/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Book;
import entity.BookVariants;
import jakarta.enterprise.concurrent.Asynchronous;
import java.math.BigDecimal;
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
public class BookVariantDAO implements IDAO<BookVariants, String> {

    @Override
    public boolean create(BookVariants entity) {
        String sql = "Insert into BookVariants"
                + "values(?,?,?,?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setNString(1, entity.getEdition());
            ps.setString(2, entity.getLanguage());
            ps.setInt(3, entity.getBookId());
            ps.setBigDecimal(4, entity.getPrice());
            ps.setInt(5, entity.getStock());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<BookVariants> readAll() {
        String sql = "Select * from BookVariants";

        try {
            List<BookVariants> list = new ArrayList<>();
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BookVariants(rs.getInt("id"), rs.getString("edition"), rs.getString("language"), rs.getInt("bookId"), rs.getBigDecimal("price"), rs.getInt("stock")));
            }
            return list;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public BookVariants readById(String id) {
        return null;
    }

    public List<BookVariants> readById(int id) {
        String sql = "select bv.id,bv.language,bv.price,bv.stock,bv.edition\n"
                + "from Book b join BookVariants bv on b.id=bv.bookId\n"
                + "where b.id=?";
        List<BookVariants> list= new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                
                list.add(new BookVariants(rs.getInt("id"), rs.getString("edition"), rs.getString("language"), id, rs.getBigDecimal("price"), rs.getInt("stock")));
            }
            return list;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookVariantDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookVariantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public boolean update(BookVariants entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<BookVariants> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody

    }

    public List<BookVariants> searchByBookId(int searchTerm) {
        String sql = "Select * from BookVariants where bookId = ?";

        try {
            List<BookVariants> list = new ArrayList<>();
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, searchTerm);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new BookVariants(rs.getInt("id"), rs.getString("edition"), rs.getString("language"), rs.getInt("bookId"), rs.getBigDecimal("price"), rs.getInt("stock")));
            }
            return list;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        BookVariantDAO bvDao = new BookVariantDAO();
//        List<BookVariantsDTO> list = bvDao.searchByBookId(2);
//        for (BookVariants b : list) {
//            System.out.println(b);
//        }
        System.out.println();
        List<BookVariants> book = bvDao.readById(2);
        for (BookVariants b : book) {
            System.out.println(b);
        }

    }

}
