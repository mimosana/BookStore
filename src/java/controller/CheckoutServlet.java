/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookVariantDao;
import dao.CartDAO;
import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.BookVariant;
import model.Cart;
import model.CartItem;
import model.Order;
import model.User;

/**
 *
 * @author Admin
 */
public class CheckoutServlet extends HttpServlet {

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

        Cart cart = (Cart) session.getAttribute("cart");
        CartDAO cartDAO = new CartDAO();

        if (cart == null || cart.getUserId() != user.getUserId()) {
            response.sendRedirect("cart");
            return;
        }
        final double Shipping = 15000;
        String receiverName = request.getParameter("receiverName");
        String phone = request.getParameter("phone");
        String shippingAddress = request.getParameter("shippingAddress");
        String city = request.getParameter("city");

        //thêm vào hóa đơn
        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setTotal(cart.getTotalQuantity() + Shipping);
        order.setReceiverName(receiverName);
        order.setPhone(phone);
        order.setShippingAddress(shippingAddress);
        order.setCity(city);

        OrderDAO orderDAO = new OrderDAO();
        BookVariantDao variantDao = new BookVariantDao();
        int orderId = orderDAO.saveOrder(order, cart);

        if (orderId == 0) {
            request.setAttribute("message", "Đặt hàng không thành công, thử lại lần sau");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }

        //trừ số lượng trong database 
        List<CartItem> listItem = cart.getItems();
        for (CartItem i : listItem) {
            int id = i.getVariant().getVariantId();
            BookVariant variant = variantDao.getVariant(id);
            int numStock = variant.getStock();
            int currentQuan = i.getQuantity();
            if (currentQuan > numStock) {
                request.setAttribute("message", "Sản phẩm không đủ số lượng");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
                return;
            }
            variantDao.updateQuantity(id, numStock - currentQuan);
        }

        //xóa cart trong db
        cartDAO.deletelCart(user.getUserId());
        session.removeAttribute("cart");

        request.setAttribute("orderId", orderId);
        request.setAttribute("listItem", listItem);
        request.getRequestDispatcher("successfulOrder.jsp").forward(request, response);
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
        request.getRequestDispatcher("checkout.jsp").forward(request, response);

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
