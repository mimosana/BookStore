package controller;

import dao.OrderDAO;
import model.Order;
import model.OrderDetail;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderManagementServlet", urlPatterns = {"/admin/orders"})
public class OrderManagementServlet extends HttpServlet {

    private final OrderDAO orderDAO = new OrderDAO();
    private final int PAGE_SIZE = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // ================= VIEW DETAIL =================
        if ("view".equals(action)) {
            String orderIdParam = request.getParameter("orderId");
            System.out.println("DEBUG - orderIdParam: " + orderIdParam);
            
            int orderId = Integer.parseInt(orderIdParam);
            System.out.println("DEBUG - parsed orderId: " + orderId);
            
            Order order = orderDAO.getOrderById(orderId);
            System.out.println("DEBUG - Order found: " + (order != null ? order.getOrderId() : "null"));
            
            List<OrderDetail> orderDetails = orderDAO.getOrderDetailsByOrderId(orderId);
            System.out.println("DEBUG - OrderDetails size: " + orderDetails.size());
            for (OrderDetail od : orderDetails) {
                System.out.println("  - OrderDetail: orderId=" + od.getOrderId() + ", title=" + od.getBookTitle());
            }

            request.setAttribute("order", order);
            request.setAttribute("orderDetails", orderDetails);
            request.getRequestDispatcher("/admin/order-detail.jsp").forward(request, response);
            return;
        }


        // ================= LIST / FILTER / PAGING =================
        String status = request.getParameter("status");
        String userIdParam = request.getParameter("userId");
        Integer userId = null;
        if (userIdParam != null && !userIdParam.isEmpty()) {
            try {
                userId = Integer.parseInt(userIdParam);
            } catch (NumberFormatException e) {
            }
        }

        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
            }
        }

        int offset = (currentPage - 1) * PAGE_SIZE;

        List<Order> orders = orderDAO.getOrders(offset, PAGE_SIZE, status, userId);
        int totalOrders = orderDAO.countOrders(status, userId);
        int totalPages = (int) Math.ceil((double) totalOrders / PAGE_SIZE);

        request.setAttribute("orders", orders);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("status", status);
        request.setAttribute("userId", userIdParam);

        request.getRequestDispatcher("/admin/order-management.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");

   if ("changeStatus".equals(action)) {
    int orderId = Integer.parseInt(request.getParameter("orderId"));
    String newStatus = request.getParameter("status");

    Order order = orderDAO.getOrderById(orderId);
    String error = null;

    // VALIDATE
    if ("CANCELLED".equals(newStatus) && "DELIVERED".equals(order.getStatus())) {
        error = "Cannot cancel an order that has been delivered!";
    }

    if (error != null) {
        request.getSession().setAttribute("error", error);
    } else {
        orderDAO.updateOrderStatus(orderId, newStatus);
        request.getSession().setAttribute("success", "Order status updated successfully.");
    }

    // redirect về trang trước với filter và paging
    String userIdParam = request.getParameter("userId");
    String statusFilter = request.getParameter("statusFilter");
    String pageParam = request.getParameter("page");
    StringBuilder sb = new StringBuilder(request.getContextPath() + "/admin/orders");
    boolean hasQuery = false;
    if (userIdParam != null && !userIdParam.isEmpty()) {
        sb.append(hasQuery ? "&" : "?").append("userId=").append(userIdParam);
        hasQuery = true;
    }
    if (statusFilter != null && !statusFilter.isEmpty()) {
        sb.append(hasQuery ? "&" : "?").append("status=").append(statusFilter);
        hasQuery = true;
    }
    if (pageParam != null && !pageParam.isEmpty()) {
        sb.append(hasQuery ? "&" : "?").append("page=").append(pageParam);
    }

    response.sendRedirect(sb.toString());
}

}

}
