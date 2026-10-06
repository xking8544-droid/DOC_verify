<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - DocuVerify</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="auth-wrapper">
    <div class="auth-card bg-white">
        <div class="text-center mb-4">
            <h2 class="text-primary fw-bold"><i class="bi bi-shield-check me-2"></i>DocuVerify</h2>
            <p class="text-muted">Sign in to your account</p>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <c:if test="${not empty success}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i>${success}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <!-- Exp 9: JSP Login Validation -->
        <form action="${pageContext.request.contextPath}/login" method="POST" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="username" class="form-label fw-medium">Username</label>
                <div class="input-group">
                    <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                    <input type="text" class="form-control" id="username" name="username" required placeholder="Enter username">
                    <div class="invalid-feedback">Please enter your username.</div>
                </div>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label fw-medium">Password</label>
                <div class="input-group">
                    <span class="input-group-text bg-light"><i class="bi bi-lock"></i></span>
                    <input type="password" class="form-control" id="password" name="password" required placeholder="Enter password">
                    <div class="invalid-feedback">Please enter your password.</div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100 py-2 fw-bold mb-3">Sign In</button>
            
            <div class="text-center mt-3">
                <p class="text-muted">Don't have an account? <a href="${pageContext.request.contextPath}/register" class="text-primary fw-bold text-decoration-none">Register here</a></p>
                <p class="mt-2"><a href="${pageContext.request.contextPath}/index.jsp" class="text-secondary text-decoration-none"><i class="bi bi-arrow-left me-1"></i>Back to Home</a></p>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
