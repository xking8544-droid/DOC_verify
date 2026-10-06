<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebar.jsp" />

<div class="container-fluid p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold mb-0">Admin Dashboard</h2>
        <span class="badge bg-danger px-3 py-2 rounded-pill"><i class="bi bi-shield-lock-fill me-1"></i> Admin Access</span>
    </div>

    <!-- Admin Stats -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card stats-card primary h-100">
                <div class="d-flex align-items-center">
                    <div class="icon-box bg-primary text-white">
                        <i class="bi bi-people-fill"></i>
                    </div>
                    <div class="ms-3">
                        <h6 class="text-muted mb-1">Total Users</h6>
                        <h3 class="fw-bold mb-0">${totalUsers != null ? totalUsers : '1'}</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card success h-100">
                <div class="d-flex align-items-center">
                    <div class="icon-box bg-success text-white">
                        <i class="bi bi-file-earmark-text"></i>
                    </div>
                    <div class="ms-3">
                        <h6 class="text-muted mb-1">Total Certificates</h6>
                        <h3 class="fw-bold mb-0">${totalCerts != null ? totalCerts : '3'}</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card h-100">
                <div class="d-flex align-items-center">
                    <div class="icon-box bg-warning text-dark">
                        <i class="bi bi-search"></i>
                    </div>
                    <div class="ms-3">
                        <h6 class="text-muted mb-1">Verifications</h6>
                        <h3 class="fw-bold mb-0">${sessionScope.adminStats.totalVerifications != null ? sessionScope.adminStats.totalVerifications : '0'}</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stats-card h-100">
                <div class="d-flex align-items-center">
                    <div class="icon-box bg-info text-white">
                        <i class="bi bi-cpu-fill"></i>
                    </div>
                    <div class="ms-3">
                        <h6 class="text-muted mb-1">RMI Service</h6>
                        <h5 class="fw-bold mb-0 text-success">Online</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Quick Actions -->
        <div class="col-lg-4 mb-4">
            <div class="card h-100">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0 fw-bold">Quick Links</h5>
                </div>
                <div class="card-body">
                    <div class="d-grid gap-3">
                        <a href="${pageContext.request.contextPath}/jsp/admin/manage_users.jsp" class="btn btn-outline-primary text-start py-3">
                            <i class="bi bi-person-lines-fill me-2 fs-5"></i> Manage Users
                        </a>
                        <a href="${pageContext.request.contextPath}/jsp/registry/list.jsp" class="btn btn-outline-primary text-start py-3">
                            <i class="bi bi-journal-text me-2 fs-5"></i> View Entire Registry
                        </a>
                        <a href="${pageContext.request.contextPath}/jsp/certificate/issue.jsp" class="btn btn-outline-primary text-start py-3">
                            <i class="bi bi-patch-plus me-2 fs-5"></i> Issue Certificate
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- System Logs / Recent Activity -->
        <div class="col-lg-8 mb-4">
            <div class="card h-100">
                <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold">Recent System Logs</h5>
                    <button class="btn btn-sm btn-light"><i class="bi bi-arrow-clockwise"></i> Refresh</button>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="ps-4">Timestamp</th>
                                    <th>User</th>
                                    <th>Action</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Mock data for UI -->
                                <tr>
                                    <td class="ps-4 text-muted small">Just now</td>
                                    <td>admin</td>
                                    <td><span class="badge bg-success">Login</span></td>
                                    <td class="text-muted small">Successful login from 192.168.1.1</td>
                                </tr>
                                <tr>
                                    <td class="ps-4 text-muted small">2 hrs ago</td>
                                    <td>issuer1</td>
                                    <td><span class="badge bg-primary">Issue</span></td>
                                    <td class="text-muted small">Generated Cert ID: CRT-5092</td>
                                </tr>
                                <tr>
                                    <td class="ps-4 text-muted small">5 hrs ago</td>
                                    <td>System</td>
                                    <td><span class="badge bg-warning text-dark">RMI Call</span></td>
                                    <td class="text-muted small">SHA-256 hash generation requested</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />
