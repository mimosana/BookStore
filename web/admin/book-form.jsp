<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title><c:choose><c:when test="${book != null}">Edit Book</c:when><c:otherwise>Add Book</c:otherwise></c:choose></title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: { "primary": "#46ec13", "background-light": "#f6f8f6", "background-dark": "#142210" },
                    fontFamily: { "display": ["Manrope", "sans-serif"] }
                }
            }
        }
    </script>
</head>
<body class="bg-background-light dark:bg-background-dark min-h-screen font-display text-gray-900 dark:text-gray-100">

<jsp:include page="menuad.jsp"/>

<main class="ml-64 p-8">
    <!-- Breadcrumb -->
    <nav class="flex flex-wrap gap-2 items-center text-sm mb-4">
        <a class="text-gray-500 hover:text-primary" href="#">Dashboard</a>
        <span class="text-gray-400 material-symbols-outlined text-sm">chevron_right</span>
        <a class="text-gray-500 hover:text-primary" href="#">Products</a>
        <span class="text-gray-400 material-symbols-outlined text-sm">chevron_right</span>
        <span class="text-gray-900 dark:text-white font-medium"><c:choose><c:when test="${book != null}">Edit Book</c:when><c:otherwise>Add Book</c:otherwise></c:choose></span>
    </nav>

   <c:if test="${not empty error}">
    <div class="mb-4 rounded-lg bg-red-50 px-6 py-3 text-red-800 font-medium">
        ${error}
    </div>
</c:if>

<c:if test="${not empty success}">
    <div class="mb-4 rounded-lg bg-emerald-50 px-6 py-3 text-emerald-800 font-medium">
        ${success}
    </div>
</c:if>

    <!-- Form -->
    <form method="post" action="products" class="flex flex-col gap-6">
        <c:choose>
            <c:when test="${book != null}">
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="bookId" value="${book.bookId}"/>
            </c:when>
            <c:otherwise>
                <input type="hidden" name="action" value="insert"/>
            </c:otherwise>
        </c:choose>

        <!-- General Information -->
        <section class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800">
            <h3 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
                <span class="material-symbols-outlined text-primary">edit_note</span>
                General Information
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4">
                <label class="flex flex-col gap-2 md:col-span-2">
                    <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Book Title</span>
                    <input name="title" value="${book.title}" type="text" placeholder="Book title"
                           class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary h-12 px-4"/>
                </label>
                <label class="flex flex-col gap-2">
                    <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Author</span>
                    <input name="author" value="${book.author}" type="text" placeholder="Author name"
                           class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 h-12 px-4 focus:border-primary focus:ring-1 focus:ring-primary"/>
                </label>
               
            </div>
            <label class="flex flex-col gap-2 mt-4">
                <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Description</span>
                <textarea name="description" placeholder="Book description"
                          class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 p-4 focus:border-primary focus:ring-1 focus:ring-primary min-h-[120px]">${book.description}</textarea>
            </label>
        </section>

        <!-- Inventory -->
        <section class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800">
            <h3 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
                <span class="material-symbols-outlined text-primary">inventory_2</span>
                Inventory & Pricing
            </h3>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mt-4">
                <label class="flex flex-col gap-2">
                    <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Category</span>
                    <select name="categoryId" class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 h-12 px-4">
                        <c:forEach var="c" items="${categories}">
                            <option value="${c.categoryId}" <c:if test="${book != null && book.categoryId == c.categoryId}">selected</c:if>>${c.categoryName}</option>
                        </c:forEach>
                    </select>
                </label>
                <label class="flex flex-col gap-2">
                    <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Status</span>
                    <select name="status" class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 h-12 px-4">
                        <option value="ACTIVE" <c:if test="${book != null && book.status=='ACTIVE'}">selected</c:if>>Active</option>
                        <option value="INACTIVE" <c:if test="${book != null && book.status=='INACTIVE'}">selected</c:if>>Inactive</option>
                    </select>
                </label>
            </div>
        </section>

        <!-- Cover -->
        <section class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800">
            <h3 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
                <span class="material-symbols-outlined text-primary">image</span>
                Book Cover
            </h3>
            <input name="image" type="text" placeholder="Cover image URL" value="${book.image}"
                   class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 h-12 px-4 mt-4"/>
        </section>

        <!-- Buttons -->
        <div class="flex items-center justify-end gap-4 mt-4">
            <a href="${pageContext.request.contextPath}/admin/products"
               class="px-6 py-2 border rounded-lg text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-800">Cancel</a>
            <button type="submit"
                    class="px-8 py-2 bg-primary hover:bg-[#3bdb0b] text-[#111b0d] font-bold rounded-lg">Save Book</button>
        </div>
    </form>
</main>
</body>
</html>
