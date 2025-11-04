/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class UserDAO implements IDAO<User, String>{

    @Override
    public boolean create(User entity) {
        String sql="Insert into Users(userName,firstName,lastName, address,email, password)"
                + "values(?,?,?,?,?,?)";
        try {
            Connection conn=DBUtils.getConnection();
            PreparedStatement ps= conn.prepareStatement(sql);
            
            ps.setString(1, entity.getUserName());
            ps.setString(2, entity.getFirstName());
            ps.setString(3, entity.getLastName());
            ps.setString(4, entity.getAddress());
            ps.setString(5, entity.getEmail());
            ps.setString(6, entity.getPassword());
            int n=ps.executeUpdate();
            return n>0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }

    @Override
    public List<User> readAll() {
        String sql="Select * from Users";
        try {
            List<User> list=new ArrayList<>();
            Connection conn=DBUtils.getConnection();
            PreparedStatement ps=conn.prepareCall(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                User user= new User(rs.getInt("id"), rs.getNString("userName"), rs.getNString("firstName"), rs.getString("lastName"), rs.getString("address"), rs.getString("email"), rs.getString("role"),rs.getString("status"),rs.getString("password"));
                list.add(user);
            }
            return list;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public User readById(String id) {
        String sql="Select * from Users where userId=?";
        try {
            Connection conn=DBUtils.getConnection();
            PreparedStatement ps= conn.prepareCall(sql);
            ps.setString(1, id);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
               return new User(rs.getInt("id"), rs.getNString("userName"), rs.getNString("firstName"), rs.getString("lastName"), rs.getString("address"), rs.getString("email"), rs.getString("role"),rs.getString("status"),rs.getString("password"));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public User findByUser(String username) {
        String sql="Select * from Users where userName=?";
        try {
            Connection conn=DBUtils.getConnection();
            PreparedStatement ps= conn.prepareCall(sql);
            ps.setString(1, username);
           
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return new User(rs.getInt("id"), rs.getNString("userName"), rs.getNString("firstName"), rs.getString("lastName"), rs.getString("address"), rs.getString("email"), rs.getString("role"),rs.getString("status"),rs.getString("password"));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public User findByEmail(String email) {
        String sql="Select * from Users where email=?";
        try {
            Connection conn=DBUtils.getConnection();
            PreparedStatement ps= conn.prepareCall(sql);
            ps.setString(1, email);
           
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return new User(rs.getInt("id"), rs.getNString("userName"), rs.getNString("firstName"), rs.getString("lastName"), rs.getString("address"), rs.getString("email"), rs.getString("role"),rs.getString("status"),rs.getString("password"));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(User entity) {
        String sql="Update Users set userName=?,firstName=?,lastName=?,address=?,email=?,role=?,password=?,status=?"
                + "where userId=?";
        try {
            Connection conn=DBUtils.getConnection();
            PreparedStatement ps=conn.prepareCall(sql);
            ps.setString(1, entity.getUserName());
            ps.setString(2, entity.getFirstName());
            ps.setString(3, entity.getLastName());
            ps.setString(4, entity.getAddress());
            ps.setString(5, entity.getEmail());
            ps.setString(6, entity.getRole());
            ps.setString(7, entity.getPassword());
            ps.setString(8, entity.getIsActive());
            ps.setInt(9, entity.getUserId());
            int n=ps.executeUpdate();
            return n>0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        String sql="Delete from Users where userId=?";
        try {
            Connection conn=DBUtils.getConnection();
            PreparedStatement ps=conn.prepareCall(sql);
            ps.setString(1, id);
            int n=ps.executeUpdate();
            return n>0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<User> search(String searchTerm) {
        String sql="Select * from Users"
                + "where userName=?"
                + "or firstName=?"
                + "or lastName=?"
                + "or address=?"
                + "or role=?"
                + "or isActive=?";
        try {
            List<User> list=new ArrayList<>();
            String searchPattern="%"+searchTerm+"%";
            Connection conn=DBUtils.getConnection();
            PreparedStatement ps=conn.prepareCall(sql);
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);
            ps.setString(4, searchPattern);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                User user= new User(rs.getInt("id"), rs.getNString("userName"), rs.getNString("firstName"), rs.getString("lastName"), rs.getString("address"), rs.getString("email"), rs.getString("role"),rs.getString("status"),rs.getString("password"));
                list.add(user);
            }
            return list;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
                
    }
    public static void main(String[] args) {
        UserDAO userDAO=new UserDAO();
        List<User> list =userDAO.readAll();
        User user=userDAO.findByUser("ngocanh");
        System.out.println(user);
//        for(User user:list){
//            System.out.println(user);
//        }
        
    }
   
    
    
}
