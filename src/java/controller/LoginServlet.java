package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import model.User;
import utils.ValidateUtils;

import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // ===== VALIDATE =====
        if (ValidateUtils.isEmpty(username) || ValidateUtils.isEmpty(password)) {
            request.setAttribute("error", "Username và password không được để trống");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (!ValidateUtils.isValidUsername(username)) {
            request.setAttribute("error", "Username không hợp lệ");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (!ValidateUtils.isValidPassword(password)) {
            request.setAttribute("error", "Password phải từ 6 ký tự trở lên");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // ===== LOGIN =====
        try {
            UserDAO dao = new UserDAO();
            User user = dao.login(username.trim(), password);

            if (user != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("account", user);
                session.setMaxInactiveInterval(30 * 60); // 30 phút

                if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/home.jsp");
                }
            } else {
                request.setAttribute("error", "Sai username hoặc password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống, vui lòng thử lại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
