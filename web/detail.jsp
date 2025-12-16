<%-- 
    Document   : detail
    Created on : Dec 15, 2025, 12:07:38 AM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>The Midnight Library - Book Detail</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
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
    <body class="bg-background font-sans text-text-main antialiased selection:bg-green-100">
        <div class="flex min-h-screen w-full flex-col">

            <%@include file="menu.jsp" %>
            <c:set var="b" value="${book}"/>
            <main class="flex-1 bg-white">
                <nav aria-label="Breadcrumb" class="mx-auto max-w-7xl px-6 pt-8 lg:px-8">
                    <ol class="flex items-center space-x-2 text-sm text-text-muted">
                        <li>
                            <a class="hover:text-text-main transition-colors" href="home">Home</a>
                        </li>
                        <li><span class="text-gray-300">/</span></li>
                        <li>
                            <a class="hover:text-text-main transition-colors" href="filter">Shop</a>
                        </li>
                        <li><span class="text-gray-300">/</span></li>
                        <li>
                            <%-- Sử dụng thông tin category từ đối tượng book hoặc biến category nếu có --%>
                            <a class="hover:text-text-main transition-colors" href="filter?category=${category.categoryId}">${category.categoryName}</a>
                        </li>
                        <li><span class="text-gray-300">/</span></li>
                        <li>
                            <span aria-current="page" class="font-medium text-text-main">${b.title}</span>
                        </li>
                    </ol>
                </nav>

                <section class="mx-auto max-w-7xl px-6 py-10 lg:px-8 lg:py-16">
                    <div class="lg:grid lg:grid-cols-2 lg:gap-x-16 xl:gap-x-24">

                        <div class="relative mx-auto w-full max-w-md lg:max-w-none">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-xl bg-gray-50 shadow-sm border border-gray-100">
                                <div class="h-full w-full bg-cover bg-center transition-transform hover:scale-105 duration-700" style='background-image: url("${b.image}");'></div>
                            </div>
                        </div>

                        <div class="mt-10 lg:mt-0 flex flex-col h-full">
                            <div class="border-b border-gray-100 pb-8">
                                <div class="mb-4">
                                    <h1 class="font-serif text-4xl font-bold tracking-tight text-text-main sm:text-5xl mb-2">${b.title}</h1>
                                    <h3>Tác giả:<a class="text-lg text-text-muted hover:text-primary transition-colors underline-offset-4 hover:underline" href="#">${b.author}</a></h3>
                                </div>
                                <div class="flex items-center gap-4 mb-6">
                                    <div class="flex items-center text-yellow-400">
                                        <span class="material-symbols-outlined text-[20px] fill-current">star</span>
                                        <span class="material-symbols-outlined text-[20px] fill-current">star</span>
                                        <span class="material-symbols-outlined text-[20px] fill-current">star</span>
                                        <span class="material-symbols-outlined text-[20px] fill-current">star</span>
                                        <span class="material-symbols-outlined text-[20px] fill-current text-gray-300">star_half</span>
                                    </div>
                                    <span class="text-sm text-text-muted border-l border-gray-200 pl-4">1,284 Reviews</span>
                                </div>

                                <%-- PHẦN GIÁ VÀ TỒN KHO: Sử dụng variant đầu tiên làm mặc định --%>
                                <div class="flex items-end gap-4 mb-6">
                                    <p class="text-3xl font-serif font-bold text-text-main" id="current-price">
                                        <c:choose>
                                            <c:when test="${not empty bookV}">
                                                <fmt:formatNumber type="currency" value="${bookV.price}"/>
                                            </c:when>
                                            <c:when test="${not empty b.listVariant[0]}">
                                                <fmt:formatNumber type="currency" value="${b.listVariant[0].price}"/>
                                            </c:when>
                                            <c:otherwise>
                                                N/A
                                            </c:otherwise>
                                        </c:choose>
                                    </p>

                                    <div id="stock-info" class="mb-1.5">
                                        <c:choose>
                                            <c:when test="${not empty bookV}">
                                                <c:set var="defaultStock" value="${bookV.stock}" />
                                                <c:choose>
                                                    <c:when test="${defaultStock > 0}">
                                                        <span class="rounded bg-green-50 px-2 py-0.5 text-xs font-semibold text-green-700">Còn hàng (${defaultStock} sản phẩm)</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="rounded bg-red-100 px-2 py-0.5 text-xs font-semibold text-red-700">Hết hàng</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:when test="${not empty b.listVariant}">
                                                <c:set var="defaultStock" value="${b.listVariant[0].stock}" />
                                                <c:choose>
                                                    <c:when test="${defaultStock > 0}">
                                                        <span class="rounded bg-green-50 px-2 py-0.5 text-xs font-semibold text-green-700">Còn hàng (${defaultStock} sản phẩm)</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="rounded bg-red-100 px-2 py-0.5 text-xs font-semibold text-red-700">Hết hàng</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="rounded bg-red-100 px-2 py-0.5 text-xs font-semibold text-red-700">Đang cập nhật</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <p class="text-base leading-relaxed text-text-muted font-light mb-8">
                                    ${b.description}
                                </p>

                                <form action="detail" method="get">
                                    <input type="hidden" name="pid" value="${b.bookId}"/>
                                    <input type="hidden" name="cateid" value="${category.categoryId}"/>

                                    <div class="mb-8">
                                        <label class="block text-sm font-medium text-text-muted mb-2" for="format-select">Select Format</label>
                                        <div class="relative">
                                            <select class="block w-full appearance-none rounded-lg border border-gray-200 bg-white py-3 pl-4 pr-10 text-text-main text-sm focus:border-primary focus:outline-none focus:ring-1 focus:ring-primary cursor-pointer transition-shadow shadow-sm hover:border-gray-300" id="format-select" name="variant" onchange="this.form.submit()">
                                                <c:forEach var="bv" items="${b.getListVariant()}">
                                                    <%-- Thêm data-price và data-stock vào option để JS đọc --%>
                                                    <option 
                                                        value="${bv.variantId}" 
                                                        data-price="${bv.price}" 
                                                        data-stock="${bv.stock}"
                                                        ${bv.variantId == bookV.variantId ? 'selected' : ''}>
                                                        ${bv.variantName} - <fmt:formatNumber type="currency" value="${bv.price}"/>
                                                    </option>       
                                                </c:forEach>
                                            </select>
                                            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3 text-text-muted">
                                                <span class="material-symbols-outlined text-[20px]">expand_more</span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="flex flex-col sm:flex-row gap-4">
                                    <button class="flex-1 rounded-full bg-primary px-8 py-4 text-sm font-semibold text-white hover:bg-green-800 transition-all shadow-md active:scale-[0.98]">
                                        Add to Cart
                                    </button>
                                    <button type="button" class="flex items-center justify-center rounded-full border border-gray-200 bg-white px-6 py-4 text-text-main hover:bg-gray-50 transition-all group">
                                        <span class="material-symbols-outlined text-[20px] group-hover:fill-current group-hover:text-red-500 transition-colors">favorite</span>
                                    </button>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>

                <section class="border-t border-gray-100 bg-gray-50/50 py-16 lg:py-24">
                    <div class="mx-auto max-w-7xl px-6 lg:px-8">
                        <div class="mx-auto max-w-4xl">

                            <div class="mb-12 flex justify-center border-b border-gray-200">
                                <nav aria-label="Tabs" class="-mb-px flex space-x-8">
                                    <button aria-current="page" data-target="description-content" class="border-b-2 border-primary py-4 px-1 text-sm font-medium text-primary">
                                        Mô tả sản phẩm
                                    </button>
                                    <button data-target="author-content" class="border-b-2 border-transparent py-4 px-1 text-sm font-medium text-text-muted hover:border-gray-300 hover:text-text-main transition-all">
                                        Chi tiết sản phẩm
                                    </button>
                                    <button data-target="reviews-content" class="border-b-2 border-transparent py-4 px-1 text-sm font-medium text-text-muted hover:border-gray-300 hover:text-text-main transition-all">
                                        Đánh giá (12)
                                    </button>
                                </nav>
                            </div>

                            <div class="space-y-12">

                                <div id="description-content">
                                    <h3 class="font-serif text-2xl font-bold text-text-main mb-6">Tổng quan sản phẩm</h3>
                                    <div class="prose prose-gray max-w-none text-text-muted font-light leading-relaxed">
                                        
                                        <p class="mb-4">
                                            ${b.description}
                                        </p>
                                        <p class="mb-4">
                                            Nora Seed finds herself in a library between life and death, where every book on the shelves provides a chance to try another life she could have lived. She can undo every decision she regrets, and try to find the perfect life. But things aren't always what she imagined they'd be, and soon her choices place the library and herself in extreme danger. Before time runs out, she must answer the ultimate question: what is the best way to live?
                                        </p>
                                        <p>
                                            A dazzling novel about all the choices that go into a life well lived, from the internationally bestselling author of Reasons to Stay Alive and How To Stop Time.
                                        </p>
                                    </div>
                                </div>

                                <div id="author-content" class=" pt-12 hidden">
                                    <h3 class="font-serif text-2xl font-bold text-text-main mb-6">Thông số chi tiết</h3>
                                    <div class="prose prose-gray max-w-none text-text-muted font-light leading-relaxed">
                                        <div class="pt-8">
                                            <div class="grid grid-cols-2 gap-y-4 gap-x-8 text-sm">
                                                <div class="flex justify-between border-b border-gray-50 pb-2">
                                                    <span class="text-text-muted">Tác giả</span>
                                                    <span class="font-medium text-text-main">${b.author}</span>
                                                </div>
                                                <div class="flex justify-between border-b border-gray-50 pb-2">
                                                    <span class="text-text-muted">Thể loại</span>
                                                    <span class="font-medium text-text-main">${category.categoryName}</span>
                                                </div>
                                                <%-- Các thông số khác (tạm để tĩnh như cũ, bạn có thể thay thế bằng dữ liệu động nếu có) --%>
                                                <div class="flex justify-between border-b border-gray-50 pb-2">
                                                    <span class="text-text-muted">Định dạng:</span>
                                                    <span class="font-medium text-text-main">Bản cứng - Bản mềm</span>
                                                </div>
                                                <div class="flex justify-between border-b border-gray-50 pb-2">
                                                    <span class="text-text-muted">Số trang</span>
                                                    <span class="font-medium text-text-main">Đang cập nhật</span>
                                                </div>
                                                <div class="flex justify-between border-b border-gray-50 pb-2">
                                                    <span class="text-text-muted">Nhà xuất bản</span>
                                                    <span class="font-medium text-text-main">Đang cập nhật</span>
                                                </div>
                                                <div class="flex justify-between border-b border-gray-50 pb-2">
                                                    <span class="text-text-muted">Ngôn ngữ</span>
                                                    <span class="font-medium text-text-main">Tiếng Việt </span>
                                                </div>
                                                <div class="flex justify-between border-b border-gray-50 pb-2">
                                                    <span class="text-text-muted">ISBN</span>
                                                    <span class="font-medium text-text-main">Đang cập nhật</span>
                                                </div>
                                                <div class="flex justify-between border-b border-gray-50 pb-2">
                                                    <span class="text-text-muted">Kích thước</span>
                                                    <span class="font-medium text-text-main">Đang cập nhật</span>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>

                                <div id="reviews-content" class="pt-12 hidden">
                                    <div class="flex items-center justify-between mb-8">
                                        <h3 class="font-serif text-2xl font-bold text-text-main">Customer Reviews</h3>
                                        <button class="text-sm font-medium text-primary underline underline-offset-4 decoration-1">Write a Review</button>
                                    </div>
                                    <div class="flex gap-4 py-6 border-b border-gray-100 last:border-0">
                                        <div class="flex-none">
                                            <div class="h-10 w-10 rounded-full bg-green-100 flex items-center justify-center text-green-700 font-bold text-sm">
                                                JD
                                            </div>
                                        </div>
                                        <div class="flex-1">
                                            <div class="flex items-center justify-between mb-2">
                                                <h4 class="text-sm font-bold text-text-main">Jane Doe</h4>
                                                <span class="text-xs text-text-muted">2 days ago</span>
                                            </div>
                                            <div class="flex text-yellow-400 mb-2">
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                            </div>
                                            <p class="text-sm text-text-muted leading-relaxed">
                                                Absolutely loved this book! It really made me think about my own life choices and regrets. Beautifully written and very touching. Highly recommend to anyone feeling a bit lost.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="flex gap-4 py-6 border-b border-gray-100 last:border-0">
                                        <div class="flex-none">
                                            <div class="h-10 w-10 rounded-full bg-green-100 flex items-center justify-center text-green-700 font-bold text-sm">
                                                MS
                                            </div>
                                        </div>
                                        <div class="flex-1">
                                            <div class="flex items-center justify-between mb-2">
                                                <h4 class="text-sm font-bold text-text-main">Michael Smith</h4>
                                                <span class="text-xs text-text-muted">1 week ago</span>
                                            </div>
                                            <div class="flex text-yellow-400 mb-2">
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current text-gray-300">star</span>
                                            </div>
                                            <p class="text-sm text-text-muted leading-relaxed">
                                                Good concept but the middle part felt a bit repetitive. Still, a solid read with a great message at the end.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="bg-white py-16 lg:py-24 border-t border-gray-100">
                    <div class="mx-auto max-w-7xl px-6 lg:px-8">
                        <div class="flex items-center justify-between mb-10">
                            <h2 class="font-serif text-3xl font-medium text-text-main">You might also like</h2>
                            <a class="text-sm font-medium text-text-muted hover:text-text-main decoration-1 underline-offset-4 hover:underline" href="#">View all</a>
                        </div>
                        <div class="grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-4">
                            <div class="group relative">
                                <div class="aspect-[2/3] w-full overflow-hidden rounded-md bg-gray-100 mb-4 transition-all group-hover:opacity-90 shadow-sm border border-gray-100">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDmQb1kZ0ybiE3kub5kB4MN7x4Au3-m1rDhzkWTvzc8ZC6HY_zrcOXb7_nraZv1t9iYc6fOMvcJkg7WJSImejjxuNB45klcjS08EIPxrDUeSRo3xZ4ddHsguCvhNQ9tXRSO3y_DUQH4kbOqob8NNj2j7c2JDROv62cGDK8PKamFj1fVFsQAMN1Xrl4ZWXBBLTQKYfy0DPzQKAUmLC0cJQKSYg5hgzTDwOfdrUIWLhJMf0U46tHazWT2rKzjAw5cfGOz7B-_V7-K79ix");'></div>
                                    <button class="absolute right-3 top-3 flex h-8 w-8 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-500 opacity-0 transition-all group-hover:opacity-100 hover:bg-white hover:text-red-500 shadow-sm">
                                        <span class="material-symbols-outlined text-[18px] fill-current">favorite</span>
                                    </button>
                                </div>
                                <div>
                                    <h3 class="text-base font-semibold text-text-main leading-snug">
                                        <a href="#">
                                            <span class="absolute inset-0"></span>
                                            Project Hail Mary
                                        </a>
                                    </h3>
                                    <p class="mt-1 text-sm text-text-muted">Andy Weir</p>
                                    <p class="mt-2 text-sm font-medium text-text-main">$14.99</p>
                                </div>
                            </div>
                            <div class="group relative">
                                <div class="aspect-[2/3] w-full overflow-hidden rounded-md bg-gray-100 mb-4 transition-all group-hover:opacity-90 shadow-sm border border-gray-100">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuA-K1qvGkPrxogOabcu7-lr1H4nszmwcYhShPmEQGePzJk6cinyy_ba-U_E6irZgmB-jb89dn6m5yG5pV8U_5MWZunsMc0ZSxyIuIamgU3YbXBCJsXFiCMmRapuKpvs8XB2cHHLS-IxGx2mtCz34hC-LQOP8BE9JFPbNVTKHczR4Z68GM6bqiXaibfb9iaIB5h3MWL9YtWs_ASOK6p6_j4zqNjIesLTrKJ4OGE86QXfFqdyKbRKF9B8EvPP95u6kOZrfVfUFOPSTc2N");'></div>
                                    <button class="absolute right-3 top-3 flex h-8 w-8 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-500 opacity-0 transition-all group-hover:opacity-100 hover:bg-white hover:text-red-500 shadow-sm">
                                        <span class="material-symbols-outlined text-[18px] fill-current">favorite</span>
                                    </button>
                                </div>
                                <div>
                                    <h3 class="text-base font-semibold text-text-main leading-snug">
                                        <a href="#">
                                            <span class="absolute inset-0"></span>
                                            The Silent Patient
                                        </a>
                                    </h3>
                                    <p class="mt-1 text-sm text-text-muted">Alex Michaelides</p>
                                    <p class="mt-2 text-sm font-medium text-text-main">$12.50</p>
                                </div>
                            </div>
                            <div class="group relative">
                                <div class="aspect-[2/3] w-full overflow-hidden rounded-md bg-gray-100 mb-4 transition-all group-hover:opacity-90 shadow-sm border border-gray-100">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuD4Ajx_LlXu6V6WGf0nTWUkxBCJrOMNNdPzU7EGczjXPRRg7I6zhi03H3QHp7JGhiR6lnaBWfDkZvAk7Fkmy5XD0ixnInaSX5p8x8BAEW8hBMQPpSJRCkbcZFnLFZQ5_U3qq8BogT_CnXNZTKHVRbYOHlGW_bQ3MM-rWmuJloWyeKFLuLuK2MvoOi9Cw73FRuNiKutWXjt40QT7rXWtAlnAErLiHjZlek5seQIC_SzbvCbCSKRrHLVs6aeXOwdLtaastpBsWTtHT_vs");'></div>
                                    <button class="absolute right-3 top-3 flex h-8 w-8 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-500 opacity-0 transition-all group-hover:opacity-100 hover:bg-white hover:text-red-500 shadow-sm">
                                        <span class="material-symbols-outlined text-[18px] fill-current">favorite</span>
                                    </button>
                                </div>
                                <div>
                                    <h3 class="text-base font-semibold text-text-main leading-snug">
                                        <a href="#">
                                            <span class="absolute inset-0"></span>
                                            Atomic Habits
                                        </a>
                                    </h3>
                                    <p class="mt-1 text-sm text-text-muted">James Clear</p>
                                    <p class="mt-2 text-sm font-medium text-text-main">$18.00</p>
                                </div>
                            </div>
                            <div class="group relative">
                                <div class="aspect-[2/3] w-full overflow-hidden rounded-md bg-gray-100 mb-4 transition-all group-hover:opacity-90 shadow-sm border border-gray-100">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAwIkCFIe9mpZIxMRgnTWg6OlRI6uUPXPpDyf45CT2vidCFfhGUMELZ8qm9CQrqT_KaisJ6XHlOVPLZSpWtLHkjg9Hvp90BsnzZJfW3uLCLCGOg0sSOLWLSCWt64e9Ud4p2SwCm3frIuJJPE6_z2wkt_8yg7ncrOMDQwj2E50XExGhSkw22X-XTbeexAvszhLwa06bFdxjCkqNx3vW84IMnIGmCkdS3GMRWxglhqVmBEBVOTClVO3_LWFcDIT_wzO70IYhF1ehTFr_r");'></div>
                                    <button class="absolute right-3 top-3 flex h-8 w-8 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-500 opacity-0 transition-all group-hover:opacity-100 hover:bg-white hover:text-red-500 shadow-sm">
                                        <span class="material-symbols-outlined text-[18px] fill-current">favorite</span>
                                    </button>
                                </div>
                                <div>
                                    <h3 class="text-base font-semibold text-text-main leading-snug">
                                        <a href="#">
                                            <span class="absolute inset-0"></span>
                                            Dune
                                        </a>
                                    </h3>
                                    <p class="mt-1 text-sm text-text-muted">Frank Herbert</p>
                                    <p class="mt-2 text-sm font-medium text-text-main">$16.99</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>

            <%@include file="footer.jsp" %>

        </div>

        <script>
            // Hàm định dạng tiền tệ (được sử dụng cho JavaScript)
            const formatCurrency = (value) => {
                // Giả định định dạng tiền tệ của bạn là VND
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
            };

            document.addEventListener('DOMContentLoaded', () => {
                const tabs = document.querySelectorAll('nav[aria-label="Tabs"] button');
                const contentSections = document.querySelectorAll('.space-y-12 > div');
                const formatSelect = document.getElementById('format-select');
                const currentPriceElement = document.getElementById('current-price');
                const stockInfoElement = document.getElementById('stock-info');

                // --- LOGIC CHUYỂN TAB ---

                // Ẩn tất cả nội dung trừ mô tả ban đầu
                contentSections.forEach((section, index) => {
                    if (index !== 0) {
                        section.classList.add('hidden');
                    }
                });

                tabs.forEach(tab => {
                    tab.addEventListener('click', () => {
                        const targetId = tab.dataset.target;

                        // Ẩn tất cả nội dung
                        contentSections.forEach(section => {
                            section.classList.add('hidden');
                        });

                        // Hiển thị nội dung tương ứng
                        const targetContent = document.getElementById(targetId);
                        if (targetContent) {
                            targetContent.classList.remove('hidden');
                        }

                        // Cập nhật trạng thái active cho tab
                        tabs.forEach(t => {
                            t.classList.remove('border-primary', 'text-primary');
                            t.classList.add('border-transparent', 'text-text-muted', 'hover:border-gray-300', 'hover:text-text-main');
                            t.removeAttribute('aria-current');
                        });

                        tab.classList.add('border-primary', 'text-primary');
                        tab.classList.remove('border-transparent', 'text-text-muted', 'hover:border-gray-300', 'hover:text-text-main');
                        tab.setAttribute('aria-current', 'page');
                    });
                });


            });
        </script>
    </body>
</html>