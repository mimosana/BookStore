<%-- 
    Document   : productManagement
    Created on : Dec 15, 2025, 11:49:35 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Bookstore Admin - Product Management</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700;800&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <script id="tailwind-config">
            tailwind.config = {
                darkMode: "class",
                theme: {
                    extend: {
                        colors: {
                            "primary": "#197fe6",
                            "background-light": "#f6f7f8",
                            "background-dark": "#111921",
                        },
                        fontFamily: {
                            "display": ["Manrope", "sans-serif"]
                        },
                        borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                    },
                },
            }
        </script>
    </head>
    <body class="bg-background-light dark:bg-background-dark font-display text-slate-900 antialiased overflow-x-hidden">
        <div class="relative flex min-h-screen flex-col">
            <%@include file="menuad.jsp" %>
            <main class="flex-1 px-6 py-8 md:px-12 lg:px-24">
                <div class="mx-auto max-w-7xl w-full flex flex-col gap-6">
                    <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                        <div>
                            <h1 class="text-3xl font-extrabold text-slate-900 tracking-tight dark:text-white">Product Inventory</h1>
                            <p class="text-slate-500 mt-1 text-sm dark:text-slate-400">Manage your book catalog, update prices, and track stock.</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/products?action=add"
                           class="inline-flex items-center justify-center gap-2 rounded-lg bg-primary px-5 py-2.5 text-sm font-bold text-white shadow-sm hover:bg-blue-600 transition-colors focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2">
                            <span class="material-symbols-outlined text-[20px]">add</span>
                            <span>Add New Product</span>
                        </a>

                    </div>
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 rounded-xl bg-white p-4 shadow-sm border border-slate-200 dark:bg-slate-900 dark:border-slate-800">
                        <form method="get" action="${pageContext.request.contextPath}/admin/products" class="lg:col-span-12 grid grid-cols-1 lg:grid-cols-12 gap-4">
                            <!-- SEARCH -->
                            <div class="lg:col-span-3 relative">
                                <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400">search</span>
                                <input name="keyword" value="${keyword}" class="w-full rounded-lg border-slate-200 bg-slate-50 pl-10 py-2.5 text-sm focus:border-primary focus:ring-primary dark:bg-slate-800 dark:border-slate-700 dark:text-white" placeholder="Search by title, author..." type="text"/>
                            </div>

                            <!-- STATUS FILTER -->
                            <div class="lg:col-span-3">
                                <select name="status" class="w-full rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm dark:bg-slate-800 dark:border-slate-700 dark:text-white">
                                    <option value="ALL" ${statusFilter == null || statusFilter == 'ALL' ? 'selected' : ''}>All Status</option>
                                    <option value="ACTIVE" ${statusFilter == 'ACTIVE' ? 'selected' : ''}>Active</option>
                                    <option value="INACTIVE" ${statusFilter == 'INACTIVE' ? 'selected' : ''}>Inactive</option>
                                </select>
                            </div>

                            <!-- CATEGORY FILTER -->
                            <div class="lg:col-span-3">
                                <select name="categoryId" class="w-full rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm dark:bg-slate-800 dark:border-slate-700 dark:text-white">
                                    <option value="0">All Categories</option>
                                    <c:forEach var="c" items="${categories}">
                                        <option value="${c.categoryId}" ${categoryFilter != null && categoryFilter == c.categoryId ? 'selected' : ''}>${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- SUBMIT -->
                            <div class="lg:col-span-3">
                                <button type="submit" class="flex items-center gap-2 w-full justify-center rounded-lg bg-emerald-600 px-5 py-2.5 text-sm font-bold text-white hover:bg-emerald-700 transition-colors">
                                    <span class="material-symbols-outlined text-[20px]">filter_list</span>
                                    <span>Apply</span>
                                </button>
                            </div>
                        </form>
                        <c:if test="${not empty sessionScope.successMessage}">
                            <div class="lg:col-span-12 rounded-lg bg-emerald-50 px-6 py-2 text-emerald-800 font-medium">
                                ${sessionScope.successMessage}
                            </div>
                            <c:remove var="successMessage" scope="session"/>
                        </c:if>

                        <c:if test="${not empty sessionScope.errorMessage}">
                            <div class="lg:col-span-12 rounded-lg bg-red-50 px-6 py-2 text-red-800 font-medium">
                                ${sessionScope.errorMessage}
                            </div>
                            <c:remove var="errorMessage" scope="session"/>
                        </c:if>



                    </div>
                    <div class="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm dark:bg-slate-900 dark:border-slate-800">
                        <div class="overflow-x-auto">
                            <table class="w-full text-left text-sm text-slate-600 dark:text-slate-400">
                                <thead class="bg-slate-50 text-xs font-semibold uppercase text-slate-500 dark:bg-slate-800 dark:text-slate-400">
                                    <tr>
                                        <th class="px-6 py-4" scope="col">Product</th>
                                        <th class="px-6 py-4" scope="col">Author</th>
                                        <th class="px-6 py-4" scope="col">Price</th>
                                        <th class="px-6 py-4" scope="col">Stock</th>
                                        <th class="px-6 py-4" scope="col">Status</th>
                                        <th class="px-6 py-4 text-right" scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-100 dark:divide-slate-800 border-t border-slate-100 dark:border-slate-800">

                                    <c:forEach items="${books}" var="b">
                                        <tr class="hover:bg-slate-50/80 transition-colors dark:hover:bg-slate-800/50">

                                            <!-- PRODUCT -->
                                            <td class="px-6 py-4 align-middle">
                                                <div class="flex items-center gap-4">
                                                    <div class="h-12 w-9 shrink-0 overflow-hidden rounded bg-slate-200 shadow-sm">
                                                        <img class="h-full w-full object-cover"
                                                             src="${b.image}"
                                                             onerror="this.src='https://via.placeholder.com/80x120?text=Book'"/>
                                                    </div>
                                                    <div>
                                                        <p class="font-bold text-slate-900 dark:text-white">
                                                            ${b.title}
                                                        </p>
                                                        <p class="text-xs text-slate-500">
                                                            Category: ${b.categoryName}
                                                        </p>
                                                    </div>
                                                </div>
                                            </td>

                                            <!-- AUTHOR -->
                                            <td class="px-6 py-4 align-middle font-medium">
                                                ${b.author}
                                            </td>

                                            <!-- PRICE -->
                                            <!-- PRICE -->
                                            <td class="px-6 py-4 font-bold text-slate-900 dark:text-white">
                                                <c:choose>
                                                    <c:when test="${b.minPrice > 0}">
                                                        <fmt:formatNumber value="${b.minPrice}" type="currency"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        N/A
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                            <!-- STOCK -->
                                            <td class="px-6 py-4">
                                                <c:choose>
                                                    <c:when test="${b.totalStock > 0}">
                                                        ${b.totalStock}
                                                    </c:when>
                                                    <c:otherwise>
                                                        0
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>




                                            <!-- STATUS -->
                                            <td class="px-6 py-4 align-middle">
                                                <c:choose>
                                                    <c:when test="${b.status == 'ACTIVE'}">
                                                        <span class="inline-flex items-center rounded-full bg-emerald-50 px-2.5 py-0.5 text-xs font-medium text-emerald-700">
                                                            Active
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="inline-flex items-center rounded-full bg-slate-100 px-2.5 py-0.5 text-xs font-medium text-slate-600">
                                                            Inactive
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                            <!-- ACTIONS -->
                                            <td class="px-6 py-4 align-middle text-right">
                                                <div class="flex items-center justify-end gap-3">

                                                    <a href="${pageContext.request.contextPath}/admin/product-variants?bookId=${b.bookId}"
                                                       class="inline-flex items-center justify-center rounded-lg bg-emerald-50 px-3 py-1.5 text-xs font-bold text-emerald-700 hover:bg-emerald-100">
                                                        Manage Variants
                                                    </a>

                                                    <a href="${pageContext.request.contextPath}/admin/products?action=edit&bookId=${b.bookId}"
                                                       class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-emerald-50 hover:text-emerald-600">
                                                        <span class="material-symbols-outlined text-[20px]">edit</span>
                                                    </a>

                                                    <form action="${pageContext.request.contextPath}/admin/products" method="post" onsubmit="return confirm('Delete this book?')">
                                                        <input type="hidden" name="action" value="delete"/>
                                                        <input type="hidden" name="bookId" value="${b.bookId}"/>
                                                        <button type="submit" class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-red-50 hover:text-red-600">
                                                            <span class="material-symbols-outlined text-[20px]">delete</span>
                                                        </button>
                                                    </form>
                                                    <form action="${pageContext.request.contextPath}/admin/products"
                                                          method="post"
                                                          onsubmit="return confirm('Change status of this book?')">

                                                        <input type="hidden" name="action" value="changeStatus"/>
                                                        <input type="hidden" name="bookId" value="${b.bookId}"/>
                                                        <input type="hidden" name="status"
                                                               value="${b.status == 'ACTIVE' ? 'INACTIVE' : 'ACTIVE'}"/>

                                                        <button type="submit"
                                                                class="flex h-8 w-8 items-center justify-center rounded-lg
                                                                text-slate-500 hover:bg-yellow-50 hover:text-yellow-600">
                                                            <span class="material-symbols-outlined text-[20px]">sync</span>
                                                        </button>
                                                    </form>





                                                </div>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                    <c:if test="${empty books}">
                                        <tr>
                                            <td colspan="6" class="text-center py-8 text-slate-400">
                                                No books found
                                            </td>
                                        </tr>
                                    </c:if>

                                </tbody>

                            </table>
                        </div>
                        <div class="flex items-center justify-between border-t border-slate-200 bg-white px-6 py-4 dark:bg-slate-900 dark:border-slate-800">

                            <p class="text-sm text-slate-500">
                                Showing page <b>${currentPage}</b> of <b>${totalPages}</b> |
                                Total books: <b>${totalBooks}</b>
                            </p>

                            <div class="flex gap-2">

                                <!-- PREVIOUS -->
                                <a href="${pageContext.request.contextPath}/admin/products?page=${currentPage - 1}"
                                   class="inline-flex items-center rounded-lg border px-3 py-1.5 text-sm font-medium
                                   ${currentPage == 1 ? 'pointer-events-none opacity-50' : ''}">
                                    Previous
                                </a>

                                <!-- NEXT -->
                                <a href="${pageContext.request.contextPath}/admin/products?page=${currentPage + 1}"
                                   class="inline-flex items-center rounded-lg border px-3 py-1.5 text-sm font-medium
                                   ${currentPage == totalPages ? 'pointer-events-none opacity-50' : ''}">
                                    Next
                                </a>

                            </div>
                        </div>

                    </div>
                </div>
            </main>
        </div>
    </body></html>
