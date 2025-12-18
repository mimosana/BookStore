/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.util.List;
import model.CartItem;
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
public class CartDAO extends DBContext {
    private BookVariantDao variantDao=new BookVariantDao();
    public CartDAO() {
        super();
    }

    public List<CartItem> getCartByUserId(int userId) {
        String sql = "select * \n"
                + "from Cart c join BookVariants bv on c.variant_id=bv.variant_id\n"
                + "join Books b on b.book_id=bv.book_id\n"
                + "where c.user_id=?";

        List<CartItem> listC = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                CartItem cart = new CartItem();
                cart.setUserId(rs.getInt("user_id"));
                cart.setQuantity(rs.getInt("quantity"));

                BookVariant variant = new BookVariant();
                variant.setVariantId(rs.getInt("variant_id"));
                variant.setBookId(rs.getInt("book_id"));
                variant.setVariantName(rs.getString("variant_name"));
                variant.setPrice(rs.getDouble("price"));
                variant.setStock(rs.getInt("stock"));
                
                
                Book book = new Book();
                book.setBookId(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setDescription(rs.getString("description"));
                book.setImage(rs.getString("image"));
                book.setCategoryId(rs.getInt("category_id"));
                variant.setBook(book);
                cart.setVariant(variant);    
                listC.add(cart);
            }

        } catch (SQLException ex) {
            errcode = -2;
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listC;
    }

    //Cập nhật sản phẩm 
    public boolean updateQuanitty(int userId, int varaintid, int quantity) {
        String sql = "update Cart\n"
                + "set quantity= quantity + ?\n"
                + "where user_id=? and variant_id=?";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, userId);
            ps.setInt(3, varaintid);
            int rs = ps.executeUpdate();
            return rs>0;

        } catch (SQLException ex) {
            errcode = -2;
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //xóa sản phẩm ra khoỉ cart
    //Cập nhật sản phẩm 
    public boolean deletelItem(int userId,int variantid) {
        String sql = "delete from Cart\n"
                + "where user_id=? and variant_id=?";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setInt(1, userId);
            ps.setInt(2, variantid);
            int rs = ps.executeUpdate();
            return rs>0;

        } catch (SQLException ex) {
            errcode = -2;
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deletelCart(int userId) {
        String sql = "delete from Cart where user_id=?";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setInt(1, userId);
            int rs = ps.executeUpdate();
            return true;

        } catch (SQLException ex) {
            errcode = -2;
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //thêm sản phẩm vào trong giỏ 
    public boolean insertItem(int userId, int varaintid, int quantity) {
        String sql = "Insert into Cart(user_id,variant_id,quantity)"
                + "values(?,?,?)";

        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setInt(1, userId);
            ps.setInt(2, varaintid);
            ps.setInt(3, quantity);
            int rs = ps.executeUpdate();
            return true;

        } catch (SQLException ex) {
            errcode = -2;
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean isVarientInCart(int variantid,int userId) {
        String sql = "select * \n"
                + "from Cart where variant_id=? and user_id =?";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setInt(1, variantid);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            errcode = -2;
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public int getQuantityOfVariant(int variantid,int userId) {
        String sql = "select quantity \n"
                + "from Cart where variant_id=? and user_id=?";
        try {
            PreparedStatement ps = conn.prepareCall(sql);
            ps.setInt(1, variantid);
            ps.setInt(2, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("quantity");
            }

        } catch (SQLException ex) {
            errcode = -2;
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public boolean addOrUpdateItem(int userId, int varaintid, int quantity) {
        if(isVarientInCart(varaintid,userId)){
            int newquantity=quantity+getQuantityOfVariant(varaintid,userId);
            if(newquantity<=variantDao.getVariant(varaintid).getStock()){
            updateQuanitty(userId, varaintid, quantity);
            return true;
            }
        }else{
            BookVariant variant=variantDao.getVariant(varaintid);
            if(variant!=null){
                if(quantity<=variant.getStock()){
                insertItem(userId, varaintid, quantity);
                return true;
                }
            }
        }
        return false;
    }

    
}
