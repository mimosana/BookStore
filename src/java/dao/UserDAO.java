package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO extends DBContext {

     public UserDAO() {
        super(); // kết nối DB
    }
    // ================== LOGIN ==================
    public User login(String username, String password) {
        if (conn == null) {
            return null;
        }

        String sql = "SELECT * FROM Users WHERE username = ? AND password = ? AND status='ACTIVE'";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                u.setCreatedAt(rs.getDate("created_at"));
                rs.close();
                ps.close();
                return u;
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // ================== REGISTER ==================
    public boolean register(User u) {
        if (conn == null) {
            return false;
        }

        String sql = "INSERT INTO Users(username, password, full_name, email, role) VALUES (?, ?, ?, ?, 'CUSTOMER')";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullName());
            ps.setString(4, u.getEmail());

            int rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ================== CHECK USERNAME EXIST ==================
    public boolean checkUsernameExist(String username) {
        if (conn == null) {
            return false;
        }

        String sql = "SELECT user_id FROM Users WHERE username = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            boolean exist = rs.next();
            rs.close();
            ps.close();
            return exist;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ================== GET ALL USERS ==================
    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        if (conn == null) {
            return list;
        }

        String sql = "SELECT * FROM Users ORDER BY user_id DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                u.setCreatedAt(rs.getDate("created_at"));
                list.add(u);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // ================== INSERT USER (ADMIN) ==================
    public boolean insert(User u) {
        if (conn == null) {
            return false;
        }

        String sql = "INSERT INTO Users(username, password, full_name, email, role) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullName());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getRole());

            int rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ================== LOCK / UNLOCK USER ==================
    public boolean updateStatus(int userId, String status) {
        if (conn == null) {
            return false;
        }

        String sql = "UPDATE Users SET status = ? WHERE user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, userId);

            int rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ================== CHANGE PASSWORD ==================
    public boolean changePassword(int userId, String password) {
        if (conn == null) {
            return false;
        }

        String sql = "UPDATE Users SET password = ? WHERE user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, userId);

            int rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ================== UPDATE ROLE ==================
    public boolean updateRole(int userId, String role) {
        if (conn == null) {
            return false;
        }

        String sql = "UPDATE Users SET role = ? WHERE user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, role);
            ps.setInt(2, userId);

            int rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // ================== COUNT USERS ==================
    public int countUsers() {
        if (conn == null) {
            return 0;
        }

        String sql = "SELECT COUNT(*) FROM Users";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }

            rs.close();
            ps.close();
            return count;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // ================== PAGINATION ==================
    public List<User> getUsersByPage(int page, int pageSize) {
        List<User> list = new ArrayList<>();
        if (conn == null) {
            return list;
        }

        String sql = """
            SELECT user_id, username, full_name, email, role, status, created_at
            FROM Users
            ORDER BY user_id
            OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
        """;

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, (page - 1) * pageSize);
            ps.setInt(2, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                u.setCreatedAt(rs.getDate("created_at"));
                list.add(u);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    // DELETE USER

    public boolean delete(int userId) {
        if (conn == null) {
            return false;
        }
        String sql = "DELETE FROM Users WHERE user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            int rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

// GET USER BY ID
    public User getUserById(int userId) {
        if (conn == null) {
            return null;
        }
        String sql = "SELECT * FROM Users WHERE user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                u.setCreatedAt(rs.getDate("created_at"));
                rs.close();
                ps.close();
                return u;
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

// UPDATE USER (ADMIN)
    public boolean update(User u) {
        if (conn == null) {
            return false;
        }
        String sql = "UPDATE Users SET full_name = ?, email = ?, role = ? WHERE user_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getFullName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getRole());
            ps.setInt(4, u.getUserId());
            int rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
// SEARCH + FILTER + PAGINATION

    public List<User> searchUsers(String keyword, String role, String status, int page, int pageSize) {
        List<User> list = new ArrayList<>();
        if (conn == null) {
            return list;
        }

        String sql = """
        SELECT * FROM Users
        WHERE 1=1
    """;

        if (keyword != null && !keyword.isEmpty()) {
            sql += " AND username LIKE ? OR full_name LIKE ?";
        }
        if (role != null && !role.isEmpty()) {
            sql += " AND role = ?";
        }
        if (status != null && !status.isEmpty()) {
            sql += " AND status = ?";
        }

        sql += " ORDER BY user_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            int index = 1;

            if (keyword != null && !keyword.isEmpty()) {
                String kw = "%" + keyword + "%";
                ps.setString(index++, kw);
                ps.setString(index++, kw);
     
            }

            if (role != null && !role.isEmpty()) {
                ps.setString(index++, role);
            }
            if (status != null && !status.isEmpty()) {
                ps.setString(index++, status);
            }

            ps.setInt(index++, (page - 1) * pageSize);
            ps.setInt(index, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                u.setCreatedAt(rs.getDate("created_at"));
                list.add(u);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

// COUNT SEARCH RESULT
    public int countSearchUsers(String keyword, String role, String status) {
        if (conn == null) {
            return 0;
        }

        String sql = "SELECT COUNT(*) FROM Users WHERE 1=1";

        if (keyword != null && !keyword.isEmpty()) {
            sql += " AND username LIKE ?";
        }
        if (role != null && !role.isEmpty()) {
            sql += " AND role = ?";
        }
        if (status != null && !status.isEmpty()) {
            sql += " AND status = ?";
        }

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            int index = 1;

            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(index++, "%" + keyword + "%");
            }
            if (role != null && !role.isEmpty()) {
                ps.setString(index++, role);
            }
            if (status != null && !status.isEmpty()) {
                ps.setString(index++, status);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<User> getCustomers() {
        List<User> list = new ArrayList<>();
        if (conn == null) {
            return list;
        }

        String sql = "SELECT * FROM Users WHERE role = 'CUSTOMER' ORDER BY user_id DESC";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                u.setCreatedAt(rs.getDate("created_at"));
                list.add(u);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updatePassword(int userId, String newPassword) {
    if (conn == null) return false;

    String sql = "UPDATE Users SET password = ? WHERE user_id = ?";
    try {
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, newPassword); // bạn có thể hash password ở đây
        ps.setInt(2, userId);

        int rows = ps.executeUpdate();
        ps.close();
        return rows > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

}
