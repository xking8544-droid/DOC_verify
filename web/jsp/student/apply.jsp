<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebar.jsp" />

<div class="container-fluid p-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3 border-bottom">
                    <h4 class="fw-bold mb-1 text-primary">
                        <i class="bi bi-file-earmark-plus-fill me-2"></i>Apply for Event Merit / Participation Certificate
                    </h4>
                    <p class="text-muted small mb-0">Arya College of Engineering & I.T. • Academic Year 2026-27</p>
                </div>
                
                <div class="card-body p-4">

                    <div class="alert alert-info py-3 mb-4">
                        <div class="d-flex align-items-center">
                            <i class="bi bi-shield-lock-fill fs-3 text-primary me-3"></i>
                            <div>
                                <h6 class="fw-bold mb-1">Anti-Forgery Roster Verification Active</h6>
                                <p class="small mb-0">Your roll number will be automatically checked against the event coordinator attendance roster. Verified submissions receive immediate cryptographic endorsement.</p>
                            </div>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/certificate/apply" method="POST">
                        
                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold small">Candidate Full Name</label>
                                <input type="text" class="form-control bg-light" value="${sessionScope.user.fullName}" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small">College Roll Number</label>
                                <input type="text" class="form-control bg-light text-uppercase" value="${sessionScope.user.rollNo}" readonly>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small">Select College Event <span class="text-danger">*</span></label>
                            <select class="form-select" id="eventSelect" name="eventName" required onchange="updateEventDetails(this)">
                                <c:forEach items="${events}" var="e">
                                    <option value="${e.eventName}" data-category="${e.category}" data-date="${e.eventDate}">
                                        ${e.eventName} [${e.category}]
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold small">Category</label>
                                <input type="text" class="form-control bg-light" id="categoryField" name="category" value="Music" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold small">Event Date</label>
                                <input type="text" class="form-control bg-light" id="dateField" name="eventDate" value="2026-09-15" readonly>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small">Position / Merit Level Claimed <span class="text-danger">*</span></label>
                            <select class="form-select" name="position" required>
                                <option value="1st Prize (Winner)">1st Prize (Winner)</option>
                                <option value="2nd Prize (Runner Up)">2nd Prize (Runner Up)</option>
                                <option value="3rd Prize">3rd Prize</option>
                                <option value="Special Jury Mention">Special Jury Mention</option>
                                <option value="Certificate of Participation" selected>Certificate of Participation</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small">Event Registration Token / Team ID</label>
                            <input type="text" class="form-control" name="registrationId" placeholder="e.g. ARYA-CULT-2026-042">
                            <small class="text-muted">Issued by the student coordinator on the competition day</small>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold small">Proof Document / Photo Link (Optional)</label>
                            <input type="url" class="form-control" name="proofLink" placeholder="e.g. Google Drive link of certificate receipt or stage photo">
                            <small class="text-muted">Accelerates manual review if your roll number was listed under team registration</small>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary fw-bold px-4">
                                <i class="bi bi-send-fill me-1"></i> Submit for Coordinator Review
                            </button>
                            <a href="${pageContext.request.contextPath}/student/dashboard" class="btn btn-outline-secondary">
                                Cancel
                            </a>
                        </div>
                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />

<script>
    function updateEventDetails(select) {
        const opt = select.options[select.selectedIndex];
        document.getElementById('categoryField').value = opt.getAttribute('data-category');
        document.getElementById('dateField').value = opt.getAttribute('data-date');
    }
</script>
