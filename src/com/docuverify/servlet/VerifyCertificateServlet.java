package com.docuverify.servlet;

import com.docuverify.crypto.CryptoRMI;
import com.docuverify.crypto.CryptoService;
import com.docuverify.dao.CertificateDAO;
import com.docuverify.model.Certificate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

@WebServlet("/verify")
public class VerifyCertificateServlet extends HttpServlet {
    private CertificateDAO certDAO = new CertificateDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null && !id.trim().isEmpty()) {
            Certificate cert = certDAO.getCertificateById(id);
            if (cert != null) {
                if (cert.isRevoked()) {
                    req.setAttribute("status", "REVOKED");
                } else {
                    try {
                        String rawData = cert.getRollNo() + "|" + cert.getStudentName() + "|" + cert.getCourseName() + "|" + cert.getGrade();
                        CryptoService crypto = CryptoRMI.getService();
                        String calculatedHash = crypto != null ? crypto.generateSHA256(rawData) : "";
                        
                        java.util.Map<String, Object> result = new java.util.HashMap<>();
                        req.setAttribute("cert", cert);
                        req.setAttribute("originalHash", cert.getCryptoHash());
                        req.setAttribute("computedHash", calculatedHash);
                        result.put("certificate", cert);
                        result.put("originalHash", cert.getCryptoHash());
                        result.put("computedHash", calculatedHash);

                        if (calculatedHash.equalsIgnoreCase(cert.getCryptoHash())) {
                            req.setAttribute("status", "VERIFIED");
                            result.put("status", "VERIFIED");
                        } else {
                            req.setAttribute("status", "TAMPERED");
                            result.put("status", "TAMPERED");
                        }
                        req.setAttribute("verificationResult", result);
                    } catch (Exception e) {
                        e.printStackTrace();
                        req.setAttribute("error", "Verification service error: " + e.getMessage());
                    }
                }
            } else {
                req.setAttribute("status", "NOT_FOUND");
                java.util.Map<String, Object> result = new java.util.HashMap<>();
                result.put("status", "NOT_FOUND");
                req.setAttribute("verificationResult", result);
            }
        }
        req.getRequestDispatcher("/jsp/certificate/verify.jsp").forward(req, resp);
    }
}
