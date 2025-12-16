<%-- 
    Document   : filter
    Created on : Dec 15, 2025, 12:07:08 AM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en"><head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Category Book List - Select &amp; Input Filters</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#46ec13",
                        "background-light": "#ffffff",
                        "background-dark": "#142210",
                        "surface-light": "#f9fcf8",
                        "surface-dark": "#1a2c15",
                        "text-main": "#111b0d",
                        "text-secondary": "#5e9a4c",
                    },
                    fontFamily: {
                        "display": ["Manrope", "sans-serif"],
                        "body": ["Manrope", "sans-serif"],
                    },
                    borderRadius: {"DEFAULT": "1rem", "lg": "2rem", "xl": "3rem", "full": "9999px"},
                },
            },
        }
    </script>
    <style>
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: transparent;
        }
        ::-webkit-scrollbar-thumb {
            background-color: #eaf3e7;
            border-radius: 20px;
        }
    </style>
</head>
<body class="bg-background-light dark:bg-background-dark text-text-main font-display antialiased min-h-screen flex flex-col">
    <%@include file="menu.jsp" %>
    <main class="flex-grow flex flex-col">
        <div class="bg-surface-light dark:bg-background-dark border-b border-[#eaf3e7] dark:border-[#2a3c25]">
            <div class="max-w-[1400px] mx-auto px-6 lg:px-12 py-8">
                <nav class="flex items-center gap-2 text-sm text-text-secondary mb-6">
                    <a class="hover:text-primary transition-colors" href="home">Trang chủ</a>
                    <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                    <a class="hover:text-primary transition-colors" href="filter">Mua sắm</a>
                    <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                   
                    <span class="font-semibold text-text-main dark:text-white">${not empty category.categoryName?category.categoryName:'Tất cả'}</span>
                    
                </nav>
                <div class="flex flex-col md:flex-row md:items-end justify-between gap-6">
                    <div class="max-w-2xl">
                        
                        <h2 class="text-4xl md:text-5xl font-black tracking-tight text-text-main dark:text-white mb-3">${not empty category.categoryName?category.categoryName:'Tất cả'}</h2>
                        
                        <p class="text-lg text-text-secondary">Master your productivity with our curated selection.</p>
                    </div>
                     
                </div>
            </div>
        </div>
        <div class="flex-grow bg-background-light dark:bg-background-dark">
            <div class="max-w-[1400px] mx-auto px-6 lg:px-12 py-10">
                <div class="flex flex-col lg:flex-row gap-12">
                    <aside class="w-full lg:w-72 flex-shrink-0">
                        <form action="filter" class="space-y-8" method="GET">
                            <div class="pb-6 border-b border-[#eaf3e7] dark:border-[#2a3c25]">
                                <h3 class="font-bold text-lg text-text-main dark:text-white mb-4 flex items-center justify-between">
                                    Danh mục
                                </h3>
                                <div class="relative">
                                    <select class="w-full appearance-none bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] text-text-main dark:text-white py-3 pl-4 pr-10 rounded-xl text-sm font-medium focus:outline-none focus:ring-2 focus:ring-primary/50 transition-shadow cursor-pointer hover:border-primary/50 bg-none" name="category">
                                        <c:set var="cateid" value="${categoryid}"/>
                                        <option value="" ${empty cateid ? 'selected' : ''}>Tất cả</option>
                                        <c:forEach var="c" items="${listC}">
                                            <option value="${c.categoryId}" ${c.categoryId == cateid ? 'selected' : ''}>${c.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                    <p class="col-span-2 text-red-500 font-semibold">
                                        ${messageCateID}
                                    </p>
                                </div>
                            </div>
                            <div class="pb-6 border-b border-[#eaf3e7] dark:border-[#2a3c25]">
                                <h3 class="font-bold text-lg text-text-main dark:text-white mb-4 flex items-center justify-between">
                                    Giá tiền
                                </h3>
                                <div class="grid grid-cols-2 gap-3">
                                    <div>
                                        <label class="block text-xs font-medium text-text-secondary mb-1.5 ml-1">Min Price</label>
                                        <div class="bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-xl px-3 py-2.5 flex items-center hover:border-primary/50 focus-within:border-primary focus-within:ring-1 focus-within:ring-primary transition-colors">
                                            <input class="w-full bg-transparent border-none p-0 text-sm font-bold text-text-main dark:text-white focus:ring-0 placeholder-gray-400" name="min_price" placeholder="0" type="number" value="${not empty min ?min:10000}"/>
                                            <span class="text-text-secondary text-sm mr-1">Đ</span>
                                        </div>
                                    </div>
                                    <div>
                                        <label class="block text-xs font-medium text-text-secondary mb-1.5 ml-1">Max Price</label>
                                        <div class="bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-xl px-3 py-2.5 flex items-center hover:border-primary/50 focus-within:border-primary focus-within:ring-1 focus-within:ring-primary transition-colors">
                                            <input class="w-full bg-transparent border-none p-0 text-sm font-bold text-text-main dark:text-white focus:ring-0 placeholder-gray-400" name="max_price" placeholder="100000" type="number" value="${not empty max ?max:500000}"/>
                                            <span class="text-text-secondary text-sm mr-1">Đ</span>
                                        </div>
                                    </div>
                                    <c:if test="${not empty error}">
                                        <p class="col-span-2 text-red-500 font-semibold">
                                            ${message}
                                        </p>
                                    </c:if>
                                </div>
                            </div>
                            <div class="pb-6 border-b border-[#eaf3e7] dark:border-[#2a3c25]">
                                <h3 class="font-bold text-lg text-text-main dark:text-white mb-4 flex items-center justify-between">
                                    Loại sản phẩm
                                </h3>
                                <div class="space-y-3">
                                    <label class="flex items-center gap-3 cursor-pointer group">
                                            <input class="w-5 h-5 rounded border-[#eaf3e7] text-primary focus:ring-primary transition-colors" name="variant" type="radio" value="" ${not empty variant ? '' : 'checked'}/>
                                            <span class="text-sm text-text-secondary group-hover:text-primary transition-colors">Cả hai</span>
                                        </label>
                                    <c:forEach var="v" items="${listV}">
                                        <label class="flex items-center gap-3 cursor-pointer group">
                                            <input class="w-5 h-5 rounded border-[#eaf3e7] text-primary focus:ring-primary transition-colors" name="variant" type="radio" value="${v.variantName}" ${v.variantName == variant ? 'checked' : ''}/>
                                            <span class="text-sm text-text-secondary group-hover:text-primary transition-colors">${v.variantName}</span>
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                            <button class="w-full bg-primary hover:bg-green-500 text-white font-bold py-3 rounded-xl shadow-lg shadow-primary/30 flex items-center justify-center gap-2 transition-all" type="submit">
                                <span class="material-symbols-outlined">filter_alt</span>
                                Lọc sản phẩm
                            </button>
                        </form>
                    </aside>
                    <div class="flex-grow">
                        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-3 gap-x-8 gap-y-10">
                            <c:forEach var="b" items="${listB}">
                                <div class="group flex flex-col gap-4">

                                    <a href="detail?pid=${b.bookId}" class="aspect-[2/3] w-full bg-[#f0f0f0] rounded-2xl overflow-hidden relative shadow-sm group-hover:shadow-lg transition-all duration-300">
                                        <img alt="${b.title}" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" src="${b.image}"/>
                                        
                                        <div class="absolute bottom-0 inset-x-0 p-4 translate-y-full group-hover:translate-y-0 transition-transform duration-300">
                                            <button class="w-full bg-primary hover:bg-green-500 text-white font-bold py-3 rounded-xl shadow-lg shadow-primary/30 flex items-center justify-center gap-2">
                                                <span class="material-symbols-outlined text-[20px]">add_shopping_cart</span>
                                                Add to Cart
                                            </button>
                                        </div>
                                    </a>

                                    <div class="space-y-1">
                                        <a href="detail?pid=${b.bookId}">
                                            <h3 class="font-bold text-lg text-text-main dark:text-white leading-tight truncate hover:text-primary transition-colors">${b.title}</h3>
                                        </a>
                                        
                                        <p class="text-sm text-text-secondary truncate">${b.author}</p>
                                        
                                        <div class="flex items-center justify-between pt-1">
                                            <span class="text-xl font-bold text-text-main dark:text-white">
                                                <fmt:formatNumber type="currency" value="${b.listVariant[0].price}"/>
                                            </span>
                                            <div class="flex items-center text-yellow-500 gap-1">
                                                <span class="material-symbols-outlined text-[16px] fill">star</span>
                                                <span class="text-xs font-bold text-text-main dark:text-white">4.8</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <div class="mt-12 flex justify-center">
                            <nav class="flex items-center gap-2">
                                <button class="w-10 h-10 flex items-center justify-center rounded-full border border-[#eaf3e7] dark:border-[#2a3c25] text-text-secondary hover:text-primary hover:border-primary transition-colors">
                                    <span class="material-symbols-outlined">chevron_left</span>
                                </button>
                                
                                <c:set var="pageIndex" value="${empty index ? 1 : index}" />

                                <c:forEach var="i" begin="1" end="${page}">
                                    <a href="filter?index=${i}&keyword=${keyword}&category=${categoryid}&variant=${variant}&min_price=${min}&max_price=${max}"
                                       class="w-10 h-10 flex items-center justify-center rounded-full
                                       ${i == pageIndex  
                                            ? 'bg-primary text-white font-bold shadow-lg shadow-primary/20'
                                            : 'border border-[#eaf3e7] dark:border-[#2a3c25] text-text-secondary hover:text-primary hover:border-primary transition-colors'}">
                                            ${i}
                                    </a>
                                </c:forEach>
                                
                                <button class="w-10 h-10 flex items-center justify-center rounded-full border border-[#eaf3e7] dark:border-[#2a3c25] text-text-secondary hover:text-primary hover:border-primary transition-colors">
                                    <span class="material-symbols-outlined">chevron_right</span>
                                </button>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <%@include file="footer.jsp" %>
</body></html>