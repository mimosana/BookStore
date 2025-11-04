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
@WebServlet(name="LoginController", urlPatterns={"/login"})
public class LoginController extends HttpServlet {
    private static final String LOGIN_PAGE="user/Login.jsp";
   private UserDAO userDao=new UserDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        if(username!=null && password!=null){
            User user=userDao.findByUser(username);
        if(user!=null){
            if(user.getPassword().equals(password)){
            request.getSession().setAttribute("user", user);
            response.sendRedirect("book?page=homepage");
        }else{
            request.setAttribute("message", "Username or Password is not correct.");
            request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
        }
        }else{
             request.setAttribute("message", "Account does not exist");
             request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
        }
        }else{
            response.sendRedirect(LOGIN_PAGE);
        }
        
        
        
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
