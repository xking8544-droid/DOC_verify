package com.docuverify.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DBConnection utility
 */
public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/docuverify_db";
    private static final String USER = "root";
    private static final String PASSWORD = "amit";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
