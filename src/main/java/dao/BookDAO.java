/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.AuthorDTO;
import dto.BookDTO;
import dto.BookVariantsDTO;
import dto.PublisherDTO;
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
public class BookDAO implements IDAO<BookDTO, String> {

    @Override
    public boolean create(BookDTO entity) {
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<BookDTO> readAll() {
        String sql = "Select * from Book";
        try {
            List<BookDTO> list = new ArrayList<>();
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BookDTO(rs.getInt("id"), rs.getNString("name"), rs.getInt("publishYear"), rs.getString("image"), rs.getString("description"), rs.getString("status")));
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
    public BookDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static BookDTO readById(int id) {
        String sql = "select b.id as bId, b.name as bName, b.publishYear, b.image, b.status, b.description,\n"
                + "       a.id as authorId, a.name as authorName,\n"
                + "       p.id as publisherId, p.name as pName,\n"
                + "       bv.id as bvId, bv.edition, bv.language, bv.price, bv.stock\n"
                + "from Book b \n"
                + "join Publisher p on b.publisherId = p.id\n"
                + "join Author a on a.id = b.authorId\n"
                + "left join BookVariants bv on b.id = bv.bookId\n" // Dùng LEFT JOIN
                + "where b.id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            BookDTO book = null;
            while (rs.next()) {
                if (book == null) {
                    book = new BookDTO(rs.getInt("bId"), rs.getString("bName"), rs.getInt("publishYear"), rs.getString("image"), rs.getString("description"), rs.getString("status"));
                    PublisherDTO publisher = new PublisherDTO();
                    AuthorDTO author = new AuthorDTO();
                    publisher.setPublisherId(rs.getInt("publisherId"));
                    publisher.setName(rs.getString("pName"));
                    book.setPublisher(publisher);
                    author.setAuthorId(rs.getInt("authorId"));
                    author.setName(rs.getString("authorName"));
                    book.getAuthour();
                    book.setVariants(new ArrayList<>());
                }

                // Tạo variant
                BookVariantsDTO bookVar = new BookVariantsDTO(rs.getInt("bvId"), rs.getString("edition"), rs.getString("language"), rs.getInt("bId"), rs.getBigDecimal("price"), rs.getInt("stock"), book);
                book.getVariants().add(bookVar);
            }

            return book;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean update(BookDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    //Search sách 
    public List<BookDTO> search(String searchTerm) {
        String sql = "Select * from Book where id =";
        try {
            List<BookDTO> list = new ArrayList<>();
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, searchTerm);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BookDTO(rs.getInt("id"), rs.getNString("name"), rs.getInt("publishYear"), rs.getString("image"), rs.getString("description"), rs.getString("status")));
            }
            return list;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //Tính ra 6 sản phẩm có số lượt mua cao
    public static List<BookDTO> bookBestSeller() {
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
        List<BookDTO> list = new ArrayList<>();
        Map<Integer, BookDTO> bookMap = new HashMap<>();

        try (Connection conn = DBUtils.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int currentId = rs.getInt("id");

                // Kiểm tra book đã có trong map chưa
                BookDTO book = bookMap.get(currentId);
                if (book == null) {
                    book = new BookDTO(
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
                BookVariantsDTO bookVar = new BookVariantsDTO();
                bookVar.setBookId(currentId);
                bookVar.setBookVarId(rs.getInt("bookVariant"));
                bookVar.setPrice(rs.getBigDecimal("price"));
                book.getVariants().add(bookVar);
            }

            list.addAll(bookMap.values());
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ArrayList<>();
    }

    // Đổi tên hàm để rõ nghĩa hơn và thêm tham số
    public static List<BookDTO> findNewestBooks(int numberOfBooks) {

        // Câu SQL đã sửa (dùng cú pháp SQL Server làm ví dụ)
        // Nó sử dụng PreparedStatement, vì vậy chúng ta dùng '?' cho an toàn
        String sql = "select b.*, bv.id AS bookVariant, bv.price\n"
                + "from Book b join BookVariants bv on b.id=bv.bookId\n"
                + "where b.id IN (\n"
                + "    select distinct TOP (?) id from Book order by id desc\n" // Dùng '?'
                + ")\n"
                + "order by b.id desc";

        List<BookDTO> list = new ArrayList<>();
        Map<Integer, BookDTO> bookMap = new HashMap<>();

        // Sửa lại try-with-resources để gán tham số '?'
        try (Connection conn = DBUtils.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
           ps.setInt(1, numberOfBooks);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int currentId = rs.getInt("id");

                    // Kiểm tra book đã có trong map chưa
                    BookDTO book = bookMap.get(currentId);
                    if (book == null) {
                        book = new BookDTO(
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
                    BookVariantsDTO bookVar = new BookVariantsDTO();
                    bookVar.setBookId(currentId);
                    bookVar.setBookVarId(rs.getInt("bookVariant"));
                    bookVar.setPrice(rs.getBigDecimal("price"));

                    // Đảm bảo bạn dùng getVariants()
                    book.getVariants().add(bookVar);
                }
            } // rs.close()

            list.addAll(bookMap.values());
            return list;

        } catch (Exception e) {
            e.printStackTrace();
        } // conn.close(), ps.close()

        return new ArrayList<>(); // Trả về rỗng nếu có lỗi
    }

    public static void main(String[] args) {
        BookDTO book = BookDAO.readById(4);
        System.out.println(book);
//        for (BookDTO b : list) {
//            System.out.println(b);
//        }
    }

}
