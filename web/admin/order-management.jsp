<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="menuad.jsp" %>

<!DOCTYPE html>
<html class="light" lang="en">
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
    <body class="bg-background-light dark:bg-background-dark min-h-screen flex flex-col font-display antialiased text-gray-900 dark:text-gray-100 overflow-x-hidden">

        <main class="flex-1 flex flex-col items-center py-8 px-4 md:px-10 w-full">
            <div class="w-full max-w-[1280px] flex flex-col gap-6">
                <!-- Breadcrumb & Title -->
                <nav class="flex flex-wrap gap-2 items-center text-sm">
                    <a class="text-gray-500 hover:text-primary dark:text-gray-400" href="#">Dashboard</a>
                    <span class="text-gray-400 material-symbols-outlined text-sm">chevron_right</span>
                    <span class="text-gray-900 dark:text-white font-medium">Order Management</span>
                </nav>
                <div class="flex flex-col md:flex-row md:items-end justify-between gap-4 pb-2">
                    <div class="flex flex-col gap-2">
                        <h1 class="text-3xl md:text-4xl font-black leading-tight tracking-tight text-gray-900 dark:text-white">Orders</h1>
                        <p class="text-gray-500 dark:text-gray-400 text-base">View and manage customer orders, track status, and process shipments.</p>
                    </div>
                </div>

                <!-- Filter -->
                <form method="get" class="bg-white dark:bg-gray-900 p-4 rounded-xl shadow-sm border flex flex-col md:flex-row gap-4">
                    <input type="text" name="userId" placeholder="Search by User ID" value="${userId}"
                           class="px-3 py-2 rounded-lg border w-full md:w-48"/>
                    <select name="status" class="px-3 py-2 rounded-lg border w-full md:w-48">
                        <option value="">All Status</option>
                        <option value="PENDING" ${status=='PENDING'?'selected':''}>Pending</option>
                        <option value="DELIVERED" ${status=='DELIVERED'?'selected':''}>Delivered</option>
                        <option value="CANCELLED" ${status=='CANCELLED'?'selected':''}>Cancelled</option>

                    </select>
                    <button type="submit" class="px-6 py-2 bg-primary text-black font-bold rounded-lg">Apply</button>
                </form>
<c:if test="${not empty sessionScope.success}">
    <div class="bg-green-100 text-green-800 px-4 py-2 rounded mb-4">
        ${sessionScope.success}
    </div>
    <c:remove var="success" scope="session"/>
</c:if>

<c:if test="${not empty sessionScope.error}">
    <div class="bg-red-100 text-red-800 px-4 py-2 rounded mb-4">
        ${sessionScope.error}
    </div>
    <c:remove var="error" scope="session"/>
</c:if>

                <!-- Orders Table -->
                <div class="bg-white dark:bg-gray-900 rounded-xl shadow-sm border overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead class="bg-gray-50 dark:bg-gray-800/50 text-xs uppercase text-gray-500 font-bold tracking-wider">
                            <tr>
                                <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Order ID</th>
                                <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">User ID</th>
                                <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Date</th>
                                <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Total</th>
                                <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Status</th>
                                <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800 text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100 dark:divide-gray-800">
                            <c:forEach var="o" items="${orders}">
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors group">
                                    <td class="px-6 py-4 font-mono font-medium text-gray-900 dark:text-white">${o.orderId}</td>
                                    <td class="px-6 py-4">${o.userId}</td>
                                    <td class="px-6 py-4 text-sm text-gray-600 dark:text-gray-400">${o.orderDate}</td>
                                    <td class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-white">${o.total}</td>
                                    <td class="px-6 py-4">
                                        <form method="post" class="relative w-full min-w-[130px]">
                                            <input type="hidden" name="action" value="changeStatus"/>
                                            <input type="hidden" name="orderId" value="${o.orderId}"/>
                                            <input type="hidden" name="userId" value="${userId}"/>
                                            <input type="hidden" name="statusFilter" value="${status}"/>
                                            <input type="hidden" name="page" value="${currentPage}"/>
                                            <select name="status" class="w-full h-10 pl-3 pr-8 rounded-lg bg-background-light dark:bg-gray-800 border-none text-sm text-gray-700 dark:text-gray-300 focus:ring-1 focus:ring-primary appearance-none cursor-pointer"
                                                    onchange="if (confirm('Are you sure you want to change the status?')) {
                                                                this.form.submit();
                                                            } else {
                                                                this.value = '${o.status}';
                                                            }">
                                                <option value="PENDING" ${o.status=='PENDING'?'selected':''}>Pending</option>
                                                <option value="DELIVERED" ${o.status=='DELIVERED'?'selected':''}>Delivered</option>
                                                <option value="CANCELLED" ${o.status=='CANCELLED'?'selected':''}>Cancelled</option>
                                                       
                                            </select>
                                            <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 pointer-events-none text-[16px]">expand_more</span>
                                        </form>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <a href="${pageContext.request.contextPath}/admin/orders?action=view&orderId=${o.orderId}"
                                           class="text-gray-400 hover:text-primary transition-colors p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700"
                                           title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">visibility</span>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="flex items-center justify-between p-4 border-t border-gray-100 dark:border-gray-800">
                    <span class="text-sm text-gray-500 dark:text-gray-400">
                        Showing ${orders.size()} of ${totalOrders} orders
                    </span>
                    <div class="flex items-center gap-2">
                        <c:choose>
                            <c:when test="${currentPage > 1}">
                                <a href="?page=${currentPage-1}&userId=${userId}&status=${status}"
                                   class="px-3 py-1 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 text-sm hover:bg-gray-50 dark:hover:bg-gray-800">Previous</a>
                            </c:when>
                            <c:otherwise>
                                <button class="px-3 py-1 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 text-sm opacity-50 cursor-not-allowed">Previous</button>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <span class="px-3 py-1 rounded-lg bg-primary text-black text-sm font-bold shadow-sm">${i}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="?page=${i}&userId=${userId}&status=${status}"
                                       class="px-3 py-1 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 text-sm hover:bg-gray-50 dark:hover:bg-gray-800">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${currentPage < totalPages}">
                                <a href="?page=${currentPage+1}&userId=${userId}&status=${status}"
                                   class="px-3 py-1 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 text-sm hover:bg-gray-50 dark:hover:bg-gray-800">Next</a>
                            </c:when>
                            <c:otherwise>
                                <button class="px-3 py-1 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 text-sm opacity-50 cursor-not-allowed">Next</button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </div>
        </main>

    </body>
</html>
