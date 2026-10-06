package com.docuverify.crypto;

import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CryptoRMI extends UnicastRemoteObject implements CryptoService {
    
    protected CryptoRMI() throws RemoteException {
        super();
    }

    @Override
    public String generateSHA256(String data) throws RemoteException {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(data.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RemoteException("SHA-256 algorithm not found", e);
        }
    }

    private static CryptoService instance;

    public static synchronized CryptoService getService() {
        if (instance != null) {
            return instance;
        }
        try {
            Registry registry = LocateRegistry.getRegistry("localhost", 1099);
            instance = (CryptoService) registry.lookup("DocuVerifyCrypto");
            return instance;
        } catch (Exception e) {
            try {
                CryptoRMI service = new CryptoRMI();
                Registry registry;
                try {
                    registry = LocateRegistry.createRegistry(1099);
                } catch (Exception re) {
                    registry = LocateRegistry.getRegistry(1099);
                }
                registry.rebind("DocuVerifyCrypto", service);
                System.out.println("CryptoRMI service auto-started on port 1099.");
                instance = service;
                return instance;
            } catch (Exception ex) {
                try {
                    instance = new CryptoRMI();
                    return instance;
                } catch (RemoteException exc) {
                    return null;
                }
            }
        }
    }

    public static void startRMIService() {
        getService();
    }
}
