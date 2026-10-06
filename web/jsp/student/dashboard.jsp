<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal — Arya College of Engineering & I.T.</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Manrope:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body { background-color: #f4f6fa; font-family: 'DM Sans', sans-serif; }
        .college-topbar {
            background: #ffffff;
            border-top: 4px solid #0f2b5c;
            border-bottom: 2px solid #d32f2f;
            padding: 10px 24px;
        }
        .arya-nav-title { color: #d32f2f; font-weight: 800; font-family: 'Manrope', sans-serif; }
        .pbl-substrip {
            background: #0f2b5c; color: #ffffff; padding: 7px 20px; font-size: 0.85rem;
        }
        .student-hero {
            background: linear-gradient(135deg, #0f2b5c 0%, #1a428a 100%);
            color: #ffffff; border-radius: 12px; padding: 24px 28px; margin-bottom: 24px;
        }
        .stat-badge-card {
            background: #ffffff; border-radius: 12px; padding: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.04); border: 1px solid rgba(0,0,0,0.06);
        }
        .badge-cultural { background-color: #6f42c1; color: #fff; }
        .badge-sports { background-color: #198754; color: #fff; }
        .badge-drama { background-color: #fd7e14; color: #fff; }
        .badge-music { background-color: #0d6efd; color: #fff; }
        .badge-technical { background-color: #212529; color: #fff; }
    </style>
</head>
<body>

    <!-- 1. Top Branding -->
    <div class="college-topbar d-flex flex-wrap justify-content-between align-items-center">
        <div>
            <h4 class="arya-nav-title mb-0">ARYA COLLEGE OF ENGINEERING & I.T.</h4>
            <small class="text-muted fw-semibold">Event & Merit E-Certificate Portal | REAP CODE 14</small>
        </div>
        <div class="d-flex align-items-center gap-3">
            <span class="badge bg-light text-dark border p-2">
                <i class="bi bi-person-circle text-primary me-1"></i> ${sessionScope.user.fullName} (${sessionScope.user.rollNo})
            </span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger btn-sm">
                <i class="bi bi-box-arrow-right me-1"></i> Logout
            </a>
        </div>
    </div>

    <!-- 2. PBL Ribbon -->
    <div class="pbl-substrip d-flex justify-content-between align-items-center">
        <div>
            🎓 <strong>PBL Portal — 5th Sem (AI&DS / CSE)</strong> • Mentor: <span class="text-warning fw-bold">Er. Ram Babu Buri</span>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/verify" class="text-white text-decoration-none small me-3">
                <i class="bi bi-search me-1"></i> Public Verify
            </a>
            <a href="${pageContext.request.contextPath}/registry" class="text-white text-decoration-none small">
                <i class="bi bi-journal-text me-1"></i> College Registry
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

        <!-- 3. Student Hero Profile Banner -->
        <div class="student-hero d-flex flex-wrap justify-content-between align-items-center gap-3">
            <div>
                <h3 class="fw-bold mb-1">Welcome back, ${sessionScope.user.fullName}! 🎓</h3>
                <p class="mb-0 text-white-50">
                    Roll No: <strong class="text-white">${sessionScope.user.rollNo}</strong> &nbsp;|&nbsp; 
                    Branch: <strong class="text-white">${sessionScope.user.branch}</strong> &nbsp;|&nbsp; 
                    Year: <strong class="text-white">${sessionScope.user.year}</strong>
                </p>
            </div>
            <div>
                <button class="btn btn-warning fw-bold px-4 py-2" data-bs-toggle="modal" data-bs-target="#applyModal">
                    <i class="bi bi-plus-circle-fill me-2"></i> Apply for Event Certificate
                </button>
            </div>
        </div>

        <!-- 4. Quick Metrics -->
        <div class="row g-3 mb-4">
            <div class="col-md-3">
                <div class="stat-badge-card text-center">
                    <h6 class="text-muted mb-1">Approved Certificates</h6>
                    <h2 class="fw-bold text-success mb-0">${approvedCount}</h2>
                    <small class="text-muted">Cryptographically Sealed</small>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-badge-card text-center">
                    <h6 class="text-muted mb-1">Pending Requests</h6>
                    <h2 class="fw-bold text-warning mb-0">${pendingCount}</h2>
                    <small class="text-muted">Under Mentor Review</small>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-badge-card text-center">
                    <h6 class="text-muted mb-1">Rejected Requests</h6>
                    <h2 class="fw-bold text-danger mb-0">${rejectedCount}</h2>
                    <small class="text-muted">Roster Discrepancies</small>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-badge-card text-center">
                    <h6 class="text-muted mb-1">Total Applications</h6>
                    <h2 class="fw-bold text-primary mb-0">${myApplications.size()}</h2>
                    <small class="text-muted">Cultural, Sports & Tech</small>
                </div>
            </div>
        </div>

        <!-- 5. Navigation Tabs -->
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active fw-semibold" id="tab-certs" data-bs-toggle="pill" data-bs-target="#pills-certs" type="button">
                    <i class="bi bi-award-fill me-1"></i> My Issued Certificates (${myCertificates.size()})
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link fw-semibold" id="tab-apps" data-bs-toggle="pill" data-bs-target="#pills-apps" type="button">
                    <i class="bi bi-clock-history me-1"></i> Application Tracking (${myApplications.size()})
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link fw-semibold" id="tab-events" data-bs-toggle="pill" data-bs-target="#pills-events" type="button">
                    <i class="bi bi-calendar-event me-1"></i> Official College Events
                </button>
            </li>
        </ul>

        <div class="tab-content" id="pills-tabContent">
            
            <!-- Tab 1: My Issued Certificates -->
            <div class="tab-pane fade show active" id="pills-certs" role="tabpanel">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-white py-3">
                        <h5 class="fw-bold mb-0 text-dark"><i class="bi bi-shield-check text-success me-2"></i>Verified Credentials (SHA-256)</h5>
                    </div>
                    <div class="card-body p-0">
                        <c:choose>
                            <c:when test="${not empty myCertificates}">
                                <div class="table-responsive">
                                    <table class="table table-hover align-middle mb-0">
                                        <thead class="table-light">
                                            <tr>
                                                <th class="ps-3">Cert ID</th>
                                                <th>Event Name</th>
                                                <th>Category</th>
                                                <th>Position / Award</th>
                                                <th>Issue Date</th>
                                                <th>Cryptographic Proof</th>
                                                <th class="text-end pe-3">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${myCertificates}" var="c">
                                                <tr>
                                                    <td class="ps-3 fw-bold text-primary font-monospace">${c.certId}</td>
                                                    <td class="fw-semibold">${c.eventName}</td>
                                                    <td>
                                                        <span class="badge badge-${c.category.toLowerCase()}">${c.category}</span>
                                                    </td>
                                                    <td><span class="fw-bold text-success">${c.grade}</span></td>
                                                    <td><small class="text-muted">${c.issueDate}</small></td>
                                                    <td>
                                                        <span class="badge bg-dark font-monospace text-truncate" style="max-width: 140px;" title="${c.cryptoHash}">
                                                            ${c.cryptoHash.substring(0, 16)}...
                                                        </span>
                                                    </td>
                                                    <td class="text-end pe-3">
                                                        <a href="${pageContext.request.contextPath}/verify?id=${c.certId}" target="_blank" class="btn btn-outline-success btn-sm">
                                                            <i class="bi bi-patch-check me-1"></i> Verify
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-5 text-muted">
                                    <i class="bi bi-award fs-1 text-secondary mb-2 d-block"></i>
                                    <h5>No certificates issued yet</h5>
                                    <p class="small">Participated in college events? Click "Apply for Event Certificate" above to submit your request!</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <!-- Tab 2: Applications Tracker -->
            <div class="tab-pane fade" id="pills-apps" role="tabpanel">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-white py-3">
                        <h5 class="fw-bold mb-0 text-dark"><i class="bi bi-list-check me-2"></i>Application Approval Status</h5>
                    </div>
                    <div class="card-body p-0">
                        <c:choose>
                            <c:when test="${not empty myApplications}">
                                <div class="table-responsive">
                                    <table class="table table-hover align-middle mb-0">
                                        <thead class="table-light">
                                            <tr>
                                                <th class="ps-3">App No</th>
                                                <th>Event Name</th>
                                                <th>Category</th>
                                                <th>Position</th>
                                                <th>Anti-Forgery Check</th>
                                                <th>Status</th>
                                                <th>Remarks / Reason</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${myApplications}" var="app">
                                                <tr>
                                                    <td class="ps-3 font-monospace fw-bold">${app.applicationNo}</td>
                                                    <td class="fw-semibold">${app.eventName}</td>
                                                    <td><span class="badge badge-${app.category.toLowerCase()}">${app.category}</span></td>
                                                    <td>${app.position}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${app.autoMatched}">
                                                                <span class="badge bg-success bg-opacity-10 text-success border border-success">
                                                                    <i class="bi bi-check2-circle me-1"></i> Roster Matched
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-warning bg-opacity-10 text-dark border border-warning">
                                                                    <i class="bi bi-hourglass-split me-1"></i> Manual Check
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${app.status == 'approved'}">
                                                                <span class="badge bg-success"><i class="bi bi-check-circle me-1"></i> Approved</span>
                                                            </c:when>
                                                            <c:when test="${app.status == 'verified_by_mentor'}">
                                                                <span class="badge bg-info text-dark"><i class="bi bi-shield-check me-1"></i> Mentor Verified</span>
                                                            </c:when>
                                                            <c:when test="${app.status == 'rejected'}">
                                                                <span class="badge bg-danger"><i class="bi bi-x-circle me-1"></i> Rejected</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-secondary"><i class="bi bi-clock me-1"></i> Pending</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <small class="text-muted">
                                                            <c:if test="${not empty app.mentorRemarks}">Mentor: ${app.mentorRemarks} </c:if>
                                                            <c:if test="${not empty app.rejectionReason}"><span class="text-danger">${app.rejectionReason}</span></c:if>
                                                            <c:if test="${empty app.mentorRemarks and empty app.rejectionReason}">Awaiting coordinator review</c:if>
                                                        </small>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-5 text-muted">
                                    <p>No applications submitted yet.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <!-- Tab 3: Official Events List -->
            <div class="tab-pane fade" id="pills-events" role="tabpanel">
                <div class="row g-3">
                    <c:forEach items="${availableEvents}" var="ev">
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100 shadow-sm border-0">
                                <div class="card-body">
                                    <span class="badge badge-${ev.category.toLowerCase()} mb-2">${ev.category}</span>
                                    <h6 class="fw-bold mb-2">${ev.eventName}</h6>
                                    <p class="small text-muted mb-2"><i class="bi bi-calendar3 me-1"></i> ${ev.eventDate}</p>
                                    <p class="small text-muted mb-3"><i class="bi bi-person-badge me-1"></i> Coordinator: ${ev.coordinatorName}</p>
                                    <button class="btn btn-outline-primary btn-sm w-100" onclick="prefillEvent('${ev.eventName}', '${ev.category}', '${ev.eventDate}')">
                                        <i class="bi bi-pencil-square me-1"></i> Apply for Certificate
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>

    </div>

    <!-- Apply for Certificate Modal -->
    <div class="modal fade" id="applyModal" tabindex="-1" aria-labelledby="applyModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-light">
                    <h5 class="modal-title fw-bold" id="applyModalLabel">
                        <i class="bi bi-file-earmark-plus-fill text-primary me-2"></i>Apply for Event Certificate
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="${pageContext.request.contextPath}/certificate/apply" method="POST">
                    <div class="modal-body">
                        
                        <div class="alert alert-info py-2 small mb-3">
                            <i class="bi bi-shield-lock-fill me-1"></i> <strong>Anti-Forgery Protection:</strong> Your submission will be cross-matched against official event rosters and faculty coordinator attendance records.
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold small">Select Official College Event <span class="text-danger">*</span></label>
                            <select class="form-select" id="eventSelect" name="eventName" required onchange="handleEventSelect(this)">
                                <c:forEach items="${availableEvents}" var="e">
                                    <option value="${e.eventName}" data-category="${e.category}" data-date="${e.eventDate}">${e.eventName} (${e.category})</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small">Category</label>
                                <input type="text" class="form-control bg-light" id="eventCategory" name="category" value="Music" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold small">Event Date</label>
                                <input type="text" class="form-control bg-light" id="eventDate" name="eventDate" value="2026-09-15" readonly>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold small">Position / Award Achieved <span class="text-danger">*</span></label>
                            <select class="form-select" name="position" required>
                                <option value="1st Prize (Winner)">1st Prize (Winner)</option>
                                <option value="2nd Prize (Runner Up)">2nd Prize (Runner Up)</option>
                                <option value="3rd Prize">3rd Prize</option>
                                <option value="Special Performance Award">Special Performance Award</option>
                                <option value="Certificate of Participation" selected>Certificate of Participation</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold small">Event Registration ID / Team Name</label>
                            <input type="text" class="form-control" name="registrationId" placeholder="e.g. ARYA-CULT-2026-042">
                            <small class="text-muted">Issued on the event day for attendance verification</small>
                        </div>

                        <div class="mb-2">
                            <label class="form-label fw-semibold small">Proof / Photo Link (Optional)</label>
                            <input type="url" class="form-control" name="proofLink" placeholder="e.g. Google Drive link of event photo/ID">
                        </div>

                    </div>
                    <div class="modal-footer bg-light">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary btn-sm fw-bold">
                            <i class="bi bi-send-fill me-1"></i> Submit for Verification
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function handleEventSelect(select) {
            const opt = select.options[select.selectedIndex];
            document.getElementById('eventCategory').value = opt.getAttribute('data-category');
            document.getElementById('eventDate').value = opt.getAttribute('data-date');
        }

        function prefillEvent(name, cat, date) {
            const select = document.getElementById('eventSelect');
            for (let i = 0; i < select.options.length; i++) {
                if (select.options[i].value === name) {
                    select.selectedIndex = i;
                    break;
                }
            }
            document.getElementById('eventCategory').value = cat;
            document.getElementById('eventDate').value = date;
            const modal = new bootstrap.Modal(document.getElementById('applyModal'));
            modal.show();
        }
    </script>
</body>
</html>
