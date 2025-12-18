<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en" class="light">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Bookstore Admin - Variant Management</title>

    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700;800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms"></script>
</head>

<body class="bg-background-light font-display text-slate-900 antialiased">
<div class="relative flex min-h-screen flex-col">

    <%@ include file="menuad.jsp" %>

    <main class="flex-1 px-6 py-8 md:px-12 lg:px-24">
        <div class="mx-auto max-w-7xl flex flex-col gap-6">

            <!-- HEADER -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div>
                    <h1 class="text-3xl font-extrabold">
                        Variants for "${book.title}"
                    </h1>
                    <p class="text-slate-500 text-sm mt-1">
                        Manage variants, prices and stock
                    </p>
                </div>

                <a href="${pageContext.request.contextPath}/admin/products"
                   class="inline-flex items-center gap-2 rounded-lg bg-blue-600 px-5 py-2.5 text-sm font-bold text-white hover:bg-blue-700">
                    <span class="material-symbols-outlined">arrow_back</span>
                    Back to Products
                </a>
            </div>

            <!-- ================= NOTIFICATION (THÊM) ================= -->
            <c:if test="${not empty sessionScope.success}">
                <div class="rounded-lg bg-emerald-50 px-6 py-3 text-emerald-800 font-medium">
                    ${sessionScope.success}
                </div>
                <c:remove var="success" scope="session"/>
            </c:if>

            <c:if test="${not empty sessionScope.error}">
                <div class="rounded-lg bg-red-50 px-6 py-3 text-red-800 font-medium">
                    ${sessionScope.error}
                </div>
                <c:remove var="error" scope="session"/>
            </c:if>
            <!-- ======================================================= -->

            <!-- ADD VARIANT FORM -->
            <div class="bg-white shadow rounded-xl p-6">
                <form action="${pageContext.request.contextPath}/admin/product-variants"
                      method="post"
                      class="flex flex-col gap-4">

                    <input type="hidden" name="bookId" value="${bookId}"/>
                    <input type="hidden" name="action" value="insert"/>

                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <input name="variantName" type="text" placeholder="Variant Name"
                               class="border rounded px-3 py-2 text-sm"/>

                        <input name="price" type="number" step="0.01" placeholder="Price"
                               class="border rounded px-3 py-2 text-sm"/>

                        <input name="stock" type="number" placeholder="Stock"
                               class="border rounded px-3 py-2 text-sm"/>
                    </div>

                    <button type="submit"
                            class="w-36 rounded-lg bg-emerald-600 px-4 py-2 text-white font-bold hover:bg-emerald-700">
                        Add Variant
                    </button>
                </form>
            </div>

            <!-- VARIANT TABLE -->
            <div class="overflow-hidden rounded-xl border bg-white shadow-sm">
                <table class="w-full text-sm text-slate-600">
                    <thead class="bg-slate-50 text-xs font-semibold uppercase text-slate-500">
                    <tr>
                        <th class="px-6 py-3">Variant Name</th>
                        <th class="px-6 py-3">Price</th>
                        <th class="px-6 py-3">Stock</th>
                        <th class="px-6 py-3">Status</th>
                        <th class="px-6 py-3 text-right">Actions</th>
                    </tr>
                    </thead>

                    <tbody class="divide-y">
                    <c:forEach items="${variants}" var="v">
                        <tr class="hover:bg-slate-50 transition">

                            <td class="px-6 py-3">${v.variantName}</td>

                            <td class="px-6 py-3 font-bold">
                                <fmt:formatNumber value="${v.price}" type="currency"/>
                            </td>

                            <td class="px-6 py-3">${v.stock}</td>

                            <td class="px-6 py-3">
                                <c:choose>
                                    <c:when test="${v.status == 'ACTIVE'}">
                                        <span class="rounded-full bg-emerald-50 px-3 py-1 text-xs font-semibold text-emerald-700">
                                            ACTIVE
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="rounded-full bg-slate-100 px-3 py-1 text-xs font-semibold text-slate-600">
                                            INACTIVE
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <!-- ================= ACTIONS (SYNC RULE) ================= -->
                            <td class="px-6 py-3 text-right flex justify-end gap-2">

                                <!-- EDIT -->
                                <a href="${pageContext.request.contextPath}/admin/product-variants?action=edit&variantId=${v.variantId}&bookId=${bookId}"
                                   class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-emerald-50 hover:text-emerald-600">
                                    <span class="material-symbols-outlined">edit</span>
                                </a>
                                   <!-- SYNC -->
<form action="${pageContext.request.contextPath}/admin/product-variants"
      method="post">

    <input type="hidden" name="action" value="sync"/>
    <input type="hidden" name="variantId" value="${v.variantId}"/>
    <input type="hidden" name="bookId" value="${bookId}"/>

    <button type="submit"
            title="Sync status with stock"
            class="flex h-8 w-8 items-center justify-center rounded-lg
                   text-slate-500 hover:bg-blue-50 hover:text-blue-600">
        <span class="material-symbols-outlined">sync</span>
    </button>
</form>


                                <!-- DELETE (always enabled) -->
<form action="${pageContext.request.contextPath}/admin/product-variants"
      method="post"
      onsubmit="return confirm('Delete this variant?')">

    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="variantId" value="${v.variantId}"/>
    <input type="hidden" name="bookId" value="${bookId}"/>

    <button type="submit"
            class="flex h-8 w-8 items-center justify-center rounded-lg
                   text-slate-500 hover:bg-red-50 hover:text-red-600">
        <span class="material-symbols-outlined">delete</span>
    </button>
</form>

                            </td>
                            <!-- ======================================================= -->

                        </tr>
                    </c:forEach>

                    <c:if test="${empty variants}">
                        <tr>
                            <td colspan="5" class="py-8 text-center text-slate-400">
                                No variants found
                            </td>
                        </tr>
                    </c:if>

                    </tbody>
                </table>
            </div>

        </div>
    </main>
</div>
</body>
</html>
