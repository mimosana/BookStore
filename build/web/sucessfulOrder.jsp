<%-- 
    Document   : sucessfulOrder
    Created on : Dec 18, 2025, 5:44:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Order Confirmation</title>
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
        <style>::-webkit-scrollbar {
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
        <main class="flex-grow flex flex-col bg-background-light dark:bg-background-dark items-center justify-center">
            <div class="max-w-[1400px] mx-auto w-full px-6 lg:px-12 py-12 md:py-24">
                <div class="flex flex-col items-center justify-center text-center max-w-2xl mx-auto">
                    <div class="w-24 h-24 rounded-full bg-surface-light dark:bg-surface-dark border-2 border-[#eaf3e7] dark:border-[#2a3c25] flex items-center justify-center mb-8 relative">
                        <span class="material-symbols-outlined text-6xl text-primary animate-bounce">check_circle</span>
                        <div class="absolute inset-0 rounded-full animate-ping bg-primary/20"></div>
                    </div>
                    <h1 class="text-4xl md:text-5xl font-bold tracking-tight text-text-main dark:text-white mb-4">Đơn hàng đã được đặt thành công!</h1>
                    <p class="text-lg text-text-secondary mb-2">Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đã được xác nhận.</p>
                    <p class="text-sm text-text-secondary mb-12">Order ID: <span class="font-mono text-text-main dark:text-white font-bold">#BK-839201</span></p>
                    <div class="w-full bg-surface-light dark:bg-surface-dark rounded-3xl p-8 border border-[#eaf3e7] dark:border-[#2a3c25] mb-12 text-left">
                        <h3 class="text-xl font-bold text-text-main dark:text-white mb-6 border-b border-[#eaf3e7] dark:border-[#2a3c25] pb-4">Order Details</h3>
                        <div class="space-y-4">
                            <div class="flex justify-between items-start gap-4">
                                <div class="flex-1">
                                    <p class="text-sm font-bold text-text-main dark:text-white">The Psychology of Money</p>
                                    <p class="text-xs text-text-secondary">Morgan Housel</p>
                                </div>
                                <div class="text-right">
                                    <p class="text-sm font-medium text-text-main dark:text-white">$18.00</p>
                                    <p class="text-xs text-text-secondary">Qty: 1</p>
                                </div>
                            </div>
                            <div class="flex justify-between items-start gap-4">
                                <div class="flex-1">
                                    <p class="text-sm font-bold text-text-main dark:text-white">Atomic Habits</p>
                                    <p class="text-xs text-text-secondary">James Clear</p>
                                </div>
                                <div class="text-right">
                                    <p class="text-sm font-medium text-text-main dark:text-white">$16.99</p>
                                    <p class="text-xs text-text-secondary">Qty: 1</p>
                                </div>
                            </div>
                            <div class="border-t border-[#eaf3e7] dark:border-[#2a3c25] pt-4 mt-4 flex justify-between items-center">
                                <span class="text-base font-bold text-text-main dark:text-white">Total Paid</span>
                                <span class="text-xl font-black text-primary">$42.79</span>
                            </div>
                        </div>
                        <div class="mt-6 pt-6 border-t border-[#eaf3e7] dark:border-[#2a3c25] grid grid-cols-1 md:grid-cols-2 gap-6 text-sm">
                            <div>
                                <p class="text-text-secondary mb-1">Shipping Address</p>
                                <p class="font-medium text-text-main dark:text-white">Jane Doe</p>
                                <p class="text-text-main dark:text-gray-300">123 Book St, Library City</p>
                                <p class="text-text-main dark:text-gray-300">New York, NY 10001, US</p>
                            </div>
                            <div>
                                <p class="text-text-secondary mb-1">Estimated Delivery</p>
                                <p class="font-medium text-text-main dark:text-white flex items-center gap-2">
                                    <span class="material-symbols-outlined text-primary text-lg">local_shipping</span>
                                    Wed, Oct 24 - Fri, Oct 26
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="flex flex-col sm:flex-row gap-4 w-full justify-center">
                        <a class="flex-1 sm:flex-none px-8 py-4 bg-primary hover:bg-[#3cd610] text-text-main font-bold rounded-xl transition-all shadow-lg shadow-primary/20 flex items-center justify-center gap-2 group text-center" href="#">
                            <span class="material-symbols-outlined group-hover:-translate-x-1 transition-transform">arrow_back</span>
                            Continue Shopping
                        </a>
                        <a class="flex-1 sm:flex-none px-8 py-4 bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] text-text-main dark:text-white font-bold rounded-xl transition-all hover:bg-gray-100 dark:hover:bg-gray-800 flex items-center justify-center gap-2 text-center" href="#">
                            <span class="material-symbols-outlined">receipt_long</span>
                            View Orders
                        </a>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body></html>
