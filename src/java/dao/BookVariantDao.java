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
import model.BookVariant;

/**
 *
 * @author Admin
 */
public class BookVariantDAO extends DBContext {

    public BookVariantDAO() {
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
             Logger.getLogger(BookVariantDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
    
   public List<BookVariant> getByBookId(int bookId) {
    List<BookVariant> list = new ArrayList<>();
    String sql = """
        SELECT * FROM BookVariants
        WHERE book_id = ? AND status = 'ACTIVE'
    """;
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, bookId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new BookVariant(
                rs.getInt("variant_id"),
                rs.getInt("book_id"),
                rs.getString("variant_name"),
                rs.getDouble("price"),
                rs.getInt("stock"),
                rs.getString("status")
            ));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
public boolean addVariant(BookVariant v) {
    if (v.getPrice() <= 0 || v.getStock() < 0) return false;

    String sql = """
        INSERT INTO BookVariants (book_id, variant_name, price, stock, status)
        VALUES (?, ?, ?, ?, 'ACTIVE')
    """;
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, v.getBookId());
        ps.setString(2, v.getVariantName());
        ps.setDouble(3, v.getPrice());
        ps.setInt(4, v.getStock());
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

public boolean updateVariant(BookVariant v) {
    String sql = """
        UPDATE BookVariants
        SET variant_name = ?, price = ?, stock = ?, status = ?
        WHERE variant_id = ?
    """;
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, v.getVariantName());
        ps.setDouble(2, v.getPrice());
        ps.setInt(3, v.getStock());
        ps.setString(4, v.getStatus());
        ps.setInt(5, v.getVariantId());
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
public boolean hardDeleteVariant(int variantId) {
    String sql = "DELETE FROM BookVariants WHERE variant_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, variantId);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

 public List<BookVariant> getVariantsByBookId(int bookId) {
        List<BookVariant> list = new ArrayList<>();
        String sql = "SELECT * FROM BookVariants WHERE book_id = ? ORDER BY variant_id ASC";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookVariant v = new BookVariant();
                v.setVariantId(rs.getInt("variant_id"));
                v.setBookId(rs.getInt("book_id"));
                v.setVariantName(rs.getString("variant_name"));
                v.setPrice(rs.getDouble("price"));
                v.setStock(rs.getInt("stock"));
                v.setStatus(rs.getString("status"));
                list.add(v);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
// Kiểm tra variant có trong cart không
public boolean isVariantInAnyCart(int variantId) {
    boolean result = false;
    String sql = "SELECT COUNT(*) FROM CartItems WHERE variant_id = ?";
    try (
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, variantId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            result = rs.getInt(1) > 0;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result;
}
public BookVariant getVariantById(int variantId) {
    String sql = "SELECT * FROM BookVariants WHERE variant_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, variantId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            BookVariant v = new BookVariant();
            v.setVariantId(rs.getInt("variant_id"));
            v.setBookId(rs.getInt("book_id"));
            v.setVariantName(rs.getString("variant_name"));
            v.setPrice(rs.getDouble("price"));
            v.setStock(rs.getInt("stock"));
            v.setStatus(rs.getString("status"));
            return v;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
public boolean updateStatus(int variantId, String status) {
    String sql = "UPDATE BookVariants SET status = ? WHERE variant_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, status);
        ps.setInt(2, variantId);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}


public boolean isVariantInAnyOrder(int variantId) {
    String sql = "SELECT COUNT(*) FROM OrderDetails WHERE variant_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, variantId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

public boolean softDeleteVariant(int variantId) {
    String sql = """
        UPDATE BookVariants
        SET status = 'INACTIVE'
        WHERE variant_id = ?
    """;
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, variantId);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

}
