<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light scroll-smooth" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Tài khoản của tôi - BookStore</title>
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
</head>
<body class="bg-background-light dark:bg-background-dark text-text-main font-display antialiased min-h-screen flex flex-col">
    
    <%@include file="menu.jsp" %>

    <main class="flex-grow flex flex-col">
        <div class="bg-surface-light dark:bg-background-dark border-b border-[#eaf3e7] dark:border-[#2a3c25]">
            <div class="max-w-[1200px] mx-auto px-6 lg:px-12 py-8">
                <nav class="flex items-center gap-2 text-sm text-text-secondary mb-6">
                    <a class="hover:text-primary transition-colors" href="home">Trang chủ</a>
                    <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                    <span class="font-semibold text-text-main dark:text-white">Hồ sơ</span>
                </nav>
                <div class="max-w-2xl">
                    <h2 class="text-3xl md:text-4xl font-black tracking-tight text-text-main dark:text-white mb-2">
                        <c:choose>
                            <c:when test="${activeView == 'orders'}">Đơn hàng của tôi</c:when>
                            <c:when test="${activeView == 'favorites'}">Yêu thích của tôi</c:when>
                            <c:otherwise>Hồ sơ của tôi</c:otherwise>
                        </c:choose>
                    </h2>
                    <p class="text-text-secondary">Quản lý thông tin cá nhân và theo dõi hoạt động mua sắm của bạn.</p>
                </div>
            </div>
        </div>

        <div class="flex-grow bg-background-light dark:bg-background-dark">
            <div class="max-w-[1200px] mx-auto px-6 lg:px-12 py-10 flex flex-col lg:flex-row gap-12">
                
                <aside class="w-full lg:w-64 flex-shrink-0">
                    <nav class="space-y-2 sticky top-24">
                        <a href="profile?view=profile" class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${activeView == 'profile' ? 'bg-surface-light text-primary font-bold shadow-sm' : 'text-text-secondary hover:text-text-main'}">
                            <span class="material-symbols-outlined">person</span> Thông tin cá nhân
                        </a>
                        <a href="profile?view=orders" class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${activeView == 'orders' ? 'bg-surface-light text-primary font-bold shadow-sm' : 'text-text-secondary hover:text-text-main'}">
                            <span class="material-symbols-outlined">shopping_bag</span> Các đơn hàng
                        </a>
                        <a href="profile?view=favorites" class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${activeView == 'favorites' ? 'bg-surface-light text-primary font-bold shadow-sm' : 'text-text-secondary hover:text-text-main'}">
                            <span class="material-symbols-outlined">favorite</span> Yêu thích
                        </a>
                        <hr class="my-4 border-[#eaf3e7] dark:border-[#2a3c25]">
                        <a href="logout" class="flex items-center gap-3 px-4 py-3 rounded-xl hover:bg-red-50 text-text-secondary hover:text-red-500 transition-all">
                            <span class="material-symbols-outlined">logout</span> Đăng xuất
                        </a>
                    </nav>
                </aside>

                <div class="flex-1">
                    
                    <%-- 1. VIEW: PERSONAL INFO --%>
                    <c:if test="${activeView == 'profile'}">
                        <c:set var="user" value="${sessionScope.account}"/>
                        <div class="flex items-center justify-between mb-8">
                            <h3 class="text-2xl font-bold text-text-main">Thông tin chi tiết</h3>
                            <button class="text-primary font-bold text-sm hover:underline flex items-center gap-1">
                                <span class="material-symbols-outlined text-sm">edit</span> Sửa hồ sơ
                            </button>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="p-6 rounded-2xl border border-[#eaf3e7] bg-surface-light/50 dark:bg-surface-dark/30">
                                <label class="block text-xs font-bold text-text-secondary uppercase mb-2">Họ và tên</label>
                                <p class="text-lg font-medium text-text-main dark:text-white">${user.getFullName()}</p>
                            </div>
                            <div class="p-6 rounded-2xl border border-[#eaf3e7] bg-surface-light/50 dark:bg-surface-dark/30">
                                <label class="block text-xs font-bold text-text-secondary uppercase mb-2">Địa chỉ gmail</label>
                                <p class="text-lg font-medium text-text-main dark:text-white">${user.getEmail()}</p>
                            </div>
                            <div class="p-6 rounded-2xl border border-[#eaf3e7] bg-surface-light/50 dark:bg-surface-dark/30">
                                <label class="block text-xs font-bold text-text-secondary uppercase mb-2">Tên người sử dụng</label>
                                <p class="text-lg font-medium text-text-main dark:text-white">${user.getUsername()}</p>
                            </div>
                            <div class="p-6 rounded-2xl border border-[#eaf3e7] bg-surface-light/50 dark:bg-surface-dark/30 flex items-center justify-between">
                                <div>
                                    <label class="block text-xs font-bold text-text-secondary uppercase mb-2">Mật khẩu</label>
                                    <p class="text-lg font-medium text-text-main dark:text-white">••••••••••••</p>
                                </div>
                                <button class="px-4 py-2 text-sm font-bold bg-white dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-full hover:bg-gray-50 transition-colors shadow-sm">
                                    Thay đổi mật khẩu
                                </button>
                            </div>
                        </div>
                        
                    </c:if>

                    <%-- 2. VIEW: ORDERS --%>
                    <c:if test="${activeView == 'orders'}">
                        <div class="flex items-center gap-8 border-b border-[#eaf3e7] dark:border-[#2a3c25] mb-8">
                            <a href="profile?view=orders&status=delivering" class="pb-4 transition-all ${param.status != 'delivered' ? 'text-primary font-bold border-b-2 border-primary' : 'text-text-secondary'}">
                                <span class="flex items-center gap-2"><span class="material-symbols-outlined text-lg">local_shipping</span> Currently Delivering</span>
                            </a>
                            <a href="profile?view=orders&status=delivered" class="pb-4 transition-all ${param.status == 'delivered' ? 'text-primary font-bold border-b-2 border-primary' : 'text-text-secondary'}">
                                <span class="flex items-center gap-2"><span class="material-symbols-outlined text-lg">check_circle</span> Delivered</span>
                            </a>
                        </div>

                        <div class="space-y-6">
                            <c:choose>
                                <c:when test="${empty listOrders}">
                                    <div class="py-12 text-center bg-surface-light dark:bg-surface-dark/30 rounded-3xl border border-dashed border-gray-300">
                                        <p class="text-text-secondary">Không có đơn hàng nào để hiển thị.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="o" items="${listOrders}">
                                        <div class="bg-surface-light/50 dark:bg-surface-dark/50 border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl p-6 flex flex-col md:flex-row items-center gap-8 hover:shadow-md transition-all">
                                            <div class="w-32 h-44 bg-white rounded-2xl overflow-hidden shadow-sm flex-shrink-0">
                                                <img src="${o.book[0].image}" class="w-full h-full object-cover" alt="${o.book[0].title}">
                                            </div>
                                            <div class="flex-grow space-y-3 text-center md:text-left">
                                                <h4 class="text-xl font-bold text-text-main dark:text-white">${o.book[0].title}</h4>
                                                <p class="text-text-secondary font-medium">${o.book[0].author}</p>
                                                <div class="flex flex-wrap items-center justify-center md:justify-start gap-6 text-sm text-text-secondary">
                                                    <span class="flex items-center gap-2"><span class="material-symbols-outlined text-sm">calendar_today</span> Purchased: <fmt:formatDate value="${o.orderDate}" pattern="MMM dd, yyyy"/></span>
                                                    <span class="flex items-center gap-2"><span class="material-symbols-outlined text-sm">tag</span> Order #${o.orderId}</span>
                                                </div>
                                            </div>
                                            <div class="flex flex-col gap-3 w-full md:w-48">
                                                <c:choose>
                                                    <c:when test="${param.status == 'delivered'}">
                                                        <div class="bg-gray-100 dark:bg-surface-dark text-gray-500 text-center py-2 rounded-full text-xs font-bold uppercase tracking-wider">Success</div>
                                                        <button class="bg-primary text-white py-3 rounded-full font-bold hover:bg-green-500 shadow-md transition-all">Buy Again</button>
                                                        <button class="border border-primary/30 py-2 rounded-full font-semibold text-sm hover:bg-primary/5 dark:text-white">Rate Product</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="order?orderId=${o.orderId}">
                                                        <button class="bg-text-main dark:bg-white text-white dark:text-text-main py-3 rounded-full font-bold hover:opacity-90 transition-all">Track Package</button>
                                                        </a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>

                    <%-- 3. VIEW: FAVORITES --%>
                    <c:if test="${activeView == 'favorites'}">
                        <div class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-6">
                            <c:choose>
                                <c:when test="${empty listFavorites}">
                                    <div class="col-span-full py-12 text-center">
                                        <p class="text-text-secondary">Danh sách yêu thích trống.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="f" items="${listFavorites}">
                                        <div class="bg-white dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl p-4 hover:shadow-lg transition-all group">
                                            <div class="aspect-[2/3] rounded-2xl overflow-hidden mb-4 relative">
                                                <img src="${f.image}" class="w-full h-full object-cover" alt="${f.title}">
                                                <a href="favorites?action=remove&pid=${f.bookId}" class="absolute top-3 right-3 w-10 h-10 bg-white/90 backdrop-blur rounded-full flex items-center justify-center text-red-500 shadow-sm transition-transform hover:scale-110">
                                                    <span class="material-symbols-outlined fill-1">favorite</span>
                                                </a>
                                            </div>
                                            <h4 class="font-bold text-text-main dark:text-white truncate">${f.title}</h4>
                                            <p class="text-sm text-text-secondary mb-4">${f.author}</p>
                                            <div class="flex gap-2">
                                                <form action="cart" method="POST" class="flex-1">
                                                    <input type="hidden" name="action" value="add">
                                                    <input type="hidden" name="pid" value="${f.bookId}">
                                                    <button class="w-full bg-primary/10 text-primary py-2 rounded-xl font-bold text-sm hover:bg-primary hover:text-white transition-all">Add to Cart</button>
                                                </form>
                                                <a href="favorites?action=remove&pid=${f.bookId}" class="w-10 h-10 border border-[#eaf3e7] dark:border-[#2a3c25] rounded-xl flex items-center justify-center text-text-secondary hover:bg-red-50 hover:text-red-500 transition-all">
                                                    <span class="material-symbols-outlined text-lg">delete</span>
                                                </a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </main>

    <footer class="bg-surface-light dark:bg-surface-dark border-t border-[#eaf3e7] dark:border-[#2a3c25] py-12 px-6 lg:px-12">
        <div class="max-w-[1200px] mx-auto flex flex-col md:flex-row justify-between items-center gap-6">
            <p class="text-text-secondary text-sm">© 2024 BookStore Inc. All rights reserved.</p>
            <div class="flex gap-6 text-sm">
                <a class="text-text-secondary hover:text-primary transition-colors" href="#">Privacy Policy</a>
                <a class="text-text-secondary hover:text-primary transition-colors" href="#">Terms of Service</a>
            </div>
        </div>
    </footer>
</body>
</html>
