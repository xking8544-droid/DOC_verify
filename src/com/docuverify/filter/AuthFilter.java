package com.docuverify.filter;

import com.docuverify.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();

        // Allow public paths
        if (uri.endsWith("/login") || uri.endsWith("/register") || uri.endsWith("/verify") ||
            uri.endsWith("/registry") ||
            uri.endsWith("/index.jsp") || uri.equals(req.getContextPath()) || uri.equals(req.getContextPath() + "/") ||
            uri.contains("/css/") || uri.contains("/js/") || uri.contains("/images/") || uri.contains("/fonts/")) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (uri.contains("/admin") && !"admin".equalsIgnoreCase(user.getRole())) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN, "Unauthorized admin access");
            return;
        }

        if (uri.contains("/mentor") && !"mentor".equalsIgnoreCase(user.getRole()) && !"admin".equalsIgnoreCase(user.getRole())) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN, "Unauthorized mentor access");
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
