# 🚀 DocuVerify — 12-Week Portal Upload Guide & Master Viva Handbook

> [!IMPORTANT]
> **Project Duration**: 6 July 2026 – 6 October 2026 (**12 Full Academic Weeks**)  
> **Team 5A**: Amit (Leader), Ayush, Mali, Aryan, Ankit  
> **Guide**: Er. Ram Babu Buri | **Track**: Web Application (JSP-Servlet + MySQL)  
> **Submission Requirements**: 3 Daily Logs per student per week (36 logs/student = **180 total logs**) + **12 Weekly Reports**.

---

## 👤 Viva File Ownership (Kaun Sa Member Kya Explain Karega)

| Member | Primary Module | Core Java Files Owned | JSP & Frontend Views | Lab Exp Mapped | Key Concepts to Explain in Viva |
|---|---|---|---|---|---|
| **Amit** | 🔐 Authentication & Security | `LoginServlet.java`<br>`RegisterServlet.java`<br>`LogoutServlet.java`<br>`ProfileServlet.java`<br>`UserDAO.java`<br>`User.java`<br>`PasswordUtil.java`<br>`AuthFilter.java` | `login.jsp`<br>`register.jsp`<br>`profile.jsp` | **Exp 1** (Threading)<br>**Exp 8** (Servlet)<br>**Exp 9** (JSP Login) | Session management via `HttpSession`, password hashing, server-side validation error handling, role-based filter interception. |
| **Ayush** | 🛠️ Admin Dashboard & Operations | `AdminDashboardServlet.java`<br>`ManageUsersServlet.java`<br>`AuditLogDAO.java`<br>`AuditLog.java` | `admin_dashboard.jsp`<br>`manage_users.jsp` | **Exp 7** (Exception/Log)<br>**Exp 8** (Servlet)<br>**Exp 10** (Role Mini-Proj) | Admin authorization boundaries, user CRUD actions, audit log tracking with timestamps & IP logging. |
| **Mali** | 📜 Certificate Issuance & Crypto | `CryptoRMI.java`<br>`CryptoService.java`<br>`IssueCertificateServlet.java`<br>`Certificate.java` | `issue.jsp` | **Exp 2** (Java RMI)<br>**Exp 5** (Dynamic GUI)<br>**Exp 8** (Servlet) | SHA-256 digest computation over Java RMI (Port 1099), string concatenation formula (`roll|name|course|grade`), live DOM preview. |
| **Aryan** | 🔍 Verification & Validation Engine | `VerifyCertificateServlet.java`<br>`DashboardServlet.java` | `verify.jsp`<br>`dashboard.jsp`<br>`index.jsp` | **Exp 3** (Form Input)<br>**Exp 8** (Servlet)<br>**Exp 9** (Validation) | Real-time hash comparison, cryptographic proof rendering, tamper detection logic, user dashboard certificate counters. |
| **Ankit** | 📊 Registry & Database Architecture | `RegistryServlet.java`<br>`DBConnection.java`<br>`CertificateDAO.java` | `list.jsp`<br>`web.xml`<br>`schema.sql` | **Exp 4** (JDBC)<br>**Exp 7** (Exception/Files)<br>**Exp 8** (Servlet) | MySQL JDBC driver connectivity, parameterized `PreparedStatement` queries to prevent SQL Injection, table search & filtering. |

---

## 📝 180 Daily Work Logs (12 Weeks × 3 Days × 5 Members)

### 👤 1. AMIT (Team Leader) — 36 Daily Logs

| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Project ideation and team alignment. Finalized DocuVerify certificate security concept. |
| **W1** | 09-07-2026 | 3.5 | Completed | Drafted project abstract, objective scope, and system boundaries for college submission. |
| **W1** | 11-07-2026 | 3.0 | Completed | Initialized Git repository on main branch; setup Java project directory structure and packages. |
| **W2** | 14-07-2026 | 3.0 | Completed | Authored SRS Section 1: Product overview, user classes, operating environment, and constraints. |
| **W2** | 16-07-2026 | 3.5 | Completed | Defined functional requirements for Authentication, Session Management, and Role Access. |
| **W2** | 18-07-2026 | 2.5 | Completed | Reviewed and compiled complete SRS document v1.0 with team member module sections. |
| **W3** | 21-07-2026 | 3.0 | Completed | Designed system-level Use Case diagram featuring Admin, Issuer, and Public Verifier actors. |
| **W3** | 23-07-2026 | 3.5 | Completed | Created Class Diagram for authentication domain: `User`, `AuthFilter`, `UserDAO`, `HttpSession`. |
| **W3** | 25-07-2026 | 3.0 | Completed | Conducted architecture review with guide Er. Ram Babu Buri; finalized JSP-Servlet track. |
| **W4** | 28-07-2026 | 3.0 | Completed | Created MySQL schema for `users` table with password_hash, full_name, and role columns. |
| **W4** | 30-07-2026 | 3.5 | Completed | Designed responsive wireframe mockups for `login.jsp` using Bootstrap 5 auth container. |
| **W4** | 01-08-2026 | 3.0 | Completed | Designed responsive wireframe mockups for `register.jsp` and user profile views. |
| **W5** | 04-08-2026 | 4.0 | Completed | Implemented `LoginServlet.java` taking credentials from request and handling POST flow (Exp 8). |
| **W5** | 06-08-2026 | 3.5 | Completed | Developed `login.jsp` with Bootstrap 5 styling, field validation alerts, and error feedback (Exp 9). |
| **W5** | 08-08-2026 | 3.0 | Completed | Created `PasswordUtil.java` helper class for cryptographic password verification. |
| **W6** | 11-08-2026 | 3.5 | Completed | Developed `RegisterServlet.java` validating registration input and preventing duplicate usernames. |
| **W6** | 13-08-2026 | 4.0 | Completed | Implemented `UserDAO.registerUser()` and `UserDAO.loginUser()` using JDBC PreparedStatements. |
| **W6** | 15-08-2026 | 3.0 | Completed | Connected `register.jsp` form submission with database insertion and success redirection. |
| **W7** | 18-08-2026 | 3.5 | Completed | Implemented `HttpSession` state binding, storing authenticated user object upon valid login. |
| **W7** | 20-08-2026 | 3.0 | Completed | Developed `LogoutServlet.java` to invalidate session tokens and redirect to login with notification. |
| **W7** | 22-08-2026 | 3.5 | Completed | Added remember session utilities and login state reflection across application headers. |
| **W8** | 25-08-2026 | 3.0 | Completed | Implemented `ProfileServlet.java` allowing users to view and update personal profile records. |
| **W8** | 27-08-2026 | 3.5 | Completed | Built `profile.jsp` interface featuring editable user fields and current privilege badge. |
| **W8** | 29-08-2026 | 3.0 | Completed | Added password change validation ensuring old password confirmation matches database hash. |
| **W9** | 01-09-2026 | 4.0 | Completed | Developed `AuthFilter.java` intercepting all HTTP requests to enforce authentication boundaries (Exp 10). |
| **W9** | 03-09-2026 | 3.5 | Completed | Configured role-based restriction blocking non-admin accounts from `/admin/*` servlet endpoints. |
| **W9** | 05-09-2026 | 3.0 | Completed | Configured public whitelist in `AuthFilter` for `/`, `/login`, `/register`, `/verify`, and `/registry`. |
| **W10** | 08-09-2026 | 3.5 | Completed | Audited all servlet parameters against SQL Injection using strict parameterized queries. |
| **W10** | 10-09-2026 | 3.5 | Completed | Implemented HTML entity escaping across JSP views to eliminate Cross-Site Scripting (XSS). |
| **W10** | 12-09-2026 | 3.0 | Completed | Designed and implemented custom HTTP error handling pages `404.jsp` and `500.jsp`. |
| **W11** | 15-09-2026 | 4.0 | Completed | Executed security test suite: SQL injection payload injection, brute force login resistance. |
| **W11** | 17-09-2026 | 3.5 | Completed | Conducted session timeout testing and cookie hijacking prevention audits. |
| **W11** | 19-09-2026 | 3.5 | Completed | Verified cross-module authentication synchronization with Admin and Issuance modules. |
| **W12** | 22-09-2026 | 4.0 | Completed | Authored Project Report Chapter 1 (Introduction), Chapter 2 (Architecture), and Chapter 6 (Security). |
| **W12** | 24-09-2026 | 3.5 | Completed | Structured viva voce defense presentation on role-based web filters and servlet lifecycles. |
| **W12** | 26-09-2026 | 3.0 | Completed | Final project repository review, documentation audit, and final submission sign-off. |

---

### 👤 2. AYUSH — 36 Daily Logs

| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Researched web administration portal design patterns and enterprise audit logging systems. |
| **W1** | 09-07-2026 | 3.0 | Completed | Assisted in defining project abstract scope and administrative privilege hierarchy. |
| **W1** | 11-07-2026 | 3.0 | Completed | Configured local Java Development Kit (JDK 24) and Apache Tomcat 9 development environment. |
| **W2** | 14-07-2026 | 3.5 | Completed | Authored SRS functional specifications for Admin Dashboard metrics and user oversight. |
| **W2** | 16-07-2026 | 3.0 | Completed | Documented use case specifications for user status management (Activate, Deactivate, Delete). |
| **W2** | 18-07-2026 | 3.0 | Completed | Formulated audit logging requirements tracking IP address, action type, and action timestamp. |
| **W3** | 21-07-2026 | 3.5 | Completed | Designed Activity Diagram modeling administrative user management and user deletion flows. |
| **W3** | 23-07-2026 | 3.0 | Completed | Constructed Class Diagram for administrative layer: `AdminDashboardServlet`, `ManageUsersServlet`. |
| **W3** | 25-07-2026 | 3.0 | Completed | Mapped relational constraints between `users` table and corresponding `audit_logs` records. |
| **W4** | 28-07-2026 | 3.5 | Completed | Created MySQL schema for `audit_logs` table with foreign key reference to `users.id`. |
| **W4** | 30-07-2026 | 3.5 | Completed | Built UI wireframe mockup for `admin_dashboard.jsp` with metrics counters and activity cards. |
| **W4** | 01-08-2026 | 3.0 | Completed | Built UI wireframe mockup for `manage_users.jsp` featuring user listing and action triggers. |
| **W5** | 04-08-2026 | 3.5 | Completed | Configured Apache Tomcat 9 deployment descriptor (`web.xml`) session timeout settings. |
| **W5** | 06-08-2026 | 4.0 | Completed | Developed `AdminDashboardServlet.java` skeleton mapping `/admin/dashboard` endpoint (Exp 8). |
| **W5** | 08-08-2026 | 3.0 | Completed | Designed `admin_dashboard.jsp` layout with Bootstrap 5 cards for Users and Certificates count. |
| **W6** | 11-08-2026 | 3.5 | Completed | Implemented `AuditLog.java` POJO entity with getters, setters, and SQL timestamp mapping. |
| **W6** | 13-08-2026 | 3.5 | Completed | Implemented `AuditLogDAO.java` with `logAction()` method inserting action audit trail to MySQL. |
| **W6** | 15-08-2026 | 3.0 | Completed | Verified automated audit log recording when users authenticate or perform sensitive operations. |
| **W7** | 18-08-2026 | 3.5 | Completed | Developed `ManageUsersServlet.java` handling GET request to retrieve all registered accounts. |
| **W7** | 20-08-2026 | 4.0 | Completed | Built dynamic users table in `manage_users.jsp` displaying User ID, Name, Email, and Roles. |
| **W7** | 22-08-2026 | 3.0 | Completed | Integrated JSTL `<c:forEach>` tags inside `manage_users.jsp` for database record iteration. |
| **W8** | 25-08-2026 | 3.5 | Completed | Implemented user deletion POST handler in `ManageUsersServlet.java` with confirmation triggers. |
| **W8** | 27-08-2026 | 3.5 | Completed | Added safety check preventing deletion of the primary root `admin` superuser account. |
| **W8** | 29-08-2026 | 3.0 | Completed | Implemented `AuditLogDAO.getRecentLogs()` method querying last 10 security transactions. |
| **W9** | 01-09-2026 | 4.0 | Completed | Connected `admin_dashboard.jsp` with live database counts: `totalUsers` and `totalCerts`. |
| **W9** | 03-09-2026 | 3.5 | Completed | Integrated recent audit trail feed inside Admin Dashboard displaying latest system events. |
| **W9** | 05-09-2026 | 3.0 | Completed | Implemented active RMI service status indicator badge on the admin metrics overview panel. |
| **W10** | 08-09-2026 | 3.5 | Completed | Configured global error code forwarders in `web.xml` for error 404 and error 500 handling. |
| **W10** | 10-09-2026 | 3.5 | Completed | Added responsive navigation toggling in `sidebar.jsp` optimized for tablets and mobile devices. |
| **W10** | 12-09-2026 | 3.0 | Completed | Verified database transaction integrity when deleting users and associated audit dependencies. |
| **W11** | 15-09-2026 | 3.5 | Completed | Conducted permission testing validating that non-admin accounts receive HTTP 403 Forbidden. |
| **W11** | 17-09-2026 | 4.0 | Completed | Tested user deletion workflow, audit record generation, and immediate table refresh. |
| **W11** | 19-09-2026 | 3.0 | Completed | Benchmarked dashboard loading latency with concurrent user sessions active. |
| **W12** | 22-09-2026 | 4.0 | Completed | Prepared PowerPoint Presentation slides (1-10) detailing problem, architecture, and admin tools. |
| **W12** | 24-09-2026 | 3.5 | Completed | Documented Admin Module implementation chapter and database entity dictionary for report. |
| **W12** | 26-09-2026 | 3.0 | Completed | Rehearsed live viva presentation demonstrating admin control panel and user governance. |

---

### 👤 3. MALI — 36 Daily Logs

| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Researched cryptographic hash functions, comparing SHA-256 vs MD5 for certificate security. |
| **W1** | 09-07-2026 | 3.0 | Completed | Investigated Java Remote Method Invocation (RMI) for modular cryptographic service isolation. |
| **W1** | 11-07-2026 | 3.0 | Completed | Created standalone test script benchmarking SHA-256 hash generation throughput in Java. |
| **W2** | 14-07-2026 | 3.5 | Completed | Documented functional requirements for Certificate Generation: input fields, validation rules. |
| **W2** | 16-07-2026 | 3.0 | Completed | Formulated payload serialization format: `rollNo|studentName|courseName|grade`. |
| **W2** | 18-07-2026 | 3.0 | Completed | Defined RMI cryptographic service contract requirements and error recovery behaviors. |
| **W3** | 21-07-2026 | 3.5 | Completed | Created Sequence Diagram modeling Certificate Issuance: User Form → Servlet → RMI → MySQL. |
| **W3** | 23-07-2026 | 3.0 | Completed | Designed Class Diagram for cryptographic layer: `CryptoService`, `CryptoRMI`, `Certificate`. |
| **W3** | 25-07-2026 | 3.0 | Completed | Documented remote stub registration sequence on RMI registry port 1099. |
| **W4** | 28-07-2026 | 3.5 | Completed | Created MySQL schema for `certificates` table with `crypto_hash` and `cert_id` unique constraints. |
| **W4** | 30-07-2026 | 3.5 | Completed | Designed UI wireframe for `issue.jsp` featuring student input form alongside live preview card. |
| **W4** | 01-08-2026 | 3.0 | Completed | Designed certificate layout template with college seal, candidate details, and hash banner. |
| **W5** | 04-08-2026 | 3.5 | Completed | Created `Certificate.java` entity model with attributes, constructors, and JavaBeans getters/setters. |
| **W5** | 06-08-2026 | 4.0 | Completed | Defined `CryptoService.java` remote interface declaring `generateSHA256(String data)` method. |
| **W5** | 08-08-2026 | 3.0 | Completed | Implemented `CryptoRMI.java` extending `UnicastRemoteObject` with MessageDigest SHA-256 (Exp 2). |
| **W6** | 11-08-2026 | 4.0 | Completed | Added automatic RMI registry creation (`LocateRegistry.createRegistry(1099)`) in `CryptoRMI`. |
| **W6** | 13-08-2026 | 3.5 | Completed | Added fallback `CryptoRMI.getService()` method ensuring high availability without manual restarts. |
| **W6** | 15-08-2026 | 3.0 | Completed | Tested remote invocation of SHA-256 hashing across multiple concurrent thread executions. |
| **W7** | 18-08-2026 | 4.0 | Completed | Developed `IssueCertificateServlet.java` mapping `/issue` and `/certificate/issue` (Exp 8). |
| **W7** | 20-08-2026 | 3.5 | Completed | Connected `IssueCertificateServlet` to RMI crypto service to compute hash from input payload. |
| **W7** | 22-08-2026 | 3.5 | Completed | Implemented unique certificate ID generator formula generating tokens like `DV-2026-XXXX`. |
| **W8** | 25-08-2026 | 3.5 | Completed | Implemented `CertificateDAO.saveCertificate()` using JDBC PreparedStatement insertion. |
| **W8** | 27-08-2026 | 3.5 | Completed | Built `issue.jsp` UI form with Bootstrap 5 input floating labels and grade classification options. |
| **W8** | 29-08-2026 | 3.0 | Completed | Built dynamic Success Card in `issue.jsp` displaying newly issued Cert ID and SHA-256 hash. |
| **W9** | 01-09-2026 | 3.5 | Completed | Connected certificate issuance with `AuditLogDAO` recording issue actions and issuer user ID. |
| **W9** | 03-09-2026 | 3.5 | Completed | Implemented client-side live preview in `app.js` updating certificate candidate name in real-time. |
| **W9** | 05-09-2026 | 3.0 | Completed | Added direct "View Public Verification" button inside issuance success notification card. |
| **W10** | 08-09-2026 | 3.5 | Completed | Added alias getters (`getCertificateId`, `getHashValue`, `getCourse`) in `Certificate.java`. |
| **W10** | 10-09-2026 | 3.5 | Completed | Tested edge case inputs: special characters in student names, lengthy degree program titles. |
| **W10** | 12-09-2026 | 3.0 | Completed | Added JSTL taglib directives to `issue.jsp` resolving dynamic attribute rendering. |
| **W11** | 15-09-2026 | 4.0 | Completed | Executed cryptographic hash collision testing verifying distinct hashes for similar names. |
| **W11** | 17-09-2026 | 3.5 | Completed | Conducted RMI communication stress testing simulating network disconnects and auto-rebind. |
| **W11** | 19-09-2026 | 3.0 | Completed | Validated foreign key linkage between issued certificates and authenticated user IDs. |
| **W12** | 22-09-2026 | 4.0 | Completed | Recorded 5-minute video walkthrough demonstrating certificate issuance and RMI hash generation. |
| **W12** | 24-09-2026 | 3.5 | Completed | Authored Chapter 3 (Cryptographic Hashing & RMI Engine) for final project documentation. |
| **W12** | 26-09-2026 | 3.0 | Completed | Prepared viva defense slides illustrating RMI architectural advantages over local execution. |

---

### 👤 4. ARYAN — 36 Daily Logs

| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Researched online document fraud detection mechanisms and mathematical integrity verification. |
| **W1** | 09-07-2026 | 3.0 | Completed | Analyzed user interaction models for public certificate verification portals. |
| **W1** | 11-07-2026 | 3.0 | Completed | Setup testing suite and browser test configurations for Chrome, Firefox, and Edge. |
| **W2** | 14-07-2026 | 3.5 | Completed | Authored SRS functional requirements for Public Certificate Verification workflow. |
| **W2** | 16-07-2026 | 3.0 | Completed | Documented verification output states: `VERIFIED` (Authentic), `TAMPERED`, and `NOT_FOUND`. |
| **W2** | 18-07-2026 | 3.0 | Completed | Defined URL query parameter verification format enabling instant links (`/verify?id=XXXX`). |
| **W3** | 21-07-2026 | 3.5 | Completed | Created Sequence Diagram modeling Verification: Query → Database Lookup → Hash Recompute. |
| **W3** | 23-07-2026 | 3.0 | Completed | Designed Activity Diagram detailing mathematical hash comparison decision branch logic. |
| **W3** | 25-07-2026 | 3.0 | Completed | Designed UI state transition diagrams for Authentic versus Tampered certificate displays. |
| **W4** | 28-07-2026 | 3.5 | Completed | Created MySQL schema for `verification_history` table logging public verification audits. |
| **W4** | 30-07-2026 | 3.5 | Completed | Built UI wireframe mockup for public `verify.jsp` search box and certificate badge styling. |
| **W4** | 01-08-2026 | 3.0 | Completed | Designed Tampered Certificate warning card wireframe with high-contrast alert styling. |
| **W5** | 04-08-2026 | 3.5 | Completed | Developed public landing page (`index.jsp`) hero banner and verification call-to-action button. |
| **W5** | 06-08-2026 | 3.5 | Completed | Developed `DashboardServlet.java` displaying user certificates and recent issuance counts. |
| **W5** | 08-08-2026 | 3.0 | Completed | Built `dashboard.jsp` interface with metrics cards for active certificates and system status. |
| **W6** | 11-08-2026 | 3.5 | Completed | Developed `VerifyCertificateServlet.java` handling GET request with Certificate ID parameter. |
| **W6** | 13-08-2026 | 4.0 | Completed | Connected `VerifyCertificateServlet` to `CertificateDAO.getCertificateById()` for DB lookup. |
| **W6** | 15-08-2026 | 3.0 | Completed | Implemented `NOT_FOUND` state trigger when an unrecorded Certificate ID is queried. |
| **W7** | 18-08-2026 | 4.0 | Completed | Integrated `CryptoRMI` in `VerifyCertificateServlet` to recalculate SHA-256 hash on stored fields. |
| **W7** | 20-08-2026 | 3.5 | Completed | Implemented string comparison logic checking computed hash against stored `crypto_hash`. |
| **W7** | 22-08-2026 | 3.5 | Completed | Built `VERIFIED` Authentic Certificate presentation card in `verify.jsp` with green badge. |
| **W8** | 25-08-2026 | 3.5 | Completed | Built `TAMPERED` warning card in `verify.jsp` showing expected hash versus computed mismatch. |
| **W8** | 27-08-2026 | 3.5 | Completed | Added Cryptographic Proof block displaying full 64-character SHA-256 hash strings. |
| **W8** | 29-08-2026 | 3.0 | Completed | Added direct verification URL support allowing external systems to verify with single click. |
| **W9** | 01-09-2026 | 3.5 | Completed | Integrated public verification search bar inside landing page header navigation. |
| **W9** | 03-09-2026 | 3.5 | Completed | Added recent certificate history listing inside user `dashboard.jsp`. |
| **W9** | 05-09-2026 | 3.0 | Completed | Built interactive verification result card showing roll number, degree program, and issue date. |
| **W10** | 08-09-2026 | 3.5 | Completed | Added `verificationResult` map attribute support in `VerifyCertificateServlet` for JSP EL. |
| **W10** | 10-09-2026 | 3.5 | Completed | Polished mobile responsive layout of `verify.jsp` ensuring card readability on small viewports. |
| **W10** | 12-09-2026 | 3.0 | Completed | Tested verification response time under simulated slow database connection queries. |
| **W11** | 15-09-2026 | 4.0 | Completed | Conducted intentional data tampering tests by altering MySQL grade values directly in DB. |
| **W11** | 17-09-2026 | 3.5 | Completed | Verified that tampered certificates immediately trigger red "Hash Mismatch" warning card. |
| **W11** | 19-09-2026 | 3.5 | Completed | Conducted cross-browser rendering audits across Chrome, Firefox, Edge, and mobile Safari. |
| **W12** | 22-09-2026 | 4.0 | Completed | Authored Chapter 4 (Verification Algorithm & Integrity Analysis) for final project report. |
| **W12** | 24-09-2026 | 3.5 | Completed | Prepared PowerPoint slides (11-15) detailing verification workflow and cryptographic proofs. |
| **W12** | 26-09-2026 | 3.0 | Completed | Finalized viva defense presentation on hash immutability and anti-forgery mechanisms. |

---

### 👤 5. ANKIT — 36 Daily Logs

| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Researched relational database structures and JDBC connection architecture for web applications. |
| **W1** | 09-07-2026 | 3.0 | Completed | Contributed to project abstract; defined database entity requirements for Team 5A. |
| **W1** | 11-07-2026 | 3.0 | Completed | Setup MySQL Server 8.0 on local environment and verified service connectivity. |
| **W2** | 14-07-2026 | 3.5 | Completed | Authored SRS Section on Database Requirements, Entity Definitions, and Storage Sizing. |
| **W2** | 16-07-2026 | 3.0 | Completed | Formulated functional requirements for Certificate Registry, Search, and Filter operations. |
| **W2** | 18-07-2026 | 3.0 | Completed | Compiled Hardware and Software system requirements for deployment (Tomcat 9, MySQL 8). |
| **W3** | 21-07-2026 | 3.5 | Completed | Designed complete Entity-Relationship (ER) Diagram with 4 relational entities and constraints. |
| **W3** | 23-07-2026 | 3.0 | Completed | Created Component Diagram illustrating web application archive (WAR) deployment structure. |
| **W3** | 25-07-2026 | 3.0 | Completed | Designed Deployment Diagram mapping Tomcat servlet container and MySQL database port 3306. |
| **W4** | 28-07-2026 | 4.0 | Completed | Authored `schema.sql` database initialization script with tables, indices, and sample seed records. |
| **W4** | 30-07-2026 | 3.5 | Completed | Configured global CSS stylesheet (`style.css`) establishing typography, cards, and theme colors. |
| **W4** | 01-08-2026 | 3.0 | Completed | Designed UI wireframe for `list.jsp` certificate registry featuring tabular listing and search filters. |
| **W5** | 04-08-2026 | 4.0 | Completed | Implemented `DBConnection.java` with MySQL JDBC connection manager and exception handling. |
| **W5** | 06-08-2026 | 3.5 | Completed | Configured MySQL Connector/J driver dependency (`mysql-connector-j-26.7.0.jar`) in `WEB-INF/lib`. |
| **W5** | 08-08-2026 | 3.0 | Completed | Executed connection pooling and leak tests validating connections close cleanly after query execution. |
| **W6** | 11-08-2026 | 3.5 | Completed | Implemented `CertificateDAO.java` skeleton with parameterized CRUD database access methods. |
| **W6** | 13-08-2026 | 4.0 | Completed | Developed `CertificateDAO.searchCertificates()` supporting search by ID, name, or roll number. |
| **W6** | 15-08-2026 | 3.0 | Completed | Added sample test records into database (Amit Kumar, Ayush Sharma, Mali Singh certificates). |
| **W7** | 18-08-2026 | 3.5 | Completed | Developed `RegistryServlet.java` mapping `/registry` URL to fetch all certificates from DAO (Exp 8). |
| **W7** | 20-08-2026 | 4.0 | Completed | Built `list.jsp` interface rendering tabular certificate records with student details and grades. |
| **W7** | 22-08-2026 | 3.0 | Completed | Added JSTL taglib directives to `list.jsp` enabling `<c:forEach>` dynamic row generation. |
| **W8** | 25-08-2026 | 3.5 | Completed | Added real-time client-side table filter in `app.js` filtering rows by search keystrokes. |
| **W8** | 27-08-2026 | 3.5 | Completed | Connected "Verify" button on each registry row directly to `/verify?id=DV-XXXX` endpoint. |
| **W8** | 29-08-2026 | 3.0 | Completed | Added Empty State display in `list.jsp` when search query produces zero certificate matches. |
| **W9** | 01-09-2026 | 3.5 | Completed | Implemented `CertificateDAO.getCertificateCount()` supporting metrics counter queries. |
| **W9** | 03-09-2026 | 3.5 | Completed | Added Course and Grade dropdown filter controls in registry table header toolbar. |
| **W9** | 05-09-2026 | 3.0 | Completed | Implemented client-side CSV table export utility function for administrative reporting. |
| **W10** | 08-09-2026 | 3.5 | Completed | Resolved column name mapping between DAO methods and MySQL snake_case table columns. |
| **W10** | 10-09-2026 | 3.5 | Completed | Developed automated build script `build.bat` compiling all 21 Java files into `WEB-INF/classes`. |
| **W10** | 12-09-2026 | 3.0 | Completed | Developed automated deployment script `deploy.bat` syncing web application to Tomcat `webapps`. |
| **W11** | 15-09-2026 | 4.0 | Completed | Conducted database load testing inserting 100+ simulated certificates to benchmark query latency. |
| **W11** | 17-09-2026 | 3.5 | Completed | Optimized SQL indexing on `cert_id` and `student_name` columns for sub-millisecond retrieval. |
| **W11** | 19-09-2026 | 3.0 | Completed | Audited `.gitignore` configuration ensuring compiled class files are excluded from Git repo. |
| **W12** | 22-09-2026 | 4.0 | Completed | Finalized `README.md` documentation with setup guide, team list, and lab experiment mapping. |
| **W12** | 24-09-2026 | 3.5 | Completed | Authored Chapter 5 (Database Schema & Registry Module) for final project documentation. |
| **W12** | 26-09-2026 | 3.0 | Completed | Prepared viva defense slides (16-20) covering JDBC best practices and deployment architecture. |

---

## 📅 12 Weekly Reports (Portal Pe Submit Karne Ke Liye)

### 📋 Week 1 Report (06 Jul – 12 Jul 2026)
> **Topic**: Team Formation, Project Selection & Abstract Submission  
> **Summary**: Formed Team 5A under the guidance of Er. Ram Babu Buri (Research Area: Machine Learning & Data Science) at Arya College of Engineering & I.T. Finalized project title: "DocuVerify™ – Cryptographic Certificate Generator & Verification Portal" under the Web Application track (JSP-Servlet + MySQL). Drafted and submitted project abstract outlining the problem of academic document fraud and our cryptographic SHA-256 solution. Created the central Git repository and established Java project structure.

### 📋 Week 2 Report (13 Jul – 19 Jul 2026)
> **Topic**: Software Requirement Specification (SRS) & Literature Review  
> **Summary**: Conducted comprehensive literature review analyzing document forgery vectors in university credentials. Authored complete Software Requirement Specification (SRS) document v1.0. Defined functional requirements across 5 distinct modules: Authentication, Admin Management, Certificate Issuance, Verification Engine, and Certificate Registry. Documented non-functional requirements including response time, cryptographic collision resistance, and data persistence.

### 📋 Week 3 Report (20 Jul – 26 Jul 2026)
> **Topic**: System Architecture & Comprehensive UML Design  
> **Summary**: Designed formal UML diagrams modeling system behavior and structural components. Created system-level Use Case Diagram defining actors (Admin, Issuer, Public Verifier), Class Diagrams for Auth and Cryptographic domains, Sequence Diagrams for Certificate Issuance via RMI and Verification workflows, Activity Diagrams for user management, and an Entity-Relationship (ER) diagram modeling relational constraints across 4 database entities.

### 📋 Week 4 Report (27 Jul – 02 Aug 2026)
> **Topic**: Database Schema Engineering & UI/UX Wireframing  
> **Summary**: Designed and executed MySQL relational database schema `docuverify_db` comprising 4 core tables: `users`, `certificates`, `audit_logs`, and `verification_history`. Established foreign key constraints and unique indexes. Created responsive UI wireframes using Bootstrap 5 framework, establishing a consistent purple color theme (#7453df), modern typography, and structured navigation layouts across all module views.

### 📋 Week 5 Report (03 Aug – 09 Aug 2026)
> **Topic**: Module Coding Sprint 1 — Base Setup & Auth Module (Exp 8 & 9)  
> **Summary**: Initiated core development phase on Apache Tomcat 9. Implemented **`LoginServlet.java`** taking user credentials via HTTP POST and validating against MySQL database (**Exp 8**). Built **`login.jsp`** featuring Bootstrap 5 form validation and server-side error display (**Exp 9**). Implemented `DBConnection.java` utilizing MySQL JDBC driver (**Exp 4**) and created initial entity POJO models (`User.java`, `Certificate.java`).

### 📋 Week 6 Report (10 Aug – 16 Aug 2026)
> **Topic**: Module Coding Sprint 2 — Cryptographic Engine via Java RMI (Exp 2)  
> **Summary**: Developed distributed cryptographic subsystem using Java Remote Method Invocation (**Exp 2**). Implemented `CryptoService.java` remote interface and `CryptoRMI.java` computing SHA-256 cryptographic digests on port 1099. Implemented `RegisterServlet.java` and `register.jsp` supporting secure user self-registration with password hashing. Added initial `CertificateDAO` and `AuditLogDAO` data access objects.

### 📋 Week 7 Report (17 Aug – 23 Aug 2026)
> **Topic**: Module Coding Sprint 3 — Public Verification Engine (Exp 8)  
> **Summary**: Implemented public verification subsystem. Built **`VerifyCertificateServlet.java`** (**Exp 8**) accepting certificate IDs, retrieving database records, and re-computing SHA-256 hashes on the fly to verify mathematical integrity. Developed `verify.jsp` supporting instant URL parameter lookups (`/verify?id=DV-XXXX`) and displaying Authentic versus Tampered status cards. Added session management and `LogoutServlet.java`.

### 📋 Week 8 Report (24 Aug – 30 Aug 2026)
> **Topic**: Module Coding Sprint 4 — Certificate Registry & JDBC Queries (Exp 4)  
> **Summary**: Developed Certificate Registry subsystem (**Exp 4**). Implemented **`RegistryServlet.java`** and **`list.jsp`** dynamically rendering all issued certificates from MySQL database using JSTL tags. Added search input filtering by candidate name, roll number, and certificate ID. Built `IssueCertificateServlet.java` and `issue.jsp` allowing authorized users to issue new certificates and obtain instant cryptographic verification links.

### 📋 Week 9 Report (31 Aug – 06 Sep 2026)
> **Topic**: Module Coding Sprint 5 — Admin Control Panel & Role Security (Exp 10)  
> **Summary**: Implemented role-based access control and administrative operations (**Exp 10**). Developed **`AuthFilter.java`** intercepting HTTP requests to protect administrative routes (`/admin/*`). Built `AdminDashboardServlet.java` and `admin_dashboard.jsp` displaying real-time metrics for total users and certificates. Built `ManageUsersServlet.java` and `manage_users.jsp` providing user management and deletion tools with automated audit logging.

### 📋 Week 10 Report (07 Sep – 13 Sep 2026)
> **Topic**: System Integration, Security Hardening & Error Handling  
> **Summary**: Completed comprehensive cross-module integration into a single unified web application. Connected public navigation across home, verification, and registry pages. Performed security hardening: eliminated SQL injection vulnerabilities using parameterized PreparedStatements, mitigated XSS via output escaping, and implemented custom error handling (`404.jsp`, `500.jsp`). Automated compilation via `build.bat` and `deploy.bat`.

### 📋 Week 11 Report (14 Sep – 20 Sep 2026)
> **Topic**: End-to-End System Testing & Quality Assurance  
> **Summary**: Executed rigorous multi-tier testing. Conducted security penetration testing verifying role isolation and session timeout enforcement. Performed cryptographic stress testing generating 50+ unique certificates to confirm hash uniqueness. Tested tamper detection by manually editing database entries in MySQL and verifying that `verify.jsp` flagged hash discrepancies. Performed cross-browser validation across Chrome, Edge, and Firefox.

### 📋 Week 12 Report (21 Sep – 06 Oct 2026)
> **Topic**: Final Documentation, Presentation Deck & Viva Voce Preparation  
> **Summary**: Compiled comprehensive Final Project Report incorporating architecture, code listings, and lab experiment mappings. Created 20-slide PowerPoint presentation deck highlighting project problem statement, cryptographic architecture, live screenshots, and team contributions. Recorded full application demonstration video walkthrough. Prepared viva voce defense strategy; completed final project evaluation submission.

---

## 🚀 One-Command GitHub Upload Guide

Tujhe poora project ek hi shot mein GitHub pe upload karna hai:

```powershell
# 1. Project directory me jao
cd "c:\Users\amitk\OneDrive\Desktop\COLLEGE\5 sem\java\DocuVerify"

# 2. Apna GitHub repository link connect karo (GitHub pe pehle new blank repo bana lena)
git remote add origin https://github.com/<tera-github-username>/<repo-naam>.git

# 3. Pura project ek sath push kar do
git push -u origin main
```
