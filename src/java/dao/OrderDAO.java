/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.Order;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;
import model.BookVariant;
import model.Cart;
import model.CartItem;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public OrderDAO() {
        super();
    }

    public List<Order> getPeding(int userid) {
        Map<Integer, Order> map = new LinkedHashMap<>();
        String sql = "SELECT \n"
                + "    o.order_id,\n"
                + "    o.order_date,\n"
                + "    o.status,\n"
                + "    b.title,\n"
                + "    b.image\n"
                + "FROM Orders o\n"
                + "JOIN OrderDetails od ON o.order_id = od.order_id\n"
                + "JOIN BookVariants bv ON bv.variant_id = od.variant_id\n"
                + "JOIN Books b ON b.book_id = bv.book_id\n"
                + "WHERE o.user_id = ?\n"
                + "  AND o.status = 'PENDING'\n"
                + "ORDER BY o.order_id;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            

            while (rs.next()) {
                int orderId = rs.getInt("order_id");

                Order order = map.get(orderId);
                if (order == null) {
                    order = new Order();
                    order.setOrderId(orderId);
                    order.setOrderDate(rs.getDate("order_date"));
                    order.setStatus(rs.getString("status"));
                    order.setBook(new ArrayList<>());
                    map.put(orderId, order);
                }

                Book book = new Book();
                book.setTitle(rs.getString("title"));
                book.setImage(rs.getString("image"));

                order.getBook().add(book);
            }

            

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new ArrayList<>(map.values());
    }

    public List<Order> getDelivered(int userid) {
        Map<Integer, Order> map = new LinkedHashMap<>();
        String sql = "SELECT \n"
                + "    o.order_id,\n"
                + "    o.order_date,\n"
                + "    o.status,\n"
                + "    b.title,\n"
                + "    b.image\n"
                + "FROM Orders o\n"
                + "JOIN OrderDetails od ON o.order_id = od.order_id\n"
                + "JOIN BookVariants bv ON bv.variant_id = od.variant_id\n"
                + "JOIN Books b ON b.book_id = bv.book_id\n"
                + "WHERE o.user_id = ?\n"
                + "  AND o.status = 'DELIVERED'\n"
                + "ORDER BY o.order_id;";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int orderId = rs.getInt("order_id");

                Order order = map.get(orderId);
                if (order == null) {
                    order = new Order();
                    order.setOrderId(orderId);
                    order.setOrderDate(rs.getDate("order_date"));
                    order.setStatus(rs.getString("status"));
                    order.setBook(new ArrayList<>());
                    map.put(orderId, order);
                }

                Book book = new Book();
                book.setTitle(rs.getString("title"));
                book.setImage(rs.getString("image"));

                order.getBook().add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new ArrayList<>(map.values());
    }

    //thêm hóa đơn 
    public int saveOrder(Order order, Cart cart) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            conn.setAutoCommit(false); // Bắt đầu Transaction

            // Bước 1: Insert vào bảng Order
            // Thêm tham số Statement.RETURN_GENERATED_KEYS
            String sqlOrder = "INSERT INTO Orders (account_id, total_price, order_date) VALUES (?, ?, NOW())";
            ps = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotal());
            ps.executeUpdate();

            // Bước 2: Lấy OrderID vừa tạo
            int orderId = 0;
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1); // Đây chính là OrderId bạn cần!
            }

            // Bước 3: Insert vào bảng OrderDetail
            String sqlDetail = "INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement psDetail = conn.prepareStatement(sqlDetail);

            for (CartItem item : cart.getItems()) {
                psDetail.setInt(1, orderId); // Dùng orderId vừa lấy được ở trên
                psDetail.setInt(2, item.getVariant().getVariantId());
                psDetail.setInt(3, item.getQuantity());
                psDetail.setDouble(4, item.getVariant().getPrice());
                psDetail.addBatch(); // Dùng Batch để tối ưu hiệu suất
            }
            psDetail.executeBatch();

            conn.commit(); // Hoàn tất giao dịch
            return orderId;

        } catch (Exception e) {
            if (conn != null) try {
                conn.rollback();
            } catch (Exception ex) {
            } // Lỗi thì hủy hết
            e.printStackTrace();
        } finally {
            // Đóng kết nối...
        }
        return 0;
    }
    
    //lay order
    public Order getOrderById(int orderId){
        String sql="Select * from Orders where order_id=?";
        try {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                Order order=new Order(rs.getInt("order_id"),
                rs.getInt("user_id"),
                rs.getDate("order_date"),
                rs.getString("status"),
                rs.getDouble("total"),
                rs.getString("receiver_name"),
                rs.getString("phone"),
                rs.getString("shipping_address"),
                rs.getString("city"));
                return order;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        List<Order> listPending = orderDAO.getPeding(2);
        for (Order o : listPending) {
            System.out.println(o);
        }
    }

}
