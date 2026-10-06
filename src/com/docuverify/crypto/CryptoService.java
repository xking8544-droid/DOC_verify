package com.docuverify.crypto;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface CryptoService extends Remote {
    String generateSHA256(String data) throws RemoteException;
}
