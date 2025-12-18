/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookVariantDao;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.BookVariant;
import model.Category;

/**
 *
 * @author Admin
 */
public class FilterServlet extends HttpServlet {

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

        ProductDAO productDAO = new ProductDAO();
        List<Book> listB = new ArrayList<>();
        BookVariantDao variantDao = new BookVariantDao();
        ArrayList<BookVariant> listV = variantDao.getVariantName();
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> listC = categoryDAO.getAll();

        String keyword = request.getParameter("keyword");
        String categoryid = request.getParameter("category");
        String variant = request.getParameter("variant");
        String min = request.getParameter("min_price");
        String max = request.getParameter("max_price");
        String index = request.getParameter("index");
        double minPrice = 0, maxPrice = 0;

        try {
            minPrice = (min == null) ? 0 : Double.parseDouble(min);
            maxPrice = (max == null) ? 0 : Double.parseDouble(max);
            if (minPrice < 0 || maxPrice < 0) {
                throw new NumberFormatException();
            }
            if (minPrice > maxPrice) {
                request.setAttribute("error", true);
                request.setAttribute("message", "Giá tối thiểu không được lớn hơn giá tối đa");
                minPrice = 0;
                maxPrice = 0;
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", true);
            request.setAttribute("message", "Nhập vào giá >0");
            minPrice = 0;
            maxPrice = 0;
        }

        int cateid = 0;
        Category category=null;
        boolean isParse = false;
        try {
            if (categoryid != null && !categoryid.trim().isEmpty()) {
                cateid = Integer.parseInt(categoryid);
                category=categoryDAO.getCategory(cateid);
            }
        } catch (NumberFormatException e) {
            cateid = 0;
            request.setAttribute("messageCateID", "Không tìm thấy sản phẩm nào");
        }
        
        listB = productDAO.filterProduct(keyword, variant, minPrice, maxPrice, cateid);

        //phân trang
        int numperpage = 6;
        int page = 0;
        int size = listB.size();
        int num = (size % numperpage == 0 ? (size / numperpage) : (size / numperpage) + 1);
        if (index == null) {
            page = 1;
        } else {
            try {
                page = Integer.parseInt(index);

            } catch (Exception e) {
            }

        }
        int start = (page - 1) * 6;
        int end = Math.min(page * numperpage, size);
        List<Book> list = productDAO.getBookByPaging(start, listB, end);

        request.setAttribute("listC", listC);
        request.setAttribute("listV", listV);
        request.setAttribute("listB", list);
        request.setAttribute("index", page);
        request.setAttribute("page", num);
        request.setAttribute("categoryid", categoryid);
        request.setAttribute("category", category);
        
        request.setAttribute("keyword", keyword);
        request.setAttribute("variant", variant);
        request.setAttribute("min", min);
        request.setAttribute("max", max);

        request.getRequestDispatcher("filter.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
