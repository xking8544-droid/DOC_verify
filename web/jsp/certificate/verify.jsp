<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify Certificate - DocuVerify</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body { background-color: #f8f9fa; }
        .search-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            margin-top: 50px;
        }
        .result-container {
            max-width: 800px;
            margin: 30px auto;
        }
    </style>
</head>
<body>

<!-- Public Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
            <i class="bi bi-shield-check me-2"></i>DocuVerify
        </a>
        <div class="ms-auto">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-outline-primary">Go to Dashboard</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Issuer Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<div class="container pb-5">
    <!-- Search Section -->
    <div class="search-container text-center">
        <i class="bi bi-shield-check text-primary mb-3" style="font-size: 3rem;"></i>
        <h2 class="fw-bold mb-2">Verify a Certificate</h2>
        <p class="text-muted mb-4">Enter the unique Certificate ID to verify its cryptographic authenticity.</p>
        
        <form action="${pageContext.request.contextPath}/verify" method="GET">
            <div class="input-group input-group-lg mb-3 shadow-sm rounded">
                <span class="input-group-text bg-white border-end-0 text-primary"><i class="bi bi-search"></i></span>
                <input type="text" name="id" class="form-control border-start-0" placeholder="e.g. CRT-123456" value="${param.id}" required>
                <button class="btn btn-primary px-4 fw-bold" type="submit">Verify Now</button>
            </div>
        </form>
    </div>

    <!-- Results Section -->
    <c:if test="${not empty verificationResult}">
        <div class="result-container">
            
            <c:choose>
                <c:when test="${verificationResult.status == 'VERIFIED'}">
                    <!-- Success Card -->
                    <div class="card verification-card border-success border-2 shadow">
                        <div class="icon text-success">
                            <i class="bi bi-patch-check-fill"></i>
                        </div>
                        <h2 class="text-success fw-bold mb-1">Authentic Certificate</h2>
                        <p class="text-muted mb-4">This certificate is mathematically verified using SHA-256 and has not been tampered with.</p>
                        
                        <div class="bg-light p-4 rounded text-start mb-4">
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <small class="text-muted d-block">Student Name</small>
                                    <span class="fw-bold fs-5">${verificationResult.certificate.studentName}</span>
                                </div>
                                <div class="col-sm-6">
                                    <small class="text-muted d-block">Roll Number</small>
                                    <span class="fw-bold fs-5">${verificationResult.certificate.rollNo}</span>
                                </div>
                                <div class="col-sm-12">
                                    <small class="text-muted d-block">Course / Program</small>
                                    <span class="fw-bold fs-5">${verificationResult.certificate.course}</span>
                                </div>
                                <div class="col-sm-6">
                                    <small class="text-muted d-block">Grade</small>
                                    <span class="fw-bold fs-5 text-primary">${verificationResult.certificate.grade}</span>
                                </div>
                                <div class="col-sm-6">
                                    <small class="text-muted d-block">Date of Issue</small>
                                    <span class="fw-bold fs-5">${verificationResult.certificate.issueDate}</span>
                                </div>
                            </div>
                        </div>

                        <div class="text-start border-top pt-4">
                            <h6 class="fw-bold mb-3"><i class="bi bi-shield-lock me-2"></i>Cryptographic Proof (SHA-256)</h6>
                            <div class="font-monospace small bg-dark text-success p-3 rounded text-break">
                                <div><span class="text-light">Original Hash:</span> ${verificationResult.originalHash}</div>
                                <div class="mt-2"><span class="text-light">Computed Hash:</span> ${verificationResult.computedHash}</div>
                                <div class="mt-2 text-warning">✓ Hashes match exactly. Integrity verified.</div>
                            </div>
                        </div>
                    </div>
                </c:when>

                <c:when test="${verificationResult.status == 'TAMPERED'}">
                    <!-- Tampered Card -->
                    <div class="card verification-card border-danger border-2 shadow">
                        <div class="icon text-danger">
                            <i class="bi bi-x-octagon-fill"></i>
                        </div>
                        <h2 class="text-danger fw-bold mb-1">Warning: Certificate Tampered</h2>
                        <p class="text-muted mb-4">The cryptographic signature does not match the database records. This document may have been altered.</p>
                        
                        <div class="text-start border-top pt-4">
                            <h6 class="fw-bold text-danger mb-3"><i class="bi bi-exclamation-triangle me-2"></i>Hash Mismatch Detected</h6>
                            <div class="font-monospace small bg-dark text-danger p-3 rounded text-break">
                                <div><span class="text-light">Expected Hash:</span> ${verificationResult.originalHash}</div>
                                <div class="mt-2"><span class="text-light">Computed Hash:</span> ${verificationResult.computedHash}</div>
                                <div class="mt-2 text-warning">✗ Hashes DO NOT match. Verification failed.</div>
                            </div>
                        </div>
                    </div>
                </c:when>

                <c:when test="${verificationResult.status == 'NOT_FOUND'}">
                    <!-- Not Found Card -->
                    <div class="card verification-card border-warning border-2 shadow">
                        <div class="icon text-warning">
                            <i class="bi bi-search"></i>
                        </div>
                        <h2 class="text-warning text-dark fw-bold mb-1">Certificate Not Found</h2>
                        <p class="text-muted mb-0">No record exists for Certificate ID: <strong>${param.id}</strong></p>
                        <p class="text-muted mt-2">Please check the ID and try again.</p>
                    </div>
                </c:when>
            </c:choose>

        </div>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
