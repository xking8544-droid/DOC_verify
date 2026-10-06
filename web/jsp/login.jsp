<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Institutional Portal Login — Arya College of Engineering & I.T.</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Space+Grotesk:wght@500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            --accent-crimson: #e11d48;
            --dark-surface: #0f172a;
            --card-bg: rgba(255, 255, 255, 0.98);
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: linear-gradient(135deg, #090e1a 0%, #0f172a 40%, #1e1b4b 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: #1e293b;
            position: relative;
            overflow-x: hidden;
        }

        /* Ambient light blurs */
        body::before {
            content: '';
            position: absolute;
            top: -150px;
            left: 50%;
            transform: translateX(-50%);
            width: 600px;
            height: 600px;
            background: radial-gradient(circle, rgba(37, 99, 235, 0.25) 0%, rgba(0, 0, 0, 0) 70%);
            pointer-events: none;
            z-index: 0;
        }

        body::after {
            content: '';
            position: absolute;
            bottom: -150px;
            right: 10%;
            width: 450px;
            height: 450px;
            background: radial-gradient(circle, rgba(225, 29, 72, 0.15) 0%, rgba(0, 0, 0, 0) 70%);
            pointer-events: none;
            z-index: 0;
        }

        /* Modern Top Bar */
        .portal-nav {
            background: rgba(15, 23, 42, 0.75);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            padding: 14px 28px;
            position: relative;
            z-index: 10;
        }

        .college-emblem-text {
            color: #ffffff;
            font-weight: 800;
            letter-spacing: 0.5px;
            font-size: 1.15rem;
            margin: 0;
        }

        .college-tagline {
            color: #94a3b8;
            font-size: 0.75rem;
            font-weight: 500;
            margin: 0;
            letter-spacing: 0.3px;
        }

        /* Main Container */
        .login-wrapper {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 16px;
            position: relative;
            z-index: 1;
        }

        .auth-card {
            background: var(--card-bg);
            border-radius: 24px;
            box-shadow: 0 25px 60px -15px rgba(0, 0, 0, 0.5), 0 0 0 1px rgba(255, 255, 255, 0.1);
            width: 100%;
            max-width: 470px;
            padding: 38px 34px;
            position: relative;
            overflow: hidden;
        }

        .auth-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #2563eb, #e11d48, #3b82f6);
        }

        /* Segmented Role Switcher */
        .role-switch-container {
            background: #f1f5f9;
            padding: 4px;
            border-radius: 12px;
            display: flex;
            gap: 4px;
            margin-bottom: 24px;
            border: 1px solid #e2e8f0;
        }

        .role-btn {
            flex: 1;
            padding: 9px 8px;
            font-size: 0.82rem;
            font-weight: 600;
            border: none;
            background: transparent;
            color: #64748b;
            border-radius: 9px;
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            cursor: pointer;
            text-align: center;
            white-space: nowrap;
        }

        .role-btn:hover {
            color: #1e293b;
        }

        .role-btn.active {
            background: #ffffff;
            color: #0f172a;
            box-shadow: 0 3px 8px rgba(15, 23, 42, 0.08), 0 1px 2px rgba(15, 23, 42, 0.04);
            font-weight: 700;
        }

        /* Form Inputs */
        .form-label-styled {
            font-size: 0.83rem;
            font-weight: 600;
            color: #334155;
            margin-bottom: 6px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .input-group-modern {
            position: relative;
            display: flex;
            align-items: center;
            border: 1.5px solid #cbd5e1;
            border-radius: 12px;
            background: #ffffff;
            transition: all 0.2s ease;
            overflow: hidden;
        }

        .input-group-modern:focus-within {
            border-color: #2563eb;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
        }

        .input-group-modern .input-icon {
            padding: 0 14px;
            color: #64748b;
            font-size: 1.1rem;
        }

        .input-group-modern input {
            border: none;
            outline: none;
            padding: 12px 14px 12px 0;
            width: 100%;
            font-size: 0.92rem;
            font-weight: 500;
            color: #0f172a;
            background: transparent;
        }

        .input-group-modern input::placeholder {
            color: #94a3b8;
            font-weight: 400;
        }

        .pwd-toggle-btn {
            background: none;
            border: none;
            color: #94a3b8;
            padding: 0 14px;
            cursor: pointer;
            font-size: 1rem;
        }
        .pwd-toggle-btn:hover {
            color: #334155;
        }

        /* Preset Chips */
        .chip-container {
            display: flex;
            align-items: center;
            gap: 6px;
            background: #f8fafc;
            border: 1px dashed #cbd5e1;
            padding: 8px 12px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-size: 0.78rem;
            color: #475569;
        }

        .chip-badge {
            background: #e2e8f0;
            color: #1e293b;
            padding: 2px 7px;
            border-radius: 6px;
            font-family: monospace;
            font-weight: 600;
            font-size: 0.75rem;
        }

        /* Submit Button */
        .btn-portal-submit {
            background: linear-gradient(135deg, #1e40af 0%, #2563eb 100%);
            color: #ffffff;
            border: none;
            font-weight: 700;
            font-size: 0.95rem;
            padding: 13px;
            border-radius: 12px;
            width: 100%;
            box-shadow: 0 8px 20px -4px rgba(37, 99, 235, 0.4);
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            letter-spacing: 0.2px;
        }

        .btn-portal-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 24px -4px rgba(37, 99, 235, 0.5);
            background: linear-gradient(135deg, #1e3a8a 0%, #1d4ed8 100%);
            color: #ffffff;
        }

        /* Footer Links */
        .auth-footer {
            margin-top: 24px;
            padding-top: 18px;
            border-top: 1px solid #f1f5f9;
            text-align: center;
            font-size: 0.84rem;
        }

        .auth-footer a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.15s;
        }

        .auth-footer a:hover {
            color: #1d4ed8;
            text-decoration: underline;
        }

        .bottom-links {
            margin-top: 10px;
            display: flex;
            justify-content: center;
            gap: 14px;
            font-size: 0.8rem;
            color: #64748b;
        }

        .bottom-links a {
            color: #64748b;
            text-decoration: none;
            font-weight: 500;
        }
        .bottom-links a:hover {
            color: #0f172a;
        }
    </style>
</head>
<body>

    <!-- Header Bar -->
    <header class="portal-nav d-flex justify-content-between align-items-center">
        <div>
            <h1 class="college-emblem-text">ARYA COLLEGE OF ENGINEERING & I.T.</h1>
            <p class="college-tagline">Academic & Event Verification System • Dept. of CSE & AI&DS</p>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-light btn-sm rounded-pill px-3">
                <i class="bi bi-house me-1"></i> Home
            </a>
        </div>
    </header>

    <!-- Main Login Card -->
    <main class="login-wrapper">
        <div class="auth-card">
            
            <div class="text-center mb-4">
                <div class="d-inline-flex align-items-center justify-content-center p-3 rounded-circle bg-primary bg-opacity-10 text-primary mb-2" style="width: 56px; height: 56px;">
                    <i class="bi bi-shield-lock-fill fs-3"></i>
                </div>
                <h4 class="fw-bold text-dark mb-1" style="letter-spacing: -0.3px;">Portal Sign In</h4>
                <p class="text-muted small mb-0">Select your authorization role to access your dashboard</p>
            </div>

            <!-- Segmented Role Selector -->
            <div class="role-switch-container">
                <button type="button" class="role-btn active" id="tabAdmin" onclick="selectRole('admin')">
                    <i class="bi bi-person-fill-gear me-1"></i> Admin / HOD
                </button>
                <button type="button" class="role-btn" id="tabMentor" onclick="selectRole('mentor')">
                    <i class="bi bi-person-badge me-1"></i> Faculty
                </button>
                <button type="button" class="role-btn" id="tabStudent" onclick="selectRole('student')">
                    <i class="bi bi-mortarboard-fill me-1"></i> Student
                </button>
            </div>

            <!-- Alerts -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show py-2 px-3 small rounded-3 mb-3" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show py-2 px-3 small rounded-3 mb-3" role="alert">
                    <i class="bi bi-check-circle-fill me-1"></i> ${success}
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <!-- Form -->
            <form action="${pageContext.request.contextPath}/login" method="POST" id="loginForm">
                
                <div class="mb-3">
                    <label for="username" class="form-label-styled" id="lblUser">
                        <span>User Identifier</span>
                        <span class="text-danger small">*</span>
                    </label>
                    <div class="input-group-modern">
                        <span class="input-icon" id="userIcon"><i class="bi bi-person"></i></span>
                        <input type="text" id="username" name="username" required placeholder="Enter your identifier">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label-styled">
                        <span>Password</span>
                        <span class="text-danger small">*</span>
                    </label>
                    <div class="input-group-modern">
                        <span class="input-icon"><i class="bi bi-key"></i></span>
                        <input type="password" id="password" name="password" required placeholder="Enter account password">
                        <button type="button" class="pwd-toggle-btn" onclick="togglePasswordVisibility()">
                            <i class="bi bi-eye" id="pwdEyeIcon"></i>
                        </button>
                    </div>
                </div>

                <!-- Credential Helper Chip -->
                <div class="chip-container" id="hintBox">
                    <i class="bi bi-info-circle text-primary"></i>
                    <span>Default demo:</span>
                    <span class="chip-badge" id="hintUser">admin</span>
                    <span>/</span>
                    <span class="chip-badge" id="hintPass">admin123</span>
                </div>

                <button type="submit" class="btn btn-portal-submit">
                    Sign In to Portal <i class="bi bi-arrow-right ms-1"></i>
                </button>

                <div class="auth-footer">
                    <div>
                        New student? <a href="${pageContext.request.contextPath}/register">Create your student profile</a>
                    </div>
                    <div class="bottom-links">
                        <a href="${pageContext.request.contextPath}/verify"><i class="bi bi-shield-check me-1"></i> Verify Certificate</a>
                        <span>•</span>
                        <a href="${pageContext.request.contextPath}/index.jsp"><i class="bi bi-house me-1"></i> Home</a>
                    </div>
                </div>
            </form>

        </div>
    </main>

    <footer class="text-center py-3 text-white-50 small" style="position: relative; z-index: 10;">
        Arya College of Engineering & I.T. • Academic Portal 2026-27
    </footer>

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
            const userIcon = document.getElementById('userIcon');

            if (role === 'admin') {
                document.getElementById('tabAdmin').classList.add('active');
                lblUser.innerHTML = '<span>Admin / HOD User ID</span><span class="text-danger small">*</span>';
                uField.placeholder = 'e.g. admin';
                uField.value = 'admin';
                pField.value = 'admin123';
                hintUser.innerText = 'admin';
                hintPass.innerText = 'admin123';
                userIcon.innerHTML = '<i class="bi bi-person-fill-gear text-primary"></i>';
            } else if (role === 'mentor') {
                document.getElementById('tabMentor').classList.add('active');
                lblUser.innerHTML = '<span>Faculty Identifier</span><span class="text-danger small">*</span>';
                uField.placeholder = 'e.g. mentor';
                uField.value = 'mentor';
                pField.value = 'mentor123';
                hintUser.innerText = 'mentor';
                hintPass.innerText = 'mentor123';
                userIcon.innerHTML = '<i class="bi bi-person-badge text-warning"></i>';
            } else if (role === 'student') {
                document.getElementById('tabStudent').classList.add('active');
                lblUser.innerHTML = '<span>University Roll Number</span><span class="text-danger small">*</span>';
                uField.placeholder = 'e.g. 24EAIDS051';
                uField.value = '24EAIDS051';
                pField.value = 'student123';
                hintUser.innerText = '24EAIDS051';
                hintPass.innerText = 'student123';
                userIcon.innerHTML = '<i class="bi bi-mortarboard-fill text-success"></i>';
            }
        }

        function togglePasswordVisibility() {
            const pwd = document.getElementById('password');
            const icon = document.getElementById('pwdEyeIcon');
            if (pwd.type === 'password') {
                pwd.type = 'text';
                icon.classList.remove('bi-eye');
                icon.classList.add('bi-eye-slash');
            } else {
                pwd.type = 'password';
                icon.classList.remove('bi-eye-slash');
                icon.classList.add('bi-eye');
            }
        }

        window.addEventListener('DOMContentLoaded', () => {
            selectRole('admin');
        });
    </script>
</body>
</html>
