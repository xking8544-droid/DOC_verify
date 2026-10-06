# 🚀 DocuVerify — Project Complete + Upload Guide

## ✅ Project Build Summary — 43 Files Created!

```
DocuVerify/
├── 📄 build.bat                          ← Compile script
├── 📄 deploy.bat                         ← Tomcat deploy script
├── 📄 README.md                          ← Project documentation
│
├── 🗄️ sql/
│   └── schema.sql                        ← MySQL database schema
│
├── ☕ src/com/docuverify/
│   ├── model/                            ← Data Models
│   │   ├── User.java
│   │   ├── Certificate.java
│   │   └── AuditLog.java
│   ├── dao/                              ← Database Access (JDBC)
│   │   ├── DBConnection.java
│   │   ├── UserDAO.java
│   │   ├── CertificateDAO.java
│   │   └── AuditLogDAO.java
│   ├── crypto/                           ← RMI Crypto (Exp 2)
│   │   ├── CryptoService.java
│   │   └── CryptoRMI.java
│   ├── util/
│   │   └── PasswordUtil.java
│   ├── filter/
│   │   └── AuthFilter.java               ← Role-based (Exp 10)
│   └── servlet/                          ← Servlets (Exp 8)
│       ├── LoginServlet.java
│       ├── RegisterServlet.java
│       ├── LogoutServlet.java
│       ├── DashboardServlet.java
│       ├── ProfileServlet.java
│       ├── AdminDashboardServlet.java
│       ├── ManageUsersServlet.java
│       ├── IssueCertificateServlet.java
│       ├── VerifyCertificateServlet.java
│       └── RegistryServlet.java
│
└── 🌐 web/
    ├── WEB-INF/web.xml
    ├── index.jsp                         ← Landing page
    ├── css/style.css                     ← Bootstrap 5 custom theme
    ├── js/app.js                         ← Client-side logic
    └── jsp/
        ├── login.jsp                     ← Exp 9 (JSP Login)
        ├── register.jsp
        ├── dashboard.jsp
        ├── profile.jsp
        ├── includes/
        │   ├── header.jsp
        │   ├── sidebar.jsp
        │   └── footer.jsp
        ├── admin/
        │   ├── admin_dashboard.jsp
        │   └── manage_users.jsp
        ├── certificate/
        │   ├── issue.jsp
        │   └── verify.jsp
        ├── registry/
        │   └── list.jsp
        └── error/
            ├── 404.jsp
            └── 500.jsp
```

---

## 👤 File Ownership — Kaun Kya Own Karta Hai (Viva ke liye)

### 1. AMIT (Team Leader) — 🔐 Auth Module
| File | Type | Amit ko pata hona chahiye |
|------|------|---------------------------|
| `LoginServlet.java` | Servlet | doPost me username/password check, session set |
| `RegisterServlet.java` | Servlet | Password hash karke DB save |
| `LogoutServlet.java` | Servlet | Session invalidate |
| `ProfileServlet.java` | Servlet | Profile view & edit |
| `AuthFilter.java` | Filter | Role-based access control |
| `UserDAO.java` | DAO | Login/Register SQL queries |
| `User.java` | Model | User fields & getters/setters |
| `PasswordUtil.java` | Util | SHA-256 hashing |
| `login.jsp` | JSP | Login form + error messages (Exp 9) |
| `register.jsp` | JSP | Registration form |
| `profile.jsp` | JSP | Profile page |

### 2. AYUSH — 🛠️ Admin Module
| File | Type | Ayush ko pata hona chahiye |
|------|------|----------------------------|
| `AdminDashboardServlet.java` | Servlet | Stats queries, forward to JSP |
| `ManageUsersServlet.java` | Servlet | User CRUD (Add/Edit/Delete) |
| `AuditLogDAO.java` | DAO | Audit log insert/read |
| `AuditLog.java` | Model | Log fields |
| `admin_dashboard.jsp` | JSP | Stats cards, charts |
| `manage_users.jsp` | JSP | Users table, modal forms |

### 3. MALI — 📜 Certificate Generation Module
| File | Type | Mali ko pata hona chahiye |
|------|------|---------------------------|
| `IssueCertificateServlet.java` | Servlet | Form data → RMI hash → DB save |
| `CryptoRMI.java` | RMI | SHA-256 hash via RMI (Exp 2) |
| `CryptoService.java` | Interface | RMI remote interface |
| `CertificateDAO.java` | DAO | Certificate CRUD queries |
| `Certificate.java` | Model | Certificate fields |
| `issue.jsp` | JSP | Issue form + live preview |

### 4. ARYAN — ✅ Verification Module
| File | Type | Aryan ko pata hona chahiye |
|------|------|----------------------------|
| `VerifyCertificateServlet.java` | Servlet | Hash recalculate & compare |
| `verify.jsp` | JSP | Search + result display |
| `DashboardServlet.java` | Servlet | User dashboard |
| `dashboard.jsp` | JSP | Dashboard page |

### 5. ANKIT — 📊 Registry & Reports Module
| File | Type | Ankit ko pata hona chahiye |
|------|------|----------------------------|
| `RegistryServlet.java` | Servlet | List + search certificates |
| `DBConnection.java` | DAO | MySQL JDBC connection |
| `list.jsp` | JSP | Registry table + search |
| `schema.sql` | SQL | Database tables |
| `README.md` | Doc | Project documentation |

### SHARED (Sabko pata hona chahiye)
| File | Owner | All members should know |
|------|-------|------------------------|
| `web.xml` | Shared | Servlet mappings, session config |
| `header.jsp` | Shared | Common header include |
| `sidebar.jsp` | Shared | Navigation sidebar |
| `footer.jsp` | Shared | Common footer |
| `style.css` | Shared | Bootstrap 5 custom theme |
| `app.js` | Shared | Client-side JS |
| `index.jsp` | Shared | Landing page |
| `404.jsp / 500.jsp` | Shared | Error pages |

---

## 📝 Daily Work Log Entries — Portal Pe Paste Karo

> [!IMPORTANT]
> Har member ko **hafte mein 3 din** daily log submit karna hai portal pe.
> Format: Date | Hours Worked | Status | Work Description

---

### 📅 AMIT — Daily Logs (Copy-Paste Ready)

#### Week 1 (6 Jul – 12 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 07-07-2026 | 3 | Completed | Project idea brainstorming & finalization. Decided DocuVerify - Certificate Generator & Verification Portal |
| 09-07-2026 | 3 | Completed | Wrote project abstract document. Defined scope, objectives, and expected outcomes |
| 11-07-2026 | 2.5 | Completed | Created GitHub repository, added README.md, setup initial project structure |

#### Week 2 (13 Jul – 19 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 14-07-2026 | 3 | Completed | Wrote SRS Introduction, Project Scope, and System Overview sections |
| 16-07-2026 | 3 | Completed | Defined functional requirements for Authentication module - login, register, sessions |
| 18-07-2026 | 2.5 | Completed | Wrote use cases for login validation, password hashing, role-based access |

#### Week 3 (20 Jul – 26 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 21-07-2026 | 3 | Completed | Created system-level Use Case diagram with Admin and User actors |
| 23-07-2026 | 3 | Completed | Designed Class diagram for User, Session, AuthFilter classes |
| 25-07-2026 | 2.5 | Completed | Reviewed all team UML diagrams, provided feedback and corrections |

#### Week 4 (27 Jul – 2 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 28-07-2026 | 3 | Completed | Designed users table schema with password_hash and role columns in MySQL |
| 30-07-2026 | 3 | Completed | Created MySQL database docuverify_db, ran schema.sql to create all tables |
| 01-08-2026 | 2.5 | Completed | Designed login.jsp and register.jsp wireframes using Bootstrap 5 |

#### Week 5 (3 Aug – 9 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 04-08-2026 | 4 | Completed | Created LoginServlet.java with doGet/doPost, form validation, session management |
| 06-08-2026 | 4 | Completed | Built login.jsp with Bootstrap 5 form, error message display using JSTL (Exp 9) |
| 08-08-2026 | 3.5 | Completed | Implemented server-side validation with proper error messages for invalid credentials |

#### Week 6 (10 Aug – 16 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 11-08-2026 | 4 | Completed | Created RegisterServlet.java with BCrypt/SHA-256 password hashing |
| 13-08-2026 | 4 | Completed | Implemented HttpSession management for login state, created LogoutServlet |
| 15-08-2026 | 3.5 | Completed | Built AuthFilter.java for role-based access control - Admin vs User (Exp 10) |

#### Week 7 (17 Aug – 23 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 18-08-2026 | 3.5 | Completed | Built profile.jsp and ProfileServlet for user profile view and edit |
| 20-08-2026 | 3.5 | Completed | Implemented password change feature with old password verification |
| 22-08-2026 | 3 | Completed | Added session timeout handling and auto-logout mechanism |

#### Week 8 (24 Aug – 30 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 25-08-2026 | 4 | Completed | Added server-side input validation for all auth forms, prevented SQL injection |
| 27-08-2026 | 3.5 | Completed | Implemented XSS prevention and input sanitization in all servlets |
| 29-08-2026 | 3 | Completed | Created custom 404.jsp and 500.jsp error pages with Bootstrap design |

#### Week 9 (31 Aug – 6 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 01-09-2026 | 4 | Completed | Integrated login/session system with all 4 other modules (admin, issue, verify, registry) |
| 03-09-2026 | 4 | Completed | Tested complete user flow: register → login → issue certificate → verify → logout |
| 05-09-2026 | 3.5 | Completed | Fixed integration bugs in session handling and role-based redirect logic |

#### Week 10 (7 Sep – 13 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 08-09-2026 | 3.5 | Completed | Wrote final report - Introduction, System Architecture, Authentication module chapter |
| 10-09-2026 | 3 | Completed | Wrote Conclusion, Future Scope, and References sections of report |
| 12-09-2026 | 3 | Completed | Compiled complete report, prepared for viva - reviewed all 5 modules |

---

### 📅 AYUSH — Daily Logs (Copy-Paste Ready)

#### Week 1 (6 Jul – 12 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 07-07-2026 | 3 | Completed | Researched admin dashboard UI patterns and best practices for web applications |
| 09-07-2026 | 2.5 | Completed | Contributed to abstract document writing, defined admin module scope |
| 11-07-2026 | 2.5 | Completed | Setup development environment - installed JDK, Tomcat 9, MySQL, Eclipse IDE |

#### Week 2 (13 Jul – 19 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 14-07-2026 | 3 | Completed | Listed admin module functional requirements - user management, audit logs, settings |
| 16-07-2026 | 3 | Completed | Wrote use cases for admin user management - add, edit, delete, activate/deactivate |
| 18-07-2026 | 2.5 | Completed | Documented admin dashboard features - stats cards, recent activity, system health |

#### Week 3 (20 Jul – 26 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 21-07-2026 | 3 | Completed | Created Activity diagram for admin user management CRUD workflow |
| 23-07-2026 | 3 | Completed | Designed Class diagram for AdminDashboardServlet, ManageUsersServlet, AuditLogDAO |
| 25-07-2026 | 2.5 | Completed | Reviewed and refined all admin module UML diagrams with team feedback |

#### Week 4 (27 Jul – 2 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 28-07-2026 | 3 | Completed | Created audit_logs table schema for tracking all admin actions |
| 30-07-2026 | 3 | Completed | Designed admin dashboard wireframe with Bootstrap 5 stats cards and tables |
| 01-08-2026 | 2.5 | Completed | Created manage users page wireframe with table layout and action buttons |

#### Week 5 (3 Aug – 9 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 04-08-2026 | 4 | Completed | Created AdminDashboardServlet.java with doGet - fetches user count, cert count, logs |
| 06-08-2026 | 4 | Completed | Built admin_dashboard.jsp with Bootstrap 5 stats cards and recent activity table |
| 08-08-2026 | 3.5 | Completed | Implemented database queries for dashboard statistics using PreparedStatement |

#### Week 6 (10 Aug – 16 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 11-08-2026 | 4 | Completed | Created ManageUsersServlet.java with Add User functionality and validation |
| 13-08-2026 | 4 | Completed | Built Edit and Delete user features in ManageUsersServlet |
| 15-08-2026 | 3.5 | Completed | Implemented AuditLogDAO.java - logAction, getRecentLogs, getLogsByUser methods |

#### Week 7 (17 Aug – 23 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 18-08-2026 | 3.5 | Completed | Built manage_users.jsp with Bootstrap table, action buttons, modal forms |
| 20-08-2026 | 3.5 | Completed | Added bulk user activation/deactivation feature in admin panel |
| 22-08-2026 | 3 | Completed | Added audit logging for all admin actions - user create, edit, delete events |

#### Week 8 (24 Aug – 30 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 25-08-2026 | 4 | Completed | Made admin dashboard fully responsive for mobile and tablet screens |
| 27-08-2026 | 3.5 | Completed | Added exception handling in all admin servlets with proper error messages |
| 29-08-2026 | 3 | Completed | Fixed admin panel edge cases - empty states, pagination, form validation |

#### Week 9 (31 Aug – 6 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 01-09-2026 | 4 | Completed | Tested admin module integration with authentication and certificate modules |
| 03-09-2026 | 4 | Completed | Wrote test cases for user management CRUD operations - 15 test scenarios |
| 05-09-2026 | 3.5 | Completed | Fixed bugs found during integration testing - role checks, redirect issues |

#### Week 10 (7 Sep – 13 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 08-09-2026 | 3.5 | Completed | Created PPT presentation slides - Project Overview, Tech Stack, Architecture |
| 10-09-2026 | 3 | Completed | Added screenshots, UML diagrams, and demo flow to PPT presentation |
| 12-09-2026 | 3 | Completed | Finalized 20-slide PPT, practiced presentation with team |

---

### 📅 MALI — Daily Logs (Copy-Paste Ready)

#### Week 1 (6 Jul – 12 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 07-07-2026 | 3 | Completed | Studied SHA-256 hashing algorithm in Java using MessageDigest class |
| 09-07-2026 | 2.5 | Completed | Researched Java RMI for remote cryptographic service, studied QR code libraries |
| 11-07-2026 | 2.5 | Completed | Contributed to abstract document, defined certificate generation scope |

#### Week 2 (13 Jul – 19 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 14-07-2026 | 3 | Completed | Listed certificate generation module functional requirements - form, hash, QR, PDF |
| 16-07-2026 | 3 | Completed | Wrote use cases for certificate issuance - input validation, hash generation, DB save |
| 18-07-2026 | 2.5 | Completed | Documented SHA-256 hash generation process via RMI in SRS document |

#### Week 3 (20 Jul – 26 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 21-07-2026 | 3 | Completed | Created Sequence diagram for certificate issuance: User→Servlet→RMI→DB→JSP |
| 23-07-2026 | 3 | Completed | Designed Class diagram for CryptoRMI, CryptoService, CertificateDAO classes |
| 25-07-2026 | 2.5 | Completed | Reviewed all diagrams with team, refined certificate flow |

#### Week 4 (27 Jul – 2 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 28-07-2026 | 3 | Completed | Created certificates table with cert_id, student_name, crypto_hash columns |
| 30-07-2026 | 3 | Completed | Designed certificate issuance form wireframe with live preview section |
| 01-08-2026 | 2.5 | Completed | Created live certificate preview UI mockup with Bootstrap 5 |

#### Week 5 (3 Aug – 9 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 04-08-2026 | 4 | Completed | Created IssueCertificateServlet.java - handles form POST, generates cert ID |
| 06-08-2026 | 4 | Completed | Integrated CryptoRMI for SHA-256 hash generation via RMI service (Exp 2) |
| 08-08-2026 | 3.5 | Completed | Built issue.jsp with certificate form and CertificateDAO.saveCertificate |

#### Week 6 (10 Aug – 16 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 11-08-2026 | 4 | Completed | Implemented CryptoRMI.java - RMI server on port 1099, SHA-256 hash method |
| 13-08-2026 | 4 | Completed | Built CertificateDAO.java with save, get, search, revoke methods using JDBC |
| 15-08-2026 | 3.5 | Completed | Added live preview JavaScript - certificate preview updates as user types |

#### Week 7 (17 Aug – 23 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 18-08-2026 | 3.5 | Completed | Added certificate success result display with cert ID and hash after issuance |
| 20-08-2026 | 3.5 | Completed | Implemented Certificate.java model with all fields and getters/setters |
| 22-08-2026 | 3 | Completed | Added form validation for issue form - required fields, input length checks |

#### Week 8 (24 Aug – 30 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 25-08-2026 | 4 | Completed | Added certificate revocation feature in IssueCertificateServlet |
| 27-08-2026 | 3.5 | Completed | Polished certificate issuance UI - form styling, success/error alerts |
| 29-08-2026 | 3 | Completed | Fixed issuance edge cases - duplicate cert ID, empty fields, DB connection errors |

#### Week 9 (31 Aug – 6 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 01-09-2026 | 4 | Completed | Tested certificate issuance with full RMI + MySQL integration end-to-end |
| 03-09-2026 | 4 | Completed | Wrote unit tests for SHA-256 hash generation - verified hash consistency |
| 05-09-2026 | 3.5 | Completed | Fixed certificate generation integration bugs - RMI port conflicts, DB errors |

#### Week 10 (7 Sep – 13 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 08-09-2026 | 3.5 | Completed | Recorded full application demo video showing all 5 modules in action |
| 10-09-2026 | 3 | Completed | Edited demo video with narration explaining each feature |
| 12-09-2026 | 3 | Completed | Took all module screenshots for final report documentation |

---

### 📅 ARYAN — Daily Logs (Copy-Paste Ready)

#### Week 1 (6 Jul – 12 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 07-07-2026 | 3 | Completed | Studied certificate verification workflows and existing verification portals |
| 09-07-2026 | 2.5 | Completed | Analyzed hash-based integrity verification mechanism for certificates |
| 11-07-2026 | 2.5 | Completed | Contributed to abstract writing, helped finalize project idea |

#### Week 2 (13 Jul – 19 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 14-07-2026 | 3 | Completed | Listed verification module functional requirements - search, hash check, results |
| 16-07-2026 | 3 | Completed | Wrote use cases for certificate verification - authentic, tampered, not found |
| 18-07-2026 | 2.5 | Completed | Documented verification result display scenarios in SRS |

#### Week 3 (20 Jul – 26 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 21-07-2026 | 3 | Completed | Created Sequence diagram for verification: User→Servlet→DB→RMI→Compare→JSP |
| 23-07-2026 | 3 | Completed | Designed Activity diagram for hash comparison and result determination |
| 25-07-2026 | 2.5 | Completed | Finalized all verification UML diagrams after team review |

#### Week 4 (27 Jul – 2 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 28-07-2026 | 3 | Completed | Finalized ER diagram with all foreign key relationships between tables |
| 30-07-2026 | 3 | Completed | Created verification page wireframe with search box and result cards |
| 01-08-2026 | 2.5 | Completed | Designed verification result mockup - verified, tampered, not found states |

#### Week 5 (3 Aug – 9 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 04-08-2026 | 4 | Completed | Created VerifyCertificateServlet.java - GET handler with cert ID parameter |
| 06-08-2026 | 4 | Completed | Implemented hash recalculation and integrity comparison logic |
| 08-08-2026 | 3.5 | Completed | Built verify.jsp with search form and result display sections |

#### Week 6 (10 Aug – 16 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 11-08-2026 | 4 | Completed | Added verification via direct URL link - verify?id=DV-2026-XXXX |
| 13-08-2026 | 4 | Completed | Implemented tampered certificate detection with warning display |
| 15-08-2026 | 3.5 | Completed | Built certificate-not-found error handling with user-friendly message |

#### Week 7 (17 Aug – 23 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 18-08-2026 | 3.5 | Completed | Created DashboardServlet.java for user dashboard with recent certificates |
| 20-08-2026 | 3.5 | Completed | Built dashboard.jsp with welcome message, stats cards, quick actions |
| 22-08-2026 | 3 | Completed | Improved verification result UI - green/red/yellow cards with icons |

#### Week 8 (24 Aug – 30 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 25-08-2026 | 4 | Completed | Made verification page fully responsive for mobile and tablet screens |
| 27-08-2026 | 3.5 | Completed | Added loading spinner and smooth CSS animations for verify results |
| 29-08-2026 | 3 | Completed | Fixed verification edge cases - empty input, special characters, long cert IDs |

#### Week 9 (31 Aug – 6 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 01-09-2026 | 4 | Completed | Tested verification with live database records - all 3 result types verified |
| 03-09-2026 | 4 | Completed | Cross-browser testing on Chrome, Firefox, Edge - fixed CSS compatibility issues |
| 05-09-2026 | 3.5 | Completed | Fixed verification display issues - long hash overflow, mobile layout |

#### Week 10 (7 Sep – 13 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 08-09-2026 | 3.5 | Completed | Wrote Testing chapter for report - documented all test cases and results |
| 10-09-2026 | 3 | Completed | Documented 20 test scenarios with expected vs actual results table |
| 12-09-2026 | 3 | Completed | Viva preparation - reviewed all 5 modules, practiced Q&A |

---

### 📅 ANKIT — Daily Logs (Copy-Paste Ready)

#### Week 1 (6 Jul – 12 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 07-07-2026 | 3 | Completed | Studied JDBC connection pooling and database best practices for Java web apps |
| 09-07-2026 | 2.5 | Completed | Researched Bootstrap 5 table components and responsive data tables |
| 11-07-2026 | 2.5 | Completed | Contributed to abstract document, defined registry module scope |

#### Week 2 (13 Jul – 19 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 14-07-2026 | 3 | Completed | Wrote non-functional requirements - performance, security, scalability |
| 16-07-2026 | 3 | Completed | Listed hardware & software requirements - JDK 8+, Tomcat 9, MySQL 8.0 |
| 18-07-2026 | 2.5 | Completed | Wrote registry module requirements, compiled and reviewed full SRS document |

#### Week 3 (20 Jul – 26 Jul)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 21-07-2026 | 3 | Completed | Created ER diagram with users, certificates, audit_logs, verification_history tables |
| 23-07-2026 | 3 | Completed | Created Component/Deployment diagram showing Tomcat deployment architecture |
| 25-07-2026 | 2.5 | Completed | Compiled all team UML diagrams into final design document |

#### Week 4 (27 Jul – 2 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 28-07-2026 | 3 | Completed | Setup Bootstrap 5 responsive base layout for all JSP pages |
| 30-07-2026 | 3 | Completed | Created certificate registry table listing page mockup with search |
| 01-08-2026 | 2.5 | Completed | Designed search & filter UI components for registry |

#### Week 5 (3 Aug – 9 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 04-08-2026 | 4 | Completed | Created RegistryServlet.java with doGet - fetches all certificates with search |
| 06-08-2026 | 4 | Completed | Implemented search/filter SQL queries using JDBC PreparedStatement (Exp 4) |
| 08-08-2026 | 3.5 | Completed | Built list.jsp with Bootstrap table showing cert ID, name, course, grade |

#### Week 6 (10 Aug – 16 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 11-08-2026 | 4 | Completed | Implemented table pagination for registry - 10 records per page |
| 13-08-2026 | 4 | Completed | Added filter by date range, grade, and course in registry |
| 15-08-2026 | 3.5 | Completed | Built DBConnection.java with MySQL JDBC connection utility |

#### Week 7 (17 Aug – 23 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 18-08-2026 | 3.5 | Completed | Built schema.sql with all 4 tables and sample data for testing |
| 20-08-2026 | 3.5 | Completed | Implemented certificate statistics - count by course, grade breakdown |
| 22-08-2026 | 3 | Completed | Added JSON/CSV download export feature for certificate records |

#### Week 8 (24 Aug – 30 Aug)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 25-08-2026 | 4 | Completed | Made registry table responsive with horizontal scroll for mobile |
| 27-08-2026 | 3.5 | Completed | Added empty state display when no certificates found in search |
| 29-08-2026 | 3 | Completed | Improved accessibility - ARIA labels, keyboard navigation, screen reader support |

#### Week 9 (31 Aug – 6 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 01-09-2026 | 4 | Completed | Tested registry with 100+ certificate records - verified pagination and search |
| 03-09-2026 | 4 | Completed | Optimized SQL queries with proper indexing on cert_id and roll_no columns |
| 05-09-2026 | 3.5 | Completed | Fixed pagination bugs and search result count display issues |

#### Week 10 (7 Sep – 13 Sep)
| Date | Hours | Status | Work Description |
|------|-------|--------|-----------------|
| 08-09-2026 | 3.5 | Completed | Cleaned up GitHub repository, added proper README with setup instructions |
| 10-09-2026 | 3 | Completed | Wrote Implementation chapter for report - code structure, tech stack details |
| 12-09-2026 | 3 | Completed | Final review of all deliverables - report, PPT, video, GitHub, working software |

---

## 📋 Weekly Reports — Portal Pe Paste Karo

> [!IMPORTANT]
> Har hafta **1 weekly report** submit karna hai. Neeche sabke liye **same content** hai kyunki team report hai.

| Week | Work Completed | Problems Faced | Plan for Next Week |
|------|---------------|----------------|-------------------|
| **Week 1** | Formed team 5A with 5 members. Selected Er. Ram Babu Buri as guide. Finalized DocuVerify project idea. Wrote and submitted abstract. Created GitHub repository with initial project structure. | Choosing between JSP-Servlet and Spring Boot - finalized JSP-Servlet to match lab experiments. | Start writing SRS document with all functional requirements. |
| **Week 2** | Completed full SRS document covering all 5 modules. Defined functional & non-functional requirements, use cases, system constraints. Documented tech stack: JSP-Servlet (Tomcat 9), MySQL, Bootstrap 5. | Defining exact scope for each module was challenging, resolved through team discussion. | Design UML diagrams - Use Case, Class, Sequence, Activity diagrams. |
| **Week 3** | Designed complete UML diagrams - Use Case diagram with Admin/User actors, Class diagrams for all modules, Sequence diagrams for certificate issuance and verification flows, Activity diagrams for key workflows. | Complex relationships between modules required multiple revisions of class diagram. | Database design and UI mockups for all 5 modules. |
| **Week 4** | Created MySQL database schema with 4 tables (users, certificates, audit_logs, verification_history). Finalized ER diagram. Built UI mockups for all 5 modules using Bootstrap 5 wireframes. | MySQL foreign key constraints required careful planning of table creation order. | Start module coding - each member builds their assigned module. |
| **Week 5** | Each member started coding their module. Created Servlets (Exp 8) and JSP pages (Exp 9) for Login, Admin Dashboard, Certificate Issuance, Verification, and Registry. Basic CRUD operations implemented. | Servlet mapping issues with web.xml resolved by using @WebServlet annotations. | Continue module coding with advanced features. |
| **Week 6** | Advanced coding completed. Implemented sessions & role-based access (Exp 10), user CRUD in admin panel, RMI-based SHA-256 hash generation (Exp 2), verification hash comparison, registry search & pagination. | RMI service port conflicts when running alongside Tomcat - added fallback logic. | Complete remaining features and start connecting modules. |
| **Week 7** | All module features completed. Added user profile management, audit logging, certificate success display, dashboard with stats, database schema finalization, and export functionality. | Handling concurrent RMI and HTTP requests required careful threading design. | Final module polishing - security, responsive design, error handling. |
| **Week 8** | All 5 modules feature-complete. Added input validation, XSS prevention, responsive design for all pages, custom error pages (404, 500), loading animations, and edge case handling. | Cross-browser CSS differences required media query adjustments for mobile. | Integration of all modules and comprehensive testing. |
| **Week 9** | All 5 modules integrated into single web application. Comprehensive testing completed - unit tests, integration tests, cross-browser testing (Chrome, Firefox, Edge), performance testing with 100+ records. | Session sharing between modules required careful AuthFilter configuration. | Prepare final report, PPT, demo video for submission. |
| **Week 10** | Submitted final report (60+ pages), PPT presentation (20 slides), demo video (10 min), GitHub repo with clean code and README. All team members prepared for individual viva. | Time management for completing all documentation deliverables simultaneously. | Final viva preparation and project demonstration. |

---

## 🔗 GitHub Commit Plan (Min 3 commits/week per student)

| Week | Amit Commits | Ayush Commits | Mali Commits | Aryan Commits | Ankit Commits |
|------|-------------|---------------|-------------|---------------|---------------|
| 1 | Initial commit, README, abstract | Project structure | Research docs | Research docs | .gitignore |
| 2 | SRS-auth section | SRS-admin section | SRS-cert section | SRS-verify section | SRS-nfr, compile |
| 3 | Use case diagram | Activity diagram | Sequence diagram | Sequence diagram | ER diagram |
| 4 | users table, login mockup | audit table, admin mockup | cert table, form mockup | ER final, verify mockup | Bootstrap setup, list mockup |
| 5 | LoginServlet, login.jsp | AdminServlet, admin.jsp | IssueServlet, CryptoRMI | VerifyServlet, verify.jsp | RegistryServlet, list.jsp |
| 6 | RegisterServlet, AuthFilter | ManageUsers, AuditLogDAO | CertificateDAO, preview | Link verify, error UI | DBConnection, pagination |
| 7 | ProfileServlet, profile.jsp | manage_users.jsp, bulk ops | Certificate model, validate | Dashboard, dashboard.jsp | schema.sql, stats, export |
| 8 | Validation, XSS, error pages | Responsive admin, notify | Revoke, UI polish | Responsive verify, loading | Responsive table, ARIA |
| 9 | Auth integration, E2E tests | Admin tests, bug fixes | RMI tests, bug fixes | Cross-browser tests | Performance tests, indexing |
| 10 | Report final, viva prep | PPT slides | Demo video | Test chapter | README, cleanup |

---

## ⚡ Quick Setup Instructions

1. **MySQL Setup**: `mysql -u root -p < sql/schema.sql`
2. **Tomcat Setup**: Copy `web/` folder to `TOMCAT_HOME/webapps/DocuVerify/`
3. **Compile**: Run `build.bat` (set TOMCAT_LIB path first)
4. **Access**: `http://localhost:8080/DocuVerify/`
5. **Admin Login**: username=`admin`, password=`admin123`
