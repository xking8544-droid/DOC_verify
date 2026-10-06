-- Arya College of Engineering & IT Upgrade Script
USE docuverify_db;

-- 1. Alter users table to support roles and college attributes
ALTER TABLE users 
    MODIFY COLUMN role ENUM('admin', 'mentor', 'student', 'user') DEFAULT 'student';

-- Add columns safely if not exist
SET @dbname = DATABASE();
SET @tablename = "users";

SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = "roll_no") > 0,
  "SELECT 1",
  "ALTER TABLE users ADD COLUMN roll_no VARCHAR(60) NULL AFTER role"
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = "branch") > 0,
  "SELECT 1",
  "ALTER TABLE users ADD COLUMN branch VARCHAR(80) DEFAULT 'AI & Data Science' AFTER roll_no"
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = "year") > 0,
  "SELECT 1",
  "ALTER TABLE users ADD COLUMN year VARCHAR(40) DEFAULT '3rd Year / 5th Sem' AFTER branch"
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- 2. Alter certificates table for event category
SET @tablename = "certificates";
SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = "category") > 0,
  "SELECT 1",
  "ALTER TABLE certificates ADD COLUMN category VARCHAR(50) DEFAULT 'Cultural' AFTER course_name"
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

SET @preparedStatement = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = @dbname AND TABLE_NAME = @tablename AND COLUMN_NAME = "event_name") > 0,
  "SELECT 1",
  "ALTER TABLE certificates ADD COLUMN event_name VARCHAR(150) DEFAULT 'College Event' AFTER category"
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

-- 3. Create events master table
CREATE TABLE IF NOT EXISTS events (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(150) NOT NULL,
    category ENUM('Cultural', 'Sports', 'Drama', 'Music', 'Technical', 'Academic') NOT NULL,
    event_date DATE NOT NULL,
    coordinator_name VARCHAR(100) DEFAULT 'Er. Ram Babu Buri',
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Create event_roster table for Anti-Forgery Matching
CREATE TABLE IF NOT EXISTS event_roster (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(150) NOT NULL,
    roll_no VARCHAR(60) NOT NULL,
    student_name VARCHAR(120) NOT NULL,
    position VARCHAR(60) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Create certificate_applications table
CREATE TABLE IF NOT EXISTS certificate_applications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    application_no VARCHAR(30) UNIQUE NOT NULL,
    student_id INT NOT NULL,
    student_name VARCHAR(120) NOT NULL,
    roll_no VARCHAR(60) NOT NULL,
    branch VARCHAR(80) NOT NULL,
    event_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    position VARCHAR(60) NOT NULL,
    event_date VARCHAR(50) NOT NULL,
    registration_id VARCHAR(100),
    proof_link VARCHAR(255),
    status ENUM('pending', 'verified_by_mentor', 'approved', 'rejected') DEFAULT 'pending',
    auto_matched TINYINT(1) DEFAULT 0,
    mentor_remarks TEXT,
    rejection_reason TEXT,
    issued_cert_id VARCHAR(30) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 6. Seed Mentor and Student accounts
INSERT INTO users (username, email, password_hash, full_name, role, roll_no, branch) 
VALUES ('mentor', 'rambabu.buri@aryacollege.in', SHA2('mentor123', 256), 'Er. Ram Babu Buri', 'mentor', 'FACULTY-CSE-01', 'Dept. of CSE')
ON DUPLICATE KEY UPDATE full_name='Er. Ram Babu Buri', role='mentor';

INSERT INTO users (username, email, password_hash, full_name, role, roll_no, branch, year)
VALUES ('24EAIDS051', 'amit.kumar@aryacollege.in', SHA2('student123', 256), 'Amit Kumar', 'student', '24EAIDS051', 'AI & Data Science', '3rd Year / 5th Sem')
ON DUPLICATE KEY UPDATE roll_no='24EAIDS051', role='student';

INSERT INTO users (username, email, password_hash, full_name, role, roll_no, branch, year)
VALUES ('24EAIDS052', 'ayush.sharma@aryacollege.in', SHA2('student123', 256), 'Ayush Sharma', 'student', '24EAIDS052', 'AI & Data Science', '3rd Year / 5th Sem')
ON DUPLICATE KEY UPDATE roll_no='24EAIDS052', role='student';

-- 7. Seed Official Arya College Events
INSERT IGNORE INTO events (id, event_name, category, event_date, coordinator_name, description) VALUES
(1, 'Arya Tarang Fest 2026 - Classical & Solo Singing', 'Music', '2026-09-15', 'Er. Ram Babu Buri', 'Annual intra-college music competition'),
(2, 'Arya Yuva Spardha 2026 - Inter-College Cricket Tournament', 'Sports', '2026-08-20', 'Sports Department', 'State-level RTU inter-collegiate cricket championship'),
(3, 'Rangmanch 2026 - Street Play & Drama Contest', 'Drama', '2026-09-10', 'Cultural Council', 'Theme: Technology Ethics & Social Harmony'),
(4, 'Aura Cultural Fest 2026 - Group Dance Showcase', 'Cultural', '2026-09-18', 'Cultural Committee', 'Folk and western group dance showcase'),
(5, 'CodeStorm Hackathon 2026 - 24hr AI Innovation Challenge', 'Technical', '2026-09-05', 'Er. Ram Babu Buri', 'Hackathon for 5th semester AI&DS and CSE students');

-- 8. Seed Attendance Master Roster for Anti-Forgery Matching
INSERT IGNORE INTO event_roster (id, event_name, roll_no, student_name, position) VALUES
(1, 'Arya Tarang Fest 2026 - Classical & Solo Singing', '24EAIDS051', 'Amit Kumar', '1st Prize (Winner)'),
(2, 'CodeStorm Hackathon 2026 - 24hr AI Innovation Challenge', '24EAIDS051', 'Amit Kumar', 'First Runner Up'),
(3, 'Arya Yuva Spardha 2026 - Inter-College Cricket Tournament', '24EAIDS052', 'Ayush Sharma', 'Best Batsman / Winner'),
(4, 'Rangmanch 2026 - Street Play & Drama Contest', '24EAIDS053', 'Mali Singh', 'Best Actor / 2nd Prize');

-- 9. Seed sample applications
INSERT IGNORE INTO certificate_applications (id, application_no, student_id, student_name, roll_no, branch, event_name, category, position, event_date, registration_id, status, auto_matched)
SELECT 1, 'APP-2026-001', id, 'Amit Kumar', '24EAIDS051', 'AI & Data Science', 'Arya Tarang Fest 2026 - Classical & Solo Singing', 'Music', '1st Prize (Winner)', '2026-09-15', 'TARANG-MUS-051', 'verified_by_mentor', 1
FROM users WHERE username='24EAIDS051'
ON DUPLICATE KEY UPDATE status='verified_by_mentor';

INSERT IGNORE INTO certificate_applications (id, application_no, student_id, student_name, roll_no, branch, event_name, category, position, event_date, registration_id, status, auto_matched)
SELECT 2, 'APP-2026-002', id, 'Ayush Sharma', '24EAIDS052', 'AI & Data Science', 'Arya Yuva Spardha 2026 - Inter-College Cricket Tournament', 'Sports', 'Winner Team', '2026-08-20', 'SPORTS-CRIC-019', 'pending', 1
FROM users WHERE username='24EAIDS052'
ON DUPLICATE KEY UPDATE status='pending';
