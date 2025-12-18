<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="light" lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>BookStore Admin - Customer Management</title>
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

        <%@include file="menuad.jsp" %>

        <main class="flex-1 flex flex-col items-center py-8 px-4 md:px-10 w-full">
            <div class="w-full max-w-[1200px] flex flex-col gap-6">
                <!-- Breadcrumb & title -->
                <nav class="flex flex-wrap gap-2 items-center text-sm">
                    <a class="text-gray-500 hover:text-primary dark:text-gray-400" href="${pageContext.request.contextPath}/admin/dashboard.jsp">Dashboard</a>
                    <span class="text-gray-400 material-symbols-outlined text-sm">chevron_right</span>
                    <span class="text-gray-900 dark:text-white font-medium">Customers</span>
                </nav>
                <div class="flex flex-wrap justify-between items-end gap-4 pb-4 border-b border-gray-100 dark:border-gray-800">
                    <div class="flex flex-col gap-2">
                        <h1 class="text-3xl md:text-4xl font-black leading-tight tracking-tight text-gray-900 dark:text-white">Customer Management</h1>
                        <p class="text-gray-500 dark:text-gray-400 text-base">View and manage all registered customers, their details, and history.</p>
                    </div>
                    <div class="flex items-center gap-3">
                        <button class="h-10 px-4 rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 text-sm font-bold hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors flex items-center gap-2">
                            <span class="material-symbols-outlined text-[18px]">download</span>
                            Export CSV
                        </button>
                    </div>
                    
                </div>
<!-- Messages -->
<c:if test="${not empty sessionScope.errorMessage}">
    <div class="mb-4 p-3 bg-red-100 text-red-700 rounded-lg border border-red-300 text-sm">
        ${sessionScope.errorMessage}
    </div>
    <c:remove var="errorMessage" scope="session"/>
</c:if>

<c:if test="${not empty sessionScope.successMessage}">
    <div class="mb-4 p-3 bg-green-100 text-green-700 rounded-lg border border-green-300 text-sm">
        ${sessionScope.successMessage}
    </div>
    <c:remove var="successMessage" scope="session"/>
</c:if>

<c:if test="${not empty sessionScope.infoMessage}">
    <div class="mb-4 p-3 bg-blue-100 text-blue-700 rounded-lg border border-blue-300 text-sm">
        ${sessionScope.infoMessage}
    </div>
    <c:remove var="infoMessage" scope="session"/>
</c:if>
<c:if test="${param.success == 'changepassword'}">
    <div class="mb-4 p-3 bg-green-100 text-green-700 rounded-lg font-bold">
        Password updated successfully!
    </div>
</c:if>

                <!-- Filter/Search form -->
                <div class="w-full bg-white dark:bg-gray-900 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col">
                    <div class="p-4 sm:p-5 border-b border-gray-100 dark:border-gray-800 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                        <form method="GET" action="${pageContext.request.contextPath}/admin/customers" class="flex items-center gap-4 w-full sm:w-auto flex-1">
                            <div class="relative w-full sm:max-w-sm">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400">
                                    <span class="material-symbols-outlined text-[20px]">search</span>
                                </div>
                                <input class="pl-10 h-10 w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary text-gray-900 dark:text-white text-sm placeholder:text-gray-400 transition-colors"
                                       name="keyword" value="${keyword}" placeholder="Search by name or username..."/>
                            </div>
                            <div class="relative hidden sm:block">
                                <select name="status" class="h-10 pl-3 pr-10 rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary text-gray-900 dark:text-white text-sm appearance-none cursor-pointer">
                                    <option value="">All Statuses</option>
                                    <option value="ACTIVE" ${status == 'ACTIVE' ? 'selected' : ''}>Active</option>
                                    <option value="LOCKED" ${status == 'LOCKED' ? 'selected' : ''}>Inactive</option>
                                </select>
                                <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-gray-500 pointer-events-none text-[18px]">expand_more</span>
                            </div>
                            <button type="submit" class="h-10 px-4 rounded-lg bg-primary text-[#111b0d] font-bold hover:opacity-90 transition-opacity">
                                Search
                            </button>
                        </form>
                        <div class="text-sm text-gray-500 dark:text-gray-400">
                            Showing
                            <span class="font-bold text-gray-900 dark:text-white">
                                ${start}-${end}
                            </span>
                            of
                            <span class="font-bold text-gray-900 dark:text-white">
                                ${totalCustomers}
                            </span>
                            customers
                        </div>

                    </div>

                    <!-- Table and Actions -->
                    <div class="overflow-x-auto">
                        <c:choose>
                            <c:when test="${not empty customers}">
                                <table class="w-full text-left border-collapse">
                                    <thead>
                                        <tr class="bg-background-light dark:bg-gray-800/50 text-xs uppercase text-gray-500 dark:text-gray-400 font-bold tracking-wider">
                                            <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Customer ID</th>
                                            <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Customer Name</th>
                                            <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Email Address</th>
                                            <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Username</th>
                                            <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Status</th>
                                            <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Registration Date</th>
                                            <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800 text-right">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-100 dark:divide-gray-800">
                                        <c:forEach var="customer" items="${customers}">
                                            <tr class="group hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors">
                                                <td class="px-6 py-4 text-sm font-mono text-gray-500 dark:text-gray-400">#C-${customer.userId}</td>
                                                <td class="px-6 py-4 text-sm font-bold text-gray-900 dark:text-white">
                                                    <c:choose>
                                                        <c:when test="${not empty customer.fullName}">
                                                            ${customer.fullName}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="italic text-gray-400">No name</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">${customer.email}</td>
                                                <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">${customer.username}</td>
                                                <td class="px-6 py-4">
                                                    <span class="text-xs font-bold ${customer.status == 'ACTIVE' ? 'text-green-600 dark:text-green-400' : 'text-gray-500 dark:text-gray-400'}">
                                                        ${customer.status}
                                                    </span>
                                                </td>
                                                <td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">
                                                    <fmt:formatDate value="${customer.createdAt}" pattern="MMM dd, yyyy" />
                                                </td>
                                                <td class="px-6 py-4 text-right">
                                                    <div class="flex items-center justify-end gap-2">
                                                        <c:if test="${sessionScope.account.userId ne customer.userId}">
                                                            <form action="${pageContext.request.contextPath}/admin/user-status" method="post" style="display:inline;">
                                                                <input type="hidden" name="userId" value="${customer.userId}" />
                                                                <c:choose>
                                                                    <c:when test="${customer.status eq 'ACTIVE'}">
                                                                        <input type="hidden" name="action" value="LOCK" />
                                                                        <button type="submit"
                                                                                class="p-2 rounded-lg text-red-500 hover:bg-red-100 dark:hover:bg-red-900/20 transition-colors"
                                                                                title="Lock User">
                                                                            <span class="material-symbols-outlined text-[20px]">lock</span>
                                                                        </button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="hidden" name="action" value="UNLOCK" />
                                                                        <button type="submit"
                                                                                class="p-2 rounded-lg text-green-600 hover:bg-green-100 dark:hover:bg-green-900/20 transition-colors"
                                                                                title="Unlock User">
                                                                            <span class="material-symbols-outlined text-[20px]">lock_open</span>
                                                                        </button>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </form>
                                                            <c:if test="${sessionScope.account.userId ne customer.userId}">
                                                                <form action="${pageContext.request.contextPath}/admin/change-password" method="get" style="display:inline;">
                                                                    <input type="hidden" name="userId" value="${customer.userId}" />
                                                                    <button type="submit"
                                                                            class="p-2 rounded-lg text-blue-600 hover:bg-blue-100 dark:hover:bg-blue-900/20 transition-colors"
                                                                            title="Change Password">
                                                                        <span class="material-symbols-outlined text-[20px]">key</span>
                                                                    </button>
                                                                </form>
                                                            </c:if>

                                                        </c:if>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <div class="p-8 text-center">
                                    <p class="text-gray-500 dark:text-gray-400">No customers found</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Pagination -->
                    <c:if test="${totalPages > 1}">
                        <div class="p-4 border-t border-gray-100 dark:border-gray-800 flex items-center justify-between">
                            <c:choose>
                                <c:when test="${currentPage > 1}">
                                    <a href="?page=${currentPage - 1}&keyword=${keyword}&status=${status}" class="flex items-center gap-2 px-4 h-9 rounded-lg border border-gray-200 dark:border-gray-700 text-sm font-medium text-gray-600 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors">
                                        <span class="material-symbols-outlined text-[16px]">arrow_back</span>
                                        Previous
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <button disabled class="flex items-center gap-2 px-4 h-9 rounded-lg border border-gray-200 dark:border-gray-700 text-sm font-medium text-gray-600 dark:text-gray-300 opacity-50 cursor-not-allowed">
                                        <span class="material-symbols-outlined text-[16px]">arrow_back</span>
                                        Previous
                                    </button>
                                </c:otherwise>
                            </c:choose>

                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <c:if test="${i <= 5}">
                                    <c:choose>
                                        <c:when test="${i == currentPage}">
                                            <button class="size-9 rounded-lg bg-primary text-[#111b0d] font-bold">${i}</button>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/admin/customers?page=${i}&keyword=${keyword}&status=${status}"
                                               class="size-9 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-800
                                               text-gray-600 dark:text-gray-300 text-sm font-medium
                                               transition-colors flex items-center justify-center">
                                                ${i}
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>


                            <c:choose>
                                <c:when test="${currentPage < totalPages}">
                                    <a href="?page=${currentPage + 1}&keyword=${keyword}&status=${status}" class="flex items-center gap-2 px-4 h-9 rounded-lg border border-gray-200 dark:border-gray-700 text-sm font-medium text-gray-600 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors">
                                        Next
                                        <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <button disabled class="flex items-center gap-2 px-4 h-9 rounded-lg border border-gray-200 dark:border-gray-700 text-sm font-medium text-gray-600 dark:text-gray-300 opacity-50 cursor-not-allowed">
                                        Next
                                        <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>
                </div>
            </div>
        </main>
    </body>
</html>
