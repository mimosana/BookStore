/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

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
import model.Order;
import model.User;

/**
 *
 * @author Admin
 */
public class ProfileServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @activeView request servlet request
     * @activeView response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        User user = (User) session.getAttribute("account");

        if (user == null) {
            response.sendRedirect("login.jsp"); 
            return;
        }
        String view=request.getParameter("view")==null?"profile":request.getParameter("view");
        if(view.equals("orders")){
            OrderDAO orderDAO=new OrderDAO();
            List<Order> order=new ArrayList<>();
            String status=request.getParameter("status")==null?"delivering":request.getParameter("status");
            if(status.equals("delivering")){
                order=orderDAO.getPeding(user.getUserId());
            }else{
                order=orderDAO.getDelivered(user.getUserId());
            }
            request.setAttribute("param", status);
            request.setAttribute("listOrders", order);
            request.setAttribute("activeView", "orders");
        }else if(view.equals("favorites")){
            request.setAttribute("activeView", "favorites");
        }else {
            request.setAttribute("activeView", "profile");
            
        }
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @activeView request servlet request
     * @activeView response servlet response
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
