package com.docuverify.servlet;

import com.docuverify.dao.CertificateDAO;
import com.docuverify.model.Certificate;
import com.docuverify.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private CertificateDAO certDAO = new CertificateDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        List<Certificate> certs = certDAO.getCertificatesByUser(user.getId());
        req.setAttribute("certCount", certs.size());
        req.setAttribute("recentCerts", certs);
        req.getRequestDispatcher("/jsp/dashboard.jsp").forward(req, resp);
    }
}
