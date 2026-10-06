<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Sidebar -->
<nav id="sidebar">
    <div class="sidebar-header d-flex flex-column align-items-center justify-content-center py-3 border-bottom">
        <h5 class="mb-0 text-danger fw-bold" style="font-family: 'Manrope', sans-serif;">ARYA COLLEGE</h5>
        <small class="text-muted fw-semibold">PBL • Dept. of CSE / AI&DS</small>
    </div>

    <ul class="list-unstyled components">
        
        <c:choose>
            <%-- ADMIN MENU --%>
            <c:when test="${sessionScope.role == 'admin'}">
                <li class="${pageContext.request.requestURI.contains('/admin/dashboard') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="bi bi-speedometer2"></i> Admin Dashboard
                    </a>
                </li>
                <li class="${pageContext.request.requestURI.contains('/issue') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/issue">
                        <i class="bi bi-patch-plus-fill"></i> Direct Issue Cert
                    </a>
                </li>
                <li class="${pageContext.request.requestURI.contains('/admin/users') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/admin/users">
                        <i class="bi bi-people-fill"></i> Manage Users
                    </a>
                </li>
            </c:when>

            <%-- MENTOR MENU --%>
            <c:when test="${sessionScope.role == 'mentor'}">
                <li class="${pageContext.request.requestURI.contains('/mentor/dashboard') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/mentor/dashboard">
                        <i class="bi bi-shield-check"></i> Mentor Review Panel
                    </a>
                </li>
            </c:when>

            <%-- STUDENT MENU --%>
            <c:otherwise>
                <li class="${pageContext.request.requestURI.contains('/student/dashboard') || (pageContext.request.requestURI.contains('/dashboard') && !pageContext.request.requestURI.contains('/admin/dashboard')) ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/student/dashboard">
                        <i class="bi bi-grid-1x2-fill"></i> Student Dashboard
                    </a>
                </li>
                <li class="${pageContext.request.requestURI.contains('/certificate/apply') || pageContext.request.requestURI.contains('/apply') ? 'active' : ''}">
                    <a href="${pageContext.request.contextPath}/certificate/apply">
                        <i class="bi bi-plus-circle-fill"></i> Apply for Certificate
                    </a>
                </li>
            </c:otherwise>
        </c:choose>

        <hr class="mx-3 text-muted">
        <li class="px-4 py-1 text-muted small fw-bold text-uppercase">Public Portal</li>

        <li class="${pageContext.request.requestURI.contains('/registry') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/registry">
                <i class="bi bi-journal-text"></i> College Registry
            </a>
        </li>
        <li class="${pageContext.request.requestURI.contains('/verify') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/verify">
                <i class="bi bi-search"></i> Public Verification
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/index.jsp">
                <i class="bi bi-house-door-fill"></i> Portal Home
            </a>
        </li>
    </ul>
</nav>

<!-- Page Content -->
<div id="content">
    <!-- Top Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom shadow-sm">
        <div class="container-fluid">
            <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary btn-sm me-2">
                <i class="bi bi-list fs-5"></i>
            </button>
            
            <div class="d-none d-md-block">
                <span class="fw-bold text-dark">Arya College of Engineering & I.T.</span>
                <span class="text-muted small ms-2">• Project Based Learning (PBL) 2026-27</span>
            </div>

            <div class="ms-auto d-flex align-items-center">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <div class="d-flex align-items-center me-3">
                            <span class="fw-medium text-dark me-2">${sessionScope.user.fullName}</span>
                            <span class="badge bg-primary me-1">${sessionScope.user.role.toUpperCase()}</span>
                            <c:if test="${not empty sessionScope.user.rollNo}">
                                <span class="badge bg-light text-dark border font-monospace">${sessionScope.user.rollNo}</span>
                            </c:if>
                        </div>
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm">
                            <i class="bi bi-box-arrow-right me-1"></i> Logout
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-sm btn-primary">
                            <i class="bi bi-box-arrow-in-right me-1"></i> Login
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
