<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Thanh toán - BookStore</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"/>
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
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background-color: #eaf3e7; border-radius: 20px; }
        #orderItems { transition: max-height 0.3s ease-out; overflow: hidden; }
    </style>
</head>
<body class="bg-background-light dark:bg-background-dark text-text-main font-display antialiased min-h-screen flex flex-col">
    
    <%@include file="menu.jsp" %>
    
    <form action="checkout" method="POST" class="flex-grow flex flex-col">
        <main class="flex-grow flex flex-col bg-background-light dark:bg-background-dark">
            <div class="max-w-[1400px] mx-auto w-full px-6 lg:px-12 py-8">
                <nav class="flex items-center gap-2 text-sm text-text-secondary mb-8">
                    <a class="hover:text-primary transition-colors" href="home">Trang chủ</a>
                    <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                    <a class="hover:text-primary transition-colors" href="cart">Giỏ hàng</a>
                    <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                    <span class="font-semibold text-text-main dark:text-white">Thanh toán</span>
                </nav>

                <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-24">
                    <div class="lg:col-span-7 xl:col-span-8 space-y-12">
                        <div>
                            <h1 class="text-3xl md:text-4xl font-bold tracking-tight text-text-main dark:text-white mb-2">Thanh toán</h1>
                            <p class="text-text-secondary">Vui lòng nhập đầy đủ thông tin để hoàn tất đơn hàng.</p>
                        </div>
                        
                        <section aria-labelledby="shipping-heading">
                            <h2 class="text-xl font-bold text-text-main dark:text-white flex items-center gap-3 mb-6" id="shipping-heading">
                                <span class="flex items-center justify-center w-8 h-8 rounded-full bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] text-sm text-primary font-bold">1</span>
                                Thông tin giao hàng
                            </h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div class="space-y-1">
                                    <label class="text-sm font-medium text-text-main dark:text-gray-300">Tên người nhận</label>
                                    <input name="receiverName" class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" type="text" required value=""/>
                                </div>
                                <div class="space-y-1">
                                    <label class="text-sm font-medium text-text-main dark:text-gray-300">Số điện thoại</label>
                                    <input name="phone" class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" type="tel" required/>
                                </div>
                                <div class="space-y-1 md:col-span-2">
                                    <label class="text-sm font-medium text-text-main dark:text-gray-300">Địa chỉ giao hàng</label>
                                    <input name="address" class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" type="text" required placeholder="Số nhà, tên đường..."/>
                                </div>
                                <div class="space-y-1 md:col-span-2">
                                    <label class="text-sm font-medium text-text-main dark:text-gray-300">Thành phố</label>
                                    <input name="city" class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" type="text" required/>
                                </div>
                            </div>
                        </section>

                        <section aria-labelledby="payment-heading" class="border-t border-[#eaf3e7] dark:border-[#2a3c25] pt-10 pb-8">
                            <h2 class="text-xl font-bold text-text-main dark:text-white flex items-center gap-3 mb-6" id="payment-heading">
                                <span class="flex items-center justify-center w-8 h-8 rounded-full bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] text-sm text-primary font-bold">2</span>
                                Hình thức thanh toán
                            </h2>
                            <div class="rounded-xl border border-[#eaf3e7] dark:border-[#2a3c25] bg-surface-light dark:bg-surface-dark p-6 flex items-center gap-4 shadow-sm">
                                <div class="w-12 h-12 rounded-full bg-[#eaf3e7] dark:bg-[#2a3c25] flex items-center justify-center text-primary">
                                    <span class="material-symbols-outlined text-2xl">payments</span>
                                </div>
                                <div>
                                    <h3 class="font-bold text-text-main dark:text-white text-lg">Thanh toán khi nhận hàng</h3>
                                    <p class="text-sm text-text-secondary">Thanh toán an toàn khi bạn nhận được đơn hàng.</p>
                                </div>
                            </div>
                        </section>
                    </div>

                    <div class="lg:col-span-5 xl:col-span-4">
                        <div class="sticky top-24 space-y-6">
                            <div class="bg-surface-light dark:bg-surface-dark rounded-3xl p-6 lg:p-8 border border-[#eaf3e7] dark:border-[#2a3c25]">
                                <div class="flex items-center justify-between mb-6">
                                    <h3 class="text-xl font-bold text-text-main dark:text-white">Tổng quan</h3>
                                    <button type="button" onclick="toggleItems()" class="text-primary text-sm font-bold flex items-center gap-1 hover:underline">
                                        <span id="btnText">Hide</span>
                                        <span id="btnIcon" class="material-symbols-outlined text-sm transition-transform">keyboard_arrow_up</span>
                                    </button>
                                </div>

                                <div id="orderItems" class="space-y-6 mb-8 max-h-80 overflow-y-auto pr-2">
                                    <c:forEach var="o" items="${sessionScope.cart.items}">
                                        <div class="flex gap-4">
                                            <div class="h-20 w-16 flex-shrink-0 overflow-hidden rounded-lg bg-gray-100 border border-[#eaf3e7]">
                                                <img alt="${o.variant.book.title}" class="h-full w-full object-cover" src="${o.variant.book.image}"/>
                                            </div>
                                            <div class="flex flex-1 flex-col justify-between py-1">
                                                <div>
                                                    <h4 class="font-bold text-text-main dark:text-white line-clamp-1">${o.variant.book.title}</h4>
                                                    <p class="text-xs text-text-secondary">${o.variant.book.author}</p>
                                                </div>
                                                <div class="flex justify-between items-center">
                                                    <span class="text-sm font-semibold text-text-main dark:text-white">
                                                        <fmt:formatNumber type="number" value="${o.variant.price}"/> Đ
                                                    </span>
                                                    <span class="text-xs text-text-secondary">SL: ${o.quantity}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="space-y-3 border-t border-[#eaf3e7] dark:border-[#2a3c25] pt-6">
                                    <div class="flex justify-between text-sm text-text-secondary">
                                        <span>Tạm tính</span>
                                        <span class="font-medium text-text-main dark:text-white">
                                            <fmt:formatNumber type="number" value="${sessionScope.cart.getTotalQuantity()}"/> Đ
                                        </span>
                                    </div>
                                    <div class="flex justify-between text-sm text-text-secondary">
                                        <span>Phí giao hàng</span>
                                        <span class="font-medium text-text-main dark:text-white">15,000 Đ</span>
                                    </div>
                                    <div class="flex justify-between items-center pt-4 border-t border-[#eaf3e7] dark:border-[#2a3c25]">
                                        <span class="text-base font-bold text-text-main dark:text-white">Tổng cộng</span>
                                        <span class="text-2xl font-black text-primary">
                                            <fmt:formatNumber type="number" value="${sessionScope.cart.getTotalQuantity() + 15000}"/> Đ
                                        </span>
                                    </div>
                                </div>

                                <button type="submit" class="w-full mt-8 bg-primary hover:bg-[#3cd610] text-text-main font-bold py-4 rounded-xl transition-all shadow-lg shadow-primary/20 flex items-center justify-center gap-2 group">
                                    <span class="material-symbols-outlined group-hover:translate-x-1 transition-transform">local_shipping</span>
                                    Đặt hàng - <fmt:formatNumber type="number" value="${sessionScope.cart.getTotalQuantity() + 15000}"/> Đ
                                </button>
                                
                                <p class="text-center text-xs text-text-secondary mt-4 flex items-center justify-center gap-1">
                                    <span class="material-symbols-outlined text-[14px]">verified_user</span>
                                    Thanh toán an toàn khi nhận hàng
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </form>
    
    <%@include file="footer.jsp" %>

    <script>
        function toggleItems() {
            const items = document.getElementById('orderItems');
            const btnText = document.getElementById('btnText');
            const btnIcon = document.getElementById('btnIcon');
            
            if (items.style.display === "none") {
                items.style.display = "block";
                btnText.innerText = "Hide";
                btnIcon.style.transform = "rotate(0deg)";
            } else {
                items.style.display = "none";
                btnText.innerText = "Show";
                btnIcon.style.transform = "rotate(180deg)";
            }
        }
    </script>
</body>
</html>