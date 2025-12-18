/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.CartItem;
import model.User;

/**
 *
 * @author Admin
 */
public class showCart extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("account");

        if (user == null) {
            response.sendRedirect("login.jsp"); // Nên dùng redirect thay vì forward cho Login
            return;
        }

        // 1. Lấy hoặc khởi tạo giỏ hàng từ Session
        Cart cart = (Cart) session.getAttribute("cart");
        CartDAO cartDAO = new CartDAO();

        if (cart == null || cart.getUserId() != user.getUserId()) {
            cart = new Cart();
            cart.setUserId(user.getUserId());
            // Giả sử hàm này đã được bạn nâng cấp SQL để JOIN lấy luôn Book
            List<CartItem> items = cartDAO.getCartByUserId(user.getUserId());
            cart.setItems(items);
            session.setAttribute("cart", cart);
        }

        // 2. Xử lý Action
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            try {
                int variantId = Integer.parseInt(request.getParameter("variantId")); // Dùng variantId chuẩn hơn bid
                int quantity = 1;

                // Đồng bộ vào Database trước
                cartDAO.addOrUpdateItem(user.getUserId(), variantId, quantity);

                List<CartItem> items = cartDAO.getCartByUserId(user.getUserId());
                cart.setItems(items);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 3. Trả về kết quả
        String type = request.getParameter("type");
        if ("ajax".equals(type)) {
            response.setContentType("application/json");
            response.getWriter().print("{\"total\": " + cart.getTotalQuantity() + "}");
            return;
        }

        request.getRequestDispatcher("cart.jsp").forward(request, response);

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
