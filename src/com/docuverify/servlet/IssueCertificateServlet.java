package com.docuverify.servlet;

import com.docuverify.crypto.CryptoRMI;
import com.docuverify.crypto.CryptoService;
import com.docuverify.dao.AuditLogDAO;
import com.docuverify.dao.CertificateDAO;
import com.docuverify.model.Certificate;
import com.docuverify.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

@WebServlet(urlPatterns = {"/issue", "/certificate/issue"})
public class IssueCertificateServlet extends HttpServlet {
    private CertificateDAO certDAO = new CertificateDAO();
    private AuditLogDAO auditDAO = new AuditLogDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/certificate/issue.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String studentName = req.getParameter("studentName");
            String rollNo = req.getParameter("rollNo");
            String courseName = req.getParameter("courseName");
            if (courseName == null || courseName.trim().isEmpty()) {
                courseName = req.getParameter("course");
            }
            String grade = req.getParameter("grade");
            User user = (User) req.getSession().getAttribute("user");

            String certId = "DV-2026-" + (int)(Math.random() * 9000 + 1000);
            String rawData = rollNo + "|" + studentName + "|" + courseName + "|" + grade;

            CryptoService crypto = CryptoRMI.getService();
            String hash = crypto != null ? crypto.generateSHA256(rawData) : "";

            Certificate cert = new Certificate();
            cert.setCertId(certId);
            cert.setStudentName(studentName);
            cert.setRollNo(rollNo);
            cert.setCourseName(courseName);
            cert.setGrade(grade);
            cert.setCryptoHash(hash);
            if (user != null) {
                cert.setIssuedBy(user.getId());
            }

            if (certDAO.saveCertificate(cert)) {
                if (user != null) {
                    auditDAO.logAction(user.getId(), "ISSUE_CERT", "Issued cert: " + certId, req.getRemoteAddr());
                }
                req.setAttribute("issuedCert", cert);
                req.setAttribute("success", "Certificate " + certId + " issued successfully.");
            } else {
                req.setAttribute("error", "Failed to issue certificate. Please check database connection.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "System error: " + e.getMessage());
        }
        req.getRequestDispatcher("/jsp/certificate/issue.jsp").forward(req, resp);
    }
}
