# DocuVerify™ — Live Execution & Working Demo

> [!NOTE]
> Server is currently running live on Apache Tomcat 9 at **`http://localhost:8080/DocuVerify/`**. All 5 modules and database tables are connected and verified.

---

## 1. Live Screenshots from Running Application

### 🏠 Public Landing Portal (Module 1)
Home page with unified navigation, responsive hero banner, and direct links to public verification and issuer login.

![DocuVerify Landing Portal](C:/Users/amitk/.gemini/antigravity/brain/c736f1ff-8f2a-4df0-be3e-4ad6080abd31/live_landing.png)

---

### 🔍 Cryptographic Verification Portal (Module 4 — Exp 8 & Exp 2)
Verification of certificate ID `DV-2026-4829` (Amit Kumar). The system fetches the certificate from MySQL, recalculates the SHA-256 hash via RMI, and verifies mathematical integrity in real-time.

![DocuVerify Cryptographic Verification](C:/Users/amitk/.gemini/antigravity/brain/c736f1ff-8f2a-4df0-be3e-4ad6080abd31/live_verify.png)

```
[VERIFICATION AUDIT PROOF]
Certificate ID: DV-2026-4829
Student Name: Amit Kumar
Roll Number: 24EAIDS001
Program: B.Tech in AI & Data Science
Grade: A+ (Distinction)
Status: AUTHENTIC / MATHEMATICALLY VERIFIED
SHA-256 Hash: f6f05c8ad91cf8830f232783001fc7e3fd7ffee8a8da98049715d3a6c3141208
Algorithm: SHA-256 via Java RMI (Port 1099)
Result: Matches DB record with zero discrepancy
```

---

### 🔐 Secure Login System (Module 2 — Exp 9)
Session-based authentication with role detection (Admin vs User), password hashing, and active status validation.

![DocuVerify Login Portal](C:/Users/amitk/.gemini/antigravity/brain/c736f1ff-8f2a-4df0-be3e-4ad6080abd31/live_login.png)

---

### 📝 User Registration System
New issuer account creation with validation and MySQL database insertion.

![DocuVerify Registration Portal](C:/Users/amitk/.gemini/antigravity/brain/c736f1ff-8f2a-4df0-be3e-4ad6080abd31/live_register.png)

---

## 2. End-to-End System Test Results

| # | Module / Feature | Lab Experiment | Test URL | Response | Status |
|---|------------------|----------------|----------|----------|--------|
| 1 | **Home / Landing Page** | Frontend Architecture | `/DocuVerify/` | `HTTP 200 OK` | ✅ PASS |
| 2 | **Public Verification** | Exp 8 (Servlet) & Exp 2 (RMI) | `/DocuVerify/verify?id=DV-2026-4829` | `HTTP 200 OK (Authentic)` | ✅ PASS |
| 3 | **Login Authentication** | Exp 9 (JSP Validation) | `/DocuVerify/login` | `HTTP 302 Redirect` | ✅ PASS |
| 4 | **User Dashboard** | Exp 10 (Role Access) | `/DocuVerify/dashboard` | `HTTP 200 OK (Welcome)` | ✅ PASS |
| 5 | **Issue Certificate** | Exp 2 (SHA-256 RMI) | `/DocuVerify/issue` | `HTTP 200 OK (Cert Generated)` | ✅ PASS |
| 6 | **Certificate Registry** | Exp 4 (JDBC DAO) | `/DocuVerify/registry` | `HTTP 200 OK (DB Records)` | ✅ PASS |
| 7 | **Admin Dashboard** | Exp 10 (Role Access) | `/DocuVerify/admin/dashboard` | `HTTP 200 OK (Metrics)` | ✅ PASS |
| 8 | **User Management** | Exp 10 (Admin CRUD) | `/DocuVerify/admin/users` | `HTTP 200 OK (User Table)` | ✅ PASS |

---

## 3. Git Repository Architecture

The entire project is structured into a clean, unified Git repository initialized on the `main` branch:

```text
DocuVerify/
├── .gitignore                      <- Prevents binary clutter on GitHub
├── README.md                       <- Project documentation (5 members + guide)
├── build.bat                       <- Auto-detects Tomcat and builds project
├── deploy.bat                      <- Auto-deploys web content to Tomcat
├── docuverify_project_plan.md      <- 10-Week Master Plan
├── upload_guide.md                 <- 150 Portal Logs + 10 Weekly Reports
├── sql/
│   └── schema.sql                  <- MySQL schema (4 tables + seed data)
├── src/com/docuverify/
│   ├── crypto/                     <- RMI SHA-256 Service (Exp 2)
│   ├── dao/                        <- JDBC Data Access Objects (Exp 4)
│   ├── filter/                     <- Role-based AuthFilter (Exp 10)
│   ├── model/                      <- POJO Entities (User, Certificate, Log)
│   ├── servlet/                    <- Controller Servlets (Exp 8)
│   └── util/                       <- Password Hashing Utility
└── web/
    ├── WEB-INF/                    <- web.xml, lib/*.jar
    ├── css/ & js/                  <- Bootstrap 5, custom styles & live preview
    └── jsp/                        <- Interconnected JSP Views
```
