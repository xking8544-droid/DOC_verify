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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String fullName = req.getParameter("fullName");

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPasswordHash(PasswordUtil.hashPassword(pass));
        user.setFullName(fullName);
        user.setRole("user"); // default role
        user.setActive(true);

        boolean success = userDAO.registerUser(user);
        if (success) {
            req.getSession().setAttribute("success", "Registration successful. Please login.");
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("error", "Registration failed. Try different username.");
            req.getRequestDispatcher("/jsp/register.jsp").forward(req, resp);
        }
    }
}
