<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="light">
<head>
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
<body class="bg-background-light dark:bg-background-dark font-display text-slate-900 antialiased">
<div class="relative flex min-h-screen flex-col">
    <%@ include file="menuad.jsp" %>

    <main class="flex-1 px-6 py-8 md:px-12 lg:px-24">
        <div class="mx-auto max-w-3xl flex flex-col gap-6">

            <!-- Header -->
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div>
                    <h1 class="text-3xl font-extrabold text-slate-900 dark:text-white">
                        <c:choose>
                            <c:when test="${not empty variant}">Edit Variant</c:when>
                            <c:otherwise>Add Variant</c:otherwise>
                        </c:choose>
                    </h1>
                </div>
                <a href="${pageContext.request.contextPath}/admin/product-variants?bookId=${bookId}" 
                   class="inline-flex items-center gap-2 px-5 py-2.5 bg-primary text-white rounded-lg font-bold hover:bg-blue-600">
                    <span class="material-symbols-outlined text-[20px]">arrow_back</span>
                    Back
                </a>
                   <c:if test="${not empty errorMessage}">
    <div class="bg-red-50 text-red-800 font-medium px-4 py-2 rounded-lg mb-4">
        ${errorMessage}
    </div>
</c:if>
            </div>

            <!-- Variant Form -->
            <form action="${pageContext.request.contextPath}/admin/product-variants" method="post"
                  class="bg-white dark:bg-slate-900 shadow-md rounded-xl p-6 flex flex-col gap-4">

                <!-- Hidden fields -->
                <input type="hidden" name="bookId" value="${bookId}"/>
                <c:if test="${not empty variant}">
                    <input type="hidden" name="variantId" value="${variant.variantId}"/>
                </c:if>
                <input type="hidden" name="action" value="${not empty variant ? 'update' : 'insert'}"/>

                <!-- Variant Name -->
                <div class="flex flex-col gap-2">
                    <label class="text-sm font-medium text-slate-700 dark:text-slate-300">Variant Name</label>
                    <input type="text" name="variantName" value="${variant.variantName}" required
                           class="rounded-lg border border-slate-200 bg-slate-50 px-3 py-2 text-sm
                                  dark:bg-slate-800 dark:border-slate-700 dark:text-white
                                  focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary"/>
                </div>

                <!-- Price & Stock -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="flex flex-col gap-2">
                        <label class="text-sm font-medium text-slate-700 dark:text-slate-300">Price</label>
                        <input type="number" step="0.01" name="price" value="${variant.price}" required
                               class="rounded-lg border border-slate-200 bg-slate-50 px-3 py-2 text-sm
                                      dark:bg-slate-800 dark:border-slate-700 dark:text-white
                                      focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary"/>
                    </div>
                    <div class="flex flex-col gap-2">
                        <label class="text-sm font-medium text-slate-700 dark:text-slate-300">Stock</label>
                        <input type="number" name="stock" value="${variant.stock}" required
                               class="rounded-lg border border-slate-200 bg-slate-50 px-3 py-2 text-sm
                                      dark:bg-slate-800 dark:border-slate-700 dark:text-white
                                      focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary"/>
                    </div>
                </div>

                <!-- Status -->
                <div class="flex flex-col gap-2">
                    <label class="text-sm font-medium text-slate-700 dark:text-slate-300">Status</label>
                    <select name="status"
                            class="rounded-lg border border-slate-200 bg-slate-50 px-3 py-2 text-sm
                                   dark:bg-slate-800 dark:border-slate-700 dark:text-white
                                   focus:outline-none focus:ring-1 focus:ring-primary focus:border-primary">
                        <option value="ACTIVE" ${variant.status == 'ACTIVE' ? 'selected' : ''}>Active</option>
                        <option value="INACTIVE" ${variant.status == 'INACTIVE' ? 'selected' : ''}>Inactive</option>
                    </select>
                </div>

                <!-- Buttons -->
                <div class="flex justify-end gap-2 pt-4">
                    <a href="${pageContext.request.contextPath}/admin/product-variants?bookId=${bookId}"
                       class="px-5 py-2.5 bg-slate-200 dark:bg-slate-700 text-slate-900 dark:text-white rounded-lg text-sm font-bold hover:bg-slate-300">
                        Cancel
                    </a>
                    <button type="submit"
                            class="px-5 py-2.5 bg-primary text-white rounded-lg text-sm font-bold hover:bg-blue-600">
                        Save
                    </button>
                </div>

            </form>

        </div>
    </main>
</div>
</body>
</html>
