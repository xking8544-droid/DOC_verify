<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty / Mentor Panel — Arya College of Engineering & I.T.</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Manrope:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body { background-color: #f4f6fa; font-family: 'DM Sans', sans-serif; }
        .college-topbar {
            background: #ffffff; border-top: 4px solid #0f2b5c; border-bottom: 2px solid #d32f2f; padding: 10px 24px;
        }
        .mentor-hero {
            background: linear-gradient(135deg, #0f2b5c 0%, #1e3a6d 100%);
            color: #ffffff; border-radius: 12px; padding: 22px 28px; margin-bottom: 24px;
        }
    </style>
</head>
<body>

    <!-- Top Bar -->
    <div class="college-topbar d-flex flex-wrap justify-content-between align-items-center">
        <div>
            <h4 class="text-danger fw-bold mb-0" style="font-family: 'Manrope', sans-serif;">ARYA COLLEGE OF ENGINEERING & I.T.</h4>
            <small class="text-muted fw-semibold">Faculty / Mentor Verification Panel • REAP CODE 14</small>
        </div>
        <div class="d-flex align-items-center gap-3">
            <span class="badge bg-light text-dark border p-2">
                <i class="bi bi-person-workspace text-primary me-1"></i> ${sessionScope.user.fullName} (${sessionScope.user.role.toUpperCase()})
            </span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm">
                <i class="bi bi-box-arrow-right me-1"></i> Logout
            </a>
        </div>
    </div>

    <div class="container py-4">

        <!-- Flash messages -->
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i> ${sessionScope.successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <% session.removeAttribute("successMessage"); %>
        </c:if>

        <c:if test="${not empty sessionScope.errorMessage}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i> ${sessionScope.errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <% session.removeAttribute("errorMessage"); %>
        </c:if>

        <!-- Mentor Hero -->
        <div class="mentor-hero d-flex flex-wrap justify-content-between align-items-center gap-3">
            <div>
                <h3 class="fw-bold mb-1">Mentor Verification Workspace 👨‍🏫</h3>
                <p class="mb-0 text-white-50">
                    Faculty Coordinator: <strong class="text-warning">${sessionScope.user.fullName}</strong> &nbsp;|&nbsp; 
                    PBL Dept: <strong class="text-white">Dept. of Computer Science & Engineering</strong>
                </p>
            </div>
            <div>
                <span class="badge bg-warning text-dark px-3 py-2 fs-6">
                    <i class="bi bi-hourglass-split me-1"></i> Pending Verification: ${pendingApplications.size()}
                </span>
            </div>
        </div>

        <!-- Pending Applications Table -->
        <div class="card shadow-sm border-0 mb-4">
            <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                <h5 class="fw-bold mb-0 text-dark">
                    <i class="bi bi-shield-lock-fill text-primary me-2"></i>Pending Student Applications (Anti-Forgery Review)
                </h5>
                <span class="badge bg-light text-secondary border">Two-Tier Faculty Verification</span>
            </div>
            <div class="card-body p-0">
                <c:choose>
                    <c:when test="${not empty pendingApplications}">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th class="ps-3">App No</th>
                                        <th>Student Details</th>
                                        <th>Event & Category</th>
                                        <th>Claimed Position</th>
                                        <th>Anti-Forgery Status</th>
                                        <th>Proof Link</th>
                                        <th class="text-end pe-3">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pendingApplications}" var="p">
                                        <tr>
                                            <td class="ps-3 font-monospace fw-bold">${p.applicationNo}</td>
                                            <td>
                                                <div class="fw-bold">${p.studentName}</div>
                                                <small class="text-muted">${p.rollNo} • ${p.branch}</small>
                                            </td>
                                            <td>
                                                <div class="fw-semibold">${p.eventName}</div>
                                                <span class="badge bg-primary bg-opacity-10 text-primary border border-primary">${p.category}</span>
                                            </td>
                                            <td><span class="fw-bold text-dark">${p.position}</span></td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${p.autoMatched}">
                                                        <span class="badge bg-success py-2 px-2">
                                                            <i class="bi bi-check-circle-fill me-1"></i> Roster Matched (Genuine)
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-warning text-dark py-2 px-2">
                                                            <i class="bi bi-exclamation-triangle-fill me-1"></i> Not on Roster (Manual Check)
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty p.proofLink}">
                                                        <a href="${p.proofLink}" target="_blank" class="btn btn-outline-secondary btn-sm">
                                                            <i class="bi bi-link-45deg me-1"></i> View Proof
                                                        </a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <small class="text-muted">ID: ${not empty p.registrationId ? p.registrationId : 'N/A'}</small>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-end pe-3">
                                                <div class="btn-group">
                                                    <!-- Verify Form -->
                                                    <form action="${pageContext.request.contextPath}/mentor/dashboard" method="POST" class="d-inline">
                                                        <input type="hidden" name="id" value="${p.id}">
                                                        <input type="hidden" name="action" value="verify">
                                                        <input type="hidden" name="remarks" value="Verified genuine by Faculty Coordinator (${sessionScope.user.fullName})">
                                                        <button type="submit" class="btn btn-success btn-sm fw-bold">
                                                            <i class="bi bi-check-lg me-1"></i> Verify & Recommend
                                                        </button>
                                                    </form>
                                                    
                                                    <!-- Reject Button -->
                                                    <button type="button" class="btn btn-outline-danger btn-sm ms-1" onclick="openRejectModal('${p.id}', '${p.studentName}', '${p.eventName}')">
                                                        <i class="bi bi-x-lg"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5 text-muted">
                            <i class="bi bi-check2-all fs-1 text-success mb-2 d-block"></i>
                            <h5>All applications verified!</h5>
                            <p class="small">No pending requests awaiting mentor review.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </div>

    <!-- Reject Reason Modal -->
    <div class="modal fade" id="rejectModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title fw-bold"><i class="bi bi-shield-x me-2"></i>Reject Application</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <form action="${pageContext.request.contextPath}/mentor/dashboard" method="POST">
                    <div class="modal-body">
                        <input type="hidden" id="rejectId" name="id" value="">
                        <input type="hidden" name="action" value="reject">
                        <p class="mb-2">Rejecting application for: <strong id="rejectStudent"></strong></p>
                        <p class="small text-muted mb-3" id="rejectEvent"></p>
                        
                        <label class="form-label fw-bold small">Rejection Reason (Visible to Student):</label>
                        <select class="form-select mb-2" onchange="document.getElementById('rejectReason').value = this.value">
                            <option value="Roll number not found in official event attendance roster">Roll number not found in event attendance roster</option>
                            <option value="Duplicate or fraudulent certificate application detected">Duplicate or fraudulent application detected</option>
                            <option value="Student was registered but marked absent on event day">Student was marked absent on event day</option>
                            <option value="Invalid registration proof submitted">Invalid registration proof submitted</option>
                        </select>
                        <textarea class="form-control" id="rejectReason" name="remarks" rows="2" required placeholder="Specify reason for rejection"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-danger btn-sm fw-bold">Confirm Rejection</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function openRejectModal(id, student, event) {
            document.getElementById('rejectId').value = id;
            document.getElementById('rejectStudent').innerText = student;
            document.getElementById('rejectEvent').innerText = event;
            document.getElementById('rejectReason').value = 'Roll number not found in official event attendance roster';
            new bootstrap.Modal(document.getElementById('rejectModal')).show();
        }
    </script>
</body>
</html>
