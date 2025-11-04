/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Author;
import entity.Book;
import entity.BookVariants;
import entity.Publisher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class BookDAO implements IDAO<Book, String> {

    @Override
    public boolean create(Book entity) {
        String sql = "Insert into Book"
                + "values(?,?,?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setNString(1, entity.getName());
            ps.setInt(2, entity.getPublishYear());
            ps.setString(3, entity.getImage());
            ps.setString(4, entity.getStatus());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {
            System.err.println("SQL error while fetching ratings for newest book ");
            return false;
        }
    }

    @Override
    public List<Book> readAll() {
        String sql = "Select * from Book";
        try {
            List<Book> list = new ArrayList<>();
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt("id"), rs.getNString("name"), rs.getInt("publishYear"), rs.getString("image"), rs.getString("description"), rs.getString("status")));
            }
            return list;
        } catch (Exception e) {
            System.err.println("SQL error while fetching ratings for newest book ");
            return new ArrayList<>();
        }
    }

    @Override
    public Book readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Book readById(int id) {
        String sql = "SELECT b.id as bId, b.name as bName, b.publishYear, b.image, b.description, b.status, "
                + "       b.authorId, b.publisherId, "
                + // Lấy cả ID để gán
                "       a.name as authorName, p.name as pName "
                + "FROM Book b "
                + "JOIN Author a ON b.authorId = a.id "
                + "JOIN Publisher p ON b.publisherId = p.id "
                + "WHERE b.id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Book book = new Book(rs.getInt("bId"), rs.getString("bName"), rs.getInt("publishYear"), rs.getString("image"), rs.getString("description"), rs.getString("status"));
                Publisher publisher = new Publisher();
                Author author = new Author();
                publisher.setPublisherId(rs.getInt("publisherId"));
                publisher.setName(rs.getString("pName"));
                book.setPublisher(publisher);
                author.setAuthorId(rs.getInt("authorId"));
                author.setName(rs.getString("authorName"));
                book.setAuthor(author);
                return book;

            }

            return new Book();
        } catch (Exception e) {
            System.err.println("SQL error while fetching ratings for newest book ");
            return new Book();
        }
    }

    @Override
    public boolean update(Book entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    //Search sách 
    public List<Book> search(String searchTerm) {
        String sql = "Select * from Book where id =";
        try {
            List<Book> list = new ArrayList<>();
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, searchTerm);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt("id"), rs.getNString("name"), rs.getInt("publishYear"), rs.getString("image"), rs.getString("description"), rs.getString("status")));
            }
            return list;
        } catch (Exception ex) {
            System.err.println("SQL error while fetching ratings for newest book ");
            return new ArrayList<>();
        }
    }

    //Tính ra 6 sản phẩm có số lượt mua cao
    public List<Book> bookBestSeller() {
        String sql
                = "SELECT "
                + "  bo.*, b.id AS bookVariant, b.price "
                + "FROM ( "
                + "  SELECT od.bookVarId, COUNT(o.userId) AS NumberOfBuyers "
                + "  FROM Orders o "
                + "  JOIN OrderDetail od ON o.id = od.orderId "
                + "  WHERE o.status = 'Delivered' "
                + "  GROUP BY od.bookVarId "
                + ") A "
                + "JOIN BookVariants b ON A.bookVarId = b.id "
                + "JOIN Book bo ON bo.id = b.bookId "
                + "ORDER BY A.NumberOfBuyers DESC";
        List<Book> list = new ArrayList<>();
        Map<Integer, Book> bookMap = new HashMap<>();

        try (Connection conn = DBUtils.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int currentId = rs.getInt("id");

                // Kiểm tra book đã có trong map chưa
                Book book = bookMap.get(currentId);
                if (book == null) {
                    book = new Book(
                            rs.getInt("id"),
                            rs.getNString("name"),
                            rs.getInt("publishYear"),
                            rs.getString("image"),
                            rs.getString("description"),
                            rs.getString("status")
                    );
                    book.setVariants(new ArrayList<>());
                    bookMap.put(currentId, book);
                }

                // Tạo variant
                BookVariants bookVar = new BookVariants();
                bookVar.setBookId(currentId);
                bookVar.setBookVarId(rs.getInt("bookVariant"));
                bookVar.setPrice(rs.getBigDecimal("price"));
                book.getVariants().add(bookVar);
            }

            list.addAll(bookMap.values());
            return list;
        } catch (Exception e) {
            System.err.println("SQL error while fetching ratings for bestseller book ");
            return new ArrayList<>();
        }
    }

    // Đổi tên hàm để rõ nghĩa hơn và thêm tham số
    public List<Book> findNewestBooks(int numberOfBooks) {

        // Câu SQL đã sửa (dùng cú pháp SQL Server làm ví dụ)
        // Nó sử dụng PreparedStatement, vì vậy chúng ta dùng '?' cho an toàn
        String sql = "select b.*, bv.id AS bookVariant, bv.price\n"
                + "from Book b join BookVariants bv on b.id=bv.bookId\n"
                + "where b.id IN (\n"
                + "    select distinct TOP (?) id from Book order by id desc\n" // Dùng '?'
                + ")\n"
                + "order by b.id desc";

        List<Book> list = new ArrayList<>();
        Map<Integer, Book> bookMap = new HashMap<>();

        // Sửa lại try-with-resources để gán tham số '?'
        try (Connection conn = DBUtils.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, numberOfBooks);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int currentId = rs.getInt("id");

                    // Kiểm tra book đã có trong map chưa
                    Book book = bookMap.get(currentId);
                    if (book == null) {
                        book = new Book(
                                rs.getInt("id"),
                                rs.getNString("name"),
                                rs.getInt("publishYear"),
                                rs.getString("image"),
                                rs.getString("description"),
                                rs.getString("status")
                        );
                        book.setVariants(new ArrayList<>()); // Đảm bảo đã sửa getter/setter thành getVariants()
                        bookMap.put(currentId, book);
                    }

                    // Tạo variant
                    BookVariants bookVar = new BookVariants();
                    bookVar.setBookId(currentId);
                    bookVar.setBookVarId(rs.getInt("bookVariant"));
                    bookVar.setPrice(rs.getBigDecimal("price"));

                    book.getVariants().add(bookVar);
                }
            }

            list.addAll(bookMap.values());
            return list;

        } catch (Exception e) {
            System.err.println("SQL error while fetching ratings for newest book ");
            return new ArrayList<>();
        }

    }

    //dem trong database có bao nhieu account
    public int getTotalBook() {
        String sql = "select count(*) from Book";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.err.println("SQL error while fetching ratings for newest book ");
        }
        return 0;
    }

    public List<Book> pagingBook(int index) {
        List<Book> list = new ArrayList<>();
        String sql = "select *\n"
                + "from Book\n"
                + "order by id\n"
                + "offset ? rows fetch next 12 row only";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, (index-1)*12);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getInt("id"), rs.getNString("name"), rs.getInt("publishYear"), rs.getString("image"), rs.getString("description"), rs.getString("status")));
            }
            return list;
        } catch (Exception e) {
            System.err.println("SQL error while fetching ratings for newest book ");
            return new ArrayList<>();
        }    
    }

    public static void main(String[] args) {
        BookDAO book = new BookDAO();
        System.out.println(book.getTotalBook());
       List<Book> list=book.pagingBook(1);
       for(Book b:list){
           System.out.println(b);
       }
    }

}
