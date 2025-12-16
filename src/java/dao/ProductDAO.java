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
    public List<Book> filterProduct(String keyword,String variantName,double min,double max,int cateid) {
    List<Book> list = new ArrayList<>();
    String sql = "select B.*,BV.variant_name,BV.price,BV.stock,BV.variant_id "
            + "from Books B join BookVariants BV on B.book_id=BV.book_id "
            + "where 1=1";
     List<Object> param=new ArrayList<>();
    if(keyword!=null&&!keyword.isEmpty()){
        sql+=" and (B.title like ? or B.author like ?)";
        param.add("%"+keyword.trim()+"%");
        param.add("%"+keyword.trim()+"%");
    }
    if(variantName!=null&&!variantName.isEmpty()){
        sql+=" and BV.variant_name like ?";
        param.add("%"+variantName+"%");
        
    }
    if(cateid>0){
        sql+=" and B.category_id =?";
        param.add(cateid);
        
    }
    if(min>0){
        sql+=" and BV.price>=?";
        param.add(min);      
    }
    if(max>0){
        sql+=" and BV.price<=?";
        param.add(max);
    }
    sql += " ORDER BY B.book_id";

    try {
        PreparedStatement ps = conn.prepareStatement(sql);
        for (int i = 0; i < param.size(); i++) {
            ps.setObject(i + 1, param.get(i));
        }
        ResultSet rs = ps.executeQuery();
        Book currentBook = null;
        int lastBookId = -1;

        while (rs.next()) {
            int bookId = rs.getInt("book_id");

            if (bookId != lastBookId) {
                currentBook = new Book();
                currentBook.setBookId(bookId);
                currentBook.setTitle(rs.getString("title"));
                currentBook.setAuthor(rs.getString("author"));
                currentBook.setDescription(rs.getString("description"));
                currentBook.setImage(rs.getString("image"));
                currentBook.setCategoryId(rs.getInt("category_id"));
                currentBook.setListVariant(new ArrayList<>());

                list.add(currentBook);
                lastBookId = bookId;
            }

            BookVariant v = new BookVariant();
            v.setVariantId(rs.getInt("variant_id"));
            v.setBookId(bookId);
            v.setVariantName(rs.getString("variant_name"));
            v.setPrice(rs.getDouble("price"));
            v.setStock(rs.getInt("stock"));

            currentBook.getListVariant().add(v);
        }
    }catch (SQLException e) {
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
        List<Book> list=productDAO.filterProduct("","Bìa mềm", 0, 200000, 3);
        for(Book b:list){
            System.out.println(b);
        }
    }

}
