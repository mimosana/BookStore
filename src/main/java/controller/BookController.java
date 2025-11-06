/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import dao.BookVariantDAO;
import entity.Author;
import entity.Book;
import entity.BookVariants;
import entity.Category;
import entity.Publisher;
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
            url = "user/homepage.jsp";
            List<Book> listTopSeller = new ArrayList<>();
            List<Book> listNewBook = new ArrayList<>();
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

            try {
                Book book = bookService.displayDetailBook(productid);
                if (book == null) {
                    url = "user/detail.jsp";
                    request.setAttribute("errorMessage", "Không thể tìm thấy sách yêu cầu");
                } else {
                    url = "user/detail.jsp";
                    List<Rating> listRating = bookService.getRatingOfBook(book.getBookId());
                    request.setAttribute("detailBook", book);
                    request.setAttribute("listRating", listRating);
                }
            } catch (IllegalArgumentException i) {
                request.setAttribute("errorMessage", i.getMessage());
            } catch (Exception e) {
                request.setAttribute("errorMessage", e.getMessage());
            }
        } else if ("shop".equals(page)) {
            String index = request.getParameter("index");
            String action = request.getParameter("action");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String category = request.getParameter("category");
            String search = request.getParameter("search");
            author = (author == null || "all".equals(author)) ? " " : author;
            category = (category == null || "all".equals(category)) ? " " : category;
            publisher = (publisher == null || "all".equals(publisher)) ? " " : publisher;
            index = (index==null) ?"1":index;
            url = "user/shop.jsp";
            int endPage = 0;
            List<Book> list = new ArrayList<>();
            try{
                int numPage=Integer.parseInt(index);
                System.out.println("index = "+index);
            if ("filter".equals(action)||index!=null) {
                list = bookService.getBookByIndex(author,publisher,category,numPage);
                endPage = bookService.countBook(author, publisher, category);
                
                request.setAttribute("author", author);
                request.setAttribute("publisher", publisher);
                request.setAttribute("category", category);
            } else if ("search".equals(action)) {
                if (search != null) {
                    list = bookService.getBookByIndex(author,publisher,category,numPage);
                    endPage = bookService.countBook(search);
                }
                request.setAttribute("", category);
            }
            

            List<Author> listA = bookService.getAuthor();
            List<Category> listC = bookService.getCategory();
            List<Publisher> listP = bookService.getPublisher();
            if (!list.isEmpty()) {
                for (Book b : list) {
                    int bookId = b.getBookId();
                    b.setVariants(bookService.getVariantByBook(bookId));
                }
            }
            
            request.setAttribute("endP", endPage);
            request.setAttribute("list", list);
            request.setAttribute("curIndex", numPage);
            request.setAttribute("listA", listA);
            request.setAttribute("listC", listC);
            request.setAttribute("listP", listP);
            }catch(Exception e){
                System.out.println("The error while fetching parameter");
                
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
