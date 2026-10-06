package com.docuverify.servlet;

import com.docuverify.dao.ApplicationDAO;
import com.docuverify.dao.AuditLogDAO;
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

@WebServlet("/mentor/dashboard")
public class MentorDashboardServlet extends HttpServlet {
    private ApplicationDAO appDAO = new ApplicationDAO();
    private AuditLogDAO auditDAO = new AuditLogDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || (!"mentor".equalsIgnoreCase(user.getRole()) && !"admin".equalsIgnoreCase(user.getRole()))) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        List<CertificateApplication> pendingApps = appDAO.getPendingForMentor();
        List<CertificateApplication> allApps = appDAO.getAllApplications();

        req.setAttribute("pendingApplications", pendingApps);
        req.setAttribute("allApplications", allApps);

        req.getRequestDispatcher("/jsp/mentor/dashboard.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || (!"mentor".equalsIgnoreCase(user.getRole()) && !"admin".equalsIgnoreCase(user.getRole()))) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");
        String idStr = req.getParameter("id");
        String remarks = req.getParameter("remarks");

        if (idStr != null) {
            try {
                int appId = Integer.parseInt(idStr);
                if ("verify".equalsIgnoreCase(action)) {
                    if (remarks == null || remarks.trim().isEmpty()) {
                        remarks = "Verified by Mentor (" + user.getFullName() + ") - Event Attendance Confirmed";
                    }
                    appDAO.verifyByMentor(appId, remarks);
                    auditDAO.logAction(user.getId(), "MENTOR_VERIFY", "Application #" + appId + " verified & recommended for issuance", req.getRemoteAddr());
                    session.setAttribute("successMessage", "Application #" + appId + " successfully verified and forwarded to Admin!");
                } else if ("reject".equalsIgnoreCase(action)) {
                    if (remarks == null || remarks.trim().isEmpty()) {
                        remarks = "Record not matched with event coordinator roster";
                    }
                    appDAO.rejectApplication(appId, remarks);
                    auditDAO.logAction(user.getId(), "MENTOR_REJECT", "Application #" + appId + " rejected: " + remarks, req.getRemoteAddr());
                    session.setAttribute("errorMessage", "Application #" + appId + " marked as rejected.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        resp.sendRedirect(req.getContextPath() + "/mentor/dashboard");
    }
}
