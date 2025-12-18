package controller;

import dao.CategoryDAO;
import model.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/categories")
public class CategoryManagementServlet extends HttpServlet {

    private CategoryDAO dao;

    @Override
    public void init() {
        dao = new CategoryDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        /* ================== EDIT ================== */
        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Category c = dao.getCategoryById(id);
            request.setAttribute("category", c);
            request.getRequestDispatcher("/admin/editCategory.jsp").forward(request, response);
            return;
        }

        /* ================== CHANGE STATUS ================== */
        if ("changeStatus".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String newStatus = request.getParameter("status");

            Category c = dao.getCategoryById(id);

            if (c == null) {
                request.getSession().setAttribute("errorMessage", "Category not found!");
            } // Chỉ chặn khi muốn INACTIVE mà còn product
            else if ("INACTIVE".equalsIgnoreCase(newStatus) && dao.hasProducts(id)) {
                request.getSession().setAttribute(
                        "errorMessage",
                        "Category still has products, cannot set to INACTIVE!"
                );
            } else {
                dao.changeStatus(id, newStatus);
                request.getSession().setAttribute(
                        "successMessage",
                        "Category status updated successfully!"
                );
            }

            response.sendRedirect(request.getContextPath() + "/admin/categories");
            return;
        }

        /* ================== DELETE ================== */
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Category c = dao.getCategoryById(id);

            if (c == null) {
                request.getSession().setAttribute("errorMessage", "Category does not exist!");
            } else if ("ACTIVE".equalsIgnoreCase(c.getStatus())) {
                request.getSession().setAttribute("errorMessage", "Cannot delete: category is ACTIVE!");
            } else if (dao.getProductsCount(id) > 0) {
                request.getSession().setAttribute("errorMessage", "Cannot delete: category still has products!");
            } else {
                dao.deleteCategory(id);
                request.getSession().setAttribute("successMessage", "Category deleted successfully!");
            }

            response.sendRedirect(request.getContextPath() + "/admin/categories");
            return;
        }

        /* ================== ADD FORM ================== */
        if ("addForm".equals(action)) {
            request.getRequestDispatcher("/admin/addCategory.jsp").forward(request, response);
            return;
        }

        /* ================== LIST + SEARCH + FILTER + PAGE ================== */
        String keyword = request.getParameter("keyword");
        String status = request.getParameter("status");

        int page = 1;
        int pageSize = 5;

        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        int totalCategories = dao.countCategories(keyword, status);
        int totalPages = (int) Math.ceil((double) totalCategories / pageSize);

        List<Category> list = dao.searchCategories(keyword, status, page, pageSize);

        request.setAttribute("categories", list);
        request.setAttribute("keyword", keyword);
        request.setAttribute("status", status);
        request.setAttribute("currentPage", page);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalCategories", totalCategories);

        request.getRequestDispatcher("/admin/categoryManagement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        try {

            if ("add".equals(action)) {
                String name = request.getParameter("categoryName");
                String description = request.getParameter("description");
                String status = request.getParameter("status");

                if (dao.isCategoryNameExists(name)) {
                    request.setAttribute("error", "Category name already exists!");
                    request.setAttribute("oldName", name);
                    request.setAttribute("oldDesc", description);
                    request.setAttribute("oldStatus", status);

                    request.getRequestDispatcher("/admin/addCategory.jsp")
                            .forward(request, response);
                    return; // ⭐ BẮT BUỘC
                }

                Category c = new Category();
                c.setCategoryName(name);
                c.setDescription(description);
                c.setStatus(status);
                dao.addCategory(c);

                response.sendRedirect(request.getContextPath() + "/admin/categories");
                return;
            }

            if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("categoryId"));
                String name = request.getParameter("categoryName");
                String description = request.getParameter("description");
                String status = request.getParameter("status");
                Category old = dao.getCategoryById(id);
                if (dao.isCategoryNameExistsExceptId(name, id)) {
                    Category c = new Category();
                    c.setCategoryId(id);
                    c.setCategoryName(name);
                    c.setDescription(description);
                    c.setStatus(status);

                    request.setAttribute("error", "Category name already exists!");
                    request.setAttribute("category", c);

                    request.getRequestDispatcher("/admin/editCategory.jsp")
                            .forward(request, response);
                    return; // ⭐ BẮT BUỘC
                }
               if ("INACTIVE".equals(status) && dao.hasProducts(id)) {

    Category c = new Category();
    c.setCategoryId(id);
    c.setCategoryName(name);
    c.setDescription(description);
    c.setStatus(old.getStatus()); // giữ status cũ

    request.setAttribute("error",
            "Cannot set INACTIVE: category still has products!");
    request.setAttribute("category", c);

    request.getRequestDispatcher("/admin/editCategory.jsp")
           .forward(request, response);
    return;
}


                Category c = new Category();
                c.setCategoryId(id);
                c.setCategoryName(name);
                c.setDescription(description);
                c.setStatus(status);
                dao.updateCategory(c);

                response.sendRedirect(request.getContextPath() + "/admin/categories");
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/categories");
        }
    }

}
