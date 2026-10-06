<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DocuVerify - Cryptographic Certificate Generator & Verification Portal</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Manrope:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .hero-section {
            background: linear-gradient(135deg, rgba(116, 83, 223, 0.9) 0%, rgba(91, 64, 184, 0.9) 100%), url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .hero-title {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .hero-subtitle {
            font-size: 1.2rem;
            margin-bottom: 40px;
            opacity: 0.9;
        }
    </style>
</head>
<body>

    <!-- Navbar for Landing Page -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
                <i class="bi bi-shield-check me-2"></i>DocuVerify
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/verify"><i class="bi bi-search me-1"></i>Verify Certificate</a>
                    </li>
                    <li class="nav-item ms-lg-2">
                        <a class="nav-link" href="${pageContext.request.contextPath}/registry"><i class="bi bi-journal-text me-1"></i>Registry</a>
                    </li>
                    <c:choose>
                        <c:when test="${not empty sessionScope.user}">
                            <li class="nav-item ms-3">
                                <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item ms-3">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Login</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <i class="bi bi-shield-lock text-white mb-4" style="font-size: 5rem;"></i>
                    <h1 class="hero-title">Cryptographically Secure Certificates</h1>
                    <p class="hero-subtitle">Generate, manage, and verify blockchain-inspired tamper-proof academic and professional certificates using SHA-256 technology.</p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="${pageContext.request.contextPath}/verify" class="btn btn-light btn-lg px-4 py-3 fw-bold">
                            <i class="bi bi-search me-2"></i>Verify a Certificate
                        </a>
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <a href="${pageContext.request.contextPath}/issue" class="btn btn-outline-light btn-lg px-4 py-3 fw-bold">
                                    Issue Certificates
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light btn-lg px-4 py-3 fw-bold">
                                    Issue Certificates
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5 bg-light">
        <div class="container py-5">
            <div class="row text-center">
                <div class="col-md-4 mb-4">
                    <div class="card h-100 p-4 border-0 shadow-sm">
                        <i class="bi bi-file-earmark-lock text-primary mb-3" style="font-size: 3rem;"></i>
                        <h4>Tamper-Proof</h4>
                        <p class="text-muted">Every certificate is hashed using SHA-256 via RMI, ensuring mathematical certainty against modification.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 p-4 border-0 shadow-sm">
                        <i class="bi bi-check-circle text-success mb-3" style="font-size: 3rem;"></i>
                        <h4>Instant Verification</h4>
                        <p class="text-muted">Public verification portal allows employers and institutions to verify credentials instantly without login.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 p-4 border-0 shadow-sm">
                        <i class="bi bi-building text-primary mb-3" style="font-size: 3rem;"></i>
                        <h4>Institution Management</h4>
                        <p class="text-muted">Comprehensive dashboard for administrators to manage users, issue certificates, and view registry logs.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS and App JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
