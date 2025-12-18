package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;
import utils.PasswordUtil; 
import utils.ValidateUtils;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chỉ forward tới trang register
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirmPassword");
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");

        // Validate
        if (!ValidateUtils.isValidUsername(username)) {
            request.setAttribute("error", "Username không hợp lệ (3–20 ký tự)");
        } else if (!ValidateUtils.isValidPassword(password)) {
            request.setAttribute("error", "Password phải >= 6 ký tự");
        } else if (!password.equals(confirm)) {
            request.setAttribute("error", "Password xác nhận không khớp");
        } else if (!ValidateUtils.isValidFullName(fullName)) {
            request.setAttribute("error", "Full name không được để trống");
        } else if (!ValidateUtils.isValidEmail(email)) {
            request.setAttribute("error", "Email không hợp lệ");
        }

        // Nếu có lỗi thì forward lại
        if (request.getAttribute("error") != null) {
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        try {
            UserDAO dao = new UserDAO();

            // Check trùng username
            if (dao.checkUsernameExist(username)) {
                request.setAttribute("error", "Username đã tồn tại");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
            }

            User u = new User();
            u.setUsername(username.trim());
           u.setPassword(PasswordUtil.hashPassword(password.trim()));

            u.setFullName(fullName.trim());
            u.setEmail(email.trim());
            u.setRole("CUSTOMER");

            if (dao.register(u)) {
                // Có thể set thông báo success nếu muốn hiển thị
                request.setAttribute("success", "Đăng ký thành công! Vui lòng đăng nhập.");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Đăng ký thất bại");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
