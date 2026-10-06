package com.docuverify.servlet;

import com.docuverify.dao.ApplicationDAO;
import com.docuverify.dao.EventDAO;
import com.docuverify.model.CertificateApplication;
import com.docuverify.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

@WebServlet(urlPatterns = {"/certificate/apply", "/apply"})
public class ApplyCertificateServlet extends HttpServlet {
    private ApplicationDAO appDAO = new ApplicationDAO();
    private EventDAO eventDAO = new EventDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.setAttribute("events", eventDAO.getAllEvents());
        req.getRequestDispatcher("/jsp/student/apply.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String eventName = req.getParameter("eventName");
        String category = req.getParameter("category");
        String position = req.getParameter("position");
        String eventDate = req.getParameter("eventDate");
        String registrationId = req.getParameter("registrationId");
        String proofLink = req.getParameter("proofLink");

        String rollNo = user.getRollNo() != null ? user.getRollNo() : user.getUsername();
        String appNo = "APP-2026-" + (100 + new Random().nextInt(900));

        CertificateApplication app = new CertificateApplication();
        app.setApplicationNo(appNo);
        app.setStudentId(user.getId());
        app.setStudentName(user.getFullName());
        app.setRollNo(rollNo);
        app.setBranch(user.getBranch() != null ? user.getBranch() : "AI & Data Science");
        app.setEventName(eventName != null ? eventName.trim() : "Arya College Event");
        app.setCategory(category != null ? category.trim() : "Cultural");
        app.setPosition(position != null ? position.trim() : "Certificate of Participation");
        app.setEventDate(eventDate != null ? eventDate.trim() : "2026-09-15");
        app.setRegistrationId(registrationId != null ? registrationId.trim() : "");
        app.setProofLink(proofLink != null ? proofLink.trim() : "");

        boolean success = appDAO.submitApplication(app);
        if (success) {
            String matchStatus = app.isAutoMatched() 
                ? " [✓ Auto-Matched with Event Roster - Genuine!]" 
                : " [Pending Coordinator Manual Review]";
            session.setAttribute("successMessage", "Certificate Application " + appNo + " submitted successfully!" + matchStatus);
        } else {
            session.setAttribute("errorMessage", "Failed to submit application. Please verify details.");
        }

        resp.sendRedirect(req.getContextPath() + "/student/dashboard");
    }
}
