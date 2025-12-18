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
public class ProcessCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
        
        BookVariantDao variantDao = new BookVariantDao();
        String num = request.getParameter("num");
        String variantid = request.getParameter("variantid");

        //tim stock cua gia trij do
        int action = 0;
        try {
            action = Integer.parseInt(num);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Thực hiện không hợp lệ");
        }
        int id = 0;
        try {
            id = Integer.parseInt(variantid);
            BookVariant variant = variantDao.getVariant(id);
            if(variant==null) throw new NumberFormatException();
            int numStore = variant.getStock();
            int currentStore=cart.getQuantityOfItem(id);
            if (action == 1 && currentStore >= numStore) {
                request.setAttribute("message", "Vượt quá số lương");
            } else if (action == -1 && currentStore <= 1) {
               request.setAttribute("message", "Không trừ được số lượng");
            } else {
                cartDAO.addOrUpdateItem(user.getUserId(), id, action);
            }
            List<CartItem> items = cartDAO.getCartByUserId(user.getUserId());
            cart.setItems(items);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Không tìm thấy sản phẩm");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }
        request.setAttribute("varaintid", id);
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
