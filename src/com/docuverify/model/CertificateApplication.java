package com.docuverify.model;

import java.sql.Timestamp;

/**
 * CertificateApplication model for student event certificate requests
 */
public class CertificateApplication {
    private int id;
    private String applicationNo;
    private int studentId;
    private String studentName;
    private String rollNo;
    private String branch;
    private String eventName;
    private String category;
    private String position;
    private String eventDate;
    private String registrationId;
    private String proofLink;
    private String status; // pending, verified_by_mentor, approved, rejected
    private boolean autoMatched;
    private String mentorRemarks;
    private String rejectionReason;
    private String issuedCertId;
    private Timestamp createdAt;

    public CertificateApplication() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getApplicationNo() { return applicationNo; }
    public void setApplicationNo(String applicationNo) { this.applicationNo = applicationNo; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getRollNo() { return rollNo; }
    public void setRollNo(String rollNo) { this.rollNo = rollNo; }

    public String getBranch() { return branch; }
    public void setBranch(String branch) { this.branch = branch; }

    public String getEventName() { return eventName; }
    public void setEventName(String eventName) { this.eventName = eventName; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }

    public String getEventDate() { return eventDate; }
    public void setEventDate(String eventDate) { this.eventDate = eventDate; }

    public String getRegistrationId() { return registrationId; }
    public void setRegistrationId(String registrationId) { this.registrationId = registrationId; }

    public String getProofLink() { return proofLink; }
    public void setProofLink(String proofLink) { this.proofLink = proofLink; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public boolean isAutoMatched() { return autoMatched; }
    public void setAutoMatched(boolean autoMatched) { this.autoMatched = autoMatched; }

    public String getMentorRemarks() { return mentorRemarks; }
    public void setMentorRemarks(String mentorRemarks) { this.mentorRemarks = mentorRemarks; }

    public String getRejectionReason() { return rejectionReason; }
    public void setRejectionReason(String rejectionReason) { this.rejectionReason = rejectionReason; }

    public String getIssuedCertId() { return issuedCertId; }
    public void setIssuedCertId(String issuedCertId) { this.issuedCertId = issuedCertId; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
