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
        String search = req.getParameter("search");
        req.setAttribute("certificates", certDAO.searchCertificates(search));
        req.getRequestDispatcher("/jsp/registry/list.jsp").forward(req, resp);
    }
}
