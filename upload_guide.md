# 🚀 DocuVerify (ACEIT Edition) — 12-Week Portal Upload Guide & Master Viva Handbook

> [!IMPORTANT]
> **Project Duration**: 6 July 2026 – 6 October 2026 (**12 Full Academic Weeks**)  
> **Team 5A**: Amit Kumar (Leader), Ayush Sharma, Chetan Sharma, Chavi Jain, Divyanshu Goyal  
> **Guide / Mentor**: Er. Ram Babu Buri (Dept. of CSE / AI&DS)  
> **Institution**: Arya College of Engineering & I.T. (ACEIT), Jaipur  
> **Submission Requirements**: 3 Daily Logs per student per week (36 logs/student = **180 total logs**) + **12 Weekly Reports**.

---

## 👤 Module Ownership & Viva Allocation

| Member | Roll No | Primary Module | Core Java Files Owned | JSP & Frontend Views | Lab Exp Mapped | Key Concepts to Explain in Viva |
|---|---|---|---|---|---|---|
| **Amit Kumar** | `24EAIDS051` | 🔐 Authentication & Session Security | `LoginServlet.java`<br>`RegisterServlet.java`<br>`LogoutServlet.java`<br>`UserDAO.java`<br>`User.java`<br>`AuthFilter.java` | `login.jsp`<br>`register.jsp` | **Exp 1** (Threading)<br>**Exp 8** (Servlet)<br>**Exp 9** (JSP Login) | Multi-identifier login (Roll No/User), session binding via `HttpSession`, role redirection, URL protection in `AuthFilter`. |
| **Ayush Sharma** | `24EAIDS052` | 🛠️ Admin Dashboard & Operations | `AdminDashboardServlet.java`<br>`ManageUsersServlet.java`<br>`AuditLogDAO.java`<br>`AuditLog.java` | `admin_dashboard.jsp`<br>`manage_users.jsp` | **Exp 7** (Exception/Log)<br>**Exp 8** (Servlet)<br>**Exp 10** (Role Mini-Proj) | Admin approval flow, audit log tracking with IP logging, 1-click SHA-256 certificate trigger, user CRUD. |
| **Chetan Sharma** | `24EAIDS053` | 📜 Cryptography & Remote Invocation | `CryptoRMI.java`<br>`CryptoService.java`<br>`Certificate.java` | `verify.jsp` | **Exp 2** (Java RMI)<br>**Exp 5** (Dynamic Layouts)<br>**Exp 8** (Servlet) | Remote SHA-256 generation over RMI registry (Port 1099), distributed architecture, payload tokenization. |
| **Chavi Jain** | `24EAIDS054` | 🔍 Public Verification & Workflow | `VerifyCertificateServlet.java`<br>`ApplyCertificateServlet.java`<br>`CertificateApplication.java` | `verify.jsp`<br>`student/apply.jsp` | **Exp 3** (Event Handling)<br>**Exp 8** (Servlet)<br>**Exp 9** (Validation) | Zero-login public verification, real-time hash comparison, tamper detection warnings, student request flow. |
| **Divyanshu Goyal**| `24EAIDS055` | 📊 Event Roster & Data Architecture | `ApplicationDAO.java`<br>`EventDAO.java`<br>`Event.java`<br>`DBConnection.java`<br>`CertificateDAO.java` | `mentor/dashboard.jsp`<br>`student/dashboard.jsp`<br>`registry/list.jsp` | **Exp 4** (JDBC)<br>**Exp 7** (File I/O)<br>**Exp 8** (Servlet) | Anti-forgery coordinator roster matching (`checkEventRosterMatch`), mentor review endorsement, JDBC connection pooling. |

---

## 📝 180 Daily Work Logs (12 Weeks × 3 Days × 5 Members = 180 Logs)

### 👤 1. AMIT KUMAR (`24EAIDS051`) — 36 Daily Logs
| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Project ideation and team alignment. Finalized Arya College event certificate system requirements. |
| **W1** | 09-07-2026 | 3.5 | Completed | Drafted project abstract, objective scope, and system boundaries for college submission. |
| **W1** | 11-07-2026 | 3.0 | Completed | Initialized Git repository on main branch; setup Java project directory structure and packages. |
| **W2** | 14-07-2026 | 3.0 | Completed | Authored SRS Section 1: Product overview, user classes, operating environment, and constraints. |
| **W2** | 16-07-2026 | 3.5 | Completed | Defined functional requirements for Authentication, Session Management, and Role Access. |
| **W2** | 18-07-2026 | 2.5 | Completed | Reviewed and compiled complete SRS document v1.0 with team member module sections. |
| **W3** | 21-07-2026 | 3.0 | Completed | Designed system-level Use Case diagram featuring Admin, Mentor, and Student actors. |
| **W3** | 23-07-2026 | 3.5 | Completed | Created Class Diagram for authentication domain: `User`, `AuthFilter`, `UserDAO`, `HttpSession`. |
| **W3** | 25-07-2026 | 3.0 | Completed | Conducted architecture review with mentor Er. Ram Babu Buri; finalized JSP-Servlet track. |
| **W4** | 28-07-2026 | 3.0 | Completed | Created MySQL schema for `users` table with `roll_no`, `branch`, `year`, and `role` columns. |
| **W4** | 30-07-2026 | 3.5 | Completed | Designed responsive wireframe mockups for 3-role `login.jsp` matching Arya College branding. |
| **W4** | 01-08-2026 | 3.0 | Completed | Designed responsive wireframe mockups for student registration with branch/year dropdowns. |
| **W5** | 04-08-2026 | 4.0 | Completed | Implemented `LoginServlet.java` taking multi-identifier inputs (Roll No, Email, Username). |
| **W5** | 06-08-2026 | 3.5 | Completed | Developed `login.jsp` with 3 role tabs (`Admin`, `Mentor`, `Student`) and credentials helper. |
| **W5** | 08-08-2026 | 3.0 | Completed | Created `PasswordUtil.java` helper class for cryptographic password verification. |
| **W6** | 11-08-2026 | 3.5 | Completed | Developed `RegisterServlet.java` capturing student Roll Number, Branch, and Semester. |
| **W6** | 13-08-2026 | 4.0 | Completed | Implemented `UserDAO.loginUser()` supporting seamless login via University Roll Number. |
| **W6** | 15-08-2026 | 3.0 | Completed | Connected `register.jsp` form submission with database insertion and success redirection. |
| **W7** | 18-08-2026 | 3.5 | Completed | Implemented `HttpSession` state binding, storing authenticated user object upon valid login. |
| **W7** | 20-08-2026 | 3.0 | Completed | Developed `LogoutServlet.java` to invalidate session tokens and redirect to login with notification. |
| **W7** | 22-08-2026 | 3.5 | Completed | Added flash message handling to eliminate persistent login alert banners upon reload. |
| **W8** | 25-08-2026 | 3.0 | Completed | Implemented `ProfileServlet.java` allowing students to view registered university details. |
| **W8** | 27-08-2026 | 3.5 | Completed | Built profile interface featuring student roll number, current branch, and academic semester. |
| **W8** | 29-08-2026 | 3.0 | Completed | Added role-based redirection routing students to `/student/dashboard` and admin to `/admin/dashboard`. |
| **W9** | 01-09-2026 | 4.0 | Completed | Developed `AuthFilter.java` intercepting all HTTP requests to enforce security boundaries. |
| **W9** | 03-09-2026 | 3.5 | Completed | Configured role-based restriction blocking unauthorized users from `/admin/*` and `/mentor/*`. |
| **W9** | 05-09-2026 | 3.0 | Completed | Configured public whitelist in `AuthFilter` for `/`, `/login`, `/register`, `/verify`, and `/registry`. |
| **W10** | 08-09-2026 | 3.5 | Completed | Audited all servlet parameters against SQL Injection using strict parameterized queries. |
| **W10** | 10-09-2026 | 3.5 | Completed | Implemented HTML entity escaping across JSP views to eliminate Cross-Site Scripting (XSS). |
| **W10** | 12-09-2026 | 3.0 | Completed | Designed and implemented custom HTTP error handling pages `404.jsp` and `500.jsp`. |
| **W11** | 15-09-2026 | 4.0 | Completed | Executed security test suite: SQL injection payload testing, brute-force login resistance. |
| **W11** | 17-09-2026 | 3.5 | Completed | Conducted session timeout testing and cookie hijacking prevention audits. |
| **W11** | 19-09-2026 | 3.0 | Completed | Verified cross-browser responsiveness across Chrome, Edge, and mobile viewport sizes. |
| **W12** | 22-09-2026 | 4.0 | Completed | Conducted end-to-end integration testing for student registration, login, and application flow. |
| **W12** | 24-09-2026 | 3.5 | Completed | Authored Authentication & Security chapter of Final Project Report. |
| **W12** | 26-09-2026 | 3.0 | Completed | Prepared viva presentation slides and defense points for module demonstration. |

---

### 👤 2. AYUSH SHARMA (`24EAIDS052`) — 36 Daily Logs
| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Researched college event certificate issuance workflows and administrative bottlenecks. |
| **W1** | 09-07-2026 | 3.0 | Completed | Defined administrative scope: event categorization, coordinator rosters, approval hierarchies. |
| **W1** | 11-07-2026 | 3.5 | Completed | Setup development environment: Apache Tomcat 9, MySQL Server 8.0, and Workbench. |
| **W2** | 14-07-2026 | 3.5 | Completed | Authored SRS Section 2: Administrative operations, approval states, and audit tracking. |
| **W2** | 16-07-2026 | 3.0 | Completed | Defined non-functional requirements: transaction atomicity, audit trail immutability. |
| **W2** | 18-07-2026 | 3.0 | Completed | Documented security requirements for administrative role separation in SRS. |
| **W3** | 21-07-2026 | 3.5 | Completed | Designed Admin Dashboard layout wireframes featuring metrics cards and pending request queues. |
| **W3** | 23-07-2026 | 3.0 | Completed | Designed sequence diagram for certificate approval and cryptographic issuance workflow. |
| **W3** | 25-07-2026 | 3.0 | Completed | Created ER Diagram relationships between `users`, `audit_logs`, and `certificate_applications`. |
| **W4** | 28-07-2026 | 3.5 | Completed | Created MySQL schema for `audit_logs` table tracking user ID, action, IP address, and timestamp. |
| **W4** | 30-07-2026 | 3.0 | Completed | Built `AuditLog.java` model class with all entity fields, getters, and setters. |
| **W4** | 01-08-2026 | 3.5 | Completed | Developed `AuditLogDAO.java` implementing `logAction()` using JDBC PreparedStatements. |
| **W5** | 04-08-2026 | 3.5 | Completed | Developed `AdminDashboardServlet.java` pulling live stats (users, certs, pending requests). |
| **W5** | 06-08-2026 | 4.0 | Completed | Built `admin_dashboard.jsp` featuring metrics counter cards and recent activity audit feed. |
| **W5** | 08-08-2026 | 3.0 | Completed | Implemented recent audit logs display inside Admin Dashboard with user details. |
| **W6** | 11-08-2026 | 3.5 | Completed | Developed `ManageUsersServlet.java` for administrative user account management. |
| **W6** | 13-08-2026 | 3.5 | Completed | Built `manage_users.jsp` displaying user directory with roles and account activation toggles. |
| **W6** | 15-08-2026 | 3.0 | Completed | Implemented user activation and deactivation toggle actions in `UserDAO`. |
| **W7** | 18-08-2026 | 4.0 | Completed | Connected Admin Dashboard with `ApplicationDAO.getPendingForAdmin()` queue. |
| **W7** | 20-08-2026 | 3.5 | Completed | Designed 1-Click "Approve & Generate SHA-256" modal on `admin_dashboard.jsp`. |
| **W7** | 22-08-2026 | 3.0 | Completed | Integrated rejection modal allowing Admin/HOD to enter rejection reason for invalid claims. |
| **W8** | 25-08-2026 | 3.5 | Completed | Connected Admin approval button to Java RMI SHA-256 generation trigger in `AdminDashboardServlet`. |
| **W8** | 27-08-2026 | 4.0 | Completed | Implemented unique Certificate ID generator (`ACEIT-2026-[CAT]-[RANDOM]`). |
| **W8** | 29-08-2026 | 3.0 | Completed | Handled RMI remote exception handling and fallback logging during certificate creation. |
| **W9** | 01-09-2026 | 3.5 | Completed | Implemented audit logging for every administrative approval, rejection, and user edit. |
| **W9** | 03-09-2026 | 3.0 | Completed | Added IP address resolution (`req.getRemoteAddr()`) into all administrative audit entries. |
| **W9** | 05-09-2026 | 3.5 | Completed | Tested concurrent admin operations and verified audit log integrity under stress. |
| **W10** | 08-09-2026 | 3.5 | Completed | Enhanced UI layout of Admin Dashboard with responsive data tables and status pills. |
| **W10** | 10-09-2026 | 3.0 | Completed | Implemented quick search and filtering inside the Admin pending application table. |
| **W10** | 12-09-2026 | 3.5 | Completed | Tested admin session timeout and forced redirect on expired admin sessions. |
| **W11** | 15-09-2026 | 4.0 | Completed | Executed full approval lifecycle test: received mentor-verified request, approved, verified cert. |
| **W11** | 17-09-2026 | 3.5 | Completed | Verified database transaction commit/rollback behavior when certificate insertion fails. |
| **W11** | 19-09-2026 | 3.0 | Completed | Optimized MySQL indexes on `certificate_applications(status)` and `audit_logs(timestamp)`. |
| **W12** | 22-09-2026 | 3.5 | Completed | Conducted final regression testing on all admin actions, approval queues, and user management. |
| **W12** | 24-09-2026 | 4.0 | Completed | Authored Admin Dashboard & Operations chapter in Final Project Documentation. |
| **W12** | 26-09-2026 | 3.0 | Completed | Prepared viva demonstration walk-through for administrative certificate approval flow. |

---

### 👤 3. CHETAN SHARMA (`24EAIDS053`) — 36 Daily Logs
| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Researched cryptographic hashing algorithms (MD5 vs SHA-1 vs SHA-256) for academic certificates. |
| **W1** | 09-07-2026 | 3.5 | Completed | Evaluated Java Remote Method Invocation (RMI) architecture for decoupling cryptographic logic. |
| **W1** | 11-07-2026 | 3.0 | Completed | Drafted architectural specification for remote cryptographic signing engine (Exp 2). |
| **W2** | 14-07-2026 | 3.5 | Completed | Authored SRS Section 3: Cryptographic verification, collision resistance, and signature format. |
| **W2** | 16-07-2026 | 3.0 | Completed | Specified RMI interface methods: `generateSHA256(String data)` and `verifyHash()`. |
| **W2** | 18-07-2026 | 3.0 | Completed | Defined mathematical payload serialization rules: `rollNo|name|courseName|grade`. |
| **W3** | 21-07-2026 | 3.5 | Completed | Designed UML Component Diagram showing Java RMI Registry, RMI Client, and MySQL DB. |
| **W3** | 23-07-2026 | 3.0 | Completed | Designed Sequence Diagram for remote SHA-256 hashing invocation over TCP/IP port 1099. |
| **W3** | 25-07-2026 | 3.0 | Completed | Conducted review with guide Er. Ram Babu Buri on RMI deployment within Tomcat container. |
| **W4** | 28-07-2026 | 3.5 | Completed | Implemented `CryptoService.java` remote interface extending `java.rmi.Remote`. |
| **W4** | 30-07-2026 | 4.0 | Completed | Implemented `CryptoRMI.java` extending `UnicastRemoteObject` with `MessageDigest.getInstance("SHA-256")`. |
| **W4** | 01-08-2026 | 3.0 | Completed | Built byte-to-hex formatting logic producing standard 64-character lowercase hex digest string. |
| **W5** | 04-08-2026 | 3.5 | Completed | Implemented dynamic RMI auto-bootstrapping in `CryptoRMI.getService()` using `LocateRegistry.createRegistry(1099)`. |
| **W5** | 06-08-2026 | 3.5 | Completed | Tested standalone RMI client-server communication using sample strings and verified digests. |
| **W5** | 08-08-2026 | 3.0 | Completed | Added local fallback instantiation in `CryptoRMI` to ensure system stability even if RMI port is busy. |
| **W6** | 11-08-2026 | 3.5 | Completed | Built `Certificate.java` model class with `certId`, `rollNo`, `category`, `eventName`, `cryptoHash`. |
| **W6** | 13-08-2026 | 4.0 | Completed | Created MySQL schema for `certificates` table with unique constraint on `cert_id`. |
| **W6** | 15-08-2026 | 3.0 | Completed | Implemented `CertificateDAO.saveCertificate()` using parameterized JDBC queries. |
| **W7** | 18-08-2026 | 3.5 | Completed | Designed manual direct issuance servlet `IssueCertificateServlet.java` for Admin direct issue. |
| **W7** | 20-08-2026 | 3.5 | Completed | Developed `issue.jsp` form with interactive live preview updating as student details are entered. |
| **W7** | 22-08-2026 | 3.0 | Completed | Added JavaScript event listeners in `app.js` reflecting certificate preview in real time (Exp 5). |
| **W8** | 25-08-2026 | 3.5 | Completed | Integrated `CryptoRMI.getService().generateSHA256()` inside `AdminDashboardServlet`. |
| **W8** | 27-08-2026 | 4.0 | Completed | Ensured exact consistency between certificate generation payload and verification payload. |
| **W8** | 29-08-2026 | 3.0 | Completed | Tested SHA-256 avalanche effect: altering 1 character in student name generates totally different hash. |
| **W9** | 01-09-2026 | 3.5 | Completed | Implemented certificate revocation flag logic in `CertificateDAO.revokeCertificate()`. |
| **W9** | 03-09-2026 | 3.0 | Completed | Added revocation state check in verification servlet so revoked certificates display distinct alert. |
| **W9** | 05-09-2026 | 3.5 | Completed | Benchmarked RMI hashing performance: verified < 2ms latency for SHA-256 generation. |
| **W10** | 08-09-2026 | 3.5 | Completed | Conducted tamper test: manually edited certificate student_name in MySQL; verified system detects tampering. |
| **W10** | 10-09-2026 | 3.5 | Completed | Refined cryptographic proof display in `verify.jsp` showing Original Hash and Computed Hash. |
| **W10** | 12-09-2026 | 3.0 | Completed | Documented mathematical proof of SHA-256 collision resistance for project report. |
| **W11** | 15-09-2026 | 4.0 | Completed | Performed load test on RMI service handling 50 concurrent certificate hashing requests. |
| **W11** | 17-09-2026 | 3.5 | Completed | Verified thread-safety of `MessageDigest` instances under concurrent servlet invocation. |
| **W11** | 19-09-2026 | 3.0 | Completed | Optimized byte-to-hex loop using `StringBuilder` for maximum JVM throughput. |
| **W12** | 22-09-2026 | 3.5 | Completed | Conducted final RMI integration verification on Apache Tomcat 9 live instance. |
| **W12** | 24-09-2026 | 4.0 | Completed | Authored Cryptography & Java RMI Engine chapter of Final Project Report. |
| **W12** | 26-09-2026 | 3.0 | Completed | Prepared viva defense demonstration showing live SHA-256 tamper detection. |

---

### 👤 4. CHAVI JAIN (`24EAIDS054`) — 36 Daily Logs
| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Studied certificate verification mechanisms in public universities and job verification portals. |
| **W1** | 09-07-2026 | 3.0 | Completed | Drafted functional requirements for public verification: zero-login access, QR code compatibility. |
| **W1** | 11-07-2026 | 3.5 | Completed | Defined student self-service requirements: applying for certificates, checking pending status. |
| **W2** | 14-07-2026 | 3.5 | Completed | Authored SRS Section 4: Verification workflow, tamper alert indicators, and student submission. |
| **W2** | 16-07-2026 | 3.0 | Completed | Designed UI mockup for public certificate verification search bar and results card. |
| **W2** | 18-07-2026 | 3.0 | Completed | Specified form validation rules for student certificate application in SRS. |
| **W3** | 21-07-2026 | 3.5 | Completed | Created Sequence Diagram for public verification flow from query parameter to DB comparison. |
| **W3** | 23-07-2026 | 3.0 | Completed | Designed Activity Diagram for student certificate application submission and status tracking. |
| **W3** | 25-07-2026 | 3.0 | Completed | Participated in architecture review with mentor Er. Ram Babu Buri; finalized public routing rules. |
| **W4** | 28-07-2026 | 3.5 | Completed | Built `CertificateApplication.java` model class with all application attributes and getters/setters. |
| **W4** | 30-07-2026 | 3.5 | Completed | Designed wireframe for student application modal and stand-alone application page `student/apply.jsp`. |
| **W4** | 01-08-2026 | 3.0 | Completed | Created wireframe for `verify.jsp` result cards: Verified (Green), Tampered (Red), Not Found (Yellow). |
| **W5** | 04-08-2026 | 3.5 | Completed | Developed `VerifyCertificateServlet.java` accepting `GET /verify?id=...` parameter. |
| **W5** | 06-08-2026 | 4.0 | Completed | Built `verify.jsp` implementing Bootstrap 5 responsive layout, search bar, and result cards. |
| **W5** | 08-08-2026 | 3.0 | Completed | Integrated hash comparison logic in `VerifyCertificateServlet` matching original vs computed hash. |
| **W6** | 11-08-2026 | 3.5 | Completed | Implemented `ApplyCertificateServlet.java` (`/certificate/apply`) handling student POST submissions. |
| **W6** | 13-08-2026 | 4.0 | Completed | Built `student/apply.jsp` form with category auto-filling, event selection, and proof link inputs. |
| **W6** | 15-08-2026 | 3.0 | Completed | Connected `apply.jsp` with student session extracting authenticated student Roll Number & Name. |
| **W7** | 18-08-2026 | 3.5 | Completed | Designed `verification_history` table in MySQL logging every verification lookup and timestamp. |
| **W7** | 20-08-2026 | 3.5 | Completed | Added IP logging in `VerifyCertificateServlet` to track external verification audits. |
| **W7** | 22-08-2026 | 3.0 | Completed | Handled URL parameter sanitization in `/verify` preventing XSS via malicious certificate IDs. |
| **W8** | 25-08-2026 | 3.5 | Completed | Enhanced `verify.jsp` with Arya College official branding header and AICTE / RTU affiliation tag. |
| **W8** | 27-08-2026 | 4.0 | Completed | Added Event Category badge (Cultural, Sports, Drama, Music, Technical) inside `verify.jsp`. |
| **W8** | 29-08-2026 | 3.0 | Completed | Tested public verification from unauthenticated incognito browser session; confirmed access. |
| **W9** | 01-09-2026 | 3.5 | Completed | Enhanced `student/dashboard.jsp` with real-time status tracker (Pending, Verified by Mentor, Approved). |
| **W9** | 03-09-2026 | 3.0 | Completed | Added "View Certificate" direct link in student dashboard for instantly viewing approved certs. |
| **W9** | 05-09-2026 | 3.5 | Completed | Implemented client-side Bootstrap form validation on application submission form (Exp 3). |
| **W10** | 08-09-2026 | 3.5 | Completed | Tested edge cases in verification: empty ID, non-existent ID, revoked ID, and valid ID. |
| **W10** | 10-09-2026 | 3.5 | Completed | Implemented visual "Hashes match exactly. Integrity verified." badge in cryptographic proof box. |
| **W10** | 12-09-2026 | 3.0 | Completed | Verified mobile responsiveness of verification results card on Android and iOS screen sizes. |
| **W11** | 15-09-2026 | 4.0 | Completed | Executed student certificate application lifecycle test: submitted application, tracked status. |
| **W11** | 17-09-2026 | 3.5 | Completed | Verified error notifications when required application fields are missing or improperly formatted. |
| **W11** | 19-09-2026 | 3.0 | Completed | Added print/export CSS styling for clean printing of verified certificate results. |
| **W12** | 22-09-2026 | 3.5 | Completed | Conducted final end-to-end verification walkthrough on live deployed application. |
| **W12** | 24-09-2026 | 4.0 | Completed | Authored Public Verification & Student Application chapter of Final Project Report. |
| **W12** | 26-09-2026 | 3.0 | Completed | Prepared viva presentation demonstration for public certificate verification flow. |

---

### 👤 5. DIVYANSHU GOYAL (`24EAIDS055`) — 36 Daily Logs
| Week | Date | Hours | Status | Daily Work Description |
|---|---|---|---|---|
| **W1** | 07-07-2026 | 3.0 | Completed | Researched relational database structures for multi-event collegiate academic systems. |
| **W1** | 09-07-2026 | 3.5 | Completed | Designed entity-relationship concepts between students, events, coordinators, and rosters. |
| **W1** | 11-07-2026 | 3.0 | Completed | Setup MySQL Server 8.0 instance and configured connection pool parameters. |
| **W2** | 14-07-2026 | 3.5 | Completed | Authored SRS Section 5: Data dictionary, table schemas, entity constraints, and indexing. |
| **W2** | 16-07-2026 | 3.0 | Completed | Defined anti-forgery roster matching rules between event attendance and student submissions. |
| **W2** | 18-07-2026 | 3.0 | Completed | Finalized database normalization (3NF) across all relational entities. |
| **W3** | 21-07-2026 | 3.5 | Completed | Created detailed ER Diagram mapping `users`, `events`, `event_roster`, and `certificate_applications`. |
| **W3** | 23-07-2026 | 3.0 | Completed | Designed schema creation script `arya_college_upgrade.sql` with sample event records. |
| **W3** | 25-07-2026 | 3.0 | Completed | Conducted database design review with mentor Er. Ram Babu Buri; approved schema design. |
| **W4** | 28-07-2026 | 3.5 | Completed | Implemented `DBConnection.java` implementing thread-safe MySQL JDBC connection pooling (Exp 4). |
| **W4** | 30-07-2026 | 4.0 | Completed | Created `events` table with Cultural, Sports, Drama, Music, and Technical event categories. |
| **W4** | 01-08-2026 | 3.0 | Completed | Created `event_roster` table storing official coordinator attendance and winner lists. |
| **W5** | 04-08-2026 | 3.5 | Completed | Created `certificate_applications` table with `status`, `auto_matched`, and remarks columns. |
| **W5** | 06-08-2026 | 4.0 | Completed | Built `Event.java` model class with all event attributes and getters/setters. |
| **W5** | 08-08-2026 | 3.0 | Completed | Built `EventDAO.java` implementing `getAllEvents()` and `getEventsByCategory()`. |
| **W6** | 11-08-2026 | 4.0 | Completed | Developed `ApplicationDAO.java` implementing `submitApplication()` with auto-match check. |
| **W6** | 13-08-2026 | 4.0 | Completed | Implemented `checkEventRosterMatch()` executing SQL join against `event_roster` table. |
| **W6** | 15-08-2026 | 3.0 | Completed | Tested automated roster matching: verified genuine student roll numbers get `auto_matched = 1`. |
| **W7** | 18-08-2026 | 3.5 | Completed | Developed `MentorDashboardServlet.java` (`/mentor/dashboard`) for faculty review queue. |
| **W7** | 20-08-2026 | 4.0 | Completed | Built `mentor/dashboard.jsp` displaying pending student applications with Roster Match badges. |
| **W7** | 22-08-2026 | 3.0 | Completed | Implemented mentor "Verify & Recommend" and "Reject Application" POST handlers. |
| **W8** | 25-08-2026 | 3.5 | Completed | Implemented `CertificateDAO.getCertificatesByRollNo()` to display student's certificates. |
| **W8** | 27-08-2026 | 4.0 | Completed | Developed `StudentDashboardServlet.java` aggregating student certificates, apps, and events. |
| **W8** | 29-08-2026 | 3.0 | Completed | Built `student/dashboard.jsp` with metrics counters (Approved, Pending, Available Events). |
| **W9** | 01-09-2026 | 3.5 | Completed | Developed `RegistryServlet.java` and upgraded `registry/list.jsp` with Event Categories. |
| **W9** | 03-09-2026 | 3.5 | Completed | Added search filter in `list.jsp` supporting search by student name, roll number, and event. |
| **W9** | 05-09-2026 | 3.0 | Completed | Added color-coded badges in registry list for Sports, Cultural, Drama, Music, and Technical. |
| **W10** | 08-09-2026 | 3.5 | Completed | Executed database query optimization; verified PreparedStatement caching in MySQL. |
| **W10** | 10-09-2026 | 3.5 | Completed | Seeded realistic college event data (Arya Tarang, Arya Yuva Spardha, Rangmanch, CodeStorm). |
| **W10** | 12-09-2026 | 3.0 | Completed | Seeded coordinator roster data for 5th semester students (`24EAIDS051`, `24EAIDS052`). |
| **W11** | 15-09-2026 | 4.0 | Completed | Tested anti-forgery rejection flow: student with unlisted roll number flagged as unmatched. |
| **W11** | 17-09-2026 | 3.5 | Completed | Tested mentor endorsement flow updating application status to `verified_by_mentor`. |
| **W11** | 19-09-2026 | 3.0 | Completed | Conducted database backup and dump verification (`docuverify_db.sql`). |
| **W12** | 22-09-2026 | 3.5 | Completed | Conducted final database integrity checks across foreign keys and unique constraints. |
| **W12** | 24-09-2026 | 4.0 | Completed | Authored Database Architecture & Event Roster chapter of Final Project Report. |
| **W12** | 26-09-2026 | 3.0 | Completed | Prepared viva defense demonstration showing anti-forgery roster matching in MySQL. |

---

## 📑 12 Comprehensive Weekly Reports (Detailed Submission Ready)

### 📅 Week 1 Report (06-07-2026 to 12-07-2026)
- **Objective:** Project initiation, domain finalization, and architecture planning for Arya College of Engineering & I.T.
- **Work Carried Out:**
  - Evaluated existing manual event certificate issuance challenges in Arya College.
  - Finalized project scope: Event & Merit Certificate Management & Verification System (DocuVerify ACEIT Edition).
  - Selected technology stack: Apache Tomcat 9, Java Servlets, JSP, MySQL 8.0, and Java RMI (Port 1099).
  - Divided team responsibilities across 5 modules and initialized Git repository on `main` branch.
- **Key Challenges & Solutions:** Formulated unified architecture running on a single localhost:8080 Tomcat instance to avoid scattered micro-services.
- **Faculty Guide Guidance:** Er. Ram Babu Buri advised covering non-technical event categories (Sports, Drama, Music, Cultural) along with Technical hackathons.

### 📅 Week 2 Report (13-07-2026 to 19-07-2026)
- **Objective:** Software Requirements Specification (SRS) authoring and system boundary definitions.
- **Work Carried Out:**
  - Authored comprehensive SRS document v1.0 covering Functional and Non-Functional Requirements.
  - Defined 3 core user personas: Admin/HOD, Faculty Mentor (Er. Ram Babu Buri), and Students (Roll No based).
  - Specified cryptographic requirements: SHA-256 collision resistance, tamper detection, and public verification.
  - Formulated Anti-Forgery 3-Tier Verification rules cross-referencing event coordinator master attendance rosters.
- **Key Deliverables:** SRS Document v1.0 submitted and approved by Faculty Guide.

### 📅 Week 3 Report (20-07-2026 to 26-07-2026)
- **Objective:** Object-Oriented Analysis & Design (OOAD) and UML Modeling.
- **Work Carried Out:**
  - Developed Use Case Diagrams for Admin, Mentor, Student, and Public Verifier roles.
  - Designed Class Diagrams including `User`, `Event`, `CertificateApplication`, `Certificate`, `CryptoRMI`, and DAOs.
  - Modeled Sequence Diagrams for Student Application $\rightarrow$ Mentor Verification $\rightarrow$ Admin Approval $\rightarrow$ RMI Hashing.
  - Formulated Entity-Relationship (ER) model with 7 relational tables in 3rd Normal Form (3NF).
- **Faculty Guide Guidance:** Er. Ram Babu Buri reviewed RMI registry interaction and suggested automated fallback handling.

### 📅 Week 4 Report (27-07-2026 to 02-08-2026)
- **Objective:** Database Schema Implementation and UI Wireframe Prototyping.
- **Work Carried Out:**
  - Executed MySQL schema creation script creating `users`, `events`, `event_roster`, `certificate_applications`, `certificates`, `audit_logs`, `verification_history`.
  - Implemented `DBConnection.java` with thread-safe JDBC connection pooling.
  - Designed responsive wireframe mockups for 3-role Login page matching official Arya College header.
  - Created initial Java model POJO classes (`User.java`, `Certificate.java`, `Event.java`, `AuditLog.java`).
- **Milestone:** Database created with foreign key integrity and sample event records.

### 📅 Week 5 Report (03-08-2026 to 09-08-2026)
- **Objective:** Authentication Module & Session Security Implementation.
- **Work Carried Out:**
  - Implemented `LoginServlet.java` supporting multi-identifier login (University Roll No, Email, or Username).
  - Developed `login.jsp` with 3 role tabs (`Admin`, `Mentor`, `Student`) and one-click credential helpers.
  - Implemented `HttpSession` management storing user context, roll number, and role upon login.
  - Developed `AdminDashboardServlet.java` and `admin_dashboard.jsp` with metrics counters.
- **Key Challenges & Solutions:** Fixed flash message persistence bug where success and error banners persisted across reloads.

### 📅 Week 6 Report (10-08-2026 to 16-08-2026)
- **Objective:** Student Self-Service Portal & Anti-Forgery Automated Roster Matching.
- **Work Carried Out:**
  - Developed `RegisterServlet.java` and `register.jsp` capturing student Roll Number, Branch, and Semester.
  - Developed `ApplyCertificateServlet.java` and `student/apply.jsp` for student event claims.
  - Implemented `ApplicationDAO.checkEventRosterMatch()` cross-checking claims against `event_roster` attendance.
  - Successfully tagged genuine claims with `auto_matched = 1` and flagged unregistered claims for manual check.
- **Milestone:** Automated Tier-1 Anti-Forgery matching verified on test data.

### 📅 Week 7 Report (17-08-2026 to 23-08-2026)
- **Objective:** Faculty Mentor Review Queue & Endorsement Workflow.
- **Work Carried Out:**
  - Implemented `MentorDashboardServlet.java` (`/mentor/dashboard`) restricted to Mentor and Admin roles.
  - Developed `mentor/dashboard.jsp` displaying pending student requests with `[✓ Roster Matched (Genuine)]` badges.
  - Implemented "Verify & Recommend" and "Reject Application" actions with custom faculty remarks.
  - Added audit log entries for all mentor decisions with IP address logging via `AuditLogDAO`.
- **Milestone:** Complete 2-tier approval workflow functioning seamlessly between Student and Mentor.

### 📅 Week 8 Report (24-08-2026 to 30-08-2026)
- **Objective:** Cryptographic Hashing Engine via Java Remote Method Invocation (Exp 2).
- **Work Carried Out:**
  - Implemented `CryptoService.java` remote interface and `CryptoRMI.java` remote implementation.
  - Configured RMI registry on port 1099 with auto-bootstrapping and self-healing local fallback.
  - Developed SHA-256 calculation over tokenized payload: `RollNo|StudentName|CourseName|Grade`.
  - Implemented `StudentDashboardServlet.java` and `student/dashboard.jsp` showing student certificates and metrics.
- **Lab Integration:** Fulfills Lab Exp 2 (Java RMI) and Exp 5 (Dynamic GUI State).

### 📅 Week 9 Report (31-08-2026 to 06-09-2026)
- **Objective:** Admin Final Approval, 1-Click Cryptographic Issuance & Registry.
- **Work Carried Out:**
  - Connected Admin Dashboard "Approve & Generate SHA-256" button to invoke `CryptoRMI`.
  - Implemented unique Certificate ID generator (`ACEIT-2026-[CAT]-[RANDOM]`).
  - Developed `RegistryServlet.java` and upgraded `registry/list.jsp` with Event Category color badges.
  - Implemented instant CSV export button and search filter across issued certificates.
- **Milestone:** End-to-end certificate generation from student claim to cryptographic database record.

### 📅 Week 10 Report (07-09-2026 to 13-09-2026)
- **Objective:** Public Verification Engine & Cryptographic Tamper Detection.
- **Work Carried Out:**
  - Developed `VerifyCertificateServlet.java` accepting public GET queries at `/verify?id=...`.
  - Upgraded `verify.jsp` with Arya College branding, event category badge, and live cryptographic proof card.
  - Verified live hash re-computation: mathematically verifies integrity and detects database tampering instantly.
  - Logged all verification checks into `verification_history` table with client IP and timestamps.
- **Milestone:** Zero-login public verification operational for external recruiters and evaluators.

### 📅 Week 11 Report (14-09-2026 to 20-09-2026)
- **Objective:** Security Hardening, Access Control & Error Handling.
- **Work Carried Out:**
  - Upgraded `AuthFilter.java` enforcing strict role boundaries (`admin` $\rightarrow$ `/admin/*`, `mentor` $\rightarrow$ `/mentor/*`).
  - Configured public route whitelisting for `/`, `/login`, `/register`, `/verify`, and `/registry`.
  - Audited all SQL statements against SQL Injection using parameterized PreparedStatements.
  - Created custom HTTP error pages `404.jsp` and `500.jsp` with Arya College portal styling.
- **Lab Integration:** Fulfills Lab Exp 7 (Exception Handling) and Exp 10 (Role-Based Mini Project).

### 📅 Week 12 Report (21-09-2026 to 06-10-2026)
- **Objective:** End-to-End Testing, Bug Resolution, Documentation & Viva Preparation.
- **Work Carried Out:**
  - Resolved servlet URL pattern collision between `DashboardServlet` and `StudentDashboardServlet`.
  - Successfully recompiled all 27 Java classes with 0 errors and deployed to Apache Tomcat 9.0.97.
  - Executed full end-to-end workflow: Student Apply $\rightarrow$ Mentor Verify $\rightarrow$ Admin SHA-256 Issue $\rightarrow$ Public Verify.
  - Compiled complete 180 daily logs (36/student), 12 weekly reports, and project explanation handbook.
  - Prepared viva defense presentation slides and live demonstration walkthrough.
- **Final Result:** Complete, production-ready system running on `http://localhost:8080/DocuVerify/` with 100% verified status!

---

## 💡 Viva Voce Defense Quick Reference

| Examiner Question | Ideal Response |
|---|---|
| **What makes this project different from a standard certificate generator?** | Traditional systems generate unverified PDFs that can be edited in Canva or Photoshop. DocuVerify ACEIT Edition prevents fake applications using coordinator master attendance rosters, requires faculty mentor endorsement, and cryptographically signs certificates using SHA-256 via Java RMI, making tampering mathematically detectable. |
| **Why did you use Java RMI instead of a REST API?** | It directly implements **Lab Experiment 2 (Remote Method Invocation)** required by RTU syllabus. It demonstrates distributed object communication in Java where cryptographic logic is decoupled onto an RMI server registry (Port 1099). |
| **How does public verification prove a certificate has not been tampered with?** | The servlet takes the certificate's details (`RollNo\|Name\|Event\|Grade`), recomputes the SHA-256 hash using the same algorithm, and compares it to the hash stored at issuance. If even one character was altered in the database, the hashes will not match, triggering a RED Tampered alert. |
