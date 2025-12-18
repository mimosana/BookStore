package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class CategoryDAO extends DBContext {

    // Lấy danh sách category + số book
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();

        String sql = """
            SELECT c.category_id,
                   c.category_name,
                   c.description,
                   c.status,
                   COUNT(b.book_id) AS books_count
            FROM Categories c
            LEFT JOIN Books b ON c.category_id = b.category_id
            GROUP BY c.category_id, c.category_name, c.description, c.status
            ORDER BY c.category_id DESC
        """;

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Category c = new Category();
                c.setCategoryId(rs.getInt("category_id"));
                c.setCategoryName(rs.getNString("category_name"));
                c.setDescription(rs.getNString("description"));
                c.setStatus(rs.getString("status"));
                c.setProductsCount(rs.getInt("books_count"));
                list.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy category theo id
    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM Categories WHERE category_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setCategoryId(rs.getInt("category_id"));
                c.setCategoryName(rs.getNString("category_name"));
                c.setDescription(rs.getNString("description"));
                c.setStatus(rs.getString("status"));
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Thêm category
    public void addCategory(Category c) {
        String sql = "INSERT INTO Categories(category_name, description, status) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setNString(1, c.getCategoryName());
            ps.setNString(2, c.getDescription());
            ps.setString(3, c.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update category
    public void updateCategory(Category c) {
        String sql = """
            UPDATE Categories
            SET category_name = ?, description = ?, status = ?
            WHERE category_id = ?
        """;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setNString(1, c.getCategoryName());
            ps.setNString(2, c.getDescription());
            ps.setString(3, c.getStatus());
            ps.setInt(4, c.getCategoryId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Đổi trạng thái
    public void changeStatus(int id, String status) {
        String sql = "UPDATE Categories SET status = ? WHERE category_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public int countCategories(String keyword, String status) {
    StringBuilder sql = new StringBuilder("""
        SELECT COUNT(DISTINCT c.category_id)
        FROM Categories c
        WHERE 1 = 1
    """);

    if (keyword != null && !keyword.trim().isEmpty()) {
        sql.append(" AND c.category_name LIKE ?");
    }
    if (status != null && !status.trim().isEmpty()) {
        sql.append(" AND c.status = ?");
    }

    try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
        int index = 1;

        if (keyword != null && !keyword.trim().isEmpty()) {
            ps.setNString(index++, "%" + keyword.trim() + "%");
        }
        if (status != null && !status.trim().isEmpty()) {
            ps.setString(index++, status);
        }

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}
public List<Category> searchCategories(String keyword, String status, int page, int pageSize) {
    List<Category> list = new ArrayList<>();

    StringBuilder sql = new StringBuilder("""
        SELECT c.category_id,
               c.category_name,
               c.description,
               c.status,
               COUNT(b.book_id) AS books_count
        FROM Categories c
        LEFT JOIN Books b ON c.category_id = b.category_id
        WHERE 1 = 1
    """);

    if (keyword != null && !keyword.trim().isEmpty()) {
        sql.append(" AND c.category_name LIKE ?");
    }
    if (status != null && !status.trim().isEmpty()) {
        sql.append(" AND c.status = ?");
    }

    sql.append("""
        GROUP BY c.category_id, c.category_name, c.description, c.status
        ORDER BY c.category_id DESC
        OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
    """);

    try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {

        int index = 1;

        if (keyword != null && !keyword.trim().isEmpty()) {
            ps.setNString(index++, "%" + keyword.trim() + "%");
        }
        if (status != null && !status.trim().isEmpty()) {
            ps.setString(index++, status);
        }

        ps.setInt(index++, (page - 1) * pageSize);
        ps.setInt(index, pageSize);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Category c = new Category();
            c.setCategoryId(rs.getInt("category_id"));
            c.setCategoryName(rs.getNString("category_name"));
            c.setDescription(rs.getNString("description"));
            c.setStatus(rs.getString("status"));
            c.setProductsCount(rs.getInt("books_count"));
            list.add(c);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}
// Kiểm tra trùng tên category
public boolean isCategoryNameExists(String name) {
    String sql = "SELECT 1 FROM Categories WHERE category_name = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setNString(1, name.trim());
        ResultSet rs = ps.executeQuery();
        return rs.next();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}
public boolean isCategoryNameExistsExceptId(String name, int id) {
    String sql = "SELECT 1 FROM Categories WHERE category_name = ? AND category_id <> ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setNString(1, name.trim());
        ps.setInt(2, id);
        ResultSet rs = ps.executeQuery();
        return rs.next();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}


public boolean isCategoryActive(int categoryId) {
    String sql = "SELECT status FROM Categories WHERE category_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, categoryId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return "ACTIVE".equalsIgnoreCase(rs.getString("status"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
public List<Category> getAllActiveCategories() {
    List<Category> list = new ArrayList<>();
    String sql = "SELECT * FROM Categories WHERE status='ACTIVE' ORDER BY category_name";
    try (PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        while (rs.next()) {
            Category c = new Category();
            c.setCategoryId(rs.getInt("category_id"));
            c.setCategoryName(rs.getString("category_name"));
            c.setDescription(rs.getString("description"));
            c.setStatus(rs.getString("status"));
            list.add(c);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

 public int countAllCategories() {
        String sql = "SELECT COUNT(*) AS total FROM Categories";
        try (
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("total");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // nếu có lỗi trả về 0
    }
 public int getProductsCount(int categoryId) {
    String sql = "SELECT COUNT(*) FROM Books WHERE category_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, categoryId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) return rs.getInt(1);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}
// Xóa category theo id
public void deleteCategory(int categoryId) {
    String sql = "DELETE FROM Categories WHERE category_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, categoryId);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
// Kiểm tra category có sản phẩm không
public boolean hasProducts(int categoryId) {
    String sql = "SELECT COUNT(*) AS total FROM Books WHERE category_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, categoryId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("total") > 0;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

 
}
