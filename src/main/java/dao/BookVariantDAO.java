/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.BookDTO;
import dto.BookVariantsDTO;
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
public class BookVariantDAO implements IDAO<BookVariantsDTO, String> {

    @Override
    public boolean create(BookVariantsDTO entity) {
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
    public List<BookVariantsDTO> readAll() {
        String sql = "Select * from BookVariants";

        try {
            List<BookVariantsDTO> list = new ArrayList<>();
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BookVariantsDTO(rs.getInt("id"), rs.getString("edition"), rs.getString("language"), rs.getInt("bookId"), rs.getBigDecimal("price"), rs.getInt("stock")));
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
    public BookVariantsDTO readById(String id) {
        return null;
    }

    public static BookVariantsDTO readById(int id) {
        String sql = "select b.id as bId,bv.id as bvId,p.name as pName,a.name as aName,b.image,\n"
                + "     b.name as bName,b.publishYear,b.description,b.image,bv.language,\n"
                + "	 bv.price,bv.stock,bv.edition,b.publisherId,b.status\n"
                + "from BookVariants bv join Book b on bv.bookId=b.id\n"
                + "     join Publisher p on b.publisherId=p.id\n"
                + "	 join BookAuthor ba on b.id=ba.bookId\n"
                + "	 join Author a  on ba.authorId=a.id\n"
                + "where b.id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BookDTO book=new BookDTO(rs.getInt("bId"), rs.getString("bName"), rs.getInt("publishYear"),rs.getString("image"), rs.getString("description"),rs.getString("status"));
                return new BookVariantsDTO(rs.getInt("bvId"), rs.getString("edition"), rs.getString("language"), rs.getInt("bId"), rs.getBigDecimal("price"), rs.getInt("stock"), book);
            }
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookVariantDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookVariantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(BookVariantsDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<BookVariantsDTO> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody

    }

    public List<BookVariantsDTO> searchByBookId(int searchTerm) {
        String sql = "Select * from BookVariants where bookId = ?";

        try {
            List<BookVariantsDTO> list = new ArrayList<>();
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, searchTerm);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new BookVariantsDTO(rs.getInt("id"), rs.getString("edition"), rs.getString("language"), rs.getInt("bookId"), rs.getBigDecimal("price"), rs.getInt("stock")));
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
        List<BookVariantsDTO> list = bvDao.searchByBookId(2);
        for (BookVariantsDTO b : list) {
            System.out.println(b);
        }
        System.out.println();
        BookVariantsDTO book = bvDao.readById(2);
        System.out.println(book);

    }

}
