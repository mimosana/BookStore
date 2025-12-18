package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import model.User;
import utils.PasswordUtil;
import utils.ValidateUtils;

import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        if (ValidateUtils.isEmpty(username) || ValidateUtils.isEmpty(password)) {
            request.setAttribute("error", "Username và password không được để trống");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try {
            UserDAO dao = new UserDAO();
            User user = dao.getByUsername(username);

            if (user != null && PasswordUtil.verifyPassword(password, user.getPassword())) {
                HttpSession session = request.getSession(true);
                session.setAttribute("account", user);
                session.setMaxInactiveInterval(30 * 60);

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
