/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name="RegisterController", urlPatterns={"/register"})
public class RegisterController extends HttpServlet {
    private static final String REGISTER_PAGE="user/Register.jsp";
   private UserDAO userDao=new UserDAO();
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   private boolean isVaidUsername(String username){
      return userDao.findByUser(username)!=null;
   }
   
   private boolean isVaidEmail(String email){
      return userDao.findByEmail(email)!=null;
   }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String url="";
        response.setContentType("text/html;charset=UTF-8");
        String userName=request.getParameter("username");
        String firstName=request.getParameter("firstName");
        String lastName=request.getParameter("lastName");
        String address=request.getParameter("address");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String confirmPass=request.getParameter("confirmPass");
        
        if(isVaidUsername(userName)){
            url=REGISTER_PAGE;
            request.setAttribute("ername", "The username already exists.");
        }else if(isVaidEmail(email)){
            url=REGISTER_PAGE;
            request.setAttribute("eremail", "The email was already used.");
        }else if(!password.equals(confirmPass)){
            url=REGISTER_PAGE;
            request.setAttribute("confirmPass", "Passwords do not match.");
        }else{
            url="user/homepage.jsp";
            userDao.create(new User(userName, firstName, lastName, address, email,password));
        }
        
        request.getRequestDispatcher(url).forward(request, response);
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
