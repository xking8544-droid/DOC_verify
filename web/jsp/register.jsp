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
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=Space+Grotesk:wght@500;700&display=swap" rel="stylesheet">
    <style>
        :root {
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
        }

        .register-wrapper {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 35px 16px;
            position: relative;
            z-index: 1;
        }

        .auth-card {
            background: var(--card-bg);
            border-radius: 24px;
            box-shadow: 0 25px 60px -15px rgba(0, 0, 0, 0.5), 0 0 0 1px rgba(255, 255, 255, 0.1);
            width: 100%;
            max-width: 540px;
            padding: 36px 34px;
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
            background: linear-gradient(90deg, #2563eb, #10b981, #3b82f6);
        }

        .form-label-styled {
            font-size: 0.82rem;
            font-weight: 600;
            color: #334155;
            margin-bottom: 5px;
            display: block;
        }

        .input-group-modern {
            position: relative;
            display: flex;
            align-items: center;
            border: 1.5px solid #cbd5e1;
            border-radius: 11px;
            background: #ffffff;
            transition: all 0.2s ease;
            overflow: hidden;
        }

        .input-group-modern:focus-within {
            border-color: #2563eb;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
        }

        .input-group-modern .input-icon {
            padding: 0 12px;
            color: #64748b;
            font-size: 1.05rem;
        }

        .input-group-modern input, .input-group-modern select {
            border: none;
            outline: none;
            padding: 10px 12px 10px 0;
            width: 100%;
            font-size: 0.9rem;
            font-weight: 500;
            color: #0f172a;
            background: transparent;
        }

        .btn-portal-submit {
            background: linear-gradient(135deg, #1e40af 0%, #2563eb 100%);
            color: #ffffff;
            border: none;
            font-weight: 700;
            font-size: 0.95rem;
            padding: 12px;
            border-radius: 12px;
            width: 100%;
            box-shadow: 0 8px 20px -4px rgba(37, 99, 235, 0.4);
            transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            margin-top: 10px;
        }

        .btn-portal-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 24px -4px rgba(37, 99, 235, 0.5);
            color: #ffffff;
        }

        .auth-footer {
            margin-top: 20px;
            padding-top: 16px;
            border-top: 1px solid #f1f5f9;
            text-align: center;
            font-size: 0.84rem;
        }

        .auth-footer a {
            color: #2563eb;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</head>
<body>

    <header class="portal-nav d-flex justify-content-between align-items-center">
        <div>
            <h1 class="college-emblem-text">ARYA COLLEGE OF ENGINEERING & I.T.</h1>
            <p class="college-tagline">Student Profile Registration • Dept. of CSE & AI&DS</p>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light btn-sm rounded-pill px-3">
                <i class="bi bi-box-arrow-in-right me-1"></i> Sign In
            </a>
        </div>
    </header>

    <main class="register-wrapper">
        <div class="auth-card">
            
            <div class="text-center mb-3">
                <div class="d-inline-flex align-items-center justify-content-center p-3 rounded-circle bg-success bg-opacity-10 text-success mb-2" style="width: 52px; height: 52px;">
                    <i class="bi bi-person-plus-fill fs-3"></i>
                </div>
                <h4 class="fw-bold text-dark mb-1" style="letter-spacing: -0.3px;">Create Student Profile</h4>
                <p class="text-muted small mb-0">Register your university credentials for certificate issuance</p>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show py-2 px-3 small rounded-3 mb-3" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-1"></i> ${error}
                    <button type="button" class="btn-close py-2" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register" method="POST" id="regForm">
                
                <div class="row g-2 mb-2">
                    <div class="col-md-6">
                        <label for="fullName" class="form-label-styled">Full Student Name <span class="text-danger">*</span></label>
                        <div class="input-group-modern">
                            <span class="input-icon"><i class="bi bi-person"></i></span>
                            <input type="text" id="fullName" name="fullName" required placeholder="e.g. Amit Kumar">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="rollNo" class="form-label-styled">University Roll No <span class="text-danger">*</span></label>
                        <div class="input-group-modern">
                            <span class="input-icon"><i class="bi bi-credit-card-2-front"></i></span>
                            <input type="text" id="rollNo" name="rollNo" required placeholder="e.g. 24EAIDS051">
                        </div>
                    </div>
                </div>

                <div class="row g-2 mb-2">
                    <div class="col-md-6">
                        <label for="branch" class="form-label-styled">Academic Branch</label>
                        <div class="input-group-modern">
                            <span class="input-icon"><i class="bi bi-diagram-3"></i></span>
                            <select id="branch" name="branch" class="form-select border-0">
                                <option value="AI & Data Science" selected>AI & Data Science (AI&DS)</option>
                                <option value="Computer Science (CSE)">Computer Science (CSE)</option>
                                <option value="Information Technology (IT)">Information Technology (IT)</option>
                                <option value="Electronics & Comm. (ECE)">Electronics & Comm. (ECE)</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="year" class="form-label-styled">Semester / Year</label>
                        <div class="input-group-modern">
                            <span class="input-icon"><i class="bi bi-calendar3"></i></span>
                            <select id="year" name="year" class="form-select border-0">
                                <option value="3rd Year / 5th Sem" selected>3rd Year / 5th Semester</option>
                                <option value="3rd Year / 6th Sem">3rd Year / 6th Semester</option>
                                <option value="2nd Year / 4th Sem">2nd Year / 4th Semester</option>
                                <option value="4th Year / 7th Sem">4th Year / 7th Semester</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="mb-2">
                    <label for="username" class="form-label-styled">Portal Username <span class="text-danger">*</span></label>
                    <div class="input-group-modern">
                        <span class="input-icon"><i class="bi bi-at"></i></span>
                        <input type="text" id="username" name="username" required placeholder="Choose a username (or use Roll No)">
                    </div>
                </div>

                <div class="mb-2">
                    <label for="email" class="form-label-styled">College / Official Email <span class="text-danger">*</span></label>
                    <div class="input-group-modern">
                        <span class="input-icon"><i class="bi bi-envelope"></i></span>
                        <input type="email" id="email" name="email" required placeholder="name@aryacollege.in">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label-styled">Password <span class="text-danger">*</span></label>
                    <div class="input-group-modern">
                        <span class="input-icon"><i class="bi bi-shield-lock"></i></span>
                        <input type="password" id="password" name="password" required placeholder="Choose a secure password">
                    </div>
                </div>

                <button type="submit" class="btn btn-portal-submit">
                    Complete Student Registration <i class="bi bi-check-circle ms-1"></i>
                </button>

                <div class="auth-footer">
                    Already registered? <a href="${pageContext.request.contextPath}/login">Sign in with Roll Number</a>
                </div>
            </form>

        </div>
    </main>

    <footer class="text-center py-3 text-white-50 small" style="position: relative; z-index: 10;">
        Arya College of Engineering & I.T. • Academic Portal 2026-27
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
