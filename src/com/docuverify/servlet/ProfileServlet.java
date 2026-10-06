package com.docuverify.servlet;

import com.docuverify.dao.UserDAO;
import com.docuverify.model.User;
import com.docuverify.util.PasswordUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        req.setAttribute("userDetails", userDAO.getUserById(user.getId()));
        req.getRequestDispatcher("/jsp/profile.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Implementation for updating profile
        User user = (User) req.getSession().getAttribute("user");
        String action = req.getParameter("action");
        if("update".equals(action)) {
            user.setFullName(req.getParameter("fullName"));
            user.setEmail(req.getParameter("email"));
            userDAO.updateUser(user);
            req.setAttribute("success", "Profile updated.");
        }
        req.setAttribute("userDetails", userDAO.getUserById(user.getId()));
        req.getRequestDispatcher("/jsp/profile.jsp").forward(req, resp);
    }
}
