/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Publisher;
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
public class PublisherDAO implements IDAO<Publisher, String> {

    @Override
    public boolean create(Publisher entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Publisher> readAll() {
        String sql="Select * from Publisher";
        List<Publisher> list=new ArrayList<>();
        try(Connection conn=DBUtils.getConnection();
                PreparedStatement ps=conn.prepareStatement(sql);
                ResultSet rs=ps.executeQuery();){
            while(rs.next()){
                list.add(new Publisher(rs.getInt("id"),rs.getString("name")));
            }
            return list;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Data driver not found");
            return new ArrayList<>();
        } catch (SQLException ex) {
            Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL error while fetching data");
            return new ArrayList<>();
        }
    }

    @Override
    public Publisher readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean update(Publisher entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Publisher> search(String searchTerm) {
        String sql="Select * from name ?";
        List<Publisher> list=new ArrayList<>();
        try(Connection conn=DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);) {
            ps.setString(1, "like"+searchTerm);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
                list.add(new Publisher(rs.getInt("id"),rs.getString("name")));
            }
            return list;
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("Database driver not found");
            return new ArrayList<>();
        } catch (SQLException ex) {
            Logger.getLogger(PublisherDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQl error while fetching data");
            return new ArrayList<>();
        }
    }
    
}
