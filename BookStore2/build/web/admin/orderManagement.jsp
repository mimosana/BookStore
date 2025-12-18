<%-- 
    Document   : orderManagement
    Created on : Dec 15, 2025, 11:50:10 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>BookStore Admin - Order Management</title>
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
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="#">Dashboard</a>
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="#">Products</a>
                        <a class="text-sm font-medium text-primary" href="#">Orders</a>
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
            <div class="w-full max-w-[1280px] flex flex-col gap-6">
                <nav class="flex flex-wrap gap-2 items-center text-sm">
                    <a class="text-gray-500 hover:text-primary dark:text-gray-400" href="#">Dashboard</a>
                    <span class="text-gray-400 material-symbols-outlined text-sm">chevron_right</span>
                    <span class="text-gray-900 dark:text-white font-medium">Order Management</span>
                </nav>
                <div class="flex flex-col md:flex-row md:items-end justify-between gap-4 pb-2">
                    <div class="flex flex-col gap-2">
                        <h1 class="text-3xl md:text-4xl font-black leading-tight tracking-tight text-gray-900 dark:text-white">Orders</h1>
                        <p class="text-gray-500 dark:text-gray-400 text-base">View and manage customer orders, track status, and process shipments.</p>
                    </div>
                    <div class="flex items-center gap-3">
                        <button class="h-10 px-4 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 text-gray-700 dark:text-gray-300 font-medium hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors flex items-center gap-2 text-sm shadow-sm">
                            <span class="material-symbols-outlined text-[18px]">download</span>
                            Export CSV
                        </button>
                    </div>
                </div>
                <div class="bg-white dark:bg-gray-900 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col">
                    <div class="p-4 border-b border-gray-100 dark:border-gray-800 flex flex-col md:flex-row gap-4 justify-between items-center">
                        <div class="relative w-full md:w-80">
                            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-[20px]">search</span>
                            <input class="w-full pl-10 pr-4 h-10 rounded-lg bg-background-light dark:bg-gray-800 border-none text-sm text-gray-900 dark:text-white placeholder:text-gray-500 focus:ring-1 focus:ring-primary" placeholder="Search order ID, customer..." type="text"/>
                        </div>
                        <div class="flex items-center gap-3 w-full md:w-auto">
                            <div class="relative w-full md:w-40">
                                <select class="w-full h-10 pl-3 pr-8 rounded-lg bg-background-light dark:bg-gray-800 border-none text-sm text-gray-700 dark:text-gray-300 focus:ring-1 focus:ring-primary appearance-none cursor-pointer">
                                    <option value="all">All Status</option>
                                    <option value="pending">Pending</option>
                                    <option value="processing">Processing</option>
                                    <option value="shipped">Shipped</option>
                                    <option value="delivered">Delivered</option>
                                    <option value="cancelled">Cancelled</option>
                                </select>
                                <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none text-[20px]">expand_more</span>
                            </div>
                            <div class="relative w-full md:w-40">
                                <select class="w-full h-10 pl-3 pr-8 rounded-lg bg-background-light dark:bg-gray-800 border-none text-sm text-gray-700 dark:text-gray-300 focus:ring-1 focus:ring-primary appearance-none cursor-pointer">
                                    <option value="newest">Newest First</option>
                                    <option value="oldest">Oldest First</option>
                                    <option value="amount-high">Amount (High-Low)</option>
                                    <option value="amount-low">Amount (Low-High)</option>
                                </select>
                                <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 pointer-events-none text-[20px]">sort</span>
                            </div>
                        </div>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse">
                            <thead class="bg-gray-50 dark:bg-gray-800/50 text-xs uppercase text-gray-500 font-bold tracking-wider">
                                <tr>
                                    <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Order ID</th>
                                    <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Customer</th>
                                    <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Date</th>
                                    <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Total</th>
                                    <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Status</th>
                                    <th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800 text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100 dark:divide-gray-800">
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors group">
                                    <td class="px-6 py-4">
                                        <span class="font-mono font-medium text-gray-900 dark:text-white">#ORD-7023</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex items-center gap-3">
                                            <div class="size-8 rounded-full bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 flex items-center justify-center text-xs font-bold">ES</div>
                                            <div class="flex flex-col">
                                                <span class="text-sm font-medium text-gray-900 dark:text-white">Emily Smith</span>
                                                <span class="text-xs text-gray-500">emily.s@example.com</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600 dark:text-gray-400">
                                        Oct 24, 2023
                                    </td>
                                    <td class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-white">
                                        $45.90
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="relative w-full min-w-[130px]">
                                            <select class="appearance-none w-full bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400 border border-green-200 dark:border-green-800 text-xs font-semibold rounded-full px-3 py-1.5 cursor-pointer focus:ring-2 focus:ring-offset-2 focus:ring-green-500 focus:outline-none pr-8">
                                                <option selected="" value="delivered">Delivered</option>
                                                <option value="pending">Pending</option>
                                                <option value="processing">Processing</option>
                                                <option value="shipped">Shipped</option>
                                                <option value="cancelled">Cancelled</option>
                                            </select>
                                            <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-green-700 dark:text-green-400 pointer-events-none text-[16px]">expand_more</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <button class="text-gray-400 hover:text-primary transition-colors p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">visibility</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors group">
                                    <td class="px-6 py-4">
                                        <span class="font-mono font-medium text-gray-900 dark:text-white">#ORD-7022</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex items-center gap-3">
                                            <div class="size-8 rounded-full bg-purple-100 dark:bg-purple-900/30 text-purple-600 dark:text-purple-400 flex items-center justify-center text-xs font-bold">MJ</div>
                                            <div class="flex flex-col">
                                                <span class="text-sm font-medium text-gray-900 dark:text-white">Michael Johnson</span>
                                                <span class="text-xs text-gray-500">michael.j@example.com</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600 dark:text-gray-400">
                                        Oct 23, 2023
                                    </td>
                                    <td class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-white">
                                        $129.50
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="relative w-full min-w-[130px]">
                                            <select class="appearance-none w-full bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400 border border-blue-200 dark:border-blue-800 text-xs font-semibold rounded-full px-3 py-1.5 cursor-pointer focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 focus:outline-none pr-8">
                                                <option value="delivered">Delivered</option>
                                                <option value="pending">Pending</option>
                                                <option selected="" value="processing">Processing</option>
                                                <option value="shipped">Shipped</option>
                                                <option value="cancelled">Cancelled</option>
                                            </select>
                                            <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-blue-700 dark:text-blue-400 pointer-events-none text-[16px]">expand_more</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <button class="text-gray-400 hover:text-primary transition-colors p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">visibility</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors group">
                                    <td class="px-6 py-4">
                                        <span class="font-mono font-medium text-gray-900 dark:text-white">#ORD-7021</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex items-center gap-3">
                                            <div class="size-8 rounded-full bg-orange-100 dark:bg-orange-900/30 text-orange-600 dark:text-orange-400 flex items-center justify-center text-xs font-bold">AB</div>
                                            <div class="flex flex-col">
                                                <span class="text-sm font-medium text-gray-900 dark:text-white">Amanda Berry</span>
                                                <span class="text-xs text-gray-500">amanda.b@example.com</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600 dark:text-gray-400">
                                        Oct 23, 2023
                                    </td>
                                    <td class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-white">
                                        $24.00
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="relative w-full min-w-[130px]">
                                            <select class="appearance-none w-full bg-yellow-100 text-yellow-700 dark:bg-yellow-900/30 dark:text-yellow-400 border border-yellow-200 dark:border-yellow-800 text-xs font-semibold rounded-full px-3 py-1.5 cursor-pointer focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500 focus:outline-none pr-8">
                                                <option value="delivered">Delivered</option>
                                                <option selected="" value="pending">Pending</option>
                                                <option value="processing">Processing</option>
                                                <option value="shipped">Shipped</option>
                                                <option value="cancelled">Cancelled</option>
                                            </select>
                                            <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-yellow-700 dark:text-yellow-400 pointer-events-none text-[16px]">expand_more</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <button class="text-gray-400 hover:text-primary transition-colors p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">visibility</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors group">
                                    <td class="px-6 py-4">
                                        <span class="font-mono font-medium text-gray-900 dark:text-white">#ORD-7020</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex items-center gap-3">
                                            <div class="size-8 rounded-full bg-pink-100 dark:bg-pink-900/30 text-pink-600 dark:text-pink-400 flex items-center justify-center text-xs font-bold">DK</div>
                                            <div class="flex flex-col">
                                                <span class="text-sm font-medium text-gray-900 dark:text-white">David Kim</span>
                                                <span class="text-xs text-gray-500">david.k@example.com</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600 dark:text-gray-400">
                                        Oct 22, 2023
                                    </td>
                                    <td class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-white">
                                        $88.50
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="relative w-full min-w-[130px]">
                                            <select class="appearance-none w-full bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400 border border-purple-200 dark:border-purple-800 text-xs font-semibold rounded-full px-3 py-1.5 cursor-pointer focus:ring-2 focus:ring-offset-2 focus:ring-purple-500 focus:outline-none pr-8">
                                                <option value="delivered">Delivered</option>
                                                <option value="pending">Pending</option>
                                                <option value="processing">Processing</option>
                                                <option selected="" value="shipped">Shipped</option>
                                                <option value="cancelled">Cancelled</option>
                                            </select>
                                            <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-purple-700 dark:text-purple-400 pointer-events-none text-[16px]">expand_more</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <button class="text-gray-400 hover:text-primary transition-colors p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">visibility</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors group">
                                    <td class="px-6 py-4">
                                        <span class="font-mono font-medium text-gray-900 dark:text-white">#ORD-7019</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex items-center gap-3">
                                            <div class="size-8 rounded-full bg-gray-100 dark:bg-gray-700 text-gray-600 dark:text-gray-300 flex items-center justify-center text-xs font-bold">JD</div>
                                            <div class="flex flex-col">
                                                <span class="text-sm font-medium text-gray-900 dark:text-white">Jane Doe</span>
                                                <span class="text-xs text-gray-500">jane.d@example.com</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600 dark:text-gray-400">
                                        Oct 21, 2023
                                    </td>
                                    <td class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-white">
                                        $210.00
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="relative w-full min-w-[130px]">
                                            <select class="appearance-none w-full bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400 border border-red-200 dark:border-red-800 text-xs font-semibold rounded-full px-3 py-1.5 cursor-pointer focus:ring-2 focus:ring-offset-2 focus:ring-red-500 focus:outline-none pr-8">
                                                <option value="delivered">Delivered</option>
                                                <option value="pending">Pending</option>
                                                <option value="processing">Processing</option>
                                                <option value="shipped">Shipped</option>
                                                <option selected="" value="cancelled">Cancelled</option>
                                            </select>
                                            <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-red-700 dark:text-red-400 pointer-events-none text-[16px]">expand_more</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <button class="text-gray-400 hover:text-primary transition-colors p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">visibility</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr class="hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors group">
                                    <td class="px-6 py-4">
                                        <span class="font-mono font-medium text-gray-900 dark:text-white">#ORD-7018</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex items-center gap-3">
                                            <div class="size-8 rounded-full bg-teal-100 dark:bg-teal-900/30 text-teal-600 dark:text-teal-400 flex items-center justify-center text-xs font-bold">RW</div>
                                            <div class="flex flex-col">
                                                <span class="text-sm font-medium text-gray-900 dark:text-white">Robert Williams</span>
                                                <span class="text-xs text-gray-500">rob.w@example.com</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600 dark:text-gray-400">
                                        Oct 20, 2023
                                    </td>
                                    <td class="px-6 py-4 text-sm font-semibold text-gray-900 dark:text-white">
                                        $32.50
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="relative w-full min-w-[130px]">
                                            <select class="appearance-none w-full bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400 border border-green-200 dark:border-green-800 text-xs font-semibold rounded-full px-3 py-1.5 cursor-pointer focus:ring-2 focus:ring-offset-2 focus:ring-green-500 focus:outline-none pr-8">
                                                <option selected="" value="delivered">Delivered</option>
                                                <option value="pending">Pending</option>
                                                <option value="processing">Processing</option>
                                                <option value="shipped">Shipped</option>
                                                <option value="cancelled">Cancelled</option>
                                            </select>
                                            <span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-green-700 dark:text-green-400 pointer-events-none text-[16px]">expand_more</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 text-right">
                                        <button class="text-gray-400 hover:text-primary transition-colors p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" title="View Details">
                                            <span class="material-symbols-outlined text-[20px]">visibility</span>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="flex items-center justify-between p-4 border-t border-gray-100 dark:border-gray-800">
                        <span class="text-sm text-gray-500 dark:text-gray-400">Showing 1-6 of 240 orders</span>
                        <div class="flex items-center gap-2">
                            <button class="px-3 py-1 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 text-sm hover:bg-gray-50 dark:hover:bg-gray-800 disabled:opacity-50 transition-colors" disabled="">Previous</button>
                            <button class="px-3 py-1 rounded-lg bg-primary text-black text-sm font-bold shadow-sm">1</button>
                            <button class="px-3 py-1 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 text-sm hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors">2</button>
                            <button class="px-3 py-1 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 text-sm hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors">3</button>
                            <button class="px-3 py-1 rounded-lg border border-gray-200 dark:border-gray-700 text-gray-500 dark:text-gray-400 text-sm hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors">Next</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body></html>
