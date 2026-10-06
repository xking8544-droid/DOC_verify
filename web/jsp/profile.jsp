<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/sidebar.jsp" />

<div class="container-fluid p-4">
    <h2 class="fw-bold mb-4">My Profile</h2>

    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="bi bi-check-circle-fill me-2"></i>${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="row">
        <!-- User Details Card -->
        <div class="col-lg-4 mb-4">
            <div class="card h-100">
                <div class="card-body text-center pt-5">
                    <div class="mb-4">
                        <i class="bi bi-person-circle text-primary" style="font-size: 5rem;"></i>
                    </div>
                    <h4 class="fw-bold mb-1">${sessionScope.user.name != null ? sessionScope.user.name : 'User'}</h4>
                    <p class="text-muted mb-3">@${sessionScope.user.username != null ? sessionScope.user.username : 'username'}</p>
                    
                    <span class="badge bg-primary px-3 py-2 rounded-pill mb-4">
                        ${sessionScope.role == 'admin' ? 'Administrator' : 'Issuer'}
                    </span>
                    
                    <hr class="text-muted">
                    
                    <div class="d-flex justify-content-between text-start px-3 py-2">
                        <span class="text-muted">Email</span>
                        <span class="fw-medium">${sessionScope.user.email != null ? sessionScope.user.email : 'user@example.com'}</span>
                    </div>
                    <div class="d-flex justify-content-between text-start px-3 py-2">
                        <span class="text-muted">Joined</span>
                        <span class="fw-medium">Oct 2026</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Profile & Password -->
        <div class="col-lg-8 mb-4">
            <div class="card mb-4">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0 fw-bold">Edit Profile</h5>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/profile/update" method="POST">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Full Name</label>
                                <input type="text" class="form-control" name="name" value="${sessionScope.user.name}">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email Address</label>
                                <input type="email" class="form-control" name="email" value="${sessionScope.user.email}">
                            </div>
                        </div>
                        <div class="text-end">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0 fw-bold">Change Password</h5>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/profile/password" method="POST" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label class="form-label">Current Password</label>
                            <input type="password" class="form-control" name="oldPassword" required>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">New Password</label>
                                <input type="password" class="form-control" id="password" name="newPassword" required minlength="6">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Confirm New Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                                <div class="invalid-feedback">Passwords do not match.</div>
                            </div>
                        </div>
                        <div class="text-end">
                            <button type="submit" class="btn btn-warning text-dark fw-medium">Update Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
