<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en" class="light">
<head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>BookStore Admin - Order Management</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <script id="tailwind-config">
            tailwind.config = {
                darkMode: "class",
                theme: {
                    extend: {
                        colors: {
                            "primary": "#46ec13",
                            "background-light": "#f6f8f6",
                            "background-dark": "#142210",
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
<body class="bg-background-light dark:bg-background-dark text-text-main font-display min-h-screen">

<%@ include file="menuad.jsp" %>

<main class="max-w-7xl mx-auto p-6">

    <h1 class="text-4xl font-black mb-4">Order #${order.orderId}</h1>
    <p class="text-gray-500 mb-6">User ID: ${order.userId} | Status: ${order.status} | Total: ${order.total}</p>

    <div class="bg-white dark:bg-gray-900 rounded-xl shadow-sm border overflow-x-auto">
        <table class="min-w-full table-auto">
            <thead class="bg-gray-50 dark:bg-gray-800 text-xs uppercase text-gray-500 font-bold">
            <tr>
                <th class="px-6 py-4 text-left">Book Title</th>
                <th class="px-6 py-4 text-left">Variant</th>
                <th class="px-6 py-4 text-left">Quantity</th>
                <th class="px-6 py-4 text-left">Price</th>
                <th class="px-6 py-4 text-left">Subtotal</th>
            </tr>
            </thead>
            <tbody class="divide-y">
            <c:forEach var="od" items="${orderDetails}">
                <tr class="hover:bg-gray-50 dark:hover:bg-gray-800">
                    <td class="px-6 py-4 font-bold">${od.bookTitle}</td>
                    <td class="px-6 py-4">${od.variantName}</td>
                    <td class="px-6 py-4">${od.quantity}</td>
                    <td class="px-6 py-4">${od.price}</td>
                    <td class="px-6 py-4 font-semibold">${od.quantity * od.price}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <a href="${pageContext.request.contextPath}/admin/orders" 
       class="mt-4 inline-block px-6 py-2 bg-primary text-black font-bold rounded-lg">Back to Orders</a>

</main>
</body>
</html>
