/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dao.BookVariantDAO;
import entity.Book;
import entity.BookVariants;
import entity.Rating;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import service.BookService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BookController", urlPatterns = {"/book"})
public class BookController extends HttpServlet {

    private BookService bookService = new BookService();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String page = request.getParameter("page");
        String url = "";
        if ("homepage".equals(page)) {
            url="user/homepage.jsp";
            List<Book> listTopSeller=new ArrayList<>();
            List<Book> listNewBook=new ArrayList<>();
            try {
                 listTopSeller = bookService.getBestSellerBook();
                 listNewBook = bookService.getNewestBook();

            } catch (Exception e) {    
               e.printStackTrace();
               request.setAttribute("error", "Không thể tại được do lỗi hệ thống");
            }
            request.setAttribute("topSeller", listTopSeller);
            request.setAttribute("newBook", listNewBook);
        } else if ("detail".equals(page)) {
            String productid = request.getParameter("productid");
            
            try{
                Book book=bookService.displayDetailBook(productid);
            if(book==null){ 
                url="user/detail.jsp";
                request.setAttribute("errorMessage", "Không thể tìm thấy sách yêu cầu"); 
            }else{
                url="user/detail.jsp";
                List<Rating> listRating=bookService.getRatingOfBook(book.getBookId());
                request.setAttribute("detailBook", book);
                request.setAttribute("listRating", listRating);
            }
            }catch(IllegalArgumentException i){
                request.setAttribute("errorMessage", i.getMessage());
            }catch(Exception e){
                request.setAttribute("errorMessage", e.getMessage());
            }
        }else if("shop".equals(page)){
            String index=request.getParameter("index");
            if(index!=null){
                url="user/shop.jsp";
                int endPage=bookService.countBook(12);
                List<Book> list=bookService.getBookByIndex(Integer.parseInt(index));
                if(!list.isEmpty()){
                    for(Book b:list){
                        int bookId=b.getBookId();
                        b.setVariants(bookService.getVariantByBook(bookId));
                    }
                }
                request.setAttribute("endP", endPage);
                request.setAttribute("list", list);
                request.setAttribute("curIndex", index);
            }
            
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
