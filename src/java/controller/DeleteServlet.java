/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BookVariantDao;
import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.BookVariant;
import model.Cart;
import model.CartItem;
import model.User;

/**
 *
 * @author Admin
 */
public class DeleteServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("account");

    // 1. Kiểm tra đăng nhập
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    CartDAO cartDAO = new CartDAO();
    String action = request.getParameter("action");
    String variantIdStr = request.getParameter("variantId");
    String message = "";

    // 2. Xử lý xóa
    if ("removeAll".equals(action)) {
        cartDAO.deletelCart(user.getUserId());
        Cart newCart = new Cart();
        newCart.setUserId(user.getUserId());
        session.setAttribute("cart", newCart);
        message = "Đã dọn sạch giỏ hàng!";
    } else {
        try {
            if (variantIdStr != null) {
                int vid = Integer.parseInt(variantIdStr);
                cartDAO.deletelItem(user.getUserId(), vid);
                
                
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart != null) {
                    cart.setItems(cartDAO.getCartByUserId(user.getUserId()));
                    session.setAttribute("cart", cart);
                }
                message = "Đã xóa sản phẩm khỏi giỏ!";
            }
        } catch (NumberFormatException e) {
            message = "Yêu cầu không hợp lệ!";
        }
    }

    
    session.setAttribute("toastMessage", message); 
    response.sendRedirect("cart"); 
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
