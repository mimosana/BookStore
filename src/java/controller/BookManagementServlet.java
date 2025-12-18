package controller;

import dao.BookDAO;
import dao.CategoryDAO;
import model.Book;
import model.Category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class BookManagementServlet extends HttpServlet {

    private BookDAO bookDAO = new BookDAO();
    private CategoryDAO categoryDAO = new CategoryDAO();

   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");
    if (action == null) action = "list";

    switch (action) {
        case "add":
            showAddForm(request, response);
            break;
        case "edit":
            showEditForm(request, response);
            break;
        case "changeStatus":
            changeStatus(request, response);
            break;
        case "delete":
            deleteBook(request, response);
            break;
        default:
            listBooks(request, response);
            break;
    }
}

private void changeStatus(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    try {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String newStatus = request.getParameter("status");

        Book old = bookDAO.getBookById(bookId);
        if (old == null) {
            response.sendRedirect("products");
            return;
        }

        // ❌ Validate: còn stock thì không cho INACTIVE
        if ("INACTIVE".equals(newStatus) && bookDAO.hasStock(bookId)) {

            request.getSession().setAttribute(
                "errorMessage",
                "Cannot set INACTIVE. This book still has stock!"
            );
            response.sendRedirect("products");
            return;
        }

        // ✅ Update status
        bookDAO.updateStatus(bookId, newStatus);
        request.getSession().setAttribute(
            "successMessage",
            "Book status updated successfully!"
        );

        response.sendRedirect("products");

    } catch (Exception e) {
        e.printStackTrace();
        request.getSession().setAttribute(
            "errorMessage",
            "Error changing book status."
        );
        response.sendRedirect("products");
    }
}



    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> categories = categoryDAO.getAllActiveCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/book-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookIdParam = request.getParameter("bookId");
        if (bookIdParam == null) {
            response.sendRedirect("products"); // nếu không có bookId thì quay lại danh sách
            return;
        }

        try {
            int bookId = Integer.parseInt(bookIdParam);
            Book book = bookDAO.getBookById(bookId);
            if (book == null) {
                response.sendRedirect("products");
                return;
            }
            List<Category> categories = categoryDAO.getAllActiveCategories();
            request.setAttribute("book", book);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/admin/book-form.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("products");
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int page = 1;
    int pageSize = 10;
    try {
        page = Integer.parseInt(request.getParameter("page"));
    } catch (Exception e) { }

    // Lấy các filter
    String keyword = request.getParameter("keyword");
    String status = request.getParameter("status");
    String categoryIdParam = request.getParameter("categoryId");
    Integer categoryId = null;
    try {
        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
            categoryId = Integer.parseInt(categoryIdParam);
        }
    } catch (NumberFormatException e) { }

    // Lấy dữ liệu từ DAO với filter
    List<Book> books = bookDAO.getBooksFiltered(page, pageSize, keyword, status, categoryId);
    int totalBooks = bookDAO.countBooksFiltered(keyword, status, categoryId);
    int totalPages = (int) Math.ceil((double) totalBooks / pageSize);

    List<Category> categories = categoryDAO.getAllCategories();

    request.setAttribute("books", books);
    request.setAttribute("currentPage", page);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("keyword", keyword);
    request.setAttribute("statusFilter", status);
    request.setAttribute("categoryFilter", categoryId);
    request.setAttribute("categories", categories);
    request.getRequestDispatcher("/admin/productManagement.jsp").forward(request, response);
}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {
            case "insert":
                insertBook(request, response);
                break;
            case "update":
                updateBook(request, response);
                break;
                case "changeStatus":
    changeStatus(request, response);
    break;

            case "delete":
                deleteBook(request, response);
                break;
            default:
                response.sendRedirect("products");
                break;
        }
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response)
        throws IOException {

    HttpSession session = request.getSession();

    try {
        Book b = new Book();
        b.setTitle(request.getParameter("title"));
        b.setAuthor(request.getParameter("author"));
        b.setDescription(request.getParameter("description"));
        b.setImage(request.getParameter("image"));
        b.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        b.setStatus(request.getParameter("status"));

        bookDAO.addBook(b);

        session.setAttribute(
            "successMessage",
            "Book added successfully!"
        );
        response.sendRedirect("products");

    } catch (Exception e) {
        e.printStackTrace();
        session.setAttribute(
            "errorMessage",
            "Error adding book."
        );
        response.sendRedirect("products");
    }
}

   private void updateBook(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession();

    try {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String newStatus = request.getParameter("status");

        Book old = bookDAO.getBookById(bookId);
        if (old == null) {
            session.setAttribute("errorMessage", "Book not found.");
            response.sendRedirect("products");
            return;
        }

        // ❌ Validate: còn stock thì không cho INACTIVE
        if ("INACTIVE".equals(newStatus) && bookDAO.hasStock(bookId)) {

    Book b = new Book();
    b.setBookId(bookId);
    b.setTitle(request.getParameter("title"));
    b.setAuthor(request.getParameter("author"));
    b.setDescription(request.getParameter("description"));
    b.setImage(request.getParameter("image"));
    b.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
    b.setStatus(old.getStatus()); // giữ status cũ

    request.setAttribute(
        "error",
        "Cannot set INACTIVE: this book still has stock!"
    );
    request.setAttribute("book", b);
    request.setAttribute("categories", categoryDAO.getAllActiveCategories());

    request.getRequestDispatcher("/admin/book-form.jsp")
           .forward(request, response);
    return;
}


        // ✅ Update hợp lệ
        Book b = new Book();
        b.setBookId(bookId);
        b.setTitle(request.getParameter("title"));
        b.setAuthor(request.getParameter("author"));
        b.setDescription(request.getParameter("description"));
        b.setImage(request.getParameter("image"));
        b.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        b.setStatus(newStatus);

        bookDAO.updateBook(b);

        session.setAttribute(
            "successMessage",
            "Book updated successfully!"
        );
        response.sendRedirect("products");

    } catch (Exception e) {
        e.printStackTrace();
        session.setAttribute(
            "errorMessage",
            "Error updating book."
        );
        response.sendRedirect("products");
    }
}



 private void deleteBook(HttpServletRequest request, HttpServletResponse response)
        throws IOException {

    HttpSession session = request.getSession();

    try {
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        Book book = bookDAO.getBookById(bookId);
        if (book == null) {
            session.setAttribute(
                "errorMessage",
                "Book not found."
            );
            response.sendRedirect("products");
            return;
        }

        // ❌ Chưa INACTIVE thì không cho delete
        if (!"INACTIVE".equals(book.getStatus())) {
            session.setAttribute(
                "errorMessage",
                "Cannot delete book. Please set status to INACTIVE first."
            );
            response.sendRedirect("products");
            return;
        }

        // ❌ Còn stock thì không cho delete
        if (bookDAO.hasStock(bookId)) {
            session.setAttribute(
                "errorMessage",
                "Cannot delete book: it still has stock."
            );
            response.sendRedirect("products");
            return;
        }

        // ✅ OK → delete
        bookDAO.deleteBook(bookId);
        session.setAttribute(
            "successMessage",
            "Book deleted successfully!"
        );

    } catch (Exception e) {
        e.printStackTrace();
        session.setAttribute(
            "errorMessage",
            "Error deleting book."
        );
    }

    response.sendRedirect("products");
}


}
