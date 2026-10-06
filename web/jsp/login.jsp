<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PBL Portal Login — Arya College of Engineering & I.T.</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
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
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .arya-title {
            color: #d32f2f;
            font-weight: 800;
            font-size: 1.55rem;
            letter-spacing: 0.5px;
            margin: 0;
            font-family: 'Manrope', sans-serif;
        }
        .arya-subtitle {
            color: #333333;
            font-size: 0.85rem;
            font-weight: 600;
            margin: 0;
        }
        .arya-code {
            color: #555555;
            font-size: 0.8rem;
            margin: 0;
        }
        .pbl-banner {
            background: #0f2b5c;
            color: #ffffff;
            padding: 9px 15px;
            font-size: 0.85rem;
            font-weight: 500;
            text-align: center;
        }
        .pbl-banner span.mentor-highlight {
            color: #ffc107;
            font-weight: 700;
        }
        .login-card-container {
            max-width: 480px;
            margin: 35px auto 40px auto;
        }
        .portal-card {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(15, 43, 92, 0.12);
            border: 1px solid rgba(15, 43, 92, 0.08);
            padding: 32px 30px;
        }
        .role-nav-btn {
            border: 1.5px solid #0f2b5c;
            color: #0f2b5c;
            background: #ffffff;
            font-weight: 600;
            font-size: 0.88rem;
            padding: 8px 12px;
            border-radius: 8px;
            transition: all 0.2s ease;
        }
        .role-nav-btn.active {
            background: #0f2b5c;
            color: #ffffff;
        }
        .btn-arya-login {
            background: #d32f2f;
            border-color: #d32f2f;
            color: #ffffff;
            font-weight: 700;
            border-radius: 8px;
            padding: 10px;
            transition: all 0.2s;
        }
        .btn-arya-login:hover {
            background: #b71c1c;
            border-color: #b71c1c;
            color: #ffffff;
            transform: translateY(-1px);
        }
        .helper-box {
            background: #f1f5fa;
            border-radius: 8px;
            padding: 9px 12px;
            font-size: 0.85rem;
            color: #2b3e50;
        }
    </style>
</head>
<body>

    <!-- 1. Official Arya College Header -->
    <div class="arya-header-strip text-center">
        <h1 class="arya-title">ARYA COLLEGE OF ENGINEERING & I.T.</h1>
        <p class="arya-subtitle">(Approved by AICTE | Affiliated to RTU, Kota)</p>
        <p class="arya-code">Estd. Yr. 2000 | ARYA 1st Old Campus | REAP CODE 14</p>
    </div>

    <!-- 2. PBL Ribbon Banner -->
    <div class="pbl-banner">
        🎓 <strong>Project Based Learning (PBL)</strong> — Java Projects • 5<sup>th</sup> Semester • CSE / AI&DS / IT &nbsp;|&nbsp; 
        📅 Academic Year: <strong>2026-27</strong> &nbsp;|&nbsp; 
        👨‍🏫 Mentor: <span class="mentor-highlight">Er. Ram Babu Buri</span>, Dept. of CSE
    </div>

    <!-- 3. Portal Login Card -->
    <div class="container login-card-container">
        <div class="portal-card">
            
            <div class="text-center mb-3">
                <h4 class="fw-bold text-dark mb-1">🔐 PBL Portal Login — A.Y. 2026-27</h4>
                <p class="text-muted small">Event Certificate Management & Verification System</p>
            </div>

            <!-- Role Selector Tabs -->
            <div class="d-flex justify-content-between gap-2 mb-3">
                <button type="button" class="btn role-nav-btn active flex-fill text-nowrap" id="tabAdmin" onclick="selectRole('admin')">
                    <i class="bi bi-person-badge me-1"></i> Admin / HOD
                </button>
                <button type="button" class="btn role-nav-btn flex-fill text-nowrap" id="tabMentor" onclick="selectRole('mentor')">
                    <i class="bi bi-person-workspace me-1"></i> Mentor
                </button>
                <button type="button" class="btn role-nav-btn flex-fill text-nowrap" id="tabStudent" onclick="selectRole('student')">
                    <i class="bi bi-mortarboard me-1"></i> Student
                </button>
            </div>

            <!-- Alert Messages -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show py-2 small" role="alert">
                    <i class="bi bi-check-circle-fill me-1"></i> ${success}
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <!-- Exp 9: JSP Login Validation Form -->
            <form action="${pageContext.request.contextPath}/login" method="POST" class="needs-validation" novalidate id="loginForm">
                
                <div class="mb-3">
                    <label for="username" class="form-label fw-semibold small mb-1" id="lblUser">User ID <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="username" name="username" required placeholder="Enter your User ID">
                    <div class="invalid-feedback">Please enter your User ID or Roll Number.</div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label fw-semibold small mb-1">Password <span class="text-danger">*</span></label>
                    <input type="password" class="form-control" id="password" name="password" required placeholder="Enter password">
                    <div class="invalid-feedback">Please enter your password.</div>
                </div>

                <!-- Credential Helper Box -->
                <div class="helper-box text-center mb-3" id="hintBox">
                    <span class="fw-semibold">Default UserID:</span> <span id="hintUser" class="badge bg-primary">admin</span> &nbsp;|&nbsp; 
                    <span class="fw-semibold">Password:</span> <span id="hintPass" class="badge bg-secondary">admin123</span>
                </div>

                <div class="text-muted small text-center mb-3">
                    <i class="bi bi-lock-fill text-warning me-1"></i> Passwords are confidential & shared by the Department. Contact Admin/HOD if forgotten.
                </div>

                <button type="submit" class="btn btn-arya-login w-100 mb-3">
                    🚀 Login to Dashboard
                </button>

                <div class="text-center pt-2 border-top">
                    <p class="small text-muted mb-1">
                        New student? <a href="${pageContext.request.contextPath}/register" class="fw-bold text-decoration-none text-primary">📝 Register your College Profile here</a>
                    </p>
                    <p class="small text-muted mb-0">
                        <a href="${pageContext.request.contextPath}/verify" class="text-secondary text-decoration-none">🔍 Public Certificate Verification</a> &nbsp;•&nbsp; 
                        <a href="${pageContext.request.contextPath}/index.jsp" class="text-secondary text-decoration-none">🏠 Portal Home</a>
                    </p>
                </div>
            </form>

        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function selectRole(role) {
            document.getElementById('tabAdmin').classList.remove('active');
            document.getElementById('tabMentor').classList.remove('active');
            document.getElementById('tabStudent').classList.remove('active');

            const uField = document.getElementById('username');
            const pField = document.getElementById('password');
            const lblUser = document.getElementById('lblUser');
            const hintUser = document.getElementById('hintUser');
            const hintPass = document.getElementById('hintPass');

            if (role === 'admin') {
                document.getElementById('tabAdmin').classList.add('active');
                lblUser.innerHTML = 'Admin / HOD User ID <span class="text-danger">*</span>';
                uField.placeholder = 'e.g. admin';
                uField.value = 'admin';
                pField.value = 'admin123';
                hintUser.innerText = 'admin';
                hintPass.innerText = 'admin123';
            } else if (role === 'mentor') {
                document.getElementById('tabMentor').classList.add('active');
                lblUser.innerHTML = 'Mentor User ID <span class="text-danger">*</span>';
                uField.placeholder = 'e.g. mentor';
                uField.value = 'mentor';
                pField.value = 'mentor123';
                hintUser.innerText = 'mentor';
                hintPass.innerText = 'mentor123';
            } else if (role === 'student') {
                document.getElementById('tabStudent').classList.add('active');
                lblUser.innerHTML = 'College Roll Number <span class="text-danger">*</span>';
                uField.placeholder = 'e.g. 24EAIDS051';
                uField.value = '24EAIDS051';
                pField.value = 'student123';
                hintUser.innerText = '24EAIDS051';
                hintPass.innerText = 'student123';
            }
        }

        // Set default on load
        window.addEventListener('DOMContentLoaded', () => {
            selectRole('admin');
        });
    </script>
</body>
</html>
