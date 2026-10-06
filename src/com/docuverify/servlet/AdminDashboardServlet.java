package com.docuverify.servlet;

import com.docuverify.crypto.CryptoRMI;
import com.docuverify.crypto.CryptoService;
import com.docuverify.dao.ApplicationDAO;
import com.docuverify.dao.AuditLogDAO;
import com.docuverify.dao.CertificateDAO;
import com.docuverify.dao.UserDAO;
import com.docuverify.model.Certificate;
import com.docuverify.model.CertificateApplication;
import com.docuverify.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    private CertificateDAO certDAO = new CertificateDAO();
    private AuditLogDAO auditDAO = new AuditLogDAO();
    private ApplicationDAO appDAO = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        List<CertificateApplication> pendingApps = appDAO.getPendingForAdmin();

        req.setAttribute("totalUsers", userDAO.getUserCount());
        req.setAttribute("totalCerts", certDAO.getCertificateCount());
        req.setAttribute("pendingCount", pendingApps.size());
        req.setAttribute("pendingApplications", pendingApps);
        req.setAttribute("recentLogs", auditDAO.getRecentLogs(10));
        
        req.getRequestDispatcher("/jsp/admin/admin_dashboard.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");
        String idStr = req.getParameter("id");
        String reason = req.getParameter("reason");

        if (idStr != null) {
            try {
                int appId = Integer.parseInt(idStr);
                CertificateApplication app = appDAO.getApplicationById(appId);

                if (app != null && "approve".equalsIgnoreCase(action)) {
                    // Generate Unique Certificate ID (e.g. ACEIT-2026-CULT-492)
                    String catCode = app.getCategory() != null && app.getCategory().length() >= 4 
                        ? app.getCategory().substring(0, 4).toUpperCase() 
                        : "CERT";
                    String certId = "ACEIT-2026-" + catCode + "-" + (1000 + new Random().nextInt(9000));

                    String courseName = app.getBranch() + " - " + app.getEventName();

                    // Generate SHA-256 via Java RMI (Exp 2)
                    String payload = app.getRollNo() + "|" + app.getStudentName() + "|" + courseName + "|" + app.getPosition();
                    CryptoService crypto = CryptoRMI.getService();
                    String hash = (crypto != null) ? crypto.generateSHA256(payload) : "";

                    Certificate cert = new Certificate();
                    cert.setCertId(certId);
                    cert.setStudentName(app.getStudentName());
                    cert.setRollNo(app.getRollNo());
                    cert.setCourseName(courseName);
                    cert.setCategory(app.getCategory());
                    cert.setEventName(app.getEventName());
                    cert.setGrade(app.getPosition());
                    cert.setCryptoHash(hash);
                    cert.setIssuedBy(user.getId());

                    boolean certSaved = certDAO.saveCertificate(cert);
                    if (certSaved) {
                        appDAO.approveAndIssue(appId, certId);
                        auditDAO.logAction(user.getId(), "ISSUE_CERT", "Issued Cert " + certId + " to " + app.getStudentName() + " (" + app.getRollNo() + ")", req.getRemoteAddr());
                        session.setAttribute("successMessage", "Certificate " + certId + " generated and issued successfully using SHA-256 RMI!");
                    } else {
                        session.setAttribute("errorMessage", "Error inserting certificate into database.");
                    }
                } else if (app != null && "reject".equalsIgnoreCase(action)) {
                    if (reason == null || reason.trim().isEmpty()) {
                        reason = "Application rejected by HOD / Admin";
                    }
                    appDAO.rejectApplication(appId, reason);
                    auditDAO.logAction(user.getId(), "ADMIN_REJECT", "Application #" + appId + " rejected: " + reason, req.getRemoteAddr());
                    session.setAttribute("errorMessage", "Application #" + appId + " has been rejected.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
    }
}
