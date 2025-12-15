<%-- 
    Document   : productManagement
    Created on : Dec 15, 2025, 11:49:35 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Bookstore Admin - Product Management</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;700;800&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <script id="tailwind-config">
            tailwind.config = {
                darkMode: "class",
                theme: {
                    extend: {
                        colors: {
                            "primary": "#197fe6",
                            "background-light": "#f6f7f8",
                            "background-dark": "#111921",
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
    <body class="bg-background-light dark:bg-background-dark font-display text-slate-900 antialiased overflow-x-hidden">
        <div class="relative flex min-h-screen flex-col">
            <header class="sticky top-0 z-50 flex items-center justify-between border-b border-slate-200 bg-white px-6 py-3 shadow-sm dark:bg-slate-900 dark:border-slate-800">
                <div class="flex items-center gap-8">
                    <div class="flex items-center gap-3 text-slate-900 dark:text-white">
                        <div class="flex size-8 items-center justify-center rounded bg-primary/10 text-primary">
                            <span class="material-symbols-outlined">menu_book</span>
                        </div>
                        <h2 class="text-lg font-bold leading-tight tracking-tight">Bookstore Admin</h2>
                    </div>
                    <nav class="hidden md:flex items-center gap-6">
                        <a class="text-slate-600 hover:text-primary text-sm font-medium transition-colors dark:text-slate-400" href="#">Dashboard</a>
                        <a class="text-primary text-sm font-bold transition-colors" href="#">Products</a>
                        <a class="text-slate-600 hover:text-primary text-sm font-medium transition-colors dark:text-slate-400" href="#">Orders</a>
                        <a class="text-slate-600 hover:text-primary text-sm font-medium transition-colors dark:text-slate-400" href="#">Customers</a>
                        <a class="text-slate-600 hover:text-primary text-sm font-medium transition-colors dark:text-slate-400" href="#">Settings</a>
                    </nav>
                </div>
                <div class="flex items-center gap-4">
                    <div class="hidden md:flex items-center rounded-lg bg-slate-100 px-3 py-2 dark:bg-slate-800">
                        <span class="material-symbols-outlined text-slate-400 text-[20px]">search</span>
                        <input class="bg-transparent border-none text-sm text-slate-900 placeholder:text-slate-400 focus:ring-0 dark:text-white w-48 lg:w-64" placeholder="Search admin..."/>
                    </div>
                    <div class="flex items-center gap-3 pl-4 border-l border-slate-200 dark:border-slate-700">
                        <div class="h-9 w-9 overflow-hidden rounded-full bg-slate-200" data-alt="Administrator profile picture placeholder">
                            <img alt="Admin User" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA7_5osOzH0641sEaGwVVSPtgVMvSHwFtWIxe0-ZQj9b-VXB7mY2l_YAuJ2l1W9ztpfy6_mc04pIgZefCrdlCC1-q_87pwidLf1zsqpfXjWDKc6EHwdk4U_d7xLOYAK66bOWNFUlkUWtYUaquKKF4vTjcQVyZhbOD4qYp6j6bz-IwfXbZgy_VupSlvlrz8nw55F1siMyvDFqwFPrzXp50ju_4iz6cPgBsM71dAfvvaZYx1KredLqMsXxh-QFODjoRoe_f02XCfxQcS5"/>
                        </div>
                        <div class="hidden lg:block">
                            <p class="text-sm font-bold text-slate-900 dark:text-white">Alex Morgan</p>
                            <p class="text-xs text-slate-500 dark:text-slate-400">Store Manager</p>
                        </div>
                    </div>
                </div>
            </header>
            <main class="flex-1 px-6 py-8 md:px-12 lg:px-24">
                <div class="mx-auto max-w-7xl w-full flex flex-col gap-6">
                    <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                        <div>
                            <h1 class="text-3xl font-extrabold text-slate-900 tracking-tight dark:text-white">Product Inventory</h1>
                            <p class="text-slate-500 mt-1 text-sm dark:text-slate-400">Manage your book catalog, update prices, and track stock.</p>
                        </div>
                        <button class="inline-flex items-center justify-center gap-2 rounded-lg bg-primary px-5 py-2.5 text-sm font-bold text-white shadow-sm hover:bg-blue-600 transition-colors focus:outline-none focus:ring-2 focus:ring-primary focus:ring-offset-2">
                            <span class="material-symbols-outlined text-[20px]">add</span>
                            <span>Add New Product</span>
                        </button>
                    </div>
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4 rounded-xl bg-white p-4 shadow-sm border border-slate-200 dark:bg-slate-900 dark:border-slate-800">
                        <div class="lg:col-span-3 relative">
                            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-slate-400">search</span>
                            <input class="w-full rounded-lg border-slate-200 bg-slate-50 pl-10 py-2.5 text-sm focus:border-primary focus:ring-primary dark:bg-slate-800 dark:border-slate-700 dark:text-white" placeholder="Search by title, author, or ISBN..." type="text"/>
                        </div>
                        <div class="lg:col-span-9 flex flex-wrap items-center gap-3 lg:justify-end">
                            <div class="flex items-center gap-2">
                                <span class="text-sm font-medium text-slate-500 dark:text-slate-400">Filter by:</span>
                            </div>
                            <div class="relative group">
                                <button class="flex items-center gap-2 rounded-lg border border-slate-200 bg-white px-3 py-2.5 text-sm font-medium text-slate-700 hover:bg-slate-50 dark:bg-slate-800 dark:border-slate-700 dark:text-slate-300">
                                    <span>Status: All</span>
                                    <span class="material-symbols-outlined text-[18px] text-slate-400">expand_more</span>
                                </button>
                            </div>
                            <div class="relative group flex items-center">
                                <button class="flex items-center gap-2 rounded-l-lg border border-r-0 border-slate-200 bg-white px-3 py-2.5 text-sm font-medium text-slate-700 hover:bg-slate-50 dark:bg-slate-800 dark:border-slate-700 dark:text-slate-300">
                                    <span>Category: All</span>
                                    <span class="material-symbols-outlined text-[18px] text-slate-400">expand_more</span>
                                </button>
                                <button class="flex items-center justify-center rounded-r-lg border border-l border-slate-200 bg-slate-50 px-3 py-2.5 text-sm font-medium text-emerald-600 hover:bg-emerald-50 hover:text-emerald-700 transition-colors dark:bg-slate-800 dark:border-slate-700 dark:text-emerald-400 dark:hover:bg-slate-700" title="Add New Category">
                                    <span class="material-symbols-outlined text-[18px]">add_circle</span>
                                </button>
                            </div>
                            <div class="relative group">
                                <button class="flex items-center gap-2 rounded-lg border border-slate-200 bg-white px-3 py-2.5 text-sm font-medium text-slate-700 hover:bg-slate-50 dark:bg-slate-800 dark:border-slate-700 dark:text-slate-300">
                                    <span>Stock Level</span>
                                    <span class="material-symbols-outlined text-[18px] text-slate-400">expand_more</span>
                                </button>
                            </div>
                            <button class="flex items-center gap-2 rounded-lg bg-emerald-600 px-5 py-2.5 text-sm font-bold text-white shadow-sm hover:bg-emerald-700 transition-colors focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 ml-1" title="Apply Filters">
                                <span class="material-symbols-outlined text-[20px]">filter_list</span>
                                <span>Filter</span>
                            </button>
                            <div class="h-6 w-px bg-slate-200 dark:bg-slate-700 mx-1"></div>
                            <button class="p-2.5 text-slate-400 hover:text-primary transition-colors" title="Refresh">
                                <span class="material-symbols-outlined">refresh</span>
                            </button>
                        </div>
                    </div>
                    <div class="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm dark:bg-slate-900 dark:border-slate-800">
                        <div class="overflow-x-auto">
                            <table class="w-full text-left text-sm text-slate-600 dark:text-slate-400">
                                <thead class="bg-slate-50 text-xs font-semibold uppercase text-slate-500 dark:bg-slate-800 dark:text-slate-400">
                                    <tr>
                                        <th class="px-6 py-4" scope="col">Product</th>
                                        <th class="px-6 py-4" scope="col">Author</th>
                                        <th class="px-6 py-4" scope="col">Price</th>
                                        <th class="px-6 py-4" scope="col">Stock</th>
                                        <th class="px-6 py-4" scope="col">Status</th>
                                        <th class="px-6 py-4 text-right" scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-slate-100 dark:divide-slate-800 border-t border-slate-100 dark:border-slate-800">
                                    <tr class="hover:bg-slate-50/80 transition-colors dark:hover:bg-slate-800/50">
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-4">
                                                <div class="h-12 w-9 shrink-0 overflow-hidden rounded bg-slate-200 shadow-sm" data-alt="Cover of book titled The Minimalist Design">
                                                    <img alt="Book Cover" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBXyloKEeUD9YlN3etumZnRBnYY4SDpqPtJj70VbeeIBOPhZ0WpFSCKmw-aT0Y4c4H_dBTMjIcwZkL7DygD4wlP2xTxYyJWvhECZdgjT4Ib8aI26u1tXBAU-xEis74BNb_kVxQ-SP106p6sQiG9bth6RYqySkez1GozwTGBr4JV2D8anGsoSTzHaEjwwI4nBOCSgiYluhUv_xKbl1m6Da8dGNixHbwl8K4WsZUh-yF8Wg7zciLHu_-z1euN5NNA9KNpmMFhtQIdNJTb"/>
                                                </div>
                                                <div>
                                                    <p class="font-bold text-slate-900 dark:text-white">The Minimalist Design</p>
                                                    <p class="text-xs text-slate-500">ISBN: 978-3-16-148410-0</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle font-medium">Jane Doe</td>
                                        <td class="px-6 py-4 align-middle text-slate-900 font-bold dark:text-white">$24.00</td>
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-2">
                                                <span class="text-slate-700 dark:text-slate-300">124</span>
                                                <span class="text-xs text-slate-400">in stock</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle">
                                            <span class="inline-flex items-center rounded-full bg-emerald-50 px-2.5 py-0.5 text-xs font-medium text-emerald-700 border border-emerald-100 dark:bg-emerald-900/30 dark:text-emerald-400 dark:border-emerald-800">
                                                Active
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 align-middle text-right">
                                            <div class="flex items-center justify-end gap-3">
                                                <button class="inline-flex items-center justify-center rounded-lg bg-emerald-50 px-3 py-1.5 text-xs font-bold text-emerald-700 transition-colors hover:bg-emerald-100 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 dark:bg-emerald-900/30 dark:text-emerald-400 dark:hover:bg-emerald-900/50">
                                                    Manage Variants
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-emerald-50 hover:text-emerald-600 transition-colors focus:outline-none focus:ring-2 focus:ring-emerald-500" title="Edit">
                                                    <span class="material-symbols-outlined text-[20px]">edit</span>
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-red-50 hover:text-red-600 transition-colors focus:outline-none focus:ring-2 focus:ring-red-500" title="Delete">
                                                    <span class="material-symbols-outlined text-[20px]">delete</span>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="hover:bg-slate-50/80 transition-colors dark:hover:bg-slate-800/50">
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-4">
                                                <div class="h-12 w-9 shrink-0 overflow-hidden rounded bg-slate-200 shadow-sm" data-alt="Cover of book titled Modern Typography">
                                                    <img alt="Book Cover" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBU9T9LQVX6u3CDdlxsM74KCkpoHYrkTDitkij-WW6MA6M0uEQgyE2cdYi_V9TEeaLD4tHV8UWJCAvDGHsq_l6RlMZfNLVbv8MhrxCNXk8ho4xsBvnDkgC0A1Sbr5syib6vEA_Bkuv3NSIHBR-RtyyE6HiGxNizE1_T5quk7ZkkggxzPwlIqPi9_iULEsSYjRz7Dt_Aw_R8mwSi43-RI7bw3Hscgg8QvcPbqhl5NUY_ipz_TK95oleQWT_Dt54mlYcv3QyfxAV6DEqR"/>
                                                </div>
                                                <div>
                                                    <p class="font-bold text-slate-900 dark:text-white">Modern Typography</p>
                                                    <p class="text-xs text-slate-500">ISBN: 978-1-56-389657-3</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle font-medium">John Smith</td>
                                        <td class="px-6 py-4 align-middle text-slate-900 font-bold dark:text-white">$32.50</td>
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-2">
                                                <span class="text-amber-600 font-bold dark:text-amber-400">15</span>
                                                <span class="text-xs text-amber-600 dark:text-amber-400">low stock</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle">
                                            <span class="inline-flex items-center rounded-full bg-amber-50 px-2.5 py-0.5 text-xs font-medium text-amber-700 border border-amber-100 dark:bg-amber-900/30 dark:text-amber-400 dark:border-amber-800">
                                                Low Stock
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 align-middle text-right">
                                            <div class="flex items-center justify-end gap-3">
                                                <button class="inline-flex items-center justify-center rounded-lg bg-emerald-50 px-3 py-1.5 text-xs font-bold text-emerald-700 transition-colors hover:bg-emerald-100 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 dark:bg-emerald-900/30 dark:text-emerald-400 dark:hover:bg-emerald-900/50">
                                                    Manage Variants
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-emerald-50 hover:text-emerald-600 transition-colors focus:outline-none focus:ring-2 focus:ring-emerald-500" title="Edit">
                                                    <span class="material-symbols-outlined text-[20px]">edit</span>
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-red-50 hover:text-red-600 transition-colors focus:outline-none focus:ring-2 focus:ring-red-500" title="Delete">
                                                    <span class="material-symbols-outlined text-[20px]">delete</span>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="hover:bg-slate-50/80 transition-colors dark:hover:bg-slate-800/50">
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-4">
                                                <div class="h-12 w-9 shrink-0 overflow-hidden rounded bg-slate-200 shadow-sm" data-alt="Cover of book titled Understanding White Space">
                                                    <img alt="Book Cover" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuA2Wu27Ru8CwvlloM-0abwSGziiw-eY2ru4nRgbXNQvTtIMKnMmfQyfWOwS5pBGDm694aaTqLGkg2Ttd3-3eJIb4jS7zxII3dti-i-r3bQbdIiC_e6n2YgD1Vnccw6Y8G6_BaqH76myLj7P_FOUhi1OfvZzodo5ajFERSFEodZh8HE3xOQFXks6JNk4qH5Wmlg3PvQP6XnM0drQgIVnrq7cTS1lSgZb7N7gyeAtUbfd-bRdEEAU2e7EOegureiiQ52T1hgfvFKKGiQ-"/>
                                                </div>
                                                <div>
                                                    <p class="font-bold text-slate-900 dark:text-white">Understanding White Space</p>
                                                    <p class="text-xs text-slate-500">ISBN: 978-0-20-148567-2</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle font-medium">Alice Green</td>
                                        <td class="px-6 py-4 align-middle text-slate-900 font-bold dark:text-white">$19.00</td>
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-2">
                                                <span class="text-slate-700 dark:text-slate-300">200</span>
                                                <span class="text-xs text-slate-400">in stock</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle">
                                            <span class="inline-flex items-center rounded-full bg-emerald-50 px-2.5 py-0.5 text-xs font-medium text-emerald-700 border border-emerald-100 dark:bg-emerald-900/30 dark:text-emerald-400 dark:border-emerald-800">
                                                Active
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 align-middle text-right">
                                            <div class="flex items-center justify-end gap-3">
                                                <button class="inline-flex items-center justify-center rounded-lg bg-emerald-50 px-3 py-1.5 text-xs font-bold text-emerald-700 transition-colors hover:bg-emerald-100 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 dark:bg-emerald-900/30 dark:text-emerald-400 dark:hover:bg-emerald-900/50">
                                                    Manage Variants
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-emerald-50 hover:text-emerald-600 transition-colors focus:outline-none focus:ring-2 focus:ring-emerald-500" title="Edit">
                                                    <span class="material-symbols-outlined text-[20px]">edit</span>
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-red-50 hover:text-red-600 transition-colors focus:outline-none focus:ring-2 focus:ring-red-500" title="Delete">
                                                    <span class="material-symbols-outlined text-[20px]">delete</span>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="hover:bg-slate-50/80 transition-colors dark:hover:bg-slate-800/50">
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-4">
                                                <div class="h-12 w-9 shrink-0 overflow-hidden rounded bg-slate-200 shadow-sm" data-alt="Cover of book titled Grid Systems">
                                                    <img alt="Book Cover" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBkOuf5a4BCigtU5tNfyMd8DIhS283t8U3F0M9Gra7PFCBl8duOG4t8memLMyhUyoYF9DTGNlygbSFifY0-eNQs59ig46MjlMWfEF-XSgNVkY1AZolWUabd78ucOBY0bF3NsBYKduT6pmzbtdVWICIiKdiJXEwEUBiFYdDciib-r3tBOnW6IZAGLTZAHC7LrIrM7cXV46HHLBjaJCuHurgOTO1mX51R3qpwWBqDlQcPKFZBZj9hk9Jf7L8LVbokm5HMInMcMqW5w-Fy"/>
                                                </div>
                                                <div>
                                                    <p class="font-bold text-slate-900 dark:text-white">Grid Systems</p>
                                                    <p class="text-xs text-slate-500">ISBN: 978-0-13-110362-7</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle font-medium">Robert Brown</td>
                                        <td class="px-6 py-4 align-middle text-slate-900 font-bold dark:text-white">$45.00</td>
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-2">
                                                <span class="text-slate-400">0</span>
                                                <span class="text-xs text-slate-400">out of stock</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle">
                                            <span class="inline-flex items-center rounded-full bg-slate-100 px-2.5 py-0.5 text-xs font-medium text-slate-600 border border-slate-200 dark:bg-slate-800 dark:text-slate-400 dark:border-slate-700">
                                                Draft
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 align-middle text-right">
                                            <div class="flex items-center justify-end gap-3">
                                                <button class="inline-flex items-center justify-center rounded-lg bg-emerald-50 px-3 py-1.5 text-xs font-bold text-emerald-700 transition-colors hover:bg-emerald-100 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 dark:bg-emerald-900/30 dark:text-emerald-400 dark:hover:bg-emerald-900/50">
                                                    Manage Variants
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-emerald-50 hover:text-emerald-600 transition-colors focus:outline-none focus:ring-2 focus:ring-emerald-500" title="Edit">
                                                    <span class="material-symbols-outlined text-[20px]">edit</span>
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-red-50 hover:text-red-600 transition-colors focus:outline-none focus:ring-2 focus:ring-red-500" title="Delete">
                                                    <span class="material-symbols-outlined text-[20px]">delete</span>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="hover:bg-slate-50/80 transition-colors dark:hover:bg-slate-800/50">
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-4">
                                                <div class="h-12 w-9 shrink-0 overflow-hidden rounded bg-slate-200 shadow-sm" data-alt="Cover of book titled Color Theory">
                                                    <img alt="Book Cover" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDb84S1POc4y4A07Lwwj9TWIKc0XEaGCIpKsGlBGEnkA9PPyOuLUT1iQucKnpj2Dlt9TLrWjUFHNfyXlt03gHVe0B6-IXCElq_gaXaXoSHKoNWyRPpXHqCBin5Bqpozlu2C1hjQbWbOPZb85s-3kPzzg_UcAXBprFICaRluT2j9L0gkO5HILTeAYPrEemqHYVW4Ds0eqfrRBt_YYWje8Gt-YDTbwQkaE5NcPbMf28t03_itUlPjVAo5vNgMUEVpp6-7rIakweaSzcby"/>
                                                </div>
                                                <div>
                                                    <p class="font-bold text-slate-900 dark:text-white">Color Theory</p>
                                                    <p class="text-xs text-slate-500">ISBN: 978-0-596-51774-8</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle font-medium">Emily White</td>
                                        <td class="px-6 py-4 align-middle text-slate-900 font-bold dark:text-white">$28.00</td>
                                        <td class="px-6 py-4 align-middle">
                                            <div class="flex items-center gap-2">
                                                <span class="text-slate-700 dark:text-slate-300">56</span>
                                                <span class="text-xs text-slate-400">in stock</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 align-middle">
                                            <span class="inline-flex items-center rounded-full bg-emerald-50 px-2.5 py-0.5 text-xs font-medium text-emerald-700 border border-emerald-100 dark:bg-emerald-900/30 dark:text-emerald-400 dark:border-emerald-800">
                                                Active
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 align-middle text-right">
                                            <div class="flex items-center justify-end gap-3">
                                                <button class="inline-flex items-center justify-center rounded-lg bg-emerald-50 px-3 py-1.5 text-xs font-bold text-emerald-700 transition-colors hover:bg-emerald-100 focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 dark:bg-emerald-900/30 dark:text-emerald-400 dark:hover:bg-emerald-900/50">
                                                    Manage Variants
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-emerald-50 hover:text-emerald-600 transition-colors focus:outline-none focus:ring-2 focus:ring-emerald-500" title="Edit">
                                                    <span class="material-symbols-outlined text-[20px]">edit</span>
                                                </button>
                                                <button class="flex h-8 w-8 items-center justify-center rounded-lg text-slate-500 hover:bg-red-50 hover:text-red-600 transition-colors focus:outline-none focus:ring-2 focus:ring-red-500" title="Delete">
                                                    <span class="material-symbols-outlined text-[20px]">delete</span>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="flex items-center justify-between border-t border-slate-200 bg-white px-6 py-4 dark:bg-slate-900 dark:border-slate-800">
                            <p class="text-sm text-slate-500 dark:text-slate-400">
                                Showing <span class="font-bold text-slate-700 dark:text-white">1</span> to <span class="font-bold text-slate-700 dark:text-white">5</span> of <span class="font-bold text-slate-700 dark:text-white">48</span> results
                            </p>
                            <div class="flex gap-2">
                                <button class="inline-flex items-center rounded-lg border border-slate-200 bg-white px-3 py-1.5 text-sm font-medium text-slate-700 hover:bg-slate-50 disabled:opacity-50 dark:bg-slate-800 dark:border-slate-700 dark:text-slate-300" disabled="">
                                    Previous
                                </button>
                                <button class="inline-flex items-center rounded-lg border border-slate-200 bg-white px-3 py-1.5 text-sm font-medium text-slate-700 hover:bg-slate-50 dark:bg-slate-800 dark:border-slate-700 dark:text-slate-300">
                                    Next
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body></html>
