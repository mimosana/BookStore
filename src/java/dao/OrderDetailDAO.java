/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.OrderDetail;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;
import model.BookVariant;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO extends DBContext {

    public OrderDetailDAO() {
        super();
    }

    public List<OrderDetail> getOrderDetail(int orderId) {
        List<OrderDetail> list=new ArrayList<>();
        String sql = "Select * from OrderDetails od\n"
                + "join BookVariants bv on od.variant_id=bv.variant_id\n"
                + "join Books b on bv.book_id=b.book_id\n"
                + "where order_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setOrderId(rs.getInt("order_id"));
                detail.setVariantId(rs.getInt("variant_id"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setPrice(rs.getDouble("price"));

                BookVariant variants = new BookVariant();
                variants.setVariantId(rs.getInt("variant_id"));
                variants.setBookId(rs.getInt("book_id"));
                variants.setVariantName(rs.getString("variant_name"));
                variants.setPrice(rs.getFloat("price"));
                variants.setStock(rs.getInt("stock"));

                Book book = new Book();
                book.setBookId(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setDescription(rs.getString("description"));
                book.setImage(rs.getString("image"));
                book.setCategoryId(rs.getInt("category_id"));
                
                variants.setBook(book);
                detail.setVaraint(variants);
                list.add(detail);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }
    public static void main(String[] args) {
        OrderDetailDAO orderDetailDAO=new OrderDetailDAO();
        List<OrderDetail> order=orderDetailDAO.getOrderDetail(1);
        for(OrderDetail o:order){
            System.out.println(o);
        }
        
    }
}
