package controller;

import dao.BookDAO;
import dao.BookVariantDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.Book;
import model.BookVariant;

public class BookVariantServlet extends HttpServlet {

    private final BookVariantDao variantDAO = new BookVariantDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookIdRaw = request.getParameter("bookId");
        if (bookIdRaw == null) {
            response.sendRedirect(request.getContextPath() + "/admin/products");
            return;
        }
        int bookId = Integer.parseInt(bookIdRaw);

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "edit":
                int variantId = Integer.parseInt(request.getParameter("variantId"));
                BookVariant v = variantDAO.getVariantById(variantId);
                request.setAttribute("variant", v);
                request.setAttribute("bookId", bookId);
                request.getRequestDispatcher("/admin/variant-form.jsp").forward(request, response);
                break;

            default: // list
                Book book = new BookDAO().getBookById(bookId);
                List<BookVariant> variants = variantDAO.getVariantsByBookId(bookId);

                request.setAttribute("book", book);
                request.setAttribute("bookId", bookId);
                request.setAttribute("variants", variants);

                request.getRequestDispatcher("/admin/variant-management.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String action = request.getParameter("action");

        /* ================= INSERT / UPDATE ================= */
        if ("insert".equals(action) || "update".equals(action)) {

            String name = request.getParameter("variantName");
            double price;
            int stock;
            String status = request.getParameter("status");

            String error = null;

            if (name == null || name.trim().isEmpty()) {
                error = "Variant name cannot be empty.";
            }

            try {
                price = Double.parseDouble(request.getParameter("price"));
                if (price < 0) error = "Price cannot be negative.";
            } catch (Exception e) {
                error = "Invalid price.";
                price = 0;
            }

            try {
                stock = Integer.parseInt(request.getParameter("stock"));
                if (stock < 0) error = "Stock cannot be negative.";
            } catch (Exception e) {
                error = "Invalid stock.";
                stock = 0;
            }

            if ("update".equals(action) && error == null) {
                if ("INACTIVE".equals(status) && stock > 0) {
                    error = "Cannot set INACTIVE while stock > 0.";
                }
            }

            if (error != null) {
                request.getSession().setAttribute("error", error);
                response.sendRedirect(request.getContextPath()
                        + "/admin/product-variants?bookId=" + bookId);
                return;
            }

            if ("insert".equals(action)) {
                BookVariant v = new BookVariant();
                v.setBookId(bookId);
                v.setVariantName(name);
                v.setPrice(price);
                v.setStock(stock);
                v.setStatus("ACTIVE");

                variantDAO.addVariant(v);
                request.getSession().setAttribute("success", "Variant added successfully.");
            } else {
                BookVariant v = new BookVariant();
                v.setVariantId(Integer.parseInt(request.getParameter("variantId")));
                v.setBookId(bookId);
                v.setVariantName(name);
                v.setPrice(price);
                v.setStock(stock);
                v.setStatus(status);

                variantDAO.updateVariant(v);
                request.getSession().setAttribute("success", "Variant updated successfully.");
            }

            response.sendRedirect(request.getContextPath()
                    + "/admin/product-variants?bookId=" + bookId);
            return;
        }

        /* ================= DELETE ================= */
     /* ================= DELETE ================= */
if ("delete".equals(action)) {

    int variantId = Integer.parseInt(request.getParameter("variantId"));
    BookVariant v = variantDAO.getVariantById(variantId);

    if (v == null) {
        request.getSession().setAttribute(
            "error",
            "Variant not found."
        );
    }
    else if (variantDAO.isVariantInAnyOrder(variantId)) {
        request.getSession().setAttribute(
            "error",
            "Cannot delete. Variant exists in orders."
        );
    }
    else if (v.getStock() > 0) {
        request.getSession().setAttribute(
            "error",
            "Cannot delete variant with stock > 0."
        );
    }
    else if (!"INACTIVE".equals(v.getStatus())) {
        request.getSession().setAttribute(
            "error",
            "Please set variant to INACTIVE before deleting."
        );
    }
    else {
        variantDAO.hardDeleteVariant(variantId);
        request.getSession().setAttribute(
            "success",
            "Variant deleted permanently."
        );
    }

    response.sendRedirect(
        request.getContextPath()
        + "/admin/product-variants?bookId=" + bookId
    );
    return;
}

/* ================= SYNC ================= */
if ("sync".equals(action)) {

    int variantId = Integer.parseInt(request.getParameter("variantId"));
    BookVariant v = variantDAO.getVariantById(variantId);

    if (v == null) {
    request.getSession().setAttribute("error", "Variant not found.");
    response.sendRedirect(request.getContextPath() + "/admin/product-variants?bookId=" + bookId);
    return;
}

if (variantDAO.isVariantInAnyOrder(variantId)) {
    request.getSession().setAttribute("error", "Cannot delete. Variant exists in orders.");
    response.sendRedirect(request.getContextPath() + "/admin/product-variants?bookId=" + bookId);
    return;
}

if (v.getStock() > 0) {
    request.getSession().setAttribute("error", "Cannot delete variant with stock > 0.");
    response.sendRedirect(request.getContextPath() + "/admin/product-variants?bookId=" + bookId);
    return;
}

if (!"INACTIVE".equals(v.getStatus())) {
    request.getSession().setAttribute("error", "Please set variant to INACTIVE before deleting.");
    response.sendRedirect(request.getContextPath() + "/admin/product-variants?bookId=" + bookId);
    return;
}

// OK → xóa thật
variantDAO.hardDeleteVariant(variantId);
request.getSession().setAttribute("success", "Variant deleted permanently.");
response.sendRedirect(request.getContextPath() + "/admin/product-variants?bookId=" + bookId);
}


    }
}
