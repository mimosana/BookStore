/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext{

    public CategoryDAO() {
        super();
    }
    
    public List<Category> getAll(){
        if (conn == null) errcode=-1;

        String sql = "SELECT * FROM Categories";
        List<Category> list=new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
               list.add(category);
            }
            return list;
        } catch (SQLException e) {
            errcode=-2;
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    public Category getCategory(int id){
        if (conn == null) errcode=-1;

        String sql = "SELECT * FROM Categories";
        if(id>0){
            sql+=" where category_id=?";
        }
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            if(id>0){
            ps.setInt(1, id);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
               return category;
            }
        } catch (SQLException e) {
            errcode=-2;
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    public static void main(String[] args) {
        CategoryDAO categoryDAO=new CategoryDAO();
        List<Category> list=categoryDAO.getAll();
        for(Category b:list){
            System.out.println(b);
        }
    }
    
}
