/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dao.BookVariantDAO;
import dto.BookDTO;
import dto.BookVariantsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BookController", urlPatterns = {"/book"})
public class BookController extends HttpServlet {

    private String displayBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "user/homepage.jsp";
        List<BookDTO> listTopSeller;
        List<BookDTO> listNewBook;
        try {
            listTopSeller = BookDAO.bookBestSeller();
            listNewBook = BookDAO.findNewestBooks(10);
        } catch (Exception e) {
            e.printStackTrace();
            listTopSeller = new ArrayList<>();
            listNewBook = new ArrayList<>();
        }
        request.setAttribute("topSeller", listTopSeller);
        request.setAttribute("newBook", listNewBook);
        return url;
    }
    private String displayDetailBook(HttpServletRequest request, HttpServletResponse response,String id)
            throws ServletException, IOException {
        String url="user/detail.jsp";
        BookDTO book;
        try {
            int productId=Integer.parseInt(id);
            book=BookDAO.readById(productId);
        } catch (Exception e) {
            book=null;
        }
        request.setAttribute("detailBook", book);
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String page = request.getParameter("page");
        String productid=request.getParameter("productid");
        String url = "";
        if ("homepage".equals(page)) {
            url = displayBook(request, response);
        }else if("detail".equals(page)){
            url=displayDetailBook(request, response, productid);    
        }
        request.getRequestDispatcher(url).forward(request, response);
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
