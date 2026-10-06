# 🛡️ DocuVerify — PBL Project Master Plan (Updated with Lab Experiments)

## 📋 Project Info
| Field | Value |
|-------|-------|
| **Project Name** | DocuVerify™ – Cryptographic Certificate Generator & Verification Portal |
| **Team ID** | 5A (PBL2627-AI&DS-A-051) |
| **Track** | Website Application — **JSP-Servlet (Tomcat 9)** + Bootstrap 5 + MySQL |
| **Guide** | Er. Ram Babu Buri |
| **College** | Arya College of Engineering & I.T. |
| **Lab Code** | SRC-04-24 |
| **Duration** | 6 July 2026 – 6 October 2026 (10 Weeks) |

---

## 🧪 Lab Experiment → Project Module Mapping

> [!IMPORTANT]
> Yeh project **Experiment 10 (Mini Project)** ka final version hai. Experiments 1-9 ke concepts isme directly use hote hain. Neeche mapping hai:

| Lab Exp # | Experiment Name | How It's Used in DocuVerify | Module Owner |
|-----------|----------------|----------------------------|-------------|
| 1 | Java basics — Socket Programming / Multithreading | Server multithreading for handling concurrent certificate requests | Amit |
| 2 | RMI (Remote Method Invocation) | **CryptoRMI.java** — SHA-256 hash generation as remote service (already coded!) | Mali |
| 3 | Swing/JavaFX (GUI — Calculator, Textbox, Checkbox) | Form validation concepts used in JSP forms (input fields, dropdowns, checkboxes) | Aryan |
| 4 | JDBC — Database Connectivity | **DatabaseDAO.java** — MySQL connection, PreparedStatement for CRUD operations (already coded!) | Ankit |
| 5 | Applet / Advanced GUI concepts | Certificate preview rendering, dynamic UI updates | Mali |
| 6 | Collections / String handling | HashMap for form data parsing, String manipulation for hash data | Amit |
| 7 | Exception handling / File I/O | Try-catch blocks, PDF/report file generation, error pages | Ayush |
| **8** | **Servlet — Design & deploy a service to take input and show result in browser** | **ALL Servlets** — LoginServlet, IssueCertificateServlet, VerifyServlet, AdminServlet, RegistryServlet | **All members** |
| **9** | **JSP — Login validation page with proper error message** | **Login Module** — login.jsp, register.jsp with server-side validation & error display | **Amit** |
| **10** | **Mini Project — Role-based Dynamic Web Project** | **DocuVerify itself** — Complete role-based (Admin/User) certificate portal | **Full Team** |

---

## 🏗️ Project Architecture (JSP-Servlet + Tomcat 9)

> [!NOTE]
> Guidelines ke according: **JSP-Servlet (Tomcat 9)** ya Spring Boot allowed hai. Lab experiments 8 & 9 JSP-Servlet pe hain, so hum **JSP-Servlet** use karenge. Yeh lab record ke saath bhi match karega.

```
DocuVerify/
├── src/main/java/
│   ├── com/docuverify/
│   │   ├── servlet/                    ← Exp 8 (Servlet)
│   │   │   ├── LoginServlet.java       ← Exp 9 (JSP Login)
│   │   │   ├── RegisterServlet.java
│   │   │   ├── LogoutServlet.java
│   │   │   ├── AdminDashboardServlet.java
│   │   │   ├── IssueCertificateServlet.java
│   │   │   ├── VerifyCertificateServlet.java
│   │   │   ├── RegistryServlet.java
│   │   │   └── ReportServlet.java
│   │   ├── model/
│   │   │   ├── User.java
│   │   │   ├── Certificate.java
│   │   │   └── AuditLog.java
│   │   ├── dao/                        ← Exp 4 (JDBC)
│   │   │   ├── DatabaseDAO.java        ← Already exists!
│   │   │   ├── UserDAO.java
│   │   │   ├── CertificateDAO.java
│   │   │   └── AuditLogDAO.java
│   │   ├── crypto/                     ← Exp 2 (RMI)
│   │   │   ├── CryptoRMI.java          ← Already exists!
│   │   │   └── CryptoService.java
│   │   ├── filter/
│   │   │   └── AuthFilter.java         ← Exp 10 (Role-based)
│   │   └── util/
│   │       ├── PasswordHasher.java     ← SHA-256/BCrypt
│   │       └── QRCodeGenerator.java
│   └──
├── src/main/webapp/
│   ├── WEB-INF/
│   │   └── web.xml                     ← Servlet mapping
│   ├── jsp/                            ← Exp 9 (JSP Pages)
│   │   ├── login.jsp
│   │   ├── register.jsp
│   │   ├── dashboard.jsp
│   │   ├── admin/
│   │   │   ├── admin_dashboard.jsp
│   │   │   ├── manage_users.jsp
│   │   │   └── settings.jsp
│   │   ├── certificate/
│   │   │   ├── issue.jsp
│   │   │   ├── verify.jsp
│   │   │   └── preview.jsp
│   │   ├── registry/
│   │   │   ├── list.jsp
│   │   │   └── reports.jsp
│   │   └── error/
│   │       ├── 404.jsp
│   │       └── 500.jsp
│   ├── css/
│   │   └── style.css                   ← Bootstrap 5 + custom
│   ├── js/
│   │   └── app.js
│   └── index.jsp                       ← Landing page
├── lib/
│   ├── mysql-connector-j-26.7.0.jar    ← Already exists!
│   ├── javax.servlet-api.jar
│   └── jstl.jar
└── README.md
```

---

## 👥 Team Members & Module Ownership

| # | Member | Role | Module | Lab Experiments Covered |
|---|--------|------|--------|------------------------|
| 1 | **Amit** (Leader) | 🔐 Auth & Login | Login/Register, Sessions, Role-based Access, Password Hashing | **Exp 1** (Multithreading), **Exp 6** (Collections), **Exp 8** (Servlet), **Exp 9** (JSP Login) |
| 2 | **Ayush** | 🛠️ Admin Dashboard | Admin Panel, User CRUD, Settings, Audit Logs | **Exp 7** (Exception/File I/O), **Exp 8** (Servlet), **Exp 10** (Role-based) |
| 3 | **Mali** | 📜 Certificate Generation | Issue Form, SHA-256 via RMI, QR Code, PDF, Live Preview | **Exp 2** (RMI), **Exp 5** (GUI/Preview), **Exp 8** (Servlet) |
| 4 | **Aryan** | ✅ Certificate Verification | Verify Page, Hash Integrity Check, Result Display | **Exp 3** (Form/Input), **Exp 8** (Servlet), **Exp 9** (Validation) |
| 5 | **Ankit** | 📊 Registry & Reports | Certificate Listing, Search, Filters, Reports, Export | **Exp 4** (JDBC), **Exp 7** (File I/O), **Exp 8** (Servlet) |

---

## 🗄️ Database Schema (MySQL)

```sql
-- Exp 4: JDBC Database Connectivity
CREATE DATABASE IF NOT EXISTS docuverify_db;
USE docuverify_db;

-- Table 1: Users (Amit's module)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,       -- BCrypt/SHA-256 hashed
    full_name VARCHAR(120) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user', -- Exp 10: Role-based
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
);

-- Table 2: Certificates (Mali + Aryan's module)
CREATE TABLE certificates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cert_id VARCHAR(20) UNIQUE NOT NULL,       -- e.g. DV-2026-4829
    student_name VARCHAR(120) NOT NULL,
    roll_no VARCHAR(60) NOT NULL,
    course_name VARCHAR(180) NOT NULL,
    grade VARCHAR(50) NOT NULL,
    crypto_hash VARCHAR(64) NOT NULL,          -- Exp 2: SHA-256 via RMI
    issued_by INT,
    issue_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_revoked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (issued_by) REFERENCES users(id)
);

-- Table 3: Audit Logs (Ayush's module)
CREATE TABLE audit_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(100) NOT NULL,
    details TEXT,
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Table 4: Verification History (Aryan's module)
CREATE TABLE verification_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cert_id VARCHAR(20) NOT NULL,
    verified_by INT NULL,
    result ENUM('authentic', 'tampered', 'not_found') NOT NULL,
    verified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (verified_by) REFERENCES users(id)
);

-- Default Admin User
INSERT INTO users (username, email, password_hash, full_name, role) 
VALUES ('admin', 'admin@docuverify.com', 
        SHA2('admin123', 256), 'System Administrator', 'admin');
```

---

## 🗓️ 10-Week Timeline (Lab Experiments Integrated)

### Week 1 (6 Jul – 12 Jul): Team Formation + Abstract
> Covers: Project idea, GitHub repo setup, abstract writing

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | Write Abstract, create GitHub repo, setup project structure | "Project idea discussion" • "Wrote abstract document" • "Created GitHub repo & project skeleton" |
| Ayush | Research admin dashboard patterns, contribute to abstract | "Researched admin panel design patterns" • "Contributed to abstract writing" • "Setup IDE & Tomcat 9" |
| Mali | Research SHA-256 & RMI integration (**Exp 2**) | "Studied SHA-256 hashing in Java (Exp 2)" • "Researched QR code libraries" • "Contributed to abstract" |
| Aryan | Research verification portals, contribute to abstract | "Analyzed existing certificate verification systems" • "Studied JSP validation patterns (Exp 9)" • "Helped finalize abstract" |
| Ankit | Research JDBC best practices (**Exp 4**), contribute | "Studied JDBC connection pooling (Exp 4)" • "Researched Bootstrap 5 tables" • "Contributed to abstract" |

**Weekly Report**: "Formed team 5A, selected guide Er. Ram Babu Buri. Finalized DocuVerify project. Wrote abstract. Created GitHub repository with initial project structure."

---

### Week 2 (13 Jul – 19 Jul): SRS Document

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | Introduction, Scope, Auth module requirements | "Wrote SRS introduction & project scope" • "Defined system overview & product perspective" • "Wrote functional requirements for Auth module" |
| Ayush | Admin module functional requirements & use cases | "Listed admin module functional requirements" • "Wrote use cases for user management" • "Documented dashboard analytics features" |
| Mali | Certificate Generation module requirements | "Listed cert generation functional requirements" • "Wrote use cases for SHA-256 hash & RMI service" • "Documented QR code & PDF requirements" |
| Aryan | Verification module requirements & use cases | "Listed verification module requirements" • "Wrote use cases for hash recalculation & integrity check" • "Documented result display scenarios" |
| Ankit | Non-functional requirements, H/W & S/W specs | "Wrote non-functional requirements (performance, security)" • "Listed H/W & S/W requirements (Tomcat 9, MySQL, JDK 8+)" • "Compiled full SRS document" |

**Weekly Report**: "Completed SRS document. Defined functional & non-functional requirements for all 5 modules. Documented tech stack: JSP-Servlet (Tomcat 9), MySQL, Bootstrap 5."

---

### Week 3 (20 Jul – 26 Jul): UML Design

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | Use Case Diagram (system-level) + Class Diagram for Auth | "Created system-level Use Case diagram with Admin/User actors" • "Designed class diagram: User, Session, AuthFilter" • "Reviewed all team UML diagrams" |
| Ayush | Activity Diagram for Admin workflow + Class Diagram | "Created activity diagram for user management CRUD flow" • "Designed class diagram: AdminServlet, UserDAO, AuditLog" • "Reviewed & refined diagrams" |
| Mali | Sequence Diagram for Certificate Issuance (with RMI flow) | "Created sequence diagram: User→Servlet→RMI→DB→JSP" • "Designed class diagram: CryptoRMI, CertificateDAO" • "Reviewed diagrams with team" |
| Aryan | Sequence Diagram for Verification + Activity Diagram | "Created sequence diagram for verification flow" • "Designed activity diagram for hash comparison process" • "Finalized all verification UML" |
| Ankit | ER Diagram + Component/Deployment Diagram | "Created ER diagram: users, certificates, audit_logs, verification_history" • "Created component diagram showing Tomcat deployment" • "Compiled all UML designs" |

**Weekly Report**: "Designed complete UML diagrams — Use Case, Class, Sequence, Activity, ER, Component diagrams for all 5 modules."

---

### Week 4 (27 Jul – 2 Aug): DB Design + UI Mockups

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | Create `users` table, Login/Register JSP mockup | "Created users table schema with password_hash & role columns" • "Setup MySQL database docuverify_db" • "Designed login.jsp & register.jsp wireframes" |
| Ayush | Create `audit_logs` table, Admin Dashboard mockup | "Created audit_logs table for admin tracking" • "Designed admin dashboard wireframe with stats cards" • "Created user management page mockup" |
| Mali | Create `certificates` table, Issuance form mockup | "Created certificates table with crypto_hash column" • "Designed certificate issuance form wireframe" • "Created live preview mockup" |
| Aryan | Finalize ER diagram, Verification page mockup | "Finalized ER diagram with all FK relationships" • "Created verification page wireframe with result cards" • "Designed error/not-found states" |
| Ankit | Setup Bootstrap 5 base template, Registry mockup | "Setup Bootstrap 5 responsive base layout for all JSPs" • "Created registry table listing mockup" • "Designed search & filter components" |

**Weekly Report**: "Created MySQL database with 4 tables. Finalized ER diagram. Built UI mockups for all 5 modules using Bootstrap 5."

---

### Week 5 (3 Aug – 9 Aug): Module Coding — Sprint 1 (Exp 8 + 9)

> [!IMPORTANT]
> Yahan se **Experiment 8 (Servlet)** aur **Experiment 9 (JSP Login)** directly implement hote hain!

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | **Exp 9**: LoginServlet + login.jsp with validation & error messages | "Created LoginServlet with POST method handling (Exp 8)" • "Built login.jsp with Bootstrap 5 form & error display (Exp 9)" • "Implemented server-side validation with proper error messages" |
| Ayush | **Exp 8**: AdminDashboardServlet + admin_dashboard.jsp | "Created AdminDashboardServlet with doGet/doPost (Exp 8)" • "Built admin_dashboard.jsp with Bootstrap cards" • "Implemented dashboard stats queries" |
| Mali | **Exp 8**: IssueCertificateServlet + issue.jsp + RMI integration | "Created IssueCertificateServlet (Exp 8)" • "Integrated CryptoRMI for SHA-256 hash (Exp 2)" • "Built issue.jsp with form & live preview" |
| Aryan | **Exp 8**: VerifyCertificateServlet + verify.jsp | "Created VerifyCertificateServlet (Exp 8)" • "Implemented hash recalculation & integrity check" • "Built verify.jsp with result display" |
| Ankit | **Exp 8**: RegistryServlet + list.jsp + JDBC queries | "Created RegistryServlet (Exp 8)" • "Implemented search/filter SQL queries (Exp 4)" • "Built list.jsp with Bootstrap table" |

**Weekly Report**: "Started module coding. Implemented Servlets (Exp 8) & JSP pages (Exp 9) for all 5 modules. Login validation with error messages working."

---

### Week 6 (10 Aug – 16 Aug): Module Coding — Sprint 2

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | RegisterServlet, HttpSession management, AuthFilter (role-based) | "Created RegisterServlet with BCrypt password hashing" • "Implemented HttpSession for login state management" • "Built AuthFilter for role-based access control (Exp 10)" |
| Ayush | User CRUD (Add/Edit/Delete), audit logging | "Implemented Add User with server-side validation" • "Built Edit & Delete user functionality" • "Added audit logging for all admin actions" |
| Mali | QR code generation (ZXing), PDF certificate (iText) | "Integrated ZXing library for QR code on certificates" • "Implemented PDF certificate generation with iText" • "Added AJAX-based live preview update" |
| Aryan | Verification link support, tamper detection UI | "Added verification via direct link (?id=DV-XXXX)" • "Implemented tampered certificate detection display" • "Built certificate-not-found error handling" |
| Ankit | Pagination, filters, JSON/CSV export | "Implemented table pagination for registry" • "Added filter by date, grade, course" • "Built JSON & CSV download/export feature" |

**Weekly Report**: "Advanced coding. Added sessions, role-based access (Exp 10), CRUD, QR codes, PDF generation, search filters."

---

### Week 7 (17 Aug – 23 Aug): Module Coding — Sprint 3

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | Profile page, password change, session timeout | "Built user profile page with edit functionality" • "Implemented password change with old password verification" • "Added session timeout & auto-logout mechanism" |
| Ayush | System settings, bulk operations, Chart.js analytics | "Built system settings page for admin" • "Added bulk user activation/deactivation" • "Integrated Chart.js for dashboard statistics" |
| Mali | Template selection, batch issuance | "Added multiple certificate design templates" • "Implemented batch certificate issuance feature" • "Improved PDF design with college branding" |
| Aryan | Verification history, bulk verification | "Built verification history table for logged-in users" • "Added bulk verification feature via CSV upload" • "Improved verification result UI" |
| Ankit | Analytics/reports page, certificate statistics | "Built reports page with statistics cards" • "Implemented certificate stats by course & grade" • "Added PDF/Excel report export" |

**Weekly Report**: "All module features complete. Added charts, bulk operations, analytics, templates, reports."

---

### Week 8 (24 Aug – 30 Aug): Module Coding — Sprint 4 (Polish + Security)

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | Input validation, XSS prevention, custom error pages | "Added server-side validation for all auth forms" • "Implemented XSS prevention & input sanitization" • "Created custom 404.jsp & 500.jsp error pages" |
| Ayush | Responsive admin UI, admin notifications | "Made admin dashboard fully responsive" • "Added admin notification system" • "Fixed admin panel edge cases & bugs" |
| Mali | Certificate revocation, UI polish | "Added certificate revocation functionality" • "Polished issuance form UI & preview" • "Fixed issuance validation edge cases" |
| Aryan | Responsive verify page, loading states, animations | "Made verification page responsive for mobile" • "Added loading spinner & smooth CSS transitions" • "Fixed verification edge cases" |
| Ankit | Registry responsive, empty states, accessibility | "Made registry table responsive with horizontal scroll" • "Added empty state displays" • "Improved accessibility (ARIA labels)" |

**Weekly Report**: "All 5 modules feature-complete. Added validation, security measures, responsive design, error handling."

---

### Week 9 (31 Aug – 6 Sep): Integration + Testing

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | Integrate Auth with all modules, E2E testing | "Integrated login/session with all 4 modules" • "Tested complete register→login→issue→verify flow" • "Fixed session handling integration bugs" |
| Ayush | Admin integration testing, write test cases | "Tested admin module with auth & certificate modules" • "Wrote test cases for user CRUD operations" • "Fixed bugs found during integration" |
| Mali | RMI + MySQL integration testing, unit tests | "Tested certificate issuance with RMI + MySQL" • "Wrote unit tests for SHA-256 hash generation" • "Fixed certificate generation integration bugs" |
| Aryan | Cross-browser testing, verification E2E | "Tested verification with live database records" • "Cross-browser testing (Chrome, Firefox, Edge)" • "Fixed verification display issues" |
| Ankit | Performance testing, SQL optimization | "Tested registry with 100+ certificate records" • "Optimized SQL queries & added indexing" • "Fixed pagination & search bugs" |

**Weekly Report**: "All 5 modules integrated into single WAR. Testing done — unit, integration, cross-browser, performance. All lab experiments verified."

---

### Week 10 (7 Sep – 13 Sep): Report, PPT, Video, Viva

| Member | Task | Daily Logs (3 days) |
|--------|------|-------------------|
| Amit | Final report (Intro, Architecture, Conclusion) | "Wrote report introduction & project overview" • "Wrote architecture chapter with lab experiment mapping" • "Wrote conclusion & future scope" |
| Ayush | PPT presentation (15-20 slides) | "Created PPT slides with project overview & tech stack" • "Added screenshots, UML diagrams to PPT" • "Finalized PPT, practiced presentation" |
| Mali | Record demo video, screenshots | "Recorded full application demo video" • "Edited demo video with narration" • "Took module screenshots for report" |
| Aryan | Testing chapter in report, viva prep | "Wrote testing chapter with test cases & results" • "Documented all testing scenarios" • "Viva preparation — reviewed all modules" |
| Ankit | GitHub repo cleanup, README, implementation chapter | "Cleaned GitHub repo, added proper README" • "Wrote implementation chapter for report" • "Final review of all deliverables" |

**Weekly Report**: "Submitted final report, PPT, demo video. GitHub repo finalized. Team ready for viva."

---

## 🔗 How Lab Record Experiments Appear in Code

### Exp 8: Servlet (Every module uses this!)
```java
// Example: IssueCertificateServlet.java — takes input, shows result in browser
@WebServlet("/issue")
public class IssueCertificateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        String name = req.getParameter("name");    // Input from user
        String roll = req.getParameter("roll");
        String course = req.getParameter("course");
        String grade = req.getParameter("grade");
        
        // Generate SHA-256 hash via RMI (Exp 2)
        CryptoService rmi = CryptoRMI.startRMIService();
        String hash = rmi.generateSHA256(roll + "|" + name + "|" + course + "|" + grade);
        
        // Save to MySQL (Exp 4)
        String certId = "DV-2026-" + (1000 + new Random().nextInt(9000));
        boolean saved = CertificateDAO.save(certId, name, roll, course, grade, hash);
        
        // Show result in browser (Exp 8)
        req.setAttribute("certId", certId);
        req.setAttribute("hash", hash);
        req.getRequestDispatcher("/jsp/certificate/preview.jsp").forward(req, resp);
    }
}
```

### Exp 9: JSP Login Validation with Error Messages
```jsp
<%-- login.jsp — Exp 9: JSP Login page with validation & error messages --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>DocuVerify — Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow">
                <div class="card-body p-4">
                    <h3 class="text-center mb-4">🔐 DocuVerify Login</h3>
                    
                    <%-- Proper error message display (Exp 9 requirement) --%>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                        <div class="alert alert-success">${success}</div>
                    </c:if>
                    
                    <form action="login" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>
                    <p class="text-center mt-3">
                        <a href="register">Don't have an account? Register</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
```

### Exp 10: Role-Based Access (AuthFilter.java)
```java
// AuthFilter.java — Exp 10: Role-based access control
@WebFilter("/*")
public class AuthFilter implements Filter {
    private static final Set<String> PUBLIC_URLS = Set.of(
        "/login", "/register", "/verify", "/api/verify"
    );
    
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpServletResponse httpResp = (HttpServletResponse) resp;
        String path = httpReq.getServletPath();
        
        // Public pages — no login needed
        if (PUBLIC_URLS.contains(path) || path.startsWith("/css") || path.startsWith("/js")) {
            chain.doFilter(req, resp);
            return;
        }
        
        HttpSession session = httpReq.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            httpResp.sendRedirect("login");
            return;
        }
        
        // Admin-only pages (Exp 10: Role-based)
        if (path.startsWith("/admin")) {
            String role = (String) session.getAttribute("role");
            if (!"admin".equals(role)) {
                httpResp.sendError(403, "Access Denied — Admin only");
                return;
            }
        }
        chain.doFilter(req, resp);
    }
}
```

---

## 📊 Evaluation Breakdown (100 Marks)

| Component | Marks | Responsibility |
|-----------|-------|----------------|
| Idea & Abstract | 5 | Amit (lead) |
| SRS / Documentation | 10 | All members |
| Design (Use-case, Class, ER) | 10 | All members |
| Weekly Progress (tracking) | **25** | All (3 daily + weekly) |
| Implementation & Code Quality | 20 | Each member's module |
| Testing | 10 | All members |
| Presentation | 10 | Ayush (lead) |
| Demo & Viva (individual) | 10 | Each member |

---

## 📂 Existing Code Reuse

| File | Status | Reused As |
|------|--------|-----------|
| [CryptoRMI.java](file:///c:/Users/amitk/OneDrive/Desktop/COLLEGE/5%20sem/java/src/CryptoRMI.java) | ✅ Keep | Move to `com.docuverify.crypto` package — **Exp 2 (RMI)** |
| [DatabaseDAO.java](file:///c:/Users/amitk/OneDrive/Desktop/COLLEGE/5%20sem/java/src/DatabaseDAO.java) | ✅ Keep | Refactor into `CertificateDAO.java` — **Exp 4 (JDBC)** |
| [Server.java](file:///c:/Users/amitk/OneDrive/Desktop/COLLEGE/5%20sem/java/src/Server.java) | ⚠️ Replace | Migrate API routes to Servlets — **Exp 8** |
| [index.html (src)](file:///c:/Users/amitk/OneDrive/Desktop/COLLEGE/5%20sem/java/src/index.html) | ⚠️ Convert | Convert to JSP pages — **Exp 9** |
| [newproject/](file:///c:/Users/amitk/OneDrive/Desktop/COLLEGE/5%20sem/java/newproject) | 📦 Reference | Use UI design as reference for JSP pages |
| mysql-connector-j-26.7.0.jar | ✅ Keep | Copy to `lib/` folder |

---

## ⚠️ Rules & Reminders

1. **GitHub**: Min **3 commits/week** per student
2. **Weekly mentor meeting**: Every **Saturday**
3. **Daily portal logs**: **3 days/week** per student
4. **Plagiarism limit**: **20%**
5. **Mandatory**: MVC, sessions, validation, password hashing, role-based access, responsive UI
6. **Deliverables**: Abstract, SRS, PPT, Report, GitHub Repo, Demo Video, Working Software

---

## 🚀 Next Step

Bhai plan approved hai toh **main coding shuru karta hoon** — pehle project structure banata hoon (Tomcat-ready), phir existing code migrate karta hoon Servlet/JSP mein. Bata de! 🔥
