package com.docuverify.dao;

import com.docuverify.model.CertificateApplication;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {

    public boolean submitApplication(CertificateApplication app) {
        // Auto-check against event roster to detect if student genuinely participated
        boolean isMatched = checkEventRosterMatch(app.getEventName(), app.getRollNo());
        app.setAutoMatched(isMatched);

        String sql = "INSERT INTO certificate_applications " +
                "(application_no, student_id, student_name, roll_no, branch, event_name, category, position, " +
                "event_date, registration_id, proof_link, status, auto_matched) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, app.getApplicationNo());
            stmt.setInt(2, app.getStudentId());
            stmt.setString(3, app.getStudentName());
            stmt.setString(4, app.getRollNo());
            stmt.setString(5, app.getBranch());
            stmt.setString(6, app.getEventName());
            stmt.setString(7, app.getCategory());
            stmt.setString(8, app.getPosition());
            stmt.setString(9, app.getEventDate());
            stmt.setString(10, app.getRegistrationId());
            stmt.setString(11, app.getProofLink());
            stmt.setString(12, "pending");
            stmt.setBoolean(13, isMatched);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean checkEventRosterMatch(String eventName, String rollNo) {
        String sql = "SELECT COUNT(*) FROM event_roster WHERE event_name = ? AND roll_no = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, eventName);
            stmt.setString(2, rollNo);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<CertificateApplication> getApplicationsByStudent(int studentId) {
        List<CertificateApplication> list = new ArrayList<>();
        String sql = "SELECT * FROM certificate_applications WHERE student_id = ? ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(mapResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CertificateApplication> getAllApplications() {
        List<CertificateApplication> list = new ArrayList<>();
        String sql = "SELECT * FROM certificate_applications ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CertificateApplication> getPendingForMentor() {
        List<CertificateApplication> list = new ArrayList<>();
        String sql = "SELECT * FROM certificate_applications WHERE status = 'pending' ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<CertificateApplication> getPendingForAdmin() {
        List<CertificateApplication> list = new ArrayList<>();
        String sql = "SELECT * FROM certificate_applications WHERE status IN ('pending', 'verified_by_mentor') ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                list.add(mapResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public CertificateApplication getApplicationById(int id) {
        String sql = "SELECT * FROM certificate_applications WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean verifyByMentor(int id, String remarks) {
        String sql = "UPDATE certificate_applications SET status = 'verified_by_mentor', mentor_remarks = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, remarks);
            stmt.setInt(2, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean approveAndIssue(int id, String certId) {
        String sql = "UPDATE certificate_applications SET status = 'approved', issued_cert_id = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, certId);
            stmt.setInt(2, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean rejectApplication(int id, String reason) {
        String sql = "UPDATE certificate_applications SET status = 'rejected', rejection_reason = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, reason);
            stmt.setInt(2, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getApplicationCountByStatus(String status) {
        String sql = "SELECT COUNT(*) FROM certificate_applications WHERE status = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private CertificateApplication mapResultSet(ResultSet rs) throws SQLException {
        CertificateApplication app = new CertificateApplication();
        app.setId(rs.getInt("id"));
        app.setApplicationNo(rs.getString("application_no"));
        app.setStudentId(rs.getInt("student_id"));
        app.setStudentName(rs.getString("student_name"));
        app.setRollNo(rs.getString("roll_no"));
        app.setBranch(rs.getString("branch"));
        app.setEventName(rs.getString("event_name"));
        app.setCategory(rs.getString("category"));
        app.setPosition(rs.getString("position"));
        app.setEventDate(rs.getString("event_date"));
        app.setRegistrationId(rs.getString("registration_id"));
        app.setProofLink(rs.getString("proof_link"));
        app.setStatus(rs.getString("status"));
        app.setAutoMatched(rs.getBoolean("auto_matched"));
        app.setMentorRemarks(rs.getString("mentor_remarks"));
        app.setRejectionReason(rs.getString("rejection_reason"));
        app.setIssuedCertId(rs.getString("issued_cert_id"));
        app.setCreatedAt(rs.getTimestamp("created_at"));
        return app;
    }
}
