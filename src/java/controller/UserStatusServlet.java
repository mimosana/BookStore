package controller;

import dao.UserDAO;
import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

public class UserStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User currentUser = (User) session.getAttribute("account");

        if (!"ADMIN".equalsIgnoreCase(currentUser.getRole())) {
            response.sendRedirect(request.getContextPath() + "/home.jsp");
            return;
        }

        try {
            String userIdStr = request.getParameter("userId");
            String action = request.getParameter("action");

            if (userIdStr == null || userIdStr.isEmpty() || action == null || action.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admin/customers");
                return;
            }

            int userId = Integer.parseInt(userIdStr);
            String newStatus = "LOCK".equalsIgnoreCase(action) ? "LOCKED" : "ACTIVE";

            UserDAO userDao = new UserDAO();
            OrderDAO orderDao = new OrderDAO();

            // Kiểm tra user có đơn hàng đang xử lý hay không
            if ("LOCK".equalsIgnoreCase(action) && orderDao.hasPendingOrders(userId)) {
                // Không cho lock user
                session.setAttribute("errorMessage", "Cannot lock user with active orders!");
                response.sendRedirect(request.getContextPath() + "/admin/customers");
                return;
            }

           boolean success = userDao.updateStatus(userId, newStatus);

if (success) {
    System.out.println("DEBUG - User " + userId + " status updated to: " + newStatus);
    // Thêm thông báo thành công
    session.setAttribute("successMessage", "User status updated successfully!");
} else {
    System.out.println("DEBUG - Failed to update user " + userId);
    session.setAttribute("errorMessage", "Failed to update user status!");
}


        } catch (NumberFormatException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Invalid user ID!");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "An error occurred!");
        }

        // Redirect lại trang customers
        response.sendRedirect(request.getContextPath() + "/admin/customers");
    }
}
