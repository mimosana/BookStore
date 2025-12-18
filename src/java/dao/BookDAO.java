package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Book;

public class BookDAO extends DBContext {

    public int countBooks() {
        if (conn == null) return -1;

        String sql = "SELECT COUNT(*) FROM Books";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    
public boolean addBook(Book b) {
    CategoryDAO cdao = new CategoryDAO();
    if (!cdao.isCategoryActive(b.getCategoryId())) {
        return false; // ❌ category inactive
    }

    String sql = """
        INSERT INTO Books(title, author, description, image, category_id, status)
        VALUES (?, ?, ?, ?, ?, ?)
    """;
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, b.getTitle());
        ps.setString(2, b.getAuthor());
        ps.setString(3, b.getDescription());
        ps.setString(4, b.getImage());
        ps.setInt(5, b.getCategoryId());
        ps.setString(6, b.getStatus());
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
public List<Book> filterByCategory(int categoryId) {
    List<Book> list = new ArrayList<>();
    String sql = """
        SELECT b.*, c.category_name
        FROM Books b
        JOIN Categories c ON b.category_id = c.category_id
        WHERE b.category_id = ?
        ORDER BY b.book_id DESC
    """;
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, categoryId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Book b = new Book();
            b.setBookId(rs.getInt("book_id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setCategoryId(rs.getInt("category_id"));
            b.setCategoryName(rs.getString("category_name"));
            list.add(b);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
public List<Book> getAllBooks() {
    List<Book> list = new ArrayList<>();
    String sql = """
        SELECT b.*, c.category_name
        FROM Books b
        JOIN Categories c ON b.category_id = c.category_id
        ORDER BY b.book_id DESC
    """;

    try (PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            Book b = new Book();
            b.setBookId(rs.getInt("book_id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setDescription(rs.getString("description"));
            b.setImage(rs.getString("image"));
            b.setCategoryId(rs.getInt("category_id"));
            b.setCategoryName(rs.getString("category_name")); // OK
            b.setStatus(rs.getString("status"));

            list.add(b);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

public List<Book> getBooks(int page, int pageSize) {
    List<Book> list = new ArrayList<>();

    String sql = """
        SELECT 
            b.book_id, b.title, b.author, b.image, b.status,
            c.category_name,
            MIN(v.price) AS min_price,
            SUM(v.stock) AS total_stock
        FROM Books b
        JOIN Categories c ON b.category_id = c.category_id
        LEFT JOIN BookVariants v ON b.book_id = v.book_id
        GROUP BY b.book_id, b.title, b.author, b.image, b.status, c.category_name
        ORDER BY b.book_id DESC
        OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
    """;

    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, (page - 1) * pageSize);
        ps.setInt(2, pageSize);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Book b = new Book();
            b.setBookId(rs.getInt("book_id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setImage(rs.getString("image"));
            b.setStatus(rs.getString("status"));
            b.setCategoryName(rs.getString("category_name"));
            b.setMinPrice(rs.getDouble("min_price"));
            b.setTotalStock(rs.getInt("total_stock"));

            list.add(b);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
public Book getBookById(int bookId) {
    String sql = "SELECT b.*, c.category_name " +
                 "FROM Books b JOIN Categories c ON b.category_id = c.category_id " +
                 "WHERE b.book_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, bookId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Book b = new Book();
            b.setBookId(rs.getInt("book_id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setDescription(rs.getString("description"));
            b.setImage(rs.getString("image"));
            b.setCategoryId(rs.getInt("category_id"));
            b.setCategoryName(rs.getString("category_name"));
            b.setStatus(rs.getString("status"));
            return b;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
public boolean updateBook(Book b) {
    // Kiểm tra category active
    CategoryDAO cdao = new CategoryDAO();
    if (!cdao.isCategoryActive(b.getCategoryId())) {
        return false; // ❌ không được update sang category inactive
    }

    String sql = """
        UPDATE Books
        SET title = ?, author = ?, description = ?, image = ?, category_id = ?, status = ?
        WHERE book_id = ?
    """;
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, b.getTitle());
        ps.setString(2, b.getAuthor());
        ps.setString(3, b.getDescription());
        ps.setString(4, b.getImage());
        ps.setInt(5, b.getCategoryId());
        ps.setString(6, b.getStatus());
        ps.setInt(7, b.getBookId());
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
public boolean deleteBook(int bookId) {
    // Nếu còn variants, không xóa
    if (hasVariants(bookId)) {
        return false;
    }

    String sql = "DELETE FROM Books WHERE book_id = ?";
    try (
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, bookId);
        int affectedRows = ps.executeUpdate();
        return affectedRows > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}



// Kiểm tra xem sách còn variants (tồn kho) không
public boolean hasVariants(int bookId) {
    String sql = "SELECT COUNT(*) FROM ProductVariants WHERE book_id = ?";
    try (
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, bookId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0; // Nếu >0 nghĩa là còn variants
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
public List<Book> getBooksFiltered(int page, int pageSize, String keyword, String status, Integer categoryId) {
    List<Book> list = new ArrayList<>();
    String sql = """
        SELECT 
            b.book_id, b.title, b.author, b.description, b.image, b.status, b.category_id,
            c.category_name,
            MIN(v.price) AS min_price,
            SUM(v.stock) AS total_stock
        FROM Books b
        JOIN Categories c ON b.category_id = c.category_id
        LEFT JOIN BookVariants v ON b.book_id = v.book_id
        WHERE 1=1
    """;

    if (keyword != null && !keyword.isEmpty()) {
        sql += " AND (b.title LIKE ? OR b.author LIKE ?)";
    }
    if (status != null && !status.equalsIgnoreCase("ALL") && !status.isEmpty()) {
        sql += " AND b.status = ?";
    }
    if (categoryId != null && categoryId > 0) {
        sql += " AND b.category_id = ?";
    }

    sql += " GROUP BY b.book_id, b.title, b.author, b.description, b.image, b.status, b.category_id, c.category_name";
    sql += " ORDER BY b.book_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        int idx = 1;
        if (keyword != null && !keyword.isEmpty()) {
            ps.setString(idx++, "%" + keyword + "%");
            ps.setString(idx++, "%" + keyword + "%");
        }
        if (status != null && !status.equalsIgnoreCase("ALL") && !status.isEmpty()) {
            ps.setString(idx++, status);
        }
        if (categoryId != null && categoryId > 0) {
            ps.setInt(idx++, categoryId);
        }
        ps.setInt(idx++, (page - 1) * pageSize);
        ps.setInt(idx++, pageSize);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Book b = new Book();
            b.setBookId(rs.getInt("book_id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setDescription(rs.getString("description"));
            b.setImage(rs.getString("image"));
            b.setCategoryId(rs.getInt("category_id"));
            b.setCategoryName(rs.getString("category_name"));
            b.setStatus(rs.getString("status"));
            b.setMinPrice(rs.getDouble("min_price"));
            b.setTotalStock(rs.getInt("total_stock"));
            list.add(b);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

public int countBooksFiltered(String keyword, String status, Integer categoryId) {
    String sql = "SELECT COUNT(*) FROM Books WHERE 1=1";
    if (keyword != null && !keyword.isEmpty()) {
        sql += " AND (title LIKE ? OR author LIKE ?)";
    }
    if (status != null && !status.equalsIgnoreCase("ALL") && !status.isEmpty()) {
        sql += " AND status = ?";
    }
    if (categoryId != null && categoryId > 0) {
        sql += " AND category_id = ?";
    }

    try (
         PreparedStatement ps = conn.prepareStatement(sql)) {

        int idx = 1;
        if (keyword != null && !keyword.isEmpty()) {
            ps.setString(idx++, "%" + keyword + "%");
            ps.setString(idx++, "%" + keyword + "%");
        }
        if (status != null && !status.equalsIgnoreCase("ALL") && !status.isEmpty()) {
            ps.setString(idx++, status);
        }
        if (categoryId != null && categoryId > 0) {
            ps.setInt(idx++, categoryId);
        }

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return 0;
}
public boolean hasStock(int bookId) {
    String sql = """
        SELECT COUNT(*) 
        FROM BookVariants 
        WHERE book_id = ? AND stock > 0
    """;

    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, bookId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) > 0;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

public void updateStatus(int bookId, String status) {
    String sql = "UPDATE Books SET status = ? WHERE book_id = ?";

    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, status);
        ps.setInt(2, bookId);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


}
