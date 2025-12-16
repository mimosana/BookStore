<%-- 
    Document   : dashboard
    Created on : Dec 15, 2025, 11:48:51 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>BookStore Admin - Dashboard</title>
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
<header class="w-full border-b border-[#eaf3e7] dark:border-gray-800 bg-background-light dark:bg-background-dark sticky top-0 z-50">
<div class="px-4 md:px-10 py-3 flex items-center justify-between">
<div class="flex items-center gap-8">
<div class="flex items-center gap-4 text-gray-900 dark:text-white">
<div class="size-8 flex items-center justify-center bg-primary/20 rounded-lg text-primary">
<span class="material-symbols-outlined">auto_stories</span>
</div>
<h2 class="text-lg font-bold leading-tight tracking-tight hidden md:block">BookStore Admin</h2>
</div>
<nav class="hidden md:flex items-center gap-6">
<a class="text-sm font-medium text-primary" href="#">Dashboard</a>
<a class="text-sm font-medium hover:text-primary transition-colors" href="#">Products</a>
<a class="text-sm font-medium hover:text-primary transition-colors" href="#">Orders</a>
<a class="text-sm font-medium hover:text-primary transition-colors" href="#">Customers</a>
<a class="text-sm font-medium hover:text-primary transition-colors" href="#">Settings</a>
</nav>
</div>
<div class="flex items-center gap-4 md:gap-8">
<label class="hidden md:flex flex-col min-w-40 h-10 w-64">
<div class="flex w-full flex-1 items-stretch rounded-lg h-full bg-[#eaf3e7] dark:bg-gray-800 overflow-hidden">
<div class="flex items-center justify-center pl-4 text-primary">
<span class="material-symbols-outlined text-[20px]">search</span>
</div>
<input class="w-full bg-transparent border-none text-sm text-gray-900 dark:text-white placeholder:text-gray-500 focus:ring-0 px-3" placeholder="Search..."/>
</div>
</label>
<div class="bg-center bg-no-repeat bg-cover rounded-full size-10 border-2 border-primary/20 cursor-pointer" data-alt="User profile avatar showing a smiling person" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDzGmonHEE48NxHmmkp9cf2SzpeHn4xSl0M55kMx20QMz_hs5XyOlSr85SjmiVMxPGhn27Y6DH1ofUL2hhi6bd7zVmmmTKAl2xTFHaK4wk_KX-B3TmgJrnKav8dyHoC1zh4DsyY7QAJKz5OGnDoo8TsKXoJTTkTRKyPZpBbPVw5dXdkixM9sYx4zhmVWl4FJGWW-5pIcE8lRX6pxUln0x4EwTS4VxrlsevFmqPOyxeXGgbiATv7GC5H5DR2ovvaOBb8yd4IbtFK_5kr");'></div>
</div>
</div>
</header>
<main class="flex-1 flex flex-col items-center py-8 px-4 md:px-10 w-full">
<div class="w-full max-w-[1100px] flex flex-col gap-8">
<div class="flex flex-wrap justify-between items-end gap-4 pb-4 border-b border-gray-100 dark:border-gray-800">
<div class="flex flex-col gap-1">
<h1 class="text-3xl md:text-4xl font-black leading-tight tracking-tight text-gray-900 dark:text-white">Dashboard</h1>
<p class="text-gray-500 dark:text-gray-400 text-base">Welcome back. Here's what's happening in your store today.</p>
</div>
<div class="flex items-center gap-3">
<button class="flex items-center gap-2 px-4 py-2 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg text-sm font-semibold hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors">
<span class="material-symbols-outlined text-[18px]">calendar_today</span>
                    Today
                </button>
</div>
</div>
<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
<div class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col justify-between gap-4">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<span class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Sales</span>
<span class="text-3xl font-black text-gray-900 dark:text-white mt-1">$12,450.00</span>
</div>
<div class="size-10 bg-primary/10 rounded-full flex items-center justify-center text-primary">
<span class="material-symbols-outlined">payments</span>
</div>
</div>
<div class="flex items-center gap-2 text-sm">
<span class="text-green-600 bg-green-50 dark:bg-green-900/20 px-1.5 py-0.5 rounded font-bold flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">trending_up</span> +12%
                    </span>
<span class="text-gray-400">vs. last week</span>
</div>
</div>
<div class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col justify-between gap-4">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<span class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Orders</span>
<span class="text-3xl font-black text-gray-900 dark:text-white mt-1">154</span>
</div>
<div class="size-10 bg-primary/10 rounded-full flex items-center justify-center text-primary">
<span class="material-symbols-outlined">shopping_bag</span>
</div>
</div>
<div class="flex items-center gap-2 text-sm">
<span class="text-green-600 bg-green-50 dark:bg-green-900/20 px-1.5 py-0.5 rounded font-bold flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">trending_up</span> +5%
                    </span>
<span class="text-gray-400">vs. last week</span>
</div>
</div>
<div class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col justify-between gap-4">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<span class="text-sm font-medium text-gray-500 dark:text-gray-400">New Customers</span>
<span class="text-3xl font-black text-gray-900 dark:text-white mt-1">32</span>
</div>
<div class="size-10 bg-primary/10 rounded-full flex items-center justify-center text-primary">
<span class="material-symbols-outlined">person_add</span>
</div>
</div>
<div class="flex items-center gap-2 text-sm">
<span class="text-green-600 bg-green-50 dark:bg-green-900/20 px-1.5 py-0.5 rounded font-bold flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">trending_up</span> +8%
                    </span>
<span class="text-gray-400">vs. last week</span>
</div>
</div>
</div>
<div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
<section class="lg:col-span-2 flex flex-col gap-6 bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800">
<div class="flex items-center justify-between">
<h3 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
<span class="material-symbols-outlined text-primary">auto_stories</span>
                        Popular Books
                    </h3>
<a class="text-sm font-bold text-primary hover:text-[#3bdb0b] transition-colors" href="#">View All</a>
</div>
<div class="flex flex-col divide-y divide-gray-100 dark:divide-gray-800">
<div class="py-4 flex items-center justify-between gap-4 group">
<div class="flex items-center gap-4">
<div class="w-12 h-16 bg-gray-200 dark:bg-gray-700 rounded-md overflow-hidden shadow-sm relative">
<div class="absolute inset-0 bg-gradient-to-br from-gray-200 to-gray-300 dark:from-gray-700 dark:to-gray-600"></div>
</div>
<div class="flex flex-col">
<span class="font-bold text-gray-900 dark:text-white text-sm group-hover:text-primary transition-colors cursor-pointer">The Great Gatsby</span>
<span class="text-xs text-gray-500">F. Scott Fitzgerald</span>
</div>
</div>
<div class="text-right">
<p class="font-bold text-gray-900 dark:text-white text-sm">124 sold</p>
<p class="text-xs text-green-600 font-medium">In Stock</p>
</div>
</div>
<div class="py-4 flex items-center justify-between gap-4 group">
<div class="flex items-center gap-4">
<div class="w-12 h-16 bg-gray-200 dark:bg-gray-700 rounded-md overflow-hidden shadow-sm relative">
<div class="absolute inset-0 bg-gradient-to-br from-gray-200 to-gray-300 dark:from-gray-700 dark:to-gray-600"></div>
</div>
<div class="flex flex-col">
<span class="font-bold text-gray-900 dark:text-white text-sm group-hover:text-primary transition-colors cursor-pointer">1984</span>
<span class="text-xs text-gray-500">George Orwell</span>
</div>
</div>
<div class="text-right">
<p class="font-bold text-gray-900 dark:text-white text-sm">98 sold</p>
<p class="text-xs text-green-600 font-medium">In Stock</p>
</div>
</div>
<div class="py-4 flex items-center justify-between gap-4 group">
<div class="flex items-center gap-4">
<div class="w-12 h-16 bg-gray-200 dark:bg-gray-700 rounded-md overflow-hidden shadow-sm relative">
<div class="absolute inset-0 bg-gradient-to-br from-gray-200 to-gray-300 dark:from-gray-700 dark:to-gray-600"></div>
</div>
<div class="flex flex-col">
<span class="font-bold text-gray-900 dark:text-white text-sm group-hover:text-primary transition-colors cursor-pointer">To Kill a Mockingbird</span>
<span class="text-xs text-gray-500">Harper Lee</span>
</div>
</div>
<div class="text-right">
<p class="font-bold text-gray-900 dark:text-white text-sm">85 sold</p>
<p class="text-xs text-orange-500 font-medium">Low Stock</p>
</div>
</div>
</div>
</section>
<section class="flex flex-col gap-6">
<div class="bg-primary text-[#111b0d] p-6 rounded-xl shadow-lg shadow-primary/20 relative overflow-hidden">
<div class="relative z-10">
<h3 class="text-xl font-black mb-2">Quick Actions</h3>
<p class="text-sm font-medium opacity-80 mb-6">Manage your store efficiently with these shortcuts.</p>
</div>
<div class="absolute -right-6 -bottom-6 size-32 bg-white/20 rounded-full z-0 pointer-events-none"></div>
<div class="relative z-10 flex flex-col gap-3">
<button class="w-full h-12 bg-white hover:bg-gray-50 text-gray-900 font-bold rounded-lg flex items-center justify-center gap-2 shadow-sm transition-transform active:scale-[0.98]">
<span class="material-symbols-outlined text-primary">add_circle</span>
                            Add New Product
                        </button>
<button class="w-full h-12 bg-[#3bdb0b] hover:bg-[#32c009] text-[#111b0d] font-bold rounded-lg flex items-center justify-center gap-2 shadow-sm transition-transform active:scale-[0.98]">
<span class="material-symbols-outlined">shopping_cart</span>
                            Manage Orders
                        </button>
<button class="w-full h-12 bg-[#3bdb0b] hover:bg-[#32c009] text-[#111b0d] font-bold rounded-lg flex items-center justify-center gap-2 shadow-sm transition-transform active:scale-[0.98]">
<span class="material-symbols-outlined">group</span>
                            View Customers
                        </button>
</div>
</div>
<div class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800">
<h4 class="font-bold text-gray-900 dark:text-white mb-4 flex items-center gap-2">
<span class="material-symbols-outlined text-yellow-500">notifications</span>
                        Pending Alerts
                    </h4>
<div class="flex flex-col gap-3">
<div class="flex items-start gap-3 p-3 bg-red-50 dark:bg-red-900/10 rounded-lg">
<div class="size-2 bg-red-500 rounded-full mt-2 shrink-0"></div>
<p class="text-sm text-gray-700 dark:text-gray-300">
<span class="font-bold">Low Stock:</span> "The Catcher in the Rye" is below 5 units.
                        </p>
</div>
<div class="flex items-start gap-3 p-3 bg-blue-50 dark:bg-blue-900/10 rounded-lg">
<div class="size-2 bg-blue-500 rounded-full mt-2 shrink-0"></div>
<p class="text-sm text-gray-700 dark:text-gray-300">
<span class="font-bold">New Review:</span> Customer left a 5-star review for order #2910.
                        </p>
</div>
</div>
</div>
</section>
</div>
</div>
</main>

</body></html>
