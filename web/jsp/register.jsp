<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - DocuVerify</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="auth-wrapper py-5">
    <div class="auth-card bg-white">
        <div class="text-center mb-4">
            <h2 class="text-primary fw-bold"><i class="bi bi-shield-check me-2"></i>DocuVerify</h2>
            <p class="text-muted">Create your account</p>
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="POST" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="fullName" class="form-label fw-medium">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required placeholder="John Doe">
                <div class="invalid-feedback">Please enter your full name.</div>
            </div>

            <div class="mb-3">
                <label for="username" class="form-label fw-medium">Username</label>
                <input type="text" class="form-control" id="username" name="username" required placeholder="johndoe">
                <div class="invalid-feedback">Please choose a username.</div>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label fw-medium">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" required placeholder="john@example.com">
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label fw-medium">Password</label>
                <input type="password" class="form-control" id="password" name="password" required minlength="6" placeholder="Create a strong password">
                <div class="invalid-feedback">Password must be at least 6 characters.</div>
            </div>

            <div class="mb-4">
                <label for="confirmPassword" class="form-label fw-medium">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">
                <div class="invalid-feedback">Passwords do not match.</div>
            </div>

            <button type="submit" class="btn btn-primary w-100 py-2 fw-bold mb-3">Register</button>
            
            <div class="text-center mt-3">
                <p class="text-muted">Already have an account? <a href="${pageContext.request.contextPath}/login" class="text-primary fw-bold text-decoration-none">Sign in</a></p>
                <p class="mt-2"><a href="${pageContext.request.contextPath}/index.jsp" class="text-secondary text-decoration-none"><i class="bi bi-arrow-left me-1"></i>Back to Home</a></p>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
