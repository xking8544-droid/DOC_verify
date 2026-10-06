<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/sidebar.jsp" />

<div class="container-fluid p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold mb-0">Dashboard</h2>
        <div>
            <a href="${pageContext.request.contextPath}/issue" class="btn btn-primary me-2"><i class="bi bi-patch-plus me-2"></i>Issue New</a>
            <a href="${pageContext.request.contextPath}/verify" class="btn btn-outline-primary"><i class="bi bi-search me-2"></i>Verify</a>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card stats-card primary h-100">
                <div class="d-flex align-items-center">
                    <div class="icon-box">
                        <i class="bi bi-file-earmark-check"></i>
                    </div>
                    <div class="ms-3">
                        <h6 class="text-muted mb-1">My Certificates</h6>
                        <h3 class="fw-bold mb-0">${sessionScope.stats.myCertificatesCount != null ? sessionScope.stats.myCertificatesCount : '0'}</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card stats-card success h-100">
                <div class="d-flex align-items-center">
                    <div class="icon-box">
                        <i class="bi bi-shield-check"></i>
                    </div>
                    <div class="ms-3">
                        <h6 class="text-muted mb-1">Verified Today</h6>
                        <h3 class="fw-bold mb-0">${sessionScope.stats.verifiedTodayCount != null ? sessionScope.stats.verifiedTodayCount : '0'}</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card stats-card h-100" style="background: linear-gradient(135deg, var(--primary-light), var(--primary-color)); color: white;">
                <div class="card-body d-flex flex-column justify-content-center align-items-center text-center">
                    <h5 class="fw-bold mb-2">DocuVerify Secured</h5>
                    <p class="small mb-0 opacity-75">Your account is protected with SHA-256 RMI encryption.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Certificates Table -->
    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center py-3">
            <h5 class="mb-0 fw-bold">Recent Certificates</h5>
            <a href="${pageContext.request.contextPath}/registry" class="btn btn-sm btn-light">View All</a>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="ps-4">ID</th>
                            <th>Student Name</th>
                            <th>Course</th>
                            <th>Date Issued</th>
                            <th class="pe-4 text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- This would normally be populated by a servlet -->
                        <c:choose>
                            <c:when test="${not empty recentCertificates}">
                                <c:forEach var="cert" items="${recentCertificates}">
                                    <tr>
                                        <td class="ps-4 fw-medium text-primary">${cert.certificateId}</td>
                                        <td>${cert.studentName}</td>
                                        <td>${cert.course}</td>
                                        <td>${cert.issueDate}</td>
                                        <td class="pe-4 text-end">
                                            <a href="${pageContext.request.contextPath}/jsp/certificate/verify.jsp?id=${cert.certificateId}" class="btn btn-sm btn-outline-primary">Verify</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" class="text-center py-4 text-muted">
                                        <i class="bi bi-inbox fs-4 d-block mb-2"></i>
                                        No recent certificates found. Issue one to get started!
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
