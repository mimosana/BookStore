/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author luong
 */
public class UserDAO extends DBContext {
    
     public UserDAO() {
        super(); // kết nối DB
    }

    public User login(String username, String password) {
        if (conn == null) return null;

        String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setPhone(rs.getString("phone"));
                u.setCity(rs.getString("city"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

        // REGISTER
    public boolean register(User u) {
        String sql = """
            INSERT INTO Users(username, password, full_name, email, role)
            VALUES (?, ?, ?, ?, 'CUSTOMER')
        """;

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullName());
            ps.setString(4, u.getEmail());

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

        public boolean checkUsernameExist(String username) {
        String sql = "SELECT user_id FROM Users WHERE username=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // có dữ liệu -> tồn tại
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    
    public ArrayList<User> getAll() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Users";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

   
    public boolean insert(User u) {
        String sql = "INSERT INTO Users(username,password,full_name,email,role) VALUES(?,?,?,?,?)";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullName());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getRole()); // CUSTOMER / ADMIN

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
     }
