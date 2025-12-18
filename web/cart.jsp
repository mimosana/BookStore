<%-- 
    Document   : cart
    Created on : Dec 15, 2025, 12:07:51 AM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Shopping Cart</title>
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
            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            input[type=number] {
                -moz-appearance: textfield;
            }
        </style>
    </head>
    <body class="bg-background-light dark:bg-background-dark text-text-main font-display antialiased min-h-screen flex flex-col">
        
        <%@include file="menu.jsp" %>
        <main class="flex-grow flex flex-col">
            <div class="bg-surface-light dark:bg-background-dark border-b border-[#eaf3e7] dark:border-[#2a3c25]">
                <div class="max-w-[1400px] mx-auto px-6 lg:px-12 py-8">
                    
                    <div class="flex flex-col md:flex-row md:items-end justify-between gap-6">
                        <div class="max-w-2xl">
                            <h2 class="text-4xl md:text-5xl font-black tracking-tight text-text-main dark:text-white mb-3">Giỏ hàng của bạn</h2>
                            <p class="text-lg text-text-secondary">Xem lại lựa chọn của bạn trước khi tiến hành thanh toán.</p>
                        </div>
                        <div class="text-right hidden md:block">
                            <p class="text-sm font-medium text-text-secondary">${sessionScope.cart.getSizeOfList()} Sản phẩm trong giỏ hàng</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex-grow bg-background-light dark:bg-background-dark">
                <div class="max-w-[1400px] mx-auto px-6 lg:px-12 py-10">
                    <div class="flex flex-col lg:flex-row gap-12">
                        <div class="flex-grow">
                            <div class="hidden md:grid grid-cols-12 gap-4 pb-4 border-b border-[#eaf3e7] dark:border-[#2a3c25] text-sm font-semibold text-text-secondary uppercase tracking-wider">
                                <div class="col-span-6 pl-4">Sản phẩm</div>
                                <div class="col-span-2 text-center">Giá tiền</div>
                                <div class="col-span-3 text-center">Số lượng</div>
                                <div class="col-span-1 text-center"></div>
                            </div>
                            <c:set var="c" value="${sessionScope.cart}"/>
                            <c:forEach var="item" items="${c.items}">
                            <div class="group flex flex-col md:grid md:grid-cols-12 gap-6 items-center py-6 border-b border-[#eaf3e7] dark:border-[#2a3c25] hover:bg-surface-light/50 dark:hover:bg-surface-dark/50 transition-colors rounded-xl md:rounded-none px-4 md:px-0">
                                <div class="col-span-6 flex gap-6 items-center w-full">
                                    <div class="w-20 h-28 flex-shrink-0 bg-[#f0f0f0] rounded-lg overflow-hidden shadow-sm relative group-hover:shadow-md transition-shadow">
                                        <img alt="${item.variant.book.title}" class="w-full h-full object-cover" src="${item.variant.book.image}"/>
                                    </div>
                                    <div class="flex flex-col gap-1">
                                        <h3 class="text-lg font-bold text-text-main dark:text-white leading-tight">${item.variant.book.title}</h3>
                                        <p class="text-sm font-medium text-text-secondary">${item.variant.book.author}</p>
                                        <div class="text-xs text-text-secondary mt-1 bg-[#eaf3e7] dark:bg-[#2a3c25] inline-block px-2 py-0.5 rounded-full w-fit">${item.variant.variantName}</div>
                                    </div>
                                </div>
                                <div class="col-span-2 flex justify-between md:justify-center w-full md:w-auto items-center">
                                    <span class="md:hidden text-sm font-medium text-text-secondary">Price:</span>
                                    <span class="text-lg font-bold text-text-main dark:text-white"><fmt:formatNumber type="number" value="${item.variant.price*item.quantity}"/></span>
                                </div>
                                <div class="col-span-3 flex justify-between md:justify-center w-full md:w-auto items-center">
                                    <span class="md:hidden text-sm font-medium text-text-secondary">Quantity:</span>
                                    <div class="flex items-center border border-[#eaf3e7] dark:border-[#2a3c25] rounded-full bg-white dark:bg-surface-dark">
                                        <button class="w-8 h-8 flex items-center justify-center text-text-secondary hover:text-primary transition-colors">
                                            <a href="process?num=-1&variantid=${item.variant.variantId}"><span class="material-symbols-outlined text-[18px]">remove</span></a>
                                        </button>
                                        <input class="w-10 text-center bg-transparent border-none p-0 text-sm font-bold text-text-main dark:text-white focus:ring-0" type="number" value="${item.quantity}"/>
                                        <button class="w-8 h-8 flex items-center justify-center text-text-secondary hover:text-primary transition-colors">
                                            <a href="process?num=1&variantid=${item.variant.variantId}"><span class="material-symbols-outlined text-[18px]">add</span></a>
                                        </button>
                                        <p class="col-span-2 text-red-500 font-semibold">
                                        ${messageQuantity}
                                    </p>
                                    </div>
                                </div>
                                <div class="col-span-1 flex justify-center w-full md:w-auto mt-2 md:mt-0">
                                    <button class="text-gray-400 hover:text-red-500 transition-colors p-2 rounded-full hover:bg-red-50 dark:hover:bg-red-900/20" title="Remove item">
                                        <a href="delete?action=remove&variantId=${item.variant.variantId}" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');"><span class="material-symbols-outlined">delete</span></a>
                                    </button>
                                </div>
                            </div>
                            </c:forEach>
                            
                            <div class="flex justify-between items-center mt-8">
                                <a href="filter" class="flex items-center gap-2 text-text-secondary hover:text-primary font-semibold text-sm transition-colors" href="filter">
                                    <span class="material-symbols-outlined">arrow_back</span>
                                    Tiếp tục mua sắm
                                </a>
                                <a href="delete?action=removeAll" onclick="return confirm('Bạn có chắc chắn muốn xóa tất cả sản phẩm không?');">
                                <button class="text-text-secondary hover:text-red-500 text-sm font-semibold transition-colors">
                                    Clear Cart
                                </button>
                                    </a>
                            </div>
                        </div>
                        <div class="w-full lg:w-96 flex-shrink-0">
                            <div class="sticky top-28 space-y-6">
                                <div class="bg-surface-light dark:bg-surface-dark p-6 lg:p-8 rounded-3xl border border-[#eaf3e7] dark:border-[#2a3c25]">
                                    <h3 class="text-xl font-bold text-text-main dark:text-white mb-6">Tóm tắt đơn hàng</h3>
                                    <div class="space-y-4 mb-6">
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-text-secondary">Tổng phụ</span>
                                            <span class="font-bold text-text-main dark:text-white"><fmt:formatNumber type="number" value="${c.getTotalQuantity()}"/> Đ</span>
                                        </div>
                                        
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-text-secondary">Ước tính thuế</span>
                                            <span class="font-bold text-text-main dark:text-white">0 Đ</span>
                                        </div>
                                    </div>
                                    <div class="border-t border-dashed border-[#eaf3e7] dark:border-[#2a3c25] my-6"></div>
                                    <div class="flex justify-between items-center mb-8">
                                        <span class="text-lg font-bold text-text-main dark:text-white">Total</span>
                                        <span class="text-2xl font-black text-primary"><fmt:formatNumber type="number" value="${c.getTotalQuantity()}"/></span>
                                    </div>
                                    <form action="checkout" method="get">
                                    <button type="submit" class="w-full bg-primary hover:bg-green-500 text-white font-bold py-4 rounded-xl transition-all shadow-lg shadow-primary/20 hover:shadow-primary/40 flex items-center justify-center gap-2">
                                        <span>Proceed to Checkout</span>
                                        <span class="material-symbols-outlined">arrow_forward</span>
                                    </button>
                                    </form>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>

    </body></html>
