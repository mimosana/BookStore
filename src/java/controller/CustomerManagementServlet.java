package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;
import java.util.List;

public class CustomerManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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

        int page = 1;
        int pageSize = 10;

        String pageRaw = request.getParameter("page");
        if (pageRaw != null) {
            try {
                page = Integer.parseInt(pageRaw);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        String keyword = request.getParameter("keyword");
        String role = request.getParameter("role");
        String status = request.getParameter("status");

        UserDAO dao = new UserDAO();
        List<User> customers = dao.searchUsers(keyword, role, status, page, pageSize);
        int totalRows = dao.countSearchUsers(keyword, role, status);
        int totalPages = (int) Math.ceil((double) totalRows / pageSize);

        int totalCustomers = totalRows;

        request.setAttribute("customers", customers);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
      
      
        request.setAttribute("keyword", keyword);
        request.setAttribute("role", role);
        request.setAttribute("status", status);
int start = (page - 1) * pageSize + 1;
int end = Math.min(page * pageSize, totalRows);

request.setAttribute("start", start);
request.setAttribute("end", end);
request.setAttribute("totalCustomers", totalRows);
request.setAttribute("pageSize", pageSize);

        request.getRequestDispatcher("/admin/customerManagement.jsp")
                .forward(request, response);
    }
}
