<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DocuVerify™ — Arya College of Engineering & I.T. Event Certificate Portal</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Manrope:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body { font-family: 'DM Sans', sans-serif; background-color: #f8fafc; margin: 0; }
        .college-topbar {
            background: #ffffff; border-top: 4px solid #0f2b5c; border-bottom: 2px solid #d32f2f; padding: 12px 24px;
        }
        .arya-heading { color: #d32f2f; font-weight: 800; font-family: 'Manrope', sans-serif; }
        .pbl-banner {
            background: #0f2b5c; color: #ffffff; padding: 8px 15px; font-size: 0.85rem; text-align: center;
        }
        .hero-section {
            background: linear-gradient(135deg, #0f2b5c 0%, #1e3a6d 50%, #29487d 100%);
            color: #ffffff; padding: 75px 20px; text-align: center;
        }
        .cat-pill {
            background: #ffffff; border-radius: 12px; padding: 22px 16px; text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05); border: 1px solid rgba(0,0,0,0.06); transition: all 0.25s;
        }
        .cat-pill:hover { transform: translateY(-5px); box-shadow: 0 10px 25px rgba(0,0,0,0.1); }
        .feature-icon-box {
            width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 12px auto;
        }
    </style>
</head>
<body>

    <!-- 1. Official College Header -->
    <div class="college-topbar d-flex flex-wrap justify-content-between align-items-center">
        <div>
            <h3 class="arya-heading mb-0">ARYA COLLEGE OF ENGINEERING & I.T.</h3>
            <p class="text-muted small mb-0">(Approved by AICTE | Affiliated to RTU, Kota) | REAP CODE 14 | Estd. 2000</p>
        </div>
        <div class="d-flex align-items-center gap-2 mt-2 mt-md-0">
            <a href="${pageContext.request.contextPath}/verify" class="btn btn-outline-primary btn-sm fw-semibold">
                <i class="bi bi-search me-1"></i> Verify Certificate
            </a>
            <a href="${pageContext.request.contextPath}/registry" class="btn btn-outline-secondary btn-sm fw-semibold">
                <i class="bi bi-journal-text me-1"></i> Public Registry
            </a>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-primary btn-sm fw-bold">
                        <i class="bi bi-grid-fill me-1"></i> My Dashboard
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-danger btn-sm fw-bold">
                        <i class="bi bi-box-arrow-in-right me-1"></i> Portal Login
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- 2. PBL Ribbon -->
    <div class="pbl-banner">
        🎓 <strong>Project Based Learning (PBL) — Java Projects • 5th Semester • CSE / AI&DS / IT</strong> &nbsp;|&nbsp; 
        📅 A.Y. <strong>2026-27</strong> &nbsp;|&nbsp; 
        👨‍🏫 Mentor: <span class="text-warning fw-bold">Er. Ram Babu Buri</span> (Dept. of CSE)
    </div>

    <!-- 3. Hero Section -->
    <section class="hero-section">
        <div class="container" style="max-width: 860px;">
            <span class="badge bg-danger px-3 py-2 text-uppercase mb-3 fw-bold tracking-wider">
                <i class="bi bi-shield-check me-1"></i> Cryptographic Anti-Forgery Architecture
            </span>
            <h1 class="display-4 fw-extrabold mb-3" style="font-family: 'Manrope', sans-serif;">
                Arya Event & Merit E-Certificate Portal
            </h1>
            <p class="lead mb-4 text-white-50">
                Official institutional platform for issuing, tracking, and mathematically verifying student achievement certificates across Cultural, Sports, Drama, Music, and Technical competitions.
            </p>
            <div class="d-flex flex-wrap justify-content-center gap-3">
                <a href="${pageContext.request.contextPath}/verify" class="btn btn-light btn-lg px-4 fw-bold text-dark shadow-sm">
                    <i class="bi bi-patch-check-fill text-success me-2"></i> Verify Any Certificate
                </a>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-warning btn-lg px-4 fw-bold shadow-sm">
                    <i class="bi bi-person-lock me-2"></i> Student & Faculty Login
                </a>
            </div>
        </div>
    </section>

    <!-- 4. Event Categories Showcase -->
    <div class="container py-5">
        <div class="text-center mb-5">
            <h3 class="fw-bold text-dark" style="font-family: 'Manrope', sans-serif;">Supported Event Categories</h3>
            <p class="text-muted">Students can participate and apply for cryptographic verification certificates in all major college domains</p>
        </div>

        <div class="row g-4">
            <div class="col-6 col-md-4 col-lg-2">
                <div class="cat-pill">
                    <div class="feature-icon-box bg-primary bg-opacity-10 text-primary">
                        <i class="bi bi-music-note-beamed fs-3"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Music</h6>
                    <small class="text-muted">Singing, Bands</small>
                </div>
            </div>

            <div class="col-6 col-md-4 col-lg-2">
                <div class="cat-pill">
                    <div class="feature-icon-box bg-success bg-opacity-10 text-success">
                        <i class="bi bi-trophy-fill fs-3"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Sports</h6>
                    <small class="text-muted">Cricket, Athletics</small>
                </div>
            </div>

            <div class="col-6 col-md-4 col-lg-2">
                <div class="cat-pill">
                    <div class="feature-icon-box bg-warning bg-opacity-10 text-warning">
                        <i class="bi bi-masks-theater fs-3"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Drama</h6>
                    <small class="text-muted">Skit, Street Play</small>
                </div>
            </div>

            <div class="col-6 col-md-4 col-lg-2">
                <div class="cat-pill">
                    <div class="feature-icon-box bg-purple bg-opacity-10" style="color: #6f42c1;">
                        <i class="bi bi-balloon-heart-fill fs-3"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Cultural</h6>
                    <small class="text-muted">Dance, Annual Fest</small>
                </div>
            </div>

            <div class="col-6 col-md-4 col-lg-2">
                <div class="cat-pill">
                    <div class="feature-icon-box bg-dark bg-opacity-10 text-dark">
                        <i class="bi bi-code-slash fs-3"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Technical</h6>
                    <small class="text-muted">Hackathons, AI Coding</small>
                </div>
            </div>

            <div class="col-6 col-md-4 col-lg-2">
                <div class="cat-pill">
                    <div class="feature-icon-box bg-info bg-opacity-10 text-info">
                        <i class="bi bi-journal-bookmark-fill fs-3"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Academic</h6>
                    <small class="text-muted">Merit, Sem Rank</small>
                </div>
            </div>
        </div>
    </div>

    <!-- 5. 3-Tier Anti-Forgery Architecture Showcase -->
    <div class="bg-white py-5 border-top border-bottom">
        <div class="container">
            <div class="text-center mb-5">
                <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-2 fw-bold mb-2">SYSTEM ARCHITECTURE</span>
                <h3 class="fw-bold text-dark">How Fake Applications Are Eliminated</h3>
                <p class="text-muted">3-Tier Verification Pipeline ensuring zero forged credentials</p>
            </div>

            <div class="row g-4 text-center">
                <div class="col-md-4">
                    <div class="p-4 border rounded-3 h-100 bg-light">
                        <div class="fs-1 text-primary mb-3"><i class="bi bi-database-check"></i></div>
                        <h5 class="fw-bold">1. Event Attendance Roster Match</h5>
                        <p class="small text-muted mb-0">
                            Student roll numbers are cross-referenced with pre-loaded official attendance lists uploaded by event coordinators.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="p-4 border rounded-3 h-100 bg-light">
                        <div class="fs-1 text-warning mb-3"><i class="bi bi-person-check-fill"></i></div>
                        <h5 class="fw-bold">2. Faculty Mentor Verification</h5>
                        <p class="small text-muted mb-0">
                            Department mentors and event in-charges physically verify participant achievements and endorse recommendations.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="p-4 border rounded-3 h-100 bg-light">
                        <div class="fs-1 text-danger mb-3"><i class="bi bi-cpu-fill"></i></div>
                        <h5 class="fw-bold">3. SHA-256 via Java RMI</h5>
                        <p class="small text-muted mb-0">
                            Admin generates a tamper-evident SHA-256 mathematical hash over Java Remote Method Invocation (Exp 2).
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 text-center">
        <div class="container">
            <h6 class="fw-bold mb-1">Arya College of Engineering & I.T., Jaipur</h6>
            <p class="small text-white-50 mb-1">Project Based Learning (PBL) 2026-27 • Team 5A (PBL2627-AI&DS-A-051)</p>
            <p class="small text-white-50 mb-0">Team Leader: Amit Kumar • Mentor: Er. Ram Babu Buri (Dept. of CSE)</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
