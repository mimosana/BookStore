package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy session hiện tại, nếu không có thì trả về null
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Xóa toàn bộ dữ liệu session
            session.invalidate();
        }

        // Redirect về trang login hoặc homepage
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    // Nếu muốn hỗ trợ POST cũng tương tự
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
