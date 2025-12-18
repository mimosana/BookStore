<%-- 
    Document   : menu
    Created on : Dec 15, 2025, 11:58:04 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="sticky top-0 z-50 bg-background-light/90 dark:bg-background-dark/90 backdrop-blur-md border-b border-[#eaf3e7] dark:border-[#2a3c25]">
    <div class="px-6 lg:px-12 py-4 flex items-center justify-between gap-8">
        <a href="home">
            <div class="flex items-center gap-3">

                <div class="text-primary">
                    <span class="material-symbols-outlined text-4xl">local_library</span>
                </div>
                <h1 class="text-2xl font-bold tracking-tight text-text-main dark:text-white">BookStore</h1>
            </div>
        </a>

        <form action="filter" class="hidden md:flex flex-1 max-w-lg" method="get">
            <input type="hidden" name="category" value="${categoryid}"/>
            <input type="hidden" name="variant" value="${variant}"/>
            <input type="hidden" name="min_price" value="${min}"/>
            <input type="hidden" name="max_price" value="${max}"/>
            <div class="relative w-full group">
                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                    <span class="material-symbols-outlined text-text-secondary">search</span>
                </div>
                <input class="block w-full pl-12 pr-4 py-3 rounded-full bg-surface-light dark:bg-surface-dark border-none ring-1 ring-inset ring-[#eaf3e7] dark:ring-[#2a3c25] focus:ring-2 focus:ring-primary text-sm transition-shadow shadow-sm" placeholder="Search by title, author" type="text" value="${keyword}" name="keyword"/>
            </div>
        </form>

        <div class="flex items-center gap-4">
            <nav class="hidden lg:flex items-center gap-6 mr-4">
                <a class="text-sm font-semibold text-text-main dark:text-gray-200 hover:text-primary transition-colors" href="home">Trang chủ</a>
                <a class="text-sm font-semibold text-text-main dark:text-gray-200 hover:text-primary transition-colors" href="filter">Mua sắm</a>
                <a class="text-sm font-semibold text-text-secondary hover:text-primary transition-colors" href="#">Về chúng tôi</a>
            </nav>
            <button class="relative p-2 rounded-full hover:bg-surface-light dark:hover:bg-surface-dark text-text-main dark:text-white transition-colors">
                <c:choose>
                    <c:when test="${not empty sessionScope.account}">
                        <a href="cart"><span class="material-symbols-outlined">shopping_cart</span></a>
                    </c:when>
                    <c:otherwise>
                        <a href="LoginServlet"><span class="material-symbols-outlined">shopping_cart</span></a>
                    </c:otherwise>
                </c:choose>
            </button>
            <c:choose>
                <c:when test="${not empty sessionScope.account}">
                    <button class="p-2 rounded-full bg-surface-light dark:bg-surface-dark transition-colors text-primary">
                        <a href="profile"><span class="material-symbols-outlined">account_circle</span></a>
                    </button>
                </c:when>
                <c:otherwise>
                    <div class="flex items-center gap-2">
                        <a href="LoginServlet" class="px-4 py-2 text-sm font-medium text-primary hover:bg-primary/10 rounded-full transition-colors">
                            Đăng nhập
                        </a>
                        <a href="RegisterServlet" class="px-4 py-2 text-sm font-medium bg-primary text-white rounded-full hover:bg-primary-dark shadow-sm transition-all active:scale-95">
                            Đăng ký
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>
