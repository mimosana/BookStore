package dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import model.Order;
import model.OrderDetail;

public class OrderDAO extends DBContext {

    public int countOrders() {
        if (conn == null) return -1;

        String sql = "SELECT COUNT(*) FROM Orders";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    
    // Lấy tất cả orders
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders ORDER BY order_date DESC";
        try (
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                o.setStatus(rs.getString("status"));
                o.setTotal(rs.getDouble("total"));
                o.setReceiverName(rs.getString("receiver_name"));
                o.setPhone(rs.getString("phone"));
                o.setShippingAddress(rs.getString("shipping_address"));
                o.setCity(rs.getString("city"));
                list.add(o);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy orders theo trạng thái
    public List<Order> getOrdersByStatus(String status) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE status=? ORDER BY order_date DESC";
        try (
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setOrderDate(rs.getTimestamp("order_date"));
                o.setStatus(rs.getString("status"));
                o.setTotal(rs.getDouble("total"));
                o.setReceiverName(rs.getString("receiver_name"));
                o.setPhone(rs.getString("phone"));
                o.setShippingAddress(rs.getString("shipping_address"));
                o.setCity(rs.getString("city"));
                list.add(o);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy chi tiết order
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT od.*, bv.variant_name, b.title AS book_title " +
                     "FROM OrderDetails od " +
                     "JOIN BookVariants bv ON od.variant_id = bv.variant_id " +
                     "JOIN Books b ON bv.book_id = b.book_id " +
                     "WHERE od.order_id=?";
        try (
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setOrderId(rs.getInt("order_id"));
                od.setVariantId(rs.getInt("variant_id"));
                od.setQuantity(rs.getInt("quantity"));
                od.setPrice(rs.getDouble("price"));
                od.setVariantName(rs.getString("variant_name"));
                od.setBookTitle(rs.getString("book_title"));
                list.add(od);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Cập nhật trạng thái order
    public void updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE Orders SET status=? WHERE order_id=?";
        try (
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
   // Lấy danh sách order với paging, filter status và userId
public List<Order> getOrders(int offset, int pageSize, String status, Integer userId) {
    List<Order> list = new ArrayList<>();
    StringBuilder sql = new StringBuilder();
    sql.append("SELECT * FROM Orders o WHERE 1=1 ");

    if (status != null && !status.isEmpty()) {
        sql.append("AND o.status = ? ");
    }
    if (userId != null) {
        sql.append("AND o.user_id = ? ");
    }
    sql.append("ORDER BY o.order_date DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

    try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
        int index = 1;
        if (status != null && !status.isEmpty()) {
            ps.setString(index++, status);
        }
        if (userId != null) {
            ps.setInt(index++, userId);
        }
        ps.setInt(index++, offset);
        ps.setInt(index++, pageSize);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Order o = new Order();
            o.setOrderId(rs.getInt("order_id"));
            o.setUserId(rs.getInt("user_id"));
            o.setOrderDate(rs.getTimestamp("order_date"));
            o.setStatus(rs.getString("status"));
            o.setTotal(rs.getDouble("total"));
            o.setReceiverName(rs.getString("receiver_name"));
            o.setPhone(rs.getString("phone"));
            o.setShippingAddress(rs.getString("shipping_address"));
            o.setCity(rs.getString("city"));
            list.add(o);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}

// Đếm tổng số order để phân trang
public int countOrders(String status, Integer userId) {
    StringBuilder sql = new StringBuilder();
    sql.append("SELECT COUNT(*) AS total FROM Orders o WHERE 1=1 ");
    if (status != null && !status.isEmpty()) {
        sql.append("AND o.status = ? ");
    }
    if (userId != null) {
        sql.append("AND o.user_id = ? ");
    }

    try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
        int index = 1;
        if (status != null && !status.isEmpty()) {
            ps.setString(index++, status);
        }
        if (userId != null) {
            ps.setInt(index++, userId);
        }

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}

    // Trong OrderDAO
public Order getOrderById(int orderId) {
    String sql = "SELECT * FROM Orders WHERE order_id=?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, orderId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Order o = new Order();
            o.setOrderId(rs.getInt("order_id"));
            o.setUserId(rs.getInt("user_id"));
            o.setOrderDate(rs.getTimestamp("order_date"));
            o.setStatus(rs.getString("status"));
            o.setTotal(rs.getDouble("total"));
            o.setReceiverName(rs.getString("receiver_name"));
            o.setPhone(rs.getString("phone"));
            o.setShippingAddress(rs.getString("shipping_address"));
            o.setCity(rs.getString("city"));
            return o;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
public boolean hasPendingOrders(int userId) {
        String sql = "SELECT COUNT(*) AS total " +
                     "FROM Orders " +
                     "WHERE user_id = ? AND status IN ('PENDING', 'SHIPPING')";
        try (
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt("total");
                    return count > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}



