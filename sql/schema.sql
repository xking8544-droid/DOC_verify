-- DocuVerify Database Schema
-- Project: DocuVerify - Cryptographic Certificate Generator & Verification Portal
-- Team: 5A (PBL2627-AI&DS-A-051)
-- Guide: Er. Ram Babu Buri

CREATE DATABASE IF NOT EXISTS docuverify_db;
USE docuverify_db;

-- Users Table (Module 1 - Amit)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(64) NOT NULL,
    full_name VARCHAR(120) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL
);

-- Certificates Table (Module 3 & 4 - Mali & Aryan)
CREATE TABLE IF NOT EXISTS certificates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cert_id VARCHAR(20) UNIQUE NOT NULL,
    student_name VARCHAR(120) NOT NULL,
    roll_no VARCHAR(60) NOT NULL,
    course_name VARCHAR(180) NOT NULL,
    grade VARCHAR(50) NOT NULL,
    crypto_hash VARCHAR(64) NOT NULL,
    issued_by INT,
    issue_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_revoked BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (issued_by) REFERENCES users(id)
);

-- Audit Logs Table (Module 2 - Ayush)
CREATE TABLE IF NOT EXISTS audit_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(100) NOT NULL,
    details TEXT,
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Verification History Table (Module 4 - Aryan)
CREATE TABLE IF NOT EXISTS verification_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cert_id VARCHAR(20) NOT NULL,
    verified_by INT NULL,
    result ENUM('authentic', 'tampered', 'not_found') NOT NULL,
    verified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (verified_by) REFERENCES users(id)
);

-- Default Admin User (password: admin123, SHA-256 hashed)
INSERT INTO users (username, email, password_hash, full_name, role) 
VALUES ('admin', 'admin@docuverify.com', 
        SHA2('admin123', 256), 'System Administrator', 'admin');

-- Sample Certificates for Testing
INSERT INTO certificates (cert_id, student_name, roll_no, course_name, grade, crypto_hash, issued_by) VALUES
('DV-2026-4829', 'Amit Kumar', '24EAIDS001', 'B.Tech in AI & Data Science', 'A+ (Distinction)', SHA2('24EAIDS001|Amit Kumar|B.Tech in AI & Data Science|A+ (Distinction)', 256), 1),
('DV-2026-5173', 'Ayush Sharma', '24EAIDS002', 'B.Tech in AI & Data Science', 'A (First Division)', SHA2('24EAIDS002|Ayush Sharma|B.Tech in AI & Data Science|A (First Division)', 256), 1),
('DV-2026-6392', 'Mali Singh', '24EAIDS003', 'B.Tech in AI & Data Science', 'A+ (Distinction)', SHA2('24EAIDS003|Mali Singh|B.Tech in AI & Data Science|A+ (Distinction)', 256), 1);
