<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>BookStore Admin - Category Management</title>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@200..700" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms"></script>
    <script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#46ec13",
                        "background-light": "#f6f8f6",
                        "background-dark": "#142210",
                    },
                    fontFamily: {
                        display: ["Manrope", "sans-serif"]
                    }
                }
            }
        }
    </script>
</head>

<body class="bg-background-light dark:bg-background-dark min-h-screen font-display text-gray-900 dark:text-gray-100">

    <%@include file="menuad.jsp" %>

    <main class="max-w-[1280px] mx-auto py-8 px-4">

        <!-- TITLE -->
        <div class="flex flex-col md:flex-row md:items-end justify-between gap-4 pb-4">
            <div>
                <h1 class="text-4xl font-black">Categories</h1>
                <p class="text-gray-500">Manage product categories</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/categories?action=addForm"
               class="h-10 px-4 rounded-lg bg-primary text-black font-bold flex items-center gap-2">
                <span class="material-symbols-outlined">add</span>
                Add New Category
            </a>
        </div>

        <!-- SEARCH + FILTER -->
        <form method="get"
              action="${pageContext.request.contextPath}/admin/categories"
              class="bg-white dark:bg-gray-900 p-4 rounded-xl shadow-sm border flex flex-col md:flex-row gap-4 mb-4">

            <div class="relative w-full md:w-80">
                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">search</span>
                <input name="keyword"
                       value="${keyword}"
                       placeholder="Search category name..."
                       class="w-full pl-10 pr-4 h-10 rounded-lg bg-gray-100 border-none"/>
            </div>

            <div class="relative w-full md:w-40">
                <select name="status" class="w-full h-10 rounded-lg bg-gray-100 border-none">
                    <option value="">All Status</option>
                    <option value="ACTIVE" ${status == 'ACTIVE' ? 'selected' : ''}>Active</option>
                    <option value="INACTIVE" ${status == 'INACTIVE' ? 'selected' : ''}>Inactive</option>
                </select>
            </div>

            <button type="submit"
                    class="h-10 px-6 rounded-lg bg-primary font-bold text-black">
                Apply
            </button>
        </form>
<c:if test="${not empty sessionScope.errorMessage}">
    <div class="mb-4 p-4 rounded-lg bg-red-100 text-red-700 font-semibold">
        ${sessionScope.errorMessage}
    </div>
    <c:remove var="errorMessage" scope="session"/>
</c:if>

<c:if test="${not empty sessionScope.successMessage}">
    <div class="mb-4 p-4 rounded-lg bg-green-100 text-green-700 font-semibold">
        ${sessionScope.successMessage}
    </div>
    <c:remove var="successMessage" scope="session"/>
</c:if>

        <!-- TABLE -->
        <div class="bg-white dark:bg-gray-900 rounded-xl shadow-sm border overflow-x-auto">
            <table class="w-full">
                <thead class="bg-gray-50 text-xs uppercase text-gray-500 font-bold">
                    <tr>
                        <th class="px-6 py-4 text-left">Category</th>
                        <th class="px-6 py-4 text-left">Description</th>
                        <th class="px-6 py-4 text-left">Products</th>
                        <th class="px-6 py-4 text-left">Status</th>
                        <th class="px-6 py-4 text-right">Actions</th>
                    </tr>
                </thead>

                <tbody class="divide-y">
                    <c:forEach var="c" items="${categories}">
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 font-bold">${c.categoryName}</td>
                            <td class="px-6 py-4 text-sm text-gray-600">${c.description}</td>
                            <td class="px-6 py-4 font-semibold">${c.productsCount}</td>
                            <td class="px-6 py-4">
                                <span class="px-3 py-1 rounded-full text-xs font-bold
${c.status == 'ACTIVE' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700'}">
                                    ${c.status}
                                </span>
                            </td>

                            <td class="px-6 py-4 text-right">
                                <!-- Edit -->
                                <a href="${pageContext.request.contextPath}/admin/categories?action=edit&id=${c.categoryId}"
   class="inline-block p-2 text-blue-500">
   <span class="material-symbols-outlined">edit</span>
</a>

<a href="${pageContext.request.contextPath}/admin/categories?action=changeStatus&id=${c.categoryId}&status=${c.status == 'ACTIVE' ? 'INACTIVE' : 'ACTIVE'}"
   class="inline-block p-2 text-orange-500"
   onclick="return confirm('Change status of this category?');">
    <span class="material-symbols-outlined">sync</span>
</a>


<a href="${pageContext.request.contextPath}/admin/categories?action=delete&id=${c.categoryId}"
   class="inline-block p-2 text-gray-700"
   onclick="return confirm('Are you sure to delete this category?');">
   <span class="material-symbols-outlined">delete</span>
</a>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- PAGINATION -->
            <div class="flex items-center justify-between p-4 border-t">
                <span class="text-sm text-gray-500">
                    Showing ${(currentPage-1)*pageSize + 1} -
                    ${currentPage*pageSize > totalCategories ? totalCategories : currentPage*pageSize}
                    of ${totalCategories}
                </span>

                <div class="flex gap-2">
                    <c:if test="${currentPage > 1}">
                        <a class="px-3 py-1 border rounded"
                           href="?page=${currentPage-1}&keyword=${keyword}&status=${status}">Previous</a>
                    </c:if>

                    <c:forEach begin="1" end="${totalPages}" var="p">
                        <a class="px-3 py-1 rounded ${p == currentPage ? 'bg-primary font-bold' : 'border'}"
                           href="?page=${p}&keyword=${keyword}&status=${status}">${p}</a>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <a class="px-3 py-1 border rounded"
                           href="?page=${currentPage+1}&keyword=${keyword}&status=${status}">Next</a>
                    </c:if>
                </div>
            </div>
        </div>

    </main>
</body>
</html>
