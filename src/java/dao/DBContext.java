/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author luong
 */
public class DBContext {
    Connection conn;
    int errcode; //gán mã lỗi (0: không lỗi, -1: Lỗi kết nối, -2: lỗi sql)
    public DBContext() {
        String dbUser = "sa", dbPass = "123",
        dbUrl = "jdbc:sqlserver://localhost:1433;databaseName=ProjectPRJ;encrypt=true;trustServerCertificate=true";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        } catch (Exception e) {
            conn = null;
        }
    }

    public int getErrcode() {
        return errcode;
    }
    
}
