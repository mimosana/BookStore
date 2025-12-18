/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;
import model.BookVariant;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    public ProductDAO() {
        super();
    }

    public List<Book> getAll() {
    List<Book> list = new ArrayList<>();
    String sql = """
        SELECT *
        FROM Books B
        JOIN BookVariants BV ON B.book_id = BV.book_id
        ORDER BY B.book_id
    """;

    try (PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        Map<Integer, Book> map = new LinkedHashMap<>();

        while (rs.next()) {
            int bookId = rs.getInt("book_id");

            Book book = map.get(bookId);
            if (book == null) {
                book = new Book();
                book.setBookId(bookId);
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setDescription(rs.getString("description"));
                book.setImage(rs.getString("image"));
                book.setCategoryId(rs.getInt("category_id"));
                book.setListVariant(new ArrayList<>());

                map.put(bookId, book);
            }

            BookVariant variant = new BookVariant();
            variant.setVariantId(rs.getInt("variant_id"));
            variant.setBookId(bookId);
            variant.setVariantName(rs.getString("variant_name"));
            variant.setPrice(rs.getDouble("price"));
            variant.setStock(rs.getInt("stock"));

            book.getListVariant().add(variant);
        }

        list.addAll(map.values());
        return list;

    } catch (SQLException e) {
        errcode = -2;
        Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
    }

    return list;
}
    public List<Book> filterProduct(String variantName,float min,float max,int cateid) {
    List<Book> list = new ArrayList<>();
    String sql = "select B.*,BV.variant_name,BV.price,BV.stock from Books B join BookVariants BV on B.book_id=BV.book_id \n" +
"     join Categories C on B.category_id=C.category_id and C.category_id=?\n" +
"where (BV.price between ? and ?) and (BV.variant_name=?)";

    try {
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, cateid);
        ps.setFloat(2, min);
        ps.setFloat(3, max);
        ps.setString(4, variantName);
         ResultSet rs = ps.executeQuery();
        Map<Integer, Book> map = new LinkedHashMap<>();

        while (rs.next()) {
            int bookId = rs.getInt("book_id");

            Book book = map.get(bookId);
            if (book == null) {
                book = new Book();
                book.setBookId(bookId);
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setDescription(rs.getString("description"));
                book.setImage(rs.getString("image"));
                book.setCategoryId(rs.getInt("category_id"));
                book.setListVariant(new ArrayList<>());

                map.put(bookId, book);
            }

            BookVariant variant = new BookVariant();
            variant.setVariantId(rs.getInt("variant_id"));
            variant.setBookId(bookId);
            variant.setVariantName(rs.getString("variant_name"));
            variant.setPrice(rs.getDouble("price"));
            variant.setStock(rs.getInt("stock"));

            book.getListVariant().add(variant);
        }

        list.addAll(map.values());
        return list;

    } catch (SQLException e) {
        errcode = -2;
        Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
    }

    return list;
}
    //Lấy book theo phân trang
    public List<Book> getBookByPaging(int start,List<Book> list,int end){
        List<Book> listB=new ArrayList<>();
        for(int i=start;i<end;i++){
            listB.add(list.get(i));
        }
        return listB;
    }

    public static void main(String[] args) {
        ProductDAO productDAO=new ProductDAO();
        List<Book> list=productDAO.filterProduct("Bìa mềm", 0, 200000, 3);
        for(Book b:list){
            System.out.println(b);
        }
    }

}
