package controller;

import dao.BookDAO;
import dao.OrderDAO;
import dao.UserDAO;
import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;

public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User acc = (session != null) ? (User) session.getAttribute("account") : null;

        // Kiểm tra login & role
        if (acc == null || !"ADMIN".equals(acc.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // DAO để lấy số liệu
        UserDAO userDAO = new UserDAO();
        BookDAO bookDAO = new BookDAO();
        OrderDAO orderDAO = new OrderDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        // Set các attribute cho JSP
        request.setAttribute("totalUsers", userDAO.countUsers());
        request.setAttribute("totalCategories", categoryDAO.countAllCategories());
        request.setAttribute("totalBooks", bookDAO.countBooks());
        request.setAttribute("totalOrders", orderDAO.countOrders());

        // Chuyển tiếp sang JSP
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}
