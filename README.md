# 🎓 DocuVerify™ (ACEIT Edition)
### Cryptographic Event & Merit Certificate Management & Verification System
**Arya College of Engineering & I.T., Jaipur • Department of CSE & AI&DS**  
*Project Based Learning (PBL) 2026-27 • Team 5A (`PBL2627-AI&DS-A-051`)*

[![Live Demo](https://img.shields.io/badge/Live%20Demo-GitHub%20Pages-brightgreen?style=for-the-badge&logo=github)](https://xking8544-droid.github.io/DOC_verify/)
[![Java](https://img.shields.io/badge/Java-JDK%2021%2B-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![Tomcat](https://img.shields.io/badge/Apache%20Tomcat-9.0-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black)](https://tomcat.apache.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![RMI](https://img.shields.io/badge/Security-SHA--256%20RMI-red?style=for-the-badge&logo=securityscorecard&logoColor=white)](#cryptographic-architecture)

---

## 🌐 Live Interactive Showcase
Experience the live cryptographic verifier and interactive portal simulator directly in your browser:  
👉 **[https://xking8544-droid.github.io/DOC_verify/](https://xking8544-droid.github.io/DOC_verify/)**

---

## 📌 Project Overview
In academic institutions, students participate in various intra-college and inter-collegiate events across:
- 🎭 **Drama / Rangmanch** (Street plays, skits, theatre festivals)
- 🎵 **Music / Arya Tarang** (Solo singing, instrumental, band competitions)
- 🏆 **Sports / Arya Yuva Spardha** (Cricket, badminton, football, athletics)
- 💃 **Cultural / Aura Fest** (Group dance, folk showcases, fashion festivals)
- 💻 **Technical / Hackathons** (CodeStorm 24-hr Hackathons, AI innovation challenges)

**DocuVerify ACEIT Edition** solves physical paper loss and certificate forgery using an institutional **3-Tier Anti-Forgery Architecture** and **Java Remote Method Invocation (RMI)** calculating immutable SHA-256 cryptographic signatures.

---

## 🏛️ 3-Role Workflow Architecture

```
                             [ ARYA COLLEGE PORTAL ]
                                        │
        ┌───────────────────────────────┼───────────────────────────────┐
        ▼                               ▼                               ▼
 [ STUDENT PORTAL ]            [ FACULTY PANEL ]              [ ADMIN / HOD PANEL ]
  • Roll No Login               • Coordinator Roster Match     • Final Authority
  • Submit Claim with Proof     • Verify & Recommend           • 1-Click Approval
  • Track Pending/Approved      • Reject Fake Requests         • SHA-256 via Java RMI
        │                               │                               │
        └───────────────────────────────┼───────────────────────────────┘
                                        ▼
                          [ PUBLIC VERIFICATION ENGINE ]
                           • Zero Login Required
                           • 1-to-1 Verification via Cert ID
                           • Live SHA-256 Re-hash Integrity Match
```

---

## 🛡️ Anti-Forgery 3-Tier Verification Engine

1. **Tier 1 (Automated Coordinator Roster Match):** When a student submits a certificate request, `ApplicationDAO` automatically matches their University Roll Number and Event ID against the official coordinator attendance roster (`event_roster` table). Genuine records receive a green `[✓ Roster Matched (Genuine)]` badge.
2. **Tier 2 (Faculty Mentor Verification):** The departmental faculty reviewer examines the student's submission and attached evidence, endorsing genuine claims or rejecting invalid proxy requests with reasons.
3. **Tier 3 (Cryptographic Sealing via Java RMI):** Admin approval triggers **Java RMI (Port 1099)** to compute a 64-character SHA-256 cryptographic digest over the certificate payload (`RollNo|StudentName|CourseName|Grade`). Any future alteration in the database immediately triggers a **TAMPERED** alert during public verification.

---

## 👥 Team 5A & Lab Experiment Mapping

| Member | Roll Number | Designated Role | Core Java Files Owned | Lab Experiments |
|---|---|---|---|---|
| **Amit Kumar** *(Lead)* | `24EAIDS051` | Lead Architect & Auth | `LoginServlet.java`, `RegisterServlet.java`, `UserDAO.java`, `AuthFilter.java` | **Exp 1** (Threading), **Exp 8** (Servlet), **Exp 9** (JSP Login) |
| **Ayush Tiwari** | `24EAIDS052` | Operations & Admin | `AdminDashboardServlet.java`, `AuditLogDAO.java`, `AuditLog.java` | **Exp 7** (Exceptions/Logs), **Exp 8** (Servlet), **Exp 10** (Role Mini-Proj) |
| **Aryan Mali** | `24EAIDS053` | Cryptography & RMI | `CryptoRMI.java`, `CryptoService.java`, `Certificate.java` | **Exp 2** (Java RMI), **Exp 5** (Dynamic Layouts), **Exp 8** (Servlet) |
| **Aryan Jangir** | `24EAIDS054` | Public Verification | `VerifyCertificateServlet.java`, `ApplyCertificateServlet.java` | **Exp 3** (Event Handling), **Exp 8** (Servlet), **Exp 9** (Validation) |
| **Ankit Jangir** | `24EAIDS055` | Roster & Data Arch | `ApplicationDAO.java`, `EventDAO.java`, `DBConnection.java`, `CertificateDAO.java` | **Exp 4** (JDBC), **Exp 7** (File I/O), **Exp 8** (Servlet) |

---

## 📁 Repository Structure

```
DOC_verify/
├── docs/                               # GitHub Pages Live Showcase
│   └── index.html                      # Interactive In-Browser SHA-256 Simulator
├── sql/
│   ├── schema.sql                      # Base schema
│   └── arya_college_upgrade.sql        # Tables: events, event_roster, certificate_applications
├── src/com/docuverify/
│   ├── crypto/                         # Lab Exp 2: Java RMI Cryptographic Engine
│   │   ├── CryptoRMI.java
│   │   └── CryptoService.java
│   ├── dao/                            # Lab Exp 4: JDBC Data Access Objects
│   │   ├── ApplicationDAO.java
│   │   ├── AuditLogDAO.java
│   │   ├── CertificateDAO.java
│   │   ├── DBConnection.java
│   │   ├── EventDAO.java
│   │   └── UserDAO.java
│   ├── filter/                         # Lab Exp 10: Security & Access Control
│   │   └── AuthFilter.java
│   ├── model/                          # POJO Data Models
│   │   ├── AuditLog.java
│   │   ├── Certificate.java
│   │   ├── CertificateApplication.java
│   │   ├── Event.java
│   │   └── User.java
│   ├── servlet/                        # Lab Exp 8: Web Controller Servlets
│   │   ├── AdminDashboardServlet.java
│   │   ├── ApplyCertificateServlet.java
│   │   ├── IssueCertificateServlet.java
│   │   ├── LoginServlet.java
│   │   ├── LogoutServlet.java
│   │   ├── ManageUsersServlet.java
│   │   ├── MentorDashboardServlet.java
│   │   ├── ProfileServlet.java
│   │   ├── RegisterServlet.java
│   │   ├── RegistryServlet.java
│   │   ├── StudentDashboardServlet.java
│   │   └── VerifyCertificateServlet.java
│   └── util/
│       └── PasswordUtil.java
├── web/                                # Frontend Presentation Layer
│   ├── css/
│   ├── js/
│   ├── jsp/
│   │   ├── admin/
│   │   ├── certificate/
│   │   ├── error/
│   │   ├── includes/
│   │   ├── mentor/
│   │   └── student/
│   ├── WEB-INF/
│   │   ├── lib/                        # JSTL, MySQL Connector J
│   │   └── web.xml
│   └── index.jsp                       # Executive Portal Landing
├── docuverify_project_plan.md          # 12-Week Master Project Curriculum
├── upload_guide.md                     # 180 Daily Logs & 12 Weekly Reports
└── project_explanation_handbook.md     # Comprehensive Project & Viva Defense Handbook
```

---

## 🚀 How to Run Locally

### 1. Prerequisites
- **Java Development Kit (JDK 21+)**
- **Apache Tomcat 9.0.x**
- **MySQL Server 8.0**

### 2. Database Setup
```bash
mysql -u root -p < sql/schema.sql
mysql -u root -p < sql/arya_college_upgrade.sql
```

### 3. Deploy to Tomcat
Copy `web/` directory to `C:/apache-tomcat-9.0.x/webapps/DocuVerify/`.

### 4. Start Server & Access Portal
Start Tomcat (`catalina.bat run`) and open:  
👉 **`http://localhost:8080/DocuVerify/`**

### Default Demo Credentials:
- **Admin / HOD:** `admin` / `admin123`
- **Faculty Reviewer:** `mentor` / `mentor123`
- **Student Portal:** `24EAIDS051` / `student123`
- **Public Verification:** Test Certificate ID `ACEIT-2026-TECH-5143`

---

## 📜 Academic License
Developed for academic submission under Project Based Learning (PBL) at **Arya College of Engineering & I.T. (ACEIT), Jaipur**.
