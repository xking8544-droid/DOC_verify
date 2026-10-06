# 🎓 Arya College of Engineering & I.T. (ACEIT)
## Event & Merit Certificate Management & Verification System (DocuVerify ACEIT Edition)
### 📘 Comprehensive Project Handbook & Viva Defense Manual

---

## 📌 1. Project Overview & Motivation (Ye Project Kya Hai Aur Kyun Banaya?)

### 1.1 Context & Real-World Problem
In technical institutions like **Arya College of Engineering & I.T.**, hundreds of students actively participate in various intra-college and inter-collegiate events every semester across multiple domains:
- 🎭 **Drama / Rangmanch** (Nukkad Natak, Skits, Theatrical Plays)
- 🎵 **Music / Arya Tarang** (Classical, Solo Singing, Band Performances)
- 🏆 **Sports / Arya Yuva Spardha** (Cricket, Football, Badminton, Athletics)
- 💃 **Cultural / Aura Fest** (Group Dance, Folk Traditions, Fashion Showcase)
- 💻 **Technical / Hackathons** (CodeStorm 24-hr Hackathon, AI Innovation Challenges)

**The Critical Flaws in the Traditional Manual System:**
1. **Paper Certificates Get Lost or Damaged:** Physical paper certificates easily deteriorate, get misplaced, or get damaged.
2. **Easy Forgery & Fake Claims:** Any student can photocopy or edit a PDF in Photoshop/Canva, alter their name or roll number, and falsely claim they won 1st prize.
3. **No Centralized Record:** Placement cells, external evaluators, and companies cannot instantly verify whether a student actually participated or won.
4. **Proxy/Fake Applications:** In manual submission, students frequently submit certificates for events they never attended.

### 1.2 The Solution: DocuVerify ACEIT Edition
**DocuVerify ACEIT Edition** is an enterprise-grade, cryptographically secured web application developed specifically for Arya College of Engineering & I.T. (Dept. of CSE & AI&DS) under **Project Based Learning (PBL)**. It completely digitizes the event certificate lifecycle:
- **Single Centralized Localhost & Unified Database (`docuverify_db`):** No scattered servers. Everything runs together seamlessly.
- **3-Tier Anti-Forgery Engine:** Eliminates fake student participation claims before any certificate is issued.
- **Cryptographic Security (SHA-256 via Java RMI):** Generates immutable mathematical signatures for every certificate that cannot be forged.
- **Public 1-Click Verification:** Anyone (recruiters, external colleges, parents) can instantly verify certificate validity without logging in.

---

## 🏛️ 2. Three-Role Workflow Architecture (Teeno Panels Kaise Kaam Karte Hain?)

The system provides tailored, role-specific portals for all three stakeholders:

```
+---------------------------------------------------------------------------------------+
|                                  STUDENT PORTAL                                       |
|  1. Register with Roll No (e.g. 24EAIDS051) & Branch                                  |
|  2. View available college events (Cultural, Sports, Drama, Music, Technical)         |
|  3. Submit Certificate Request with event details, team ID, & proof link              |
+------------------------------------------+--------------------------------------------+
                                           |
                    [Anti-Forgery Check: Matches against Event Roster?]
                                           |
                                           v
+---------------------------------------------------------------------------------------+
|                                FACULTY / REVIEWER PANEL                               |
|                         Department Faculty & Event In-Charge                          |
|  1. Reviews application queue                                                         |
|  2. Inspects "Roster Matched (Genuine)" badge & event coordinator records             |
|  3. Action: "Verify & Recommend" (or Reject with reason)                              |
+------------------------------------------+--------------------------------------------+
                                           |
                                [Recommended to HOD/Admin]
                                           |
                                           v
+---------------------------------------------------------------------------------------+
|                                ADMIN / HOD PANEL                                      |
|  1. Final Approval Authority                                                          |
|  2. 1-Click "Approve & Generate SHA-256"                                              |
|  3. Invokes Java RMI (Exp 2) to compute mathematical cryptographic hash              |
|  4. Certificate issued with unique ID (e.g. ACEIT-2026-TECH-5143)                     |
+------------------------------------------+--------------------------------------------+
                                           |
                                   [Published to Web]
                                           |
                                           v
+---------------------------------------------------------------------------------------+
|                              PUBLIC VERIFICATION                                      |
|                 URL: http://localhost:8080/DocuVerify/verify?id=...                   |
|  - Zero login required for employers, companies, and external evaluators              |
|  - Re-computes live SHA-256 hash and compares with database hash                     |
|  - Instant GREEN Verified Badge or RED Tampered Alert                                 |
+---------------------------------------------------------------------------------------+
```

---

## 🛡️ 3. Anti-Forgery 3-Tier Verification Engine (Farzi / Fake Request Kaise Pakdi Jaati Hai?)

> **The Key Question:** *"Agar koi bachha fake certificate ke liye apply kare jisme wo kabhi gaya hi nahi, to system ko kaise pata chalega?"*

The system implements an **automated and institutional 3-Tier Anti-Forgery Architecture**:

### 🎯 Tier 1: Master Event Coordinator Roster (`event_roster` Table)
- When any college event finishes (e.g., *CodeStorm Hackathon* or *Arya Yuva Spardha*), the official Faculty Coordinator uploads the master attendance and winner list directly into the `event_roster` table.
- When a student applies through `/certificate/apply`, `ApplicationDAO.checkEventRosterMatch()` automatically cross-checks:
  $$\text{Match} = (\text{LOWER}(roll\_no) == \text{roster.roll\_no}) \land (\text{LOWER}(student\_name) \approx \text{roster.student\_name}) \land (\text{roster.event\_id} == \text{applied\_event\_id})$$
- If found, the application is tagged with:
  `auto_matched = 1` $\rightarrow$ **`[✓ Roster Matched (Genuine)]` Green Badge**.
- If NOT found (e.g., student never registered or participated), the application is flagged:
  `auto_matched = 0` $\rightarrow$ **`[⚠ Not in Coordinator Roster - Manual Check Required]` Amber Badge**.

### 👨‍🏫 Tier 2: Faculty Mentor Physical Verification
- The Department Mentor (**Er. Ram Babu Buri**) logs into `/mentor/dashboard`.
- The mentor reviews the pending list. If a request is flagged as unmatched, the mentor can:
  - Check the student's physical participation certificate / ID card.
  - Contact the event coordinator.
  - If fraudulent, click **"Reject Application"** with remarks: *"Roll number not found in coordinator attendance sheet"*.
  - If authentic, click **"Verify & Recommend"**.

### 🔒 Tier 3: Cryptographic Immutability via Java RMI (Exp 2 & SHA-256)
- Once the Admin/HOD approves, the server computes a mathematical SHA-256 signature over the payload:
  $$\text{Payload} = \text{RollNo} + "|" + \text{StudentName} + "|" + \text{CourseName} + "|" + \text{Grade/Position}$$
- Computed remotely via **Java RMI (Port 1099)**.
- If anyone tampers with the student's name, grade, or event in the database, the computed hash immediately mismatches during `/verify`, triggering a **TAMPERED (Tampering Detected)** alert!

---

## 💾 4. Database Schema Specification (`docuverify_db`)

The system operates on **MySQL 8.0** with 7 optimized relational tables:

1. **`users`**:
   - `id`, `username`, `email`, `password_hash`, `full_name`, `role` (`'admin'`, `'mentor'`, `'student'`, `'user'`), `roll_no`, `branch`, `year`, `is_active`, `created_at`, `last_login`.
2. **`events`**:
   - `id`, `event_name`, `category` (`Cultural`, `Sports`, `Drama`, `Music`, `Technical`), `event_date`, `coordinator_name`, `description`, `created_at`.
3. **`event_roster`**:
   - `id`, `event_id`, `student_name`, `roll_no`, `branch`, `position_secured`, `coordinator_signature`, `created_at`.
4. **`certificate_applications`**:
   - `id`, `application_no`, `student_id`, `student_name`, `roll_no`, `branch`, `event_name`, `category`, `position`, `event_date`, `registration_id`, `proof_link`, `status` (`pending`, `verified_by_mentor`, `approved`, `rejected`), `auto_matched`, `mentor_remarks`, `admin_remarks`, `cert_id`, `applied_at`, `updated_at`.
5. **`certificates`**:
   - `id`, `cert_id`, `student_name`, `roll_no`, `course_name`, `category`, `event_name`, `grade`, `crypto_hash`, `issued_by`, `issue_date`, `is_revoked`.
6. **`audit_logs`**:
   - `id`, `user_id`, `action`, `details`, `ip_address`, `timestamp`.
7. **`verification_history`**:
   - `id`, `cert_id`, `verified_by_ip`, `verification_status`, `verified_at`.

---

## 🧪 5. Academic Java Lab Experiments Mapping (Syllabus Integration)

Every single module directly satisfies the official RTU / College 5th Semester Java Programming Lab requirements:

| Experiment # | RTU Syllabus Topic | Implementation in DocuVerify |
|---|---|---|
| **Exp 1** | Fundamentals, Multithreading & Concurrency | Concurrent HTTP thread pools in Apache Tomcat 9, thread-safe DAO database connections. |
| **Exp 2** | **Remote Method Invocation (RMI)** | **`CryptoRMI.java`** & **`CryptoService.java`** running on RMI Registry (Port 1099), providing remote SHA-256 calculation. |
| **Exp 3** | Event Handling & Form Validation Components | Interactive JavaScript event listeners in `app.js` and dynamic DOM reflection. |
| **Exp 4** | **JDBC Database Connectivity** | **`DBConnection.java`**, `UserDAO`, `CertificateDAO`, `ApplicationDAO`, `EventDAO` using connection pooling & parameterized `PreparedStatement`. |
| **Exp 5** | Dynamic GUI Layouts & Real-time State | Dynamic role-based sidebar, live status badges, interactive category filters in JSP. |
| **Exp 6** | Java Collections Framework | Heavy usage of `ArrayList<CertificateApplication>`, `Map<String, Object>`, and payload serialization. |
| **Exp 7** | Exception Handling & Logging | Robust `try-catch-finally` blocks, `404.jsp`, `500.jsp`, and database audit trails via `AuditLogDAO`. |
| **Exp 8** | **Servlet Architecture & Lifecycle** | Complete servlet suite: `LoginServlet`, `RegisterServlet`, `StudentDashboardServlet`, `ApplyCertificateServlet`, `MentorDashboardServlet`, `AdminDashboardServlet`, `VerifyCertificateServlet`, `RegistryServlet`. |
| **Exp 9** | **JSP Form Validation with Error Notifications** | `login.jsp`, `register.jsp`, and `apply.jsp` featuring server-side validation error handling and flash alerts. |
| **Exp 10** | **Role-Based Dynamic Web Mini Project** | Complete end-to-end multi-role web application with `AuthFilter` enforcing security boundaries. |

---

## 🚀 6. How to Run the Project (Step-by-Step Localhost Guide)

### Prerequisites
- **Operating System:** Windows 10 / 11
- **Java Development Kit:** JDK 21+ (Installed at `C:\Program Files\Java\jdk-24\`)
- **Web Server:** Apache Tomcat 9.0.97 (Installed at `C:\apache-tomcat-9.0.97\`)
- **Database Server:** MySQL 8.0 (Database name: `docuverify_db`, Password: `amit`)

### 1-Click Execution via PowerShell
Open PowerShell inside `DocuVerify` directory:
```powershell
# 1. Start Apache Tomcat Daemon
$env:CATALINA_HOME = "C:\apache-tomcat-9.0.97"
$env:JAVA_HOME = "C:\Program Files\Java\jdk-24"
& "C:\apache-tomcat-9.0.97\bin\catalina.bat" run
```

### URLs & Default Credentials:
| Portal | URL | Username / ID | Password | Role Description |
|---|---|---|---|---|
| **Portal Home** | `http://localhost:8080/DocuVerify/` | *Public* | *Public* | Landing portal showcasing event categories |
| **Login Page** | `http://localhost:8080/DocuVerify/login` | — | — | 3-tab login interface |
| **Admin Panel** | `http://localhost:8080/DocuVerify/admin/dashboard` | `admin` | `admin123` | Final approval & SHA-256 issuance |
| **Mentor Panel** | `http://localhost:8080/DocuVerify/mentor/dashboard` | `mentor` | `mentor123` | Er. Ram Babu Buri (CSE / AI&DS) |
| **Student Portal** | `http://localhost:8080/DocuVerify/student/dashboard` | `24EAIDS051` | `student123` | Amit Kumar (5th Sem AI&DS) |
| **Public Verification** | `http://localhost:8080/DocuVerify/verify` | *Public* | *Public* | 1-click cryptographic verification |
| **College Registry** | `http://localhost:8080/DocuVerify/registry` | *Public* | *Public* | Public archive of issued certificates |

---

## 💡 7. Comprehensive Viva Voce Questions & Answers (Examiner Ke Sawal Aur Jawab)

### Q1: What is the main problem your project solves?
> **Answer:** Traditional college paper certificates are vulnerable to physical damage and easy Photoshop tampering, while manual application allows proxy or fake participation claims. DocuVerify ACEIT Edition digitizes event certificates across Cultural, Sports, Drama, Music, and Technical categories, enforces a 3-tier anti-forgery verification process using coordinator master rosters, and seals each certificate with an immutable SHA-256 cryptographic hash computed over Java RMI.

### Q2: How does the system prevent fake certificate applications?
> **Answer:** We created an institutional 3-Tier Anti-Forgery Architecture:
> 1. **Tier 1 (Automated Roster Matching):** When a student submits a claim, `ApplicationDAO` instantly cross-checks their Roll Number and Event ID against the official coordinator attendance roster (`event_roster` table). If matched, it gets a green *Roster Matched (Genuine)* badge; otherwise, it is flagged.
> 2. **Tier 2 (Faculty Mentor Verification):** The departmental faculty mentor reviews the student's submission and roster match status before recommending it to the HOD/Admin.
> 3. **Tier 3 (Cryptographic Sealing):** Only after both endorsements can the Admin click approve, generating a tamper-proof SHA-256 signature.

### Q3: Why did you use Java RMI (Remote Method Invocation)? Which lab experiment does it cover?
> **Answer:** It fulfills **Lab Experiment 2**. Instead of keeping cryptography in the web presentation tier, we decoupled it into a standalone remote cryptographic service (`CryptoRMI`). The servlet acts as an RMI client, looking up `DocuVerifyCrypto` on RMI Registry port 1099, and the remote server executes the SHA-256 hashing. This demonstrates distributed system architecture.

### Q4: How does public verification work without login?
> **Answer:** Anyone can visit `/verify?id=<cert_id>`. The servlet fetches the certificate details from MySQL, takes `RollNo|StudentName|CourseName|Grade`, passes this payload through the SHA-256 algorithm again, and compares the freshly calculated hash with the original stored hash. If even a single letter was altered in the database, the hashes will mismatch, and a red "TAMPERED" warning appears.

### Q5: How do you prevent SQL Injection and unauthorized access?
> **Answer:** All database operations strictly use parameterized `PreparedStatement` with `?` placeholders, which neutralizes SQL Injection. Unauthorized access is blocked by `AuthFilter.java`, which checks the user's `HttpSession` and role permissions before allowing access to `/admin/*` or `/mentor/*` routes.

---

## 📤 8. GitHub Push Command (Git Pe Upload Kaise Karein?)

All files are structured inside the unified repository. To push the complete working project to your GitHub account:

```powershell
# In PowerShell inside c:\Users\amitk\OneDrive\Desktop\COLLEGE\5 sem\java\DocuVerify
git add .
git commit -m "feat: complete Arya College event certificate portal with 3-tier anti-forgery, RMI SHA-256, and 12-week documentation"
git branch -M main
git remote add origin https://github.com/<YOUR_GITHUB_USERNAME>/DocuVerify-ACEIT.git
git push -u origin main
```
Everything is contained in this single repository, ready to be reviewed by evaluators and faculty guides.
