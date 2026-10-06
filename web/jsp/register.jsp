<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration — Arya College of Engineering & I.T.</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Manrope:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body {
            background-color: #f0f3f8;
            font-family: 'DM Sans', sans-serif;
            margin: 0;
            padding: 0;
        }
        .arya-header-strip {
            background: #ffffff;
            border-top: 4px solid #0f2b5c;
            border-bottom: 2px solid #d32f2f;
            padding: 12px 20px;
        }
        .arya-title {
            color: #d32f2f;
            font-weight: 800;
            font-size: 1.45rem;
            margin: 0;
            font-family: 'Manrope', sans-serif;
        }
        .pbl-banner {
            background: #0f2b5c;
            color: #ffffff;
            padding: 8px 15px;
            font-size: 0.85rem;
            text-align: center;
        }
        .register-card-container {
            max-width: 540px;
            margin: 30px auto 40px auto;
        }
        .portal-card {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(15, 43, 92, 0.12);
            border: 1px solid rgba(15, 43, 92, 0.08);
            padding: 32px 30px;
        }
        .btn-arya-submit {
            background: #0f2b5c;
            border-color: #0f2b5c;
            color: #ffffff;
            font-weight: 700;
            border-radius: 8px;
            padding: 10px;
        }
        .btn-arya-submit:hover {
            background: #183f80;
            color: #ffffff;
        }
    </style>
</head>
<body>

    <!-- Header Strip -->
    <div class="arya-header-strip text-center">
        <h1 class="arya-title">ARYA COLLEGE OF ENGINEERING & I.T.</h1>
        <p class="text-muted small mb-0">(Approved by AICTE | Affiliated to RTU, Kota) | REAP CODE 14</p>
    </div>

    <!-- PBL Ribbon -->
    <div class="pbl-banner">
        🎓 <strong>Student Event & Certificate Portal</strong> • Mentor: <span class="text-warning fw-bold">Er. Ram Babu Buri</span> (Dept. of CSE)
    </div>

    <div class="container register-card-container">
        <div class="portal-card">
            
            <div class="text-center mb-3">
                <h4 class="fw-bold text-dark mb-1">📝 Student Registration</h4>
                <p class="text-muted small">Register your student account to apply for event certificates</p>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="POST" class="needs-validation" novalidate>
                
                <div class="row g-2 mb-2">
                    <div class="col-md-6">
                        <label for="fullName" class="form-label fw-semibold small mb-1">Full Student Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="fullName" name="fullName" required placeholder="e.g. Amit Kumar">
                    </div>
                    <div class="col-md-6">
                        <label for="rollNo" class="form-label fw-semibold small mb-1">College Roll Number <span class="text-danger">*</span></label>
                        <input type="text" class="form-control text-uppercase" id="rollNo" name="rollNo" required placeholder="e.g. 24EAIDS051">
                    </div>
                </div>

                <div class="row g-2 mb-2">
                    <div class="col-md-6">
                        <label for="branch" class="form-label fw-semibold small mb-1">Department / Branch <span class="text-danger">*</span></label>
                        <select class="form-select" id="branch" name="branch" required>
                            <option value="AI & Data Science" selected>AI & Data Science (AI&DS)</option>
                            <option value="Computer Science & Engg">Computer Science & Engg (CSE)</option>
                            <option value="Information Technology">Information Technology (IT)</option>
                            <option value="Electronics & Comm.">Electronics & Comm. (ECE)</option>
                            <option value="Mechanical Engg">Mechanical Engg (ME)</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label for="year" class="form-label fw-semibold small mb-1">Semester & Year <span class="text-danger">*</span></label>
                        <select class="form-select" id="year" name="year" required>
                            <option value="5th Semester / 3rd Year" selected>5th Semester (3rd Year)</option>
                            <option value="6th Semester / 3rd Year">6th Semester (3rd Year)</option>
                            <option value="7th Semester / 4th Year">7th Semester (4th Year)</option>
                            <option value="3rd Semester / 2nd Year">3rd Semester (2nd Year)</option>
                        </select>
                    </div>
                </div>

                <div class="mb-2">
                    <label for="email" class="form-label fw-semibold small mb-1">Email Address <span class="text-danger">*</span></label>
                    <input type="email" class="form-control" id="email" name="email" required placeholder="e.g. amit.kumar@aryacollege.in">
                </div>

                <div class="row g-2 mb-3">
                    <div class="col-md-6">
                        <label for="password" class="form-label fw-semibold small mb-1">Password <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" id="password" name="password" required placeholder="Create password">
                    </div>
                    <div class="col-md-6">
                        <label for="confirmPassword" class="form-label fw-semibold small mb-1">Confirm Password <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required placeholder="Confirm password">
                    </div>
                </div>

                <button type="submit" class="btn btn-arya-submit w-100 mb-3">
                    <i class="bi bi-person-check-fill me-1"></i> Register Student Account
                </button>

                <div class="text-center pt-2 border-top">
                    <p class="small text-muted mb-0">
                        Already have an account? <a href="${pageContext.request.contextPath}/login" class="fw-bold text-decoration-none text-danger">Sign In Here</a>
                    </p>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
