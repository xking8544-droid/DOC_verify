<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebar.jsp" />

<div class="container-fluid p-4">
    <h2 class="fw-bold mb-4">Issue New Certificate</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Success Result (Exp 8: Servlet input & output) -->
    <c:if test="${not empty issuedCert}">
        <div class="card mb-4 border-success border-2 shadow-sm">
            <div class="card-body p-4">
                <div class="d-flex align-items-center mb-3">
                    <i class="bi bi-check-circle-fill text-success fs-1 me-3"></i>
                    <div>
                        <h4 class="text-success fw-bold mb-0">Certificate Issued Successfully!</h4>
                        <p class="text-muted mb-0">The certificate has been secured with SHA-256 via RMI.</p>
                    </div>
                </div>
                
                <div class="bg-light p-3 rounded mb-3 font-monospace small">
                    <strong>Certificate ID:</strong> ${issuedCert.certId}<br>
                    <strong>Cryptographic Hash:</strong> <span class="text-break text-primary">${issuedCert.cryptoHash}</span>
                </div>
                
                <a href="${pageContext.request.contextPath}/verify?id=${issuedCert.certId}" class="btn btn-outline-success">
                    <i class="bi bi-box-arrow-up-right me-2"></i>View Public Verification
                </a>
            </div>
        </div>
    </c:if>

    <div class="row">
        <!-- Input Form -->
        <div class="col-lg-5 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0 fw-bold">Student Details</h5>
                </div>
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/issue" method="POST" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label for="studentName" class="form-label fw-medium">Student Full Name</label>
                            <input type="text" class="form-control" id="studentName" name="studentName" required placeholder="e.g. John Doe">
                            <div class="invalid-feedback">Please enter the student's name.</div>
                        </div>

                        <div class="mb-3">
                            <label for="rollNo" class="form-label fw-medium">Roll Number / ID</label>
                            <input type="text" class="form-control" id="rollNo" name="rollNo" required placeholder="e.g. CS2024-001">
                        </div>

                        <div class="mb-3">
                            <label for="course" class="form-label fw-medium">Course / Program</label>
                            <input type="text" class="form-control" id="course" name="course" required placeholder="e.g. B.Tech Computer Science">
                        </div>

                        <div class="mb-4">
                            <label for="grade" class="form-label fw-medium">Grade / Classification</label>
                            <select class="form-select" id="grade" name="grade" required>
                                <option value="" disabled selected>Select a grade...</option>
                                <option value="First Class with Distinction">First Class with Distinction</option>
                                <option value="First Class">First Class</option>
                                <option value="Second Class">Second Class</option>
                                <option value="Pass">Pass</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2 fw-bold">
                            <i class="bi bi-patch-check-fill me-2"></i>Generate Secure Certificate
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Live Preview -->
        <div class="col-lg-7 mb-4">
            <div class="card h-100 shadow-sm border-0 bg-light">
                <div class="card-header bg-white py-3 border-bottom-0">
                    <h5 class="mb-0 fw-bold">Live Preview</h5>
                </div>
                <div class="card-body d-flex align-items-center justify-content-center p-4">
                    <div class="cert-preview w-100">
                        <i class="bi bi-award-fill text-warning mb-3" style="font-size: 4rem;"></i>
                        <h2 class="text-uppercase fw-bold" style="letter-spacing: 2px;">Certificate of Completion</h2>
                        <p class="text-muted mb-4">This is to certify that</p>
                        
                        <div class="student-name" id="preview-name">[Student Name]</div>
                        
                        <p class="text-muted mt-4 mb-2">has successfully completed the program</p>
                        <h4 class="fw-bold text-dark mb-4" id="preview-course">[Course Name]</h4>
                        
                        <p class="text-muted mb-2">with the classification of</p>
                        <h5 class="fw-bold text-primary" id="preview-grade">[Grade]</h5>
                        
                        <div class="mt-5 pt-4 border-top d-flex justify-content-between px-4">
                            <div class="text-center">
                                <p class="mb-0 fw-bold border-bottom px-4 pb-1">DocuVerify Auth</p>
                                <small class="text-muted">Digital Signature</small>
                            </div>
                            <div class="text-center">
                                <p class="mb-0 fw-bold border-bottom px-4 pb-1"><%= java.time.LocalDate.now() %></p>
                                <small class="text-muted">Date of Issue</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />
