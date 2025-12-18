<%-- 
    Document   : orderDetail
    Created on : Dec 15, 2025, 12:09:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Order Invoice Details</title>
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
                        <a class="hover:text-primary transition-colors" href="profile">Hồ sơ</a>
                        <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                        <a class="hover:text-primary transition-colors" href="profile?view=orders">Đơn hàng</a>
                        <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                        <span class="font-semibold text-text-main dark:text-white">Đơn hàng ${order.orderId}</span>
                    </nav>
                    <div class="flex flex-col md:flex-row md:items-end justify-between gap-6">
                        <div class="max-w-2xl">
                            <div class="flex items-center gap-3 mb-2">
                                <h2 class="text-4xl md:text-5xl font-black tracking-tight text-text-main dark:text-white">Đơn hàng ${order.orderId}</h2>
                                <span class="px-3 py-1 rounded-full bg-primary/10 text-primary text-xs font-bold border border-primary/20 tracking-wide uppercase">${order.status}</span>
                            </div>
                            <p class="text-lg text-text-secondary flex items-center gap-2 mt-2">
                                <span class="material-symbols-outlined text-primary">calendar_month</span>
                                <span>Ngày đặt: 
                                    <span class="font-bold text-text-main dark:text-white">
                                        <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy"/>
                                    </span>
                                </span>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
            <div class="flex-grow bg-background-light dark:bg-background-dark">
                <div class="max-w-[1400px] mx-auto px-6 lg:px-12 py-12">
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-12">
                        <div class="lg:col-span-8 space-y-6">
                            <div class="flex items-center justify-between pb-4 border-b border-[#eaf3e7] dark:border-[#2a3c25]">
                                <h3 class="text-xl font-bold text-text-main dark:text-white">Các sản phẩm có trong đơn</h3>
                                <span class="text-sm font-semibold text-text-secondary">${listO.size()} sản phẩm </span>
                            </div>
                            <c:forEach var="o" items="${listO}">
                                <div class="group flex flex-col sm:flex-row gap-6 p-6 bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl hover:shadow-sm transition-all">
                                    <div class="w-24 h-36 flex-shrink-0 bg-[#f0f0f0] rounded-xl overflow-hidden shadow-sm relative">
                                        <img alt="${o.varaint.book.title}" class="w-full h-full object-cover" src="${o.varaint.book.image}"/>
                                    </div>
                                    <div class="flex-grow flex flex-col justify-between">
                                        <div>
                                            <div class="flex justify-between items-start gap-4">
                                                <div>
                                                    <h4 class="text-lg font-bold text-text-main dark:text-white leading-tight">${o.varaint.book.title}</h4>
                                                    <p class="text-sm font-medium text-text-secondary mt-1">${o.varaint.book.author}</p>
                                                </div>
                                                <span class="text-lg font-bold text-text-main dark:text-white"><fmt:formatNumber type="number" value="${o.varaint.price}"/></span>
                                            </div>
                                            <div class="flex items-center gap-2 mt-2">
                                                <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-[#eaf3e7] dark:bg-[#2a3c25] text-text-secondary">
                                                    ${o.varaint.variantName}
                                                </span>
                                            </div>
                                        </div>
                                        <div class="flex items-end justify-between mt-4">
                                            <div class="text-sm text-text-main dark:text-white font-medium">
                                                Số lượng: <span class="font-bold">${o.quantity}</span>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="lg:col-span-4 space-y-6">
                            <div class="p-6 bg-white dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl shadow-sm shadow-[#eaf3e7]/50 dark:shadow-none">
                                <h3 class="text-lg font-bold text-text-main dark:text-white mb-6 flex items-center gap-2">
                                    <span class="material-symbols-outlined text-text-secondary">receipt_long</span>
                                    Tóm tắt thanh toán
                                </h3>
                                <div class="space-y-4 pb-6 border-b border-[#eaf3e7] dark:border-[#2a3c25] text-sm">
                                    <div class="flex justify-between items-center text-text-secondary">
                                        <span>Tổng sản phẩm</span>
                                        <span class="font-semibold text-text-main dark:text-white"><fmt:formatNumber type="number" value="${order.total-15000}"/></span>
                                    </div>
                                    <div class="flex justify-between items-center text-text-secondary">
                                        <span>Chi phí giao hàng</span>
                                        <span class="font-semibold text-text-main dark:text-white">15.000 Đ</span>
                                    </div>
                                    
                                </div>
                                <div class="pt-6 flex justify-between items-center">
                                    <span class="text-lg font-bold text-text-main dark:text-white">Tổng tiền đơn</span>
                                    <span class="text-2xl font-black text-primary"><fmt:formatNumber type="number" value="${order.total}"/></span>
                                </div>

                            </div>
                            <div class="p-6 bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl">
                                <h3 class="text-lg font-bold text-text-main dark:text-white mb-4 flex items-center gap-2">
                                    <span class="material-symbols-outlined text-text-secondary">local_shipping</span>
                                    Chi tiết giao hàng
                                </h3>
                                <div class="space-y-1">
                                    <p class="font-bold text-text-main dark:text-white">${order.receiverName}</p>
                                    <p class="text-sm text-text-secondary">${order.phone}</p>
                                    <p class="text-sm text-text-secondary">${order.shippingAddress}</p>
                                    <p class="text-sm text-text-secondary">${order.city}</p>
                                </div>
                                <div class="mt-4 pt-4 border-t border-[#eaf3e7] dark:border-[#2a3c25]">
                                    <p class="text-xs font-bold text-text-main dark:text-white uppercase tracking-wider mb-1">Phương thức thanh toán</p>
                                    <p class="text-sm text-text-secondary">Thanh toán khi nhận hàng</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>

    </body></html>
