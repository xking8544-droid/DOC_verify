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
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String fullName = req.getParameter("fullName");
        String rollNo = req.getParameter("rollNo");
        String username = req.getParameter("username");
        if (username == null || username.trim().isEmpty()) {
            username = rollNo;
        }
        String email = req.getParameter("email");
        String branch = req.getParameter("branch");
        String year = req.getParameter("year");
        String pass = req.getParameter("password");

        User user = new User();
        user.setUsername(username != null ? username.trim() : "");
        user.setFullName(fullName != null ? fullName.trim() : "");
        user.setRollNo(rollNo != null ? rollNo.trim().toUpperCase() : (username != null ? username.trim().toUpperCase() : ""));
        user.setEmail(email != null ? email.trim() : "");
        user.setBranch(branch != null ? branch.trim() : "AI & Data Science");
        user.setYear(year != null ? year.trim() : "3rd Year / 5th Sem");
        user.setPasswordHash(PasswordUtil.hashPassword(pass != null ? pass.trim() : ""));
        user.setRole("student");
        user.setActive(true);

        boolean success = userDAO.registerUser(user);
        if (success) {
            req.getSession().setAttribute("success", "Registration successful! You can now login with your Roll Number: " + user.getRollNo());
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("error", "Registration failed. Roll Number or Email already registered.");
            req.getRequestDispatcher("/jsp/register.jsp").forward(req, resp);
        }
    }
}
