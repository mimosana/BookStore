/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.BookVariant;
import model.Category;

/**
 *
 * @author Admin
 */
public class DetailServlet extends HttpServlet {
   
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
        
        ProductDAO productDAO=new ProductDAO();
        CategoryDAO categoryDAO=new CategoryDAO();
        
        String bid=request.getParameter("pid");
        String cateid=request.getParameter("cateid");
        String variant=request.getParameter("variant");
        int bookId=0,cateId=0;
        try {
            bookId=Integer.parseInt(bid);
            if(bookId<=0) throw new NumberFormatException();
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Hiện chưa có sản phẩm");
            request.getRequestDispatcher("detail.jsp").forward(request, response);
            return;
        }
        try {
            cateId=Integer.parseInt(cateid);
            if(cateId<=0) throw new NumberFormatException();
        } catch (NumberFormatException e) {
            request.setAttribute("category", cateid);
            request.getRequestDispatcher("filter").forward(request, response);
            return;
        }
        
        Book book =productDAO.getBook(bookId);
        Category category=categoryDAO.getCategory(cateId);
        
        
        if(variant!=null&&!variant.isEmpty()){
            try {
                int variantId=Integer.parseInt(variant);
                BookVariant bookVariant=null;
                for(BookVariant b:book.getListVariant()){
                    if(b.getVariantId()==variantId){
                        bookVariant=b;
                    }
                }
                System.out.println(bookVariant);
                request.setAttribute("bookV", bookVariant);
            } catch (NumberFormatException e) {
            }
        }
                
                
        
        
        request.setAttribute("category", category);
        request.setAttribute("book", book);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
