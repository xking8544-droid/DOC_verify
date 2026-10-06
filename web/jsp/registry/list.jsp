<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebar.jsp" />

<div class="container-fluid p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold mb-0">Certificate Registry</h2>
        <div>
            <button class="btn btn-outline-secondary me-2"><i class="bi bi-download me-2"></i>Export CSV</button>
            <a href="${pageContext.request.contextPath}/issue" class="btn btn-primary"><i class="bi bi-plus-lg me-2"></i>Issue New</a>
        </div>
    </div>

    <!-- Registry Table Card -->
    <div class="card shadow-sm">
        <div class="card-header bg-white py-3 d-flex flex-wrap justify-content-between align-items-center gap-3">
            <div class="input-group" style="max-width: 350px;">
                <span class="input-group-text bg-light border-end-0"><i class="bi bi-search text-muted"></i></span>
                <input type="text" id="tableSearch" class="form-control border-start-0 bg-light" placeholder="Search by name, ID, or course...">
            </div>
            
            <div class="d-flex gap-2">
                <select class="form-select bg-light border-0" style="width: auto;">
                    <option value="">All Courses</option>
                    <option value="cs">Computer Science</option>
                    <option value="it">Information Technology</option>
                </select>
                <select class="form-select bg-light border-0" style="width: auto;">
                    <option value="">Sort By: Newest</option>
                    <option value="oldest">Oldest First</option>
                    <option value="name">Name A-Z</option>
                </select>
            </div>
        </div>
        
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th class="ps-4">Cert ID</th>
                            <th>Student Name</th>
                            <th>Roll No</th>
                            <th>Category</th>
                            <th>Event / Activity</th>
                            <th>Grade / Award</th>
                            <th>Issue Date</th>
                            <th class="text-end pe-4">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty certificates}">
                                <c:forEach items="${certificates}" var="cert">
                                    <tr>
                                        <td class="ps-4 fw-medium text-primary font-monospace">${cert.certId}</td>
                                        <td class="fw-bold">${cert.studentName}</td>
                                        <td><span class="badge bg-light text-dark border font-monospace">${cert.rollNo}</span></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${cert.category == 'Sports'}"><span class="badge bg-danger">Sports</span></c:when>
                                                <c:when test="${cert.category == 'Music'}"><span class="badge bg-info text-dark">Music</span></c:when>
                                                <c:when test="${cert.category == 'Drama'}"><span class="badge bg-warning text-dark">Drama</span></c:when>
                                                <c:when test="${cert.category == 'Cultural'}"><span class="badge bg-primary">Cultural</span></c:when>
                                                <c:when test="${cert.category == 'Technical'}"><span class="badge bg-success">Technical</span></c:when>
                                                <c:otherwise><span class="badge bg-secondary">${cert.category != null ? cert.category : 'General'}</span></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${cert.eventName != null ? cert.eventName : cert.courseName}</td>
                                        <td>
                                            <span class="badge bg-success bg-opacity-10 text-success border border-success border-opacity-25">
                                                ${cert.grade}
                                            </span>
                                        </td>
                                        <td>${cert.issueDate != null ? cert.issueDate : 'Recently'}</td>
                                        <td class="text-end pe-4">
                                            <a href="${pageContext.request.contextPath}/verify?id=${cert.certId}" class="btn btn-sm btn-outline-primary" title="Verify Certificate">
                                                <i class="bi bi-shield-check me-1"></i>Verify
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="text-center py-4 text-muted">
                                        <i class="bi bi-inbox fs-2 d-block mb-2"></i>
                                        No certificates found in registry.
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="card-footer bg-white py-3 d-flex justify-content-between align-items-center">
            <span class="text-muted small">Showing 1-3 of 150 entries</span>
            <nav aria-label="Page navigation">
                <ul class="pagination pagination-sm mb-0">
                    <li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />
