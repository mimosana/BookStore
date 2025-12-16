<%-- 
    Document   : customerManagement
    Created on : Dec 15, 2025, 11:49:55 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>BookStore Admin - Customer Management</title>
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
<a class="text-sm font-medium hover:text-primary transition-colors" href="#">Orders</a>
<a class="text-sm font-medium text-primary" href="#">Customers</a>
<a class="text-sm font-medium hover:text-primary transition-colors" href="#">Settings</a>
</nav>
</div>
<div class="flex items-center gap-4 md:gap-8">
<label class="hidden md:flex flex-col min-w-40 h-10 w-64">
<div class="flex w-full flex-1 items-stretch rounded-lg h-full bg-[#eaf3e7] dark:bg-gray-800 overflow-hidden">
<div class="flex items-center justify-center pl-4 text-primary">
<span class="material-symbols-outlined text-[20px]">search</span>
</div>
<input class="w-full bg-transparent border-none text-sm text-gray-900 dark:text-white placeholder:text-gray-500 focus:ring-0 px-3" placeholder="Global search..."/>
</div>
</label>
<div class="bg-center bg-no-repeat bg-cover rounded-full size-10 border-2 border-primary/20 cursor-pointer" data-alt="User profile avatar showing a smiling person" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDzGmonHEE48NxHmmkp9cf2SzpeHn4xSl0M55kMx20QMz_hs5XyOlSr85SjmiVMxPGhn27Y6DH1ofUL2hhi6bd7zVmmmTKAl2xTFHaK4wk_KX-B3TmgJrnKav8dyHoC1zh4DsyY7QAJKz5OGnDoo8TsKXoJTTkTRKyPZpBbPVw5dXdkixM9sYx4zhmVWl4FJGWW-5pIcE8lRX6pxUln0x4EwTS4VxrlsevFmqPOyxeXGgbiATv7GC5H5DR2ovvaOBb8yd4IbtFK_5kr");'></div>
</div>
</div>
</header>
<main class="flex-1 flex flex-col items-center py-8 px-4 md:px-10 w-full">
<div class="w-full max-w-[1200px] flex flex-col gap-6">
<nav class="flex flex-wrap gap-2 items-center text-sm">
<a class="text-gray-500 hover:text-primary dark:text-gray-400" href="#">Dashboard</a>
<span class="text-gray-400 material-symbols-outlined text-sm">chevron_right</span>
<span class="text-gray-900 dark:text-white font-medium">Customers</span>
</nav>
<div class="flex flex-wrap justify-between items-end gap-4 pb-4 border-b border-gray-100 dark:border-gray-800">
<div class="flex flex-col gap-2">
<h1 class="text-3xl md:text-4xl font-black leading-tight tracking-tight text-gray-900 dark:text-white">Customer Management</h1>
<p class="text-gray-500 dark:text-gray-400 text-base">View and manage all registered customers, their details, and history.</p>
</div>
<div class="flex items-center gap-3">
<button class="h-10 px-4 rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 text-sm font-bold hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors flex items-center gap-2">
<span class="material-symbols-outlined text-[18px]">download</span>
                    Export CSV
                </button>
</div>
</div>
<div class="w-full bg-white dark:bg-gray-900 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col">
<div class="p-4 sm:p-5 border-b border-gray-100 dark:border-gray-800 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
<div class="flex items-center gap-4 w-full sm:w-auto flex-1">
<div class="relative w-full sm:max-w-sm">
<div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400">
<span class="material-symbols-outlined text-[20px]">search</span>
</div>
<input class="pl-10 h-10 w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary text-gray-900 dark:text-white text-sm placeholder:text-gray-400 transition-colors" placeholder="Search by name, email or ID..." type="text"/>
</div>
<div class="relative hidden sm:block">
<select class="h-10 pl-3 pr-10 rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary text-gray-900 dark:text-white text-sm appearance-none cursor-pointer">
<option value="">All Statuses</option>
<option value="active">Active</option>
<option value="inactive">Inactive</option>
<option value="blocked">Blocked</option>
</select>
<span class="material-symbols-outlined absolute right-2 top-1/2 -translate-y-1/2 text-gray-500 pointer-events-none text-[18px]">expand_more</span>
</div>
</div>
<div class="text-sm text-gray-500 dark:text-gray-400">
                    Showing <span class="font-bold text-gray-900 dark:text-white">1-5</span> of <span class="font-bold text-gray-900 dark:text-white">124</span> customers
                </div>
</div>
<div class="overflow-x-auto">
<table class="w-full text-left border-collapse">
<thead>
<tr class="bg-background-light dark:bg-gray-800/50 text-xs uppercase text-gray-500 dark:text-gray-400 font-bold tracking-wider">
<th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Customer ID</th>
<th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Customer Name</th>
<th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Email Address</th>
<th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Phone Number</th>
<th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800">Registration Date</th>
<th class="px-6 py-4 border-b border-gray-100 dark:border-gray-800 text-right">Actions</th>
</tr>
</thead>
<tbody class="divide-y divide-gray-100 dark:divide-gray-800">
<tr class="group hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors">
<td class="px-6 py-4 text-sm font-mono text-gray-500 dark:text-gray-400">#C-88321</td>
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="size-9 rounded-full bg-primary/10 text-primary flex items-center justify-center text-sm font-bold border border-primary/20">
                                    SJ
                                </div>
<div class="flex flex-col">
<span class="text-sm font-bold text-gray-900 dark:text-white">Sarah Jenkins</span>
<span class="text-xs text-green-600 dark:text-green-400">Active</span>
</div>
</div>
</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">sarah.j@example.com</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">+1 (555) 019-2834</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">Oct 24, 2023</td>
<td class="px-6 py-4 text-right">
<div class="flex items-center justify-end gap-2">
<button class="p-2 rounded-lg text-gray-400 hover:text-primary hover:bg-primary/10 transition-colors" title="View Details">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
<button class="p-2 rounded-lg text-gray-400 hover:text-blue-500 hover:bg-blue-50 dark:hover:bg-blue-900/20 transition-colors" title="Edit Customer">
<span class="material-symbols-outlined text-[20px]">edit</span>
</button>
</div>
</td>
</tr>
<tr class="group hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors">
<td class="px-6 py-4 text-sm font-mono text-gray-500 dark:text-gray-400">#C-88322</td>
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="size-9 rounded-full bg-purple-100 dark:bg-purple-900/30 text-purple-600 dark:text-purple-400 flex items-center justify-center text-sm font-bold border border-purple-200 dark:border-purple-800">
                                    MC
                                </div>
<div class="flex flex-col">
<span class="text-sm font-bold text-gray-900 dark:text-white">Michael Chen</span>
<span class="text-xs text-green-600 dark:text-green-400">Active</span>
</div>
</div>
</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">m.chen@designstudio.net</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">+1 (555) 998-1122</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">Oct 22, 2023</td>
<td class="px-6 py-4 text-right">
<div class="flex items-center justify-end gap-2">
<button class="p-2 rounded-lg text-gray-400 hover:text-primary hover:bg-primary/10 transition-colors" title="View Details">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
<button class="p-2 rounded-lg text-gray-400 hover:text-blue-500 hover:bg-blue-50 dark:hover:bg-blue-900/20 transition-colors" title="Edit Customer">
<span class="material-symbols-outlined text-[20px]">edit</span>
</button>
</div>
</td>
</tr>
<tr class="group hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors">
<td class="px-6 py-4 text-sm font-mono text-gray-500 dark:text-gray-400">#C-88323</td>
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="size-9 rounded-full bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 flex items-center justify-center text-sm font-bold border border-blue-200 dark:border-blue-800">
                                    EW
                                </div>
<div class="flex flex-col">
<span class="text-sm font-bold text-gray-900 dark:text-white">Emma Wilson</span>
<span class="text-xs text-gray-500 dark:text-gray-400">Inactive</span>
</div>
</div>
</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">emma.wilson@mail.com</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">+1 (555) 456-7890</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">Oct 20, 2023</td>
<td class="px-6 py-4 text-right">
<div class="flex items-center justify-end gap-2">
<button class="p-2 rounded-lg text-gray-400 hover:text-primary hover:bg-primary/10 transition-colors" title="View Details">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
<button class="p-2 rounded-lg text-gray-400 hover:text-blue-500 hover:bg-blue-50 dark:hover:bg-blue-900/20 transition-colors" title="Edit Customer">
<span class="material-symbols-outlined text-[20px]">edit</span>
</button>
</div>
</td>
</tr>
<tr class="group hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors">
<td class="px-6 py-4 text-sm font-mono text-gray-500 dark:text-gray-400">#C-88324</td>
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="size-9 rounded-full bg-orange-100 dark:bg-orange-900/30 text-orange-600 dark:text-orange-400 flex items-center justify-center text-sm font-bold border border-orange-200 dark:border-orange-800">
                                    JR
                                </div>
<div class="flex flex-col">
<span class="text-sm font-bold text-gray-900 dark:text-white">James Rodriguez</span>
<span class="text-xs text-green-600 dark:text-green-400">Active</span>
</div>
</div>
</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">james.rod@tech.io</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">+1 (555) 222-3344</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">Oct 18, 2023</td>
<td class="px-6 py-4 text-right">
<div class="flex items-center justify-end gap-2">
<button class="p-2 rounded-lg text-gray-400 hover:text-primary hover:bg-primary/10 transition-colors" title="View Details">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
<button class="p-2 rounded-lg text-gray-400 hover:text-blue-500 hover:bg-blue-50 dark:hover:bg-blue-900/20 transition-colors" title="Edit Customer">
<span class="material-symbols-outlined text-[20px]">edit</span>
</button>
</div>
</td>
</tr>
<tr class="group hover:bg-gray-50 dark:hover:bg-gray-800/50 transition-colors">
<td class="px-6 py-4 text-sm font-mono text-gray-500 dark:text-gray-400">#C-88325</td>
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="size-9 rounded-full bg-teal-100 dark:bg-teal-900/30 text-teal-600 dark:text-teal-400 flex items-center justify-center text-sm font-bold border border-teal-200 dark:border-teal-800">
                                    LT
                                </div>
<div class="flex flex-col">
<span class="text-sm font-bold text-gray-900 dark:text-white">Linda Taylor</span>
<span class="text-xs text-red-500 dark:text-red-400">Blocked</span>
</div>
</div>
</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">linda.taylor88@webmail.org</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">+1 (555) 777-8899</td>
<td class="px-6 py-4 text-sm text-gray-700 dark:text-gray-300">Oct 15, 2023</td>
<td class="px-6 py-4 text-right">
<div class="flex items-center justify-end gap-2">
<button class="p-2 rounded-lg text-gray-400 hover:text-primary hover:bg-primary/10 transition-colors" title="View Details">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
<button class="p-2 rounded-lg text-gray-400 hover:text-blue-500 hover:bg-blue-50 dark:hover:bg-blue-900/20 transition-colors" title="Edit Customer">
<span class="material-symbols-outlined text-[20px]">edit</span>
</button>
</div>
</td>
</tr>
</tbody>
</table>
</div>
<div class="p-4 border-t border-gray-100 dark:border-gray-800 flex items-center justify-between">
<button class="flex items-center gap-2 px-4 h-9 rounded-lg border border-gray-200 dark:border-gray-700 text-sm font-medium text-gray-600 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors disabled:opacity-50 disabled:cursor-not-allowed" disabled="">
<span class="material-symbols-outlined text-[16px]">arrow_back</span>
                    Previous
                </button>
<div class="hidden sm:flex items-center gap-2">
<button class="size-9 rounded-lg bg-primary text-[#111b0d] text-sm font-bold shadow-sm">1</button>
<button class="size-9 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-800 text-gray-600 dark:text-gray-300 text-sm font-medium transition-colors">2</button>
<button class="size-9 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-800 text-gray-600 dark:text-gray-300 text-sm font-medium transition-colors">3</button>
<span class="text-gray-400 px-1">...</span>
<button class="size-9 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-800 text-gray-600 dark:text-gray-300 text-sm font-medium transition-colors">12</button>
</div>
<button class="flex items-center gap-2 px-4 h-9 rounded-lg border border-gray-200 dark:border-gray-700 text-sm font-medium text-gray-600 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors">
                    Next
                    <span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</button>
</div>
</div>
</div>
</main>

</body></html>