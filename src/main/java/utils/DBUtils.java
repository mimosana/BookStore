/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DBUtils {
   private static String DB_name = "BookStore";
    private static String DB_Username = "sa";
    private static String DB_Password = "12345";

    public DBUtils() {
    }
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        //đăng kí thư viện cho manager để biết có driver này 
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_name+"; encrypt=true; trustServerCertificate=true";
        conn = DriverManager.getConnection(url, DB_Username, DB_Password);
        return conn;
    }
    
    public static void main(String[] args) {
        try {
            //Vì có thể nó không get Connnection được nên cần try catch
            Connection c = getConnection();
            System.out.println(c);
        } catch (SQLException ex) {
            System.out.println("SQL Error: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
