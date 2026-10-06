package com.docuverify.servlet;

import com.docuverify.dao.AuditLogDAO;
import com.docuverify.dao.CertificateDAO;
import com.docuverify.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();
    private CertificateDAO certDAO = new CertificateDAO();
    private AuditLogDAO auditDAO = new AuditLogDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("totalUsers", userDAO.getUserCount());
        req.setAttribute("totalCerts", certDAO.getCertificateCount());
        req.setAttribute("recentLogs", auditDAO.getRecentLogs(10));
        
        req.getRequestDispatcher("/jsp/admin/admin_dashboard.jsp").forward(req, resp);
    }
}
