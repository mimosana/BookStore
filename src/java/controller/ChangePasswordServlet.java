package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import utils.ValidateUtils;

public class ChangePasswordServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        if (userIdStr == null || userIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/customers");
            return;
        }
        try {
            int userId = Integer.parseInt(userIdStr);
            request.setAttribute("userId", userId);
            request.getRequestDispatcher("/admin/changePassword.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/customers");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userIdStr = request.getParameter("userId");
        String password = request.getParameter("newPassword");
        String confirm = request.getParameter("confirmPassword");

        // Validate userId
        if (userIdStr == null || userIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/customers");
            return;
        }

        int userId;
        try {
            userId = Integer.parseInt(userIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/customers");
            return;
        }

        // Validate password
        String error = null;
        if (password == null || password.isEmpty()) {
            error = "Password cannot be empty!";
        } else if (!ValidateUtils.isValidPassword(password)) {
            error = "Password phải >= 6 ký tự";
        } else if (!password.equals(confirm)) {
            error = "Confirm password không khớp!";
        }

        if (error != null) {
            request.setAttribute("error", error);
            request.setAttribute("userId", userId);
            request.getRequestDispatcher("/admin/changePassword.jsp").forward(request, response);
            return;
        }

        // Update password
        boolean success = userDAO.updatePassword(userId, password);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/customers?success=changepassword");
        } else {
            request.setAttribute("error", "Failed to update password!");
            request.setAttribute("userId", userId);
            request.getRequestDispatcher("/admin/changePassword.jsp").forward(request, response);
        }
    }
}
