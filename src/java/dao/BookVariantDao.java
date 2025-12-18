/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;
import model.BookVariant;
import model.User;

/**
 *
 * @author Admin
 */
public class BookVariantDao extends DBContext {

    public BookVariantDao() {
        super();
    }

    public ArrayList<BookVariant> getVariantName() {
        ArrayList<BookVariant> list = new ArrayList<>();
        String sql = "select distinct variant_name\n"
                + "from BookVariants";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookVariant variants = new BookVariant();
                variants.setVariantName(rs.getString("variant_name"));
                list.add(variants);
            }
        } catch (SQLException e) {
            errcode = -2;
             Logger.getLogger(BookVariantDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public ArrayList<BookVariant> getVariants() {
        ArrayList<BookVariant> list = new ArrayList<>();
        String sql = "select * from BookVariants";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookVariant variants = new BookVariant();
                variants.setVariantId(rs.getInt("variant_id"));
                variants.setBookId(rs.getInt("book_id"));
                variants.setVariantName(rs.getString("variant_name"));
                variants.setPrice(rs.getFloat("price"));
                variants.setStock(rs.getInt("stock"));
                list.add(variants);
            }
        } catch (SQLException e) {
            errcode = -2;
             Logger.getLogger(BookVariantDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
    public int getQuantity(int variantid){
        String sql = "select stock from BookVariants where variant_id=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, variantid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                 return rs.getInt("stock");
            }
        } catch (SQLException e) {
            errcode = -2;
             Logger.getLogger(BookVariantDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return -1;//không có quantity trong kho
    }
    public boolean isVariant(int variantid){
        String sql = "select * from BookVariants where variant_id=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, variantid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                 return true;
            }
        } catch (SQLException e) {
            errcode = -2;
             Logger.getLogger(BookVariantDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    public BookVariant getVariant(int variantid){
        String sql = "select * from BookVariants where variant_id=?";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, variantid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                 BookVariant variants = new BookVariant();
                variants.setVariantId(rs.getInt("variant_id"));
                variants.setBookId(rs.getInt("book_id"));
                variants.setVariantName(rs.getString("variant_name"));
                variants.setPrice(rs.getFloat("price"));
                variants.setStock(rs.getInt("stock"));
                return variants;
            }
        } catch (SQLException e) {
            errcode = -2;
             Logger.getLogger(BookVariantDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    public boolean updateQuantity(int variantId,int quantity){
        String sql="Update from BookVariants"
                + "set quantity=?"
                + "where variant_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, variantId);
            int n = ps.executeUpdate();
            return n>0;
            
        } catch (SQLException e) {
            errcode = -2;
             Logger.getLogger(BookVariantDao.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
    public static void main(String[] args) {
        BookVariantDao variantDao=new BookVariantDao();
        BookVariant variant2=variantDao.getVariant(6);
        System.out.println(variant2);
        ArrayList<BookVariant> list=variantDao.getVariantName();
        for(BookVariant b:list){
            System.out.println(b);
        }
        
    }

}
