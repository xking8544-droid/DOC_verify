<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Sidebar -->
<nav id="sidebar">
    <div class="sidebar-header d-flex align-items-center justify-content-center">
        <h3 class="mb-0 text-primary fw-bold"><i class="bi bi-shield-check me-2"></i>DocuVerify</h3>
    </div>

    <ul class="list-unstyled components">
        <li class="${pageContext.request.requestURI.contains('/dashboard') && !pageContext.request.requestURI.contains('/admin/dashboard') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/dashboard">
                <i class="bi bi-grid-1x2-fill"></i> Dashboard
            </a>
        </li>
        <li class="${pageContext.request.requestURI.contains('/issue') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/issue">
                <i class="bi bi-patch-plus-fill"></i> Issue Certificate
            </a>
        </li>
        <li class="${pageContext.request.requestURI.contains('/verify') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/verify">
                <i class="bi bi-search"></i> Verify Certificate
            </a>
        </li>
        <li class="${pageContext.request.requestURI.contains('/registry') ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/registry">
                <i class="bi bi-journal-text"></i> Certificate Registry
            </a>
        </li>
        
        <c:if test="${sessionScope.role == 'admin'}">
            <hr class="mx-3 text-muted">
            <li class="px-4 py-2 text-muted small fw-bold text-uppercase">Admin</li>
            <li class="${pageContext.request.requestURI.contains('/admin/dashboard') ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="bi bi-speedometer2"></i> Admin Dashboard
                </a>
            </li>
            <li class="${pageContext.request.requestURI.contains('/admin/users') ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/admin/users">
                    <i class="bi bi-people-fill"></i> Manage Users
                </a>
            </li>
        </c:if>
    </ul>
</nav>

<!-- Page Content -->
<div id="content">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <button type="button" id="sidebarCollapse" class="btn btn-outline-primary">
                <i class="bi bi-list"></i>
            </button>
            
            <div class="ms-auto d-flex align-items-center">
                <span class="me-3 fw-medium">Welcome, ${sessionScope.user.fullName != null ? sessionScope.user.fullName : sessionScope.username}</span>
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle rounded-circle p-2" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-circle fs-5 text-primary"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile"><i class="bi bi-person me-2"></i>Profile</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
