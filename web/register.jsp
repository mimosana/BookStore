<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Sign Up - BookStore</title>
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
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background-color: #eaf3e7; border-radius: 20px; }
    </style>
</head>
<body class="bg-surface-light dark:bg-background-dark text-text-main font-display antialiased min-h-screen flex flex-col">

<main class="flex-grow flex items-center justify-center p-6">
    <div class="w-full max-w-[520px] bg-background-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl p-8 md:p-10 shadow-xl shadow-[#eaf3e7]/60 dark:shadow-none">
        <div class="text-center mb-8">
            <h2 class="text-3xl font-black tracking-tight text-text-main dark:text-white mb-2">Create Account</h2>
            <p class="text-text-secondary font-medium">Join us to explore our collection.</p>
        </div>

        <!-- Hiển thị lỗi / thông báo thành công -->
        <c:if test="${not empty error}">
            <div class="text-red-500 text-sm mb-2">${error}</div>
        </c:if>
        <c:if test="${not empty success}">
            <div class="text-green-500 text-sm mb-2">${success}</div>
        </c:if>

        <form class="space-y-5" method="post" action="${pageContext.request.contextPath}/register">

            <div class="space-y-2">
                <label class="block text-sm font-bold text-text-main dark:text-white ml-1" for="fullname">Họ và tên</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                        <span class="material-symbols-outlined text-text-secondary">badge</span>
                    </div>
                    <input class="block w-full pl-11 pr-4 py-3.5 rounded-2xl bg-surface-light dark:bg-background-dark border-none ring-1 ring-inset ring-[#eaf3e7] dark:ring-[#2a3c25] focus:ring-2 focus:ring-primary text-text-main dark:text-white placeholder-text-secondary/60 transition-shadow sm:text-sm sm:leading-6"
                           id="fullname" name="fullname" placeholder="Full Name" type="text" value="${param.fullname != null ? param.fullname : ''}"/>
                </div>
            </div>

            <div class="space-y-2">
                <label class="block text-sm font-bold text-text-main dark:text-white ml-1" for="username">Tên người dùng</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                        <span class="material-symbols-outlined text-text-secondary">person</span>
                    </div>
                    <input class="block w-full pl-11 pr-4 py-3.5 rounded-2xl bg-surface-light dark:bg-background-dark border-none ring-1 ring-inset ring-[#eaf3e7] dark:ring-[#2a3c25] focus:ring-2 focus:ring-primary text-text-main dark:text-white placeholder-text-secondary/60 transition-shadow sm:text-sm sm:leading-6"
                           id="username" name="username" placeholder="Username" type="text" value="${param.username != null ? param.username : ''}"/>
                </div>
            </div>

            <div class="space-y-2">
                <label class="block text-sm font-bold text-text-main dark:text-white ml-1" for="email">Email</label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                        <span class="material-symbols-outlined text-text-secondary">mail</span>
                    </div>
                    <input class="block w-full pl-11 pr-4 py-3.5 rounded-2xl bg-surface-light dark:bg-background-dark border-none ring-1 ring-inset ring-[#eaf3e7] dark:ring-[#2a3c25] focus:ring-2 focus:ring-primary text-text-main dark:text-white placeholder-text-secondary/60 transition-shadow sm:text-sm sm:leading-6"
                           id="email" name="email" placeholder="name@example.com" type="email" value="${param.email != null ? param.email : ''}"/>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-sm font-bold text-text-main dark:text-white ml-1" for="password">Mật khẩu</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <span class="material-symbols-outlined text-text-secondary">lock</span>
                        </div>
                        <input class="block w-full pl-11 pr-4 py-3.5 rounded-2xl bg-surface-light dark:bg-background-dark border-none ring-1 ring-inset ring-[#eaf3e7] dark:ring-[#2a3c25] focus:ring-2 focus:ring-primary text-text-main dark:text-white placeholder-text-secondary/60 transition-shadow sm:text-sm sm:leading-6"
                               id="password" name="password" placeholder="••••••••" type="password"/>
                    </div>
                </div>

                <div class="space-y-2">
                    <label class="block text-sm font-bold text-text-main dark:text-white ml-1" for="confirmPassword">Xác nhận mật khẩu</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <span class="material-symbols-outlined text-text-secondary">check_circle</span>
                        </div>
                        <input class="block w-full pl-11 pr-4 py-3.5 rounded-2xl bg-surface-light dark:bg-background-dark border-none ring-1 ring-inset ring-[#eaf3e7] dark:ring-[#2a3c25] focus:ring-2 focus:ring-primary text-text-main dark:text-white placeholder-text-secondary/60 transition-shadow sm:text-sm sm:leading-6"
                               id="confirmPassword" name="confirmPassword" placeholder="••••••••" type="password"/>
                    </div>
                </div>
            </div>

            <div class="pt-4">
                <button class="w-full py-4 rounded-2xl bg-text-main dark:bg-white text-white dark:text-text-main font-bold text-lg hover:opacity-90 transition-opacity shadow-lg shadow-text-main/10 dark:shadow-none" type="submit">
                    Đăng ký
                </button>
            </div>
        </form>

        <div class="mt-8 pt-6 border-t border-[#eaf3e7] dark:border-[#2a3c25] text-center">
            <p class="text-text-secondary text-sm font-medium">
                Already have an account? 
                <a class="text-text-main dark:text-white font-bold hover:text-primary transition-colors ml-1" href="${pageContext.request.contextPath}/login">
                    Đăng nhập
                </a>
            </p>
        </div>
    </div>
</main>

<%@include file="footer.jsp" %>
</body>
</html>
