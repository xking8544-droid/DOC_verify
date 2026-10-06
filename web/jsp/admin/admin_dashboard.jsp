<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebar.jsp" />

<div class="container-fluid p-4">

    <!-- Flash message alerts -->
    <c:if test="${not empty sessionScope.successMessage}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="bi bi-patch-check-fill me-2"></i> ${sessionScope.successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <% session.removeAttribute("successMessage"); %>
    </c:if>

    <c:if test="${not empty sessionScope.errorMessage}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-triangle-fill me-2"></i> ${sessionScope.errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <% session.removeAttribute("errorMessage"); %>
    </c:if>

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0">HOD & Administrative Control Panel</h2>
            <small class="text-muted fw-semibold">Arya College of Engineering & I.T. • Academic Event E-Certificate Master Portal</small>
        </div>
        <div>
            <span class="badge bg-danger px-3 py-2 rounded-pill me-2">
                <i class="bi bi-shield-lock-fill me-1"></i> Admin Privileges
            </span>
            <span class="badge bg-success px-3 py-2 rounded-pill">
                <i class="bi bi-cpu-fill me-1"></i> RMI SHA-256 Active (Port 1099)
            </span>
        </div>
    </div>

    <!-- Admin Stats Cards -->
    <div class="row g-3 mb-4">
        <div class="col-md-3">
            <div class="card stats-card primary h-100 shadow-sm border-0">
                <div class="d-flex align-items-center p-3">
                    <div class="icon-box bg-primary text-white rounded p-3 me-3">
                        <i class="bi bi-people-fill fs-3"></i>
                    </div>
                    <div>
                        <h6 class="text-muted mb-1">Total Users</h6>
                        <h3 class="fw-bold mb-0">${totalUsers != null ? totalUsers : '0'}</h3>
                        <small class="text-muted">Students & Mentors</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card success h-100 shadow-sm border-0">
                <div class="d-flex align-items-center p-3">
                    <div class="icon-box bg-success text-white rounded p-3 me-3">
                        <i class="bi bi-patch-check-fill fs-3"></i>
                    </div>
                    <div>
                        <h6 class="text-muted mb-1">Issued Certificates</h6>
                        <h3 class="fw-bold mb-0">${totalCerts != null ? totalCerts : '0'}</h3>
                        <small class="text-muted">SHA-256 Validated</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card warning h-100 shadow-sm border-0">
                <div class="d-flex align-items-center p-3">
                    <div class="icon-box bg-warning text-dark rounded p-3 me-3">
                        <i class="bi bi-hourglass-split fs-3"></i>
                    </div>
                    <div>
                        <h6 class="text-muted mb-1">Pending Approvals</h6>
                        <h3 class="fw-bold mb-0">${pendingCount != null ? pendingCount : '0'}</h3>
                        <small class="text-muted">Awaiting Cryptographic Hash</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card info h-100 shadow-sm border-0">
                <div class="d-flex align-items-center p-3">
                    <div class="icon-box bg-dark text-white rounded p-3 me-3">
                        <i class="bi bi-building fs-3"></i>
                    </div>
                    <div>
                        <h6 class="text-muted mb-1">Affiliation</h6>
                        <h5 class="fw-bold mb-0">RTU / AICTE</h5>
                        <small class="text-muted">Arya 1st Old Campus</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Pending Applications for 1-Click Crypto Issuance -->
    <div class="card shadow-sm border-0 mb-4">
        <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
            <h5 class="fw-bold mb-0 text-dark">
                <i class="bi bi-shield-shaded text-danger me-2"></i>Event Certificate Requests Awaiting Cryptographic Issuance
            </h5>
            <span class="badge bg-light text-dark border">SHA-256 Digest Engine via Java RMI (Exp 2)</span>
        </div>
        <div class="card-body p-0">
            <c:choose>
                <c:when test="${not empty pendingApplications}">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="ps-3">App No</th>
                                    <th>Student Name & Roll No</th>
                                    <th>Event & Category</th>
                                    <th>Award / Position</th>
                                    <th>Faculty Review Status</th>
                                    <th>Anti-Forgery Match</th>
                                    <th class="text-end pe-3">Cryptographic Issuance</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pendingApplications}" var="app">
                                    <tr>
                                        <td class="ps-3 font-monospace fw-bold">${app.applicationNo}</td>
                                        <td>
                                            <div class="fw-bold">${app.studentName}</div>
                                            <small class="text-muted">${app.rollNo} • ${app.branch}</small>
                                        </td>
                                        <td>
                                            <div class="fw-semibold">${app.eventName}</div>
                                            <span class="badge bg-secondary">${app.category}</span>
                                        </td>
                                        <td><span class="fw-bold text-success">${app.position}</span></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${app.status == 'verified_by_mentor'}">
                                                    <span class="badge bg-success"><i class="bi bi-check2-all me-1"></i> Mentor Verified</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-warning text-dark"><i class="bi bi-clock me-1"></i> Direct Student Request</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${app.autoMatched}">
                                                    <span class="badge bg-success bg-opacity-10 text-success border border-success">
                                                        <i class="bi bi-patch-check-fill me-1"></i> Roster Matched
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary">Coordinator Review</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-end pe-3">
                                            <!-- Approve Form -->
                                            <form action="${pageContext.request.contextPath}/admin/dashboard" method="POST" class="d-inline">
                                                <input type="hidden" name="id" value="${app.id}">
                                                <input type="hidden" name="action" value="approve">
                                                <button type="submit" class="btn btn-danger btn-sm fw-bold">
                                                    <i class="bi bi-cpu me-1"></i> Approve & Generate SHA-256
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="text-center py-4 text-muted">
                        <i class="bi bi-check-circle fs-2 text-success d-block mb-1"></i>
                        <p class="mb-0">No pending certificate requests in queue.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Quick Operations & Recent Audit Logs -->
    <div class="row g-4">
        <div class="col-lg-4">
            <div class="card h-100 shadow-sm border-0">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0 fw-bold">Quick Administration</h5>
                </div>
                <div class="card-body">
                    <div class="d-grid gap-3">
                        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-outline-primary text-start py-3">
                            <i class="bi bi-person-lines-fill me-2 fs-5"></i> Manage Users & Students
                        </a>
                        <a href="${pageContext.request.contextPath}/issue" class="btn btn-outline-danger text-start py-3">
                            <i class="bi bi-patch-plus me-2 fs-5"></i> Direct Certificate Issuance (Offline Award)
                        </a>
                        <a href="${pageContext.request.contextPath}/registry" class="btn btn-outline-secondary text-start py-3">
                            <i class="bi bi-journal-text me-2 fs-5"></i> View College Certificate Registry
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card h-100 shadow-sm border-0">
                <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-clock-history me-2"></i>Security Audit Log (Exp 10)</h5>
                    <button class="btn btn-sm btn-light" onclick="location.reload()"><i class="bi bi-arrow-clockwise"></i> Refresh</button>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="ps-4">Timestamp</th>
                                    <th>Action</th>
                                    <th>Audit Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${recentLogs}" var="log">
                                    <tr>
                                        <td class="ps-4 small text-muted">${log.createdAt}</td>
                                        <td><span class="badge bg-secondary">${log.action}</span></td>
                                        <td class="small">${log.details}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<jsp:include page="../includes/footer.jsp" />
