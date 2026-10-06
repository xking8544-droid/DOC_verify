package com.docuverify.servlet;

import com.docuverify.dao.CertificateDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registry")
public class RegistryServlet extends HttpServlet {
    private CertificateDAO certDAO = new CertificateDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        javax.servlet.http.HttpSession session = req.getSession(false);
        com.docuverify.model.User user = (session != null) ? (com.docuverify.model.User) session.getAttribute("user") : null;
        
        // Strict privacy: Only admin or faculty/mentor can view the full registry
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        } else if ("student".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/student/dashboard");
            return;
        }

        String search = req.getParameter("search");
        req.setAttribute("certificates", certDAO.searchCertificates(search));
        req.getRequestDispatcher("/jsp/registry/list.jsp").forward(req, resp);
    }
}
