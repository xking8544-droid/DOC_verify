package com.docuverify.servlet;

import com.docuverify.dao.ApplicationDAO;
import com.docuverify.dao.CertificateDAO;
import com.docuverify.dao.EventDAO;
import com.docuverify.model.Certificate;
import com.docuverify.model.CertificateApplication;
import com.docuverify.model.Event;
import com.docuverify.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/student/dashboard", "/dashboard"})
public class StudentDashboardServlet extends HttpServlet {
    private ApplicationDAO appDAO = new ApplicationDAO();
    private CertificateDAO certDAO = new CertificateDAO();
    private EventDAO eventDAO = new EventDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // If admin or mentor, route to their dashboards
        if ("admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
            return;
        } else if ("mentor".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/mentor/dashboard");
            return;
        }

        String rollNo = user.getRollNo() != null ? user.getRollNo() : user.getUsername();
        List<CertificateApplication> myApps = appDAO.getApplicationsByStudent(user.getId());
        List<Certificate> myCerts = certDAO.getCertificatesByRollNo(rollNo);
        List<Event> availableEvents = eventDAO.getAllEvents();

        int pendingCount = 0;
        int approvedCount = 0;
        int rejectedCount = 0;

        for (CertificateApplication a : myApps) {
            if ("approved".equalsIgnoreCase(a.getStatus())) approvedCount++;
            else if ("rejected".equalsIgnoreCase(a.getStatus())) rejectedCount++;
            else pendingCount++;
        }

        req.setAttribute("myApplications", myApps);
        req.setAttribute("myCertificates", myCerts);
        req.setAttribute("availableEvents", availableEvents);
        req.setAttribute("pendingCount", pendingCount);
        req.setAttribute("approvedCount", approvedCount);
        req.setAttribute("rejectedCount", rejectedCount);

        req.getRequestDispatcher("/jsp/student/dashboard.jsp").forward(req, resp);
    }
}
