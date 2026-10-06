package com.docuverify.dao;

import com.docuverify.model.Certificate;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CertificateDAO {

    public boolean saveCertificate(Certificate cert) {
        String sql = "INSERT INTO certificates (cert_id, student_name, roll_no, course_name, category, event_name, grade, crypto_hash, issued_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cert.getCertId());
            stmt.setString(2, cert.getStudentName());
            stmt.setString(3, cert.getRollNo());
            stmt.setString(4, cert.getCourseName());
            stmt.setString(5, cert.getCategory());
            stmt.setString(6, cert.getEventName());
            stmt.setString(7, cert.getGrade());
            stmt.setString(8, cert.getCryptoHash());
            stmt.setInt(9, cert.getIssuedBy());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Certificate getCertificateById(String certId) {
        String sql = "SELECT * FROM certificates WHERE cert_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, certId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToCertificate(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Certificate> getAllCertificates() {
        return searchCertificates(null);
    }

    public List<Certificate> searchCertificates(String keyword) {
        List<Certificate> certs = new ArrayList<>();
        String sql = "SELECT * FROM certificates";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += " WHERE cert_id LIKE ? OR student_name LIKE ? OR roll_no LIKE ?";
        }
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            if (keyword != null && !keyword.trim().isEmpty()) {
                String likeKw = "%" + keyword + "%";
                stmt.setString(1, likeKw);
                stmt.setString(2, likeKw);
                stmt.setString(3, likeKw);
            }
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                certs.add(mapResultSetToCertificate(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return certs;
    }

    public int getCertificateCount() {
        String sql = "SELECT COUNT(*) FROM certificates";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public List<Certificate> getCertificatesByUser(int userId) {
        List<Certificate> certs = new ArrayList<>();
        String sql = "SELECT * FROM certificates WHERE issued_by = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                certs.add(mapResultSetToCertificate(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return certs;
    }

    public boolean revokeCertificate(String certId) {
        String sql = "UPDATE certificates SET is_revoked = 1 WHERE cert_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, certId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Certificate> getRecentCertificates(int limit) {
        List<Certificate> certs = new ArrayList<>();
        String sql = "SELECT * FROM certificates ORDER BY issue_date DESC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                certs.add(mapResultSetToCertificate(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return certs;
    }

    public List<Certificate> getCertificatesByRollNo(String rollNo) {
        List<Certificate> certs = new ArrayList<>();
        String sql = "SELECT * FROM certificates WHERE roll_no = ? ORDER BY issue_date DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, rollNo);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                certs.add(mapResultSetToCertificate(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return certs;
    }

    private Certificate mapResultSetToCertificate(ResultSet rs) throws SQLException {
        Certificate cert = new Certificate();
        cert.setId(rs.getInt("id"));
        cert.setCertId(rs.getString("cert_id"));
        cert.setStudentName(rs.getString("student_name"));
        cert.setRollNo(rs.getString("roll_no"));
        cert.setCourseName(rs.getString("course_name"));
        try {
            cert.setCategory(rs.getString("category"));
            cert.setEventName(rs.getString("event_name"));
        } catch (SQLException ignored) {}
        cert.setGrade(rs.getString("grade"));
        cert.setCryptoHash(rs.getString("crypto_hash"));
        cert.setIssuedBy(rs.getInt("issued_by"));
        cert.setIssueDate(rs.getTimestamp("issue_date"));
        cert.setRevoked(rs.getBoolean("is_revoked"));
        return cert;
    }
}
