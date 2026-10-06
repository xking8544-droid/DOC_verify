# 🛡️ DocuVerify (ACEIT Edition) — PBL Project Master Plan (12-Week Comprehensive Curriculum)

## 📋 Project Summary
| Field | Specification |
|---|---|
| **Project Name** | **Arya College Event & Merit Certificate Management & Verification System** (DocuVerify ACEIT Edition) |
| **Team ID** | 5A (PBL2627-AI&DS-A-051) |
| **Track** | Web Application — **JSP-Servlet (Apache Tomcat 9)** + Bootstrap 5 + MySQL 8.0 |
| **Faculty Guide / Mentor** | **Er. Ram Babu Buri** (Dept. of CSE / AI&DS) |
| **Institution** | **Arya College of Engineering & I.T. (ACEIT), Jaipur** (Affiliated to RTU Kota \| AICTE) |
| **Department** | Computer Science & Engineering / Artificial Intelligence & Data Science (AI&DS) |
| **Academic Year** | 2026-27 (5th Semester) |
| **Duration** | **6 July 2026 – 6 October 2026 (12 Full Weeks)** |

---

## 👥 Team Members & Module Distribution

| # | Member | University Roll No | Designated Role | Core Module Owned | Lab Experiments Mapped |
|---|---|---|---|---|---|
| 1 | **Amit Kumar** | `24EAIDS051` | Lead Architect & Security | 🔐 Student Auth & Roll No Session Security | **Exp 1** (Multithreading), **Exp 6** (Collections), **Exp 8** (Servlets), **Exp 9** (JSP Login Validation) |
| 2 | **Ayush Sharma** | `24EAIDS052` | Operations & Admin Lead | 🛠️ Admin/HOD Panel & Audit Log Tracking | **Exp 7** (Exception Handling & Logging), **Exp 8** (Servlets), **Exp 10** (Role-Based Mini Project) |
| 3 | **Chetan Sharma** | `24EAIDS053` | Cryptography & Issuance | 📜 Java RMI SHA-256 Engine & Cert Issuance | **Exp 2** (RMI Remote Invocation), **Exp 5** (Dynamic Layouts), **Exp 8** (Servlets) |
| 4 | **Chavi Jain** | `24EAIDS054` | Verification & Workflow | 🔍 Public Verification & Anti-Forgery Filter | **Exp 3** (Event Handling), **Exp 8** (Servlets), **Exp 9** (Form Validation) |
| 5 | **Divyanshu Goyal**| `24EAIDS055` | Data Architecture & Events | 📊 Event Roster Cross-Match & Registry DAO | **Exp 4** (JDBC Database Connectivity), **Exp 7** (File I/O & Exports), **Exp 8** (Servlets) |

---

## 🏛️ System Architecture: 3 Panels & Public Verification

```
                                  [ ARYA COLLEGE PORTAL ]
                                             |
             +-------------------------------+-------------------------------+
             |                               |                               |
             v                               v                               v
    [ STUDENT PORTAL ]               [ FACULTY PANEL ]             [ ADMIN / HOD PANEL ]
     - Roll No Login                  - Department Faculty          - Final Authority
     - Apply for Certificate          - Coordinator Roster Match    - 1-Click Approval
     - Track Status (Pending/Approved)- Verify & Recommend          - SHA-256 via Java RMI
             |                               |                               |
             +-------------------------------+-------------------------------+
                                             |
                                             v
                               [ PUBLIC VERIFICATION ]
                                - Zero Login Required
                                - Live SHA-256 Rehash Check
                                - Instant Authenticity Badge
```

### Event Categories Covered:
- 🎭 **Drama / Rangmanch:** Street plays, skits, theatre festivals.
- 🎵 **Music / Arya Tarang:** Solo vocals, instrumentals, group choir.
- 🏆 **Sports / Arya Yuva Spardha:** Cricket, badminton, athletics, chess.
- 💃 **Cultural / Aura Fest:** Group dance, folk showcases, literary events.
- 💻 **Technical / Hackathons:** CodeStorm 24-hr Hackathons, AI innovation challenges.

---

## 🛡️ Anti-Forgery 3-Tier Verification Engine

1. **Tier 1 (Automated Roster Matching):** When a student submits a claim, `ApplicationDAO.checkEventRosterMatch()` cross-checks the student's Roll Number and Event ID against the coordinator master attendance roster (`event_roster` table). If present, it receives a **`[✓ Roster Matched (Genuine)]`** tag.
2. **Tier 2 (Faculty Mentor Verification):** The departmental faculty mentor (**Er. Ram Babu Buri**) reviews the application queue. Unmatched claims require physical verification or are rejected with explicit feedback.
3. **Tier 3 (Cryptographic Sealing via Java RMI):** Admin/HOD approval invokes **Java RMI (Exp 2)** on port 1099 to seal the certificate with a SHA-256 cryptographic signature that makes it impossible to tamper with or forge.

---

## 🧪 Comprehensive Lab Experiment → Project Mapping

| Lab Exp # | Experiment Title | Exact Implementation in DocuVerify | Primary Owner |
|---|---|---|---|
| **Exp 1** | Java Fundamentals & Multithreading / Socket Architecture | Concurrent request processing in Tomcat servlet threads & async task execution | Amit Kumar |
| **Exp 2** | **Remote Method Invocation (RMI)** | **`CryptoRMI.java`** / **`CryptoService.java`** — Remote cryptographic server computing SHA-256 digests over RMI registry (Port 1099) | Chetan Sharma |
| **Exp 3** | Event Handling & Form Validation Components | Client-side Bootstrap form validation, live preview synchronization (`app.js`) | Chavi Jain |
| **Exp 4** | **JDBC Database Connectivity** | **`DBConnection.java`**, **`CertificateDAO.java`**, **`UserDAO.java`**, **`ApplicationDAO.java`**, **`EventDAO.java`** — MySQL connection pooling & PreparedStatement CRUD | Divyanshu Goyal |
| **Exp 5** | Dynamic GUI Layouts & Real-time State | Real-time DOM reflection of certificate data on issuance page before submission | Chetan Sharma |
| **Exp 6** | Java Collections Framework & String Tokenization | `HashMap`, `ArrayList<CertificateApplication>`, and payload serialization (`rollNo|name|course|grade`) | Amit Kumar |
| **Exp 7** | Robust Exception Handling & Logging | Custom SQL error handlers, `404.jsp`, `500.jsp`, and database audit logging via `AuditLogDAO` | Ayush Sharma |
| **Exp 8** | **Servlet Architecture & Lifecycle** | Complete servlet suite: `LoginServlet`, `RegisterServlet`, `StudentDashboardServlet`, `ApplyCertificateServlet`, `MentorDashboardServlet`, `AdminDashboardServlet`, `VerifyCertificateServlet`, `RegistryServlet` | **All Members** |
| **Exp 9** | **JSP Form Validation with Error Notifications** | **`login.jsp`** & **`register.jsp`** with server-side validation messages and clean alerts | Amit Kumar |
| **Exp 10** | **Role-Based Dynamic Web Mini Project** | **DocuVerify Portal** — Complete production-grade web project with Admin, Mentor, and Student permission boundaries enforced by `AuthFilter` | **Full Team** |

---

## 📅 12-Week Project Timeline & Deliverables (6 July 2026 – 6 October 2026)

| Week | Date Range | Focus Area | Deliverables & Milestones |
|---|---|---|---|
| **Week 1** | 06 Jul – 12 Jul 2026 | Ideation & Architecture | Problem statement, feasibility analysis, Git repo initialization. |
| **Week 2** | 13 Jul – 19 Jul 2026 | Requirements & SRS | Complete Software Requirements Specification (SRS) v1.0. |
| **Week 3** | 20 Jul – 26 Jul 2026 | System Design & UML | Use Case diagrams, Class diagrams, Sequence diagrams, ER model. |
| **Week 4** | 27 Jul – 02 Aug 2026 | Database Design & UI Wireframes | MySQL schema creation (`docuverify_db`), responsive UI mockups. |
| **Week 5** | 03 Aug – 09 Aug 2026 | Auth & Session Security | `LoginServlet`, `RegisterServlet`, `UserDAO`, multi-identifier auth. |
| **Week 6** | 10 Aug – 16 Aug 2026 | Event Catalog & Application Engine | `events` table, `event_roster` matching, `ApplyCertificateServlet`. |
| **Week 7** | 17 Aug – 23 Aug 2026 | Mentor Verification Workflow | `MentorDashboardServlet`, roster match badge, review & reject actions. |
| **Week 8** | 24 Aug – 30 Aug 2026 | Java RMI Cryptographic Engine | `CryptoRMI.java`, SHA-256 payload calculation, RMI registry binding. |
| **Week 9** | 31 Aug – 06 Sep 2026 | Admin Approval & Issuance | `AdminDashboardServlet`, 1-click generation, audit logging. |
| **Week 10**| 07 Sep – 13 Sep 2026 | Public Verification Engine | `/verify`, instant hash matching, tamper detection alert card. |
| **Week 11**| 14 Sep – 20 Sep 2026 | Integration & Security Hardening | `AuthFilter`, SQL injection immunity, XSS sanitation, 404/500 handlers. |
| **Week 12**| 21 Sep – 06 Oct 2026 | Final Testing, Reports & Viva Prep | End-to-end verification, 180 daily logs, 12 weekly reports, project handbook. |
