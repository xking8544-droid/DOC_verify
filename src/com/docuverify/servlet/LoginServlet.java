package com.docuverify.servlet;

import com.docuverify.dao.UserDAO;
import com.docuverify.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            String flashSuccess = (String) session.getAttribute("success");
            if (flashSuccess != null) {
                req.setAttribute("success", flashSuccess);
                session.removeAttribute("success");
            }
        }
        req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String pass = req.getParameter("password");
        
        User user = userDAO.loginUser(username, pass);
        
        if (user != null) {
            userDAO.updateLastLogin(user.getId());
            HttpSession session = req.getSession();
            session.removeAttribute("success");
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("rollNo", user.getRollNo());
            session.setAttribute("branch", user.getBranch());
            session.setAttribute("role", user.getRole());
            
            if ("admin".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
            } else if ("mentor".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/mentor/dashboard");
            } else {
                resp.sendRedirect(req.getContextPath() + "/student/dashboard");
            }
        } else {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.removeAttribute("success");
            }
            req.setAttribute("error", "Invalid User ID/Roll Number or password.");
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
        }
    }
}
