/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.BookVariantDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.BookVariant;

/**
 *
 * @author Admin
 */
public class addToCart extends HttpServlet {
   
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
        BookVariantDao variantDao = new BookVariantDao();
        List<BookVariant> listBV = variantDao.getVariants();
        String variantid=request.getParameter("variantid");
        String quantity=request.getParameter("quantity");
        Cookie[] cookie = request.getCookies();
        String txt = "";
        for (Cookie c : cookie) {
            if (c.getName().equals("cart")) {
                txt += c.getValue();
                c.setMaxAge(0);
                response.addCookie(c);
            }
        }
        try {
            int vid=Integer.parseInt(variantid);
            BookVariant bookVariant=getVariant(vid, listBV);
            if(bookVariant!=null){
                if(txt.isEmpty()){
                txt=txt+"|"+variantid+":"+quantity;
            }else{
                txt+=variantid+":"+quantity;
            }
            }else throw new NumberFormatException();
            Cookie c=new Cookie("cart", txt);
            c.setMaxAge(2*24*60*60);
            response.addCookie(c);
            
            
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Không tìm thấy sản phẩm");
        }
        request.getRequestDispatcher("show").forward(request, response);
        
} 
    private BookVariant getVariant(int variantid,List<BookVariant> listBV ){
        for(BookVariant b:listBV){
            if(b.getVariantId()==variantid){
                return b;
            }
        }
        return null;
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
