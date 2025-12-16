<%-- 
    Document   : orderDetailManagement
    Created on : Dec 15, 2025, 3:43:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>BookStore Admin - Order Detail</title>
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
                    <a class="text-gray-500 hover:text-primary dark:text-gray-400" href="#">Orders</a>
                    <span class="text-gray-400 material-symbols-outlined text-sm">chevron_right</span>
                    <span class="text-gray-900 dark:text-white font-medium">Order #ORD-7023</span>
                </nav>
                <div class="flex flex-col md:flex-row md:items-end justify-between gap-4 pb-2">
                    <div class="flex flex-col gap-2">
                        <div class="flex items-center gap-3">
                            <h1 class="text-3xl md:text-4xl font-black leading-tight tracking-tight text-gray-900 dark:text-white">Order #ORD-7023</h1>
                            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-bold bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400 border border-green-200 dark:border-green-800">
                                Delivered
                            </span>
                        </div>
                        <p class="text-gray-500 dark:text-gray-400 text-base flex items-center gap-2">
                            <span class="material-symbols-outlined text-sm">calendar_today</span>
                            October 24, 2023 at 10:32 AM
                        </p>
                    </div>
                    
                </div>
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <div class="lg:col-span-2 flex flex-col gap-6">
                        <div class="bg-white dark:bg-gray-900 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 p-6">
                            <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-6">Order Items</h3>
                            <div class="overflow-x-auto">
                                <table class="w-full text-left">
                                    <thead>
                                        <tr class="text-xs uppercase text-gray-500 border-b border-gray-100 dark:border-gray-800">
                                            <th class="pb-4 font-bold tracking-wider w-1/2">Product</th>
                                            <th class="pb-4 font-bold tracking-wider text-center">Price</th>
                                            <th class="pb-4 font-bold tracking-wider text-center">Quantity</th>
                                            <th class="pb-4 font-bold tracking-wider text-right">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-100 dark:divide-gray-800">
                                        <tr class="group">
                                            <td class="py-4">
                                                <div class="flex items-center gap-4">
                                                    <div class="w-12 h-16 bg-gray-100 rounded bg-cover bg-center shadow-sm" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAuXIimlCcxCFVnweRZgmln4NNvGTM1FYH_CqeprDxMZlSpuP1tUWKjfLO9JFtc936mu2hp3aHRX67_iwrmc4SBI-QHmviQ3475Zr54RWb-BzgfjODKMCccUZHt2Rbc2xmSrZUyLnNsgI6z0qyHnOJjhj5HrlP3oLHOEqFKDVBbJNTpBH7VcdXGFNebUl-qNtYD2eRhGf-X0ljih_nr0ZiiSrzi_TlOnrroTp4B-5qzRriRLhIwPzqeLVesrIwVug1gmvnGQH_uodu8");'></div>
                                                    <div class="flex flex-col">
                                                        <span class="font-bold text-gray-900 dark:text-white text-sm">The Great Gatsby</span>
                                                        <span class="text-xs text-gray-500">F. Scott Fitzgerald</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="py-4 text-center text-sm font-medium text-gray-700 dark:text-gray-300">$12.50</td>
                                            <td class="py-4 text-center text-sm font-medium text-gray-700 dark:text-gray-300">1</td>
                                            <td class="py-4 text-right text-sm font-bold text-gray-900 dark:text-white">$12.50</td>
                                        </tr>
                                        <tr class="group">
                                            <td class="py-4">
                                                <div class="flex items-center gap-4">
                                                    <div class="w-12 h-16 bg-gray-100 rounded bg-cover bg-center shadow-sm" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuA-xuGwZLpnxN5wGhn7je9yYqUTyVTpiYdXKwHUVR656Du0jVzh8v0UrFBU5BOQT8zFOGTo6NXANB7YCr-DfOwaI8VMeTisMpBT9hK-5Hf9BWwfpTl-yMSeS_QQQGnF7hvbjFzQh9Tev-KcjpuaJSmhShgGa-aIc1LZcc6kZwSK4clF7nLGdChqA0iSbjHmP8RZPVVQk0XPBjZ7BCqPGOrwwok8QkWko9BOKMN5dusKwdt3ejoow9mBxk_lDyI7Eyau96VLj_sVIoGx");'></div>
                                                    <div class="flex flex-col">
                                                        <span class="font-bold text-gray-900 dark:text-white text-sm">Atomic Habits</span>
                                                        <span class="text-xs text-gray-500">James Clear</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="py-4 text-center text-sm font-medium text-gray-700 dark:text-gray-300">$24.00</td>
                                            <td class="py-4 text-center text-sm font-medium text-gray-700 dark:text-gray-300">1</td>
                                            <td class="py-4 text-right text-sm font-bold text-gray-900 dark:text-white">$24.00</td>
                                        </tr>
                                        <tr class="group">
                                            <td class="py-4">
                                                <div class="flex items-center gap-4">
                                                    <div class="w-12 h-16 bg-gray-100 rounded bg-cover bg-center shadow-sm" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDfM9vzDPvS3KMsIQom5SHaH5JDwSk4cCSgn9pbYyDWOYkeR0npXu_qOo26zjJlYaQrb0aSjG3Vv68Cij_cP_jzciqg4tUqyWpgQQ1pdZZkyjYNRRXcqy28hNk7CI8Hu_Ui6dgjyUmQeknKftn-FWlY7y9uxA8X-KYF4JMISgx4dMvk2rnYSbL83kQ9IfpEuXo3vnTJAM5vhlR1nv-yf4U4FSNSa0gLcrGEt2PSW8ZNO3nFDNNR6coqsoav-1fhp81B-f6fSaOZmBnd");'></div>
                                                    <div class="flex flex-col">
                                                        <span class="font-bold text-gray-900 dark:text-white text-sm">Design Systems</span>
                                                        <span class="text-xs text-gray-500">Alla Kholmatova</span>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="py-4 text-center text-sm font-medium text-gray-700 dark:text-gray-300">$34.00</td>
                                            <td class="py-4 text-center text-sm font-medium text-gray-700 dark:text-gray-300">2</td>
                                            <td class="py-4 text-right text-sm font-bold text-gray-900 dark:text-white">$68.00</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="mt-4 pt-4 border-t border-gray-100 dark:border-gray-800 flex flex-col items-end gap-3">
                                <div class="flex justify-between w-full md:w-1/2 lg:w-1/3 text-sm">
                                    <span class="text-gray-500 dark:text-gray-400">Subtotal</span>
                                    <span class="font-medium text-gray-900 dark:text-white">$104.50</span>
                                </div>
                                <div class="flex justify-between w-full md:w-1/2 lg:w-1/3 text-sm">
                                    <span class="text-gray-500 dark:text-gray-400">Shipping (Standard)</span>
                                    <span class="font-medium text-gray-900 dark:text-white">$5.00</span>
                                </div>
                                <div class="flex justify-between w-full md:w-1/2 lg:w-1/3 text-sm">
                                    <span class="text-gray-500 dark:text-gray-400">Tax (8%)</span>
                                    <span class="font-medium text-gray-900 dark:text-white">$8.36</span>
                                </div>
                                <div class="flex justify-between w-full md:w-1/2 lg:w-1/3 text-lg font-bold border-t border-dashed border-gray-200 dark:border-gray-700 pt-3 mt-1">
                                    <span class="text-gray-900 dark:text-white">Total Amount</span>
                                    <span class="text-primary">$117.86</span>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white dark:bg-gray-900 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 p-6">
                            <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-6">Order Timeline</h3>
                            <div class="relative pl-4 border-l-2 border-gray-100 dark:border-gray-800 space-y-8">
                                <div class="relative">
                                    <div class="absolute -left-[21px] top-1 bg-green-500 size-3 rounded-full border-2 border-white dark:border-gray-900"></div>
                                    <p class="text-sm font-bold text-gray-900 dark:text-white">Order Delivered</p>
                                    <p class="text-xs text-gray-500 mt-1">October 26, 2023 at 02:30 PM</p>
                                </div>
                                <div class="relative">
                                    <div class="absolute -left-[21px] top-1 bg-gray-300 dark:bg-gray-700 size-3 rounded-full border-2 border-white dark:border-gray-900"></div>
                                    <p class="text-sm font-medium text-gray-700 dark:text-gray-300">Package Shipped</p>
                                    <p class="text-xs text-gray-500 mt-1">October 25, 2023 at 09:15 AM</p>
                                </div>
                                <div class="relative">
                                    <div class="absolute -left-[21px] top-1 bg-gray-300 dark:bg-gray-700 size-3 rounded-full border-2 border-white dark:border-gray-900"></div>
                                    <p class="text-sm font-medium text-gray-700 dark:text-gray-300">Order Processed</p>
                                    <p class="text-xs text-gray-500 mt-1">October 24, 2023 at 11:00 AM</p>
                                </div>
                                <div class="relative">
                                    <div class="absolute -left-[21px] top-1 bg-gray-300 dark:bg-gray-700 size-3 rounded-full border-2 border-white dark:border-gray-900"></div>
                                    <p class="text-sm font-medium text-gray-700 dark:text-gray-300">Order Placed</p>
                                    <p class="text-xs text-gray-500 mt-1">October 24, 2023 at 10:32 AM</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="lg:col-span-1 flex flex-col gap-6">
                        <div class="bg-white dark:bg-gray-900 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 p-6">
                            <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-4">Customer Details</h3>
                            <div class="flex items-center gap-4 mb-6">
                                <div class="size-12 rounded-full bg-blue-100 dark:bg-blue-900/30 text-blue-600 dark:text-blue-400 flex items-center justify-center text-lg font-bold">ES</div>
                                <div class="flex flex-col">
                                    <span class="font-bold text-gray-900 dark:text-white">Emily Smith</span>
                                    <span class="text-sm text-gray-500">Customer since 2021</span>
                                </div>
                            </div>
                            <div class="space-y-4">
                                <div class="flex items-start gap-3">
                                    <div class="p-2 bg-background-light dark:bg-gray-800 rounded-lg text-gray-500">
                                        <span class="material-symbols-outlined text-[20px]">mail</span>
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-xs text-gray-500 font-medium uppercase">Email</span>
                                        <a class="text-sm font-medium text-gray-900 dark:text-white hover:text-primary transition-colors" href="mailto:emily.s@example.com">emily.s@example.com</a>
                                    </div>
                                </div>
                                <div class="flex items-start gap-3">
                                    <div class="p-2 bg-background-light dark:bg-gray-800 rounded-lg text-gray-500">
                                        <span class="material-symbols-outlined text-[20px]">call</span>
                                    </div>
                                    <div class="flex flex-col">
                                        <span class="text-xs text-gray-500 font-medium uppercase">Phone</span>
                                        <a class="text-sm font-medium text-gray-900 dark:text-white hover:text-primary transition-colors" href="tel:+1234567890">+1 (555) 123-4567</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white dark:bg-gray-900 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 p-6">
                            <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-4">Shipping Address</h3>
                            <div class="flex items-start gap-3">
                                <div class="p-2 bg-background-light dark:bg-gray-800 rounded-lg text-gray-500 shrink-0">
                                    <span class="material-symbols-outlined text-[20px]">local_shipping</span>
                                </div>
                                <p class="text-sm text-gray-700 dark:text-gray-300 leading-relaxed">
                                    1234 Maple Avenue,<br/>
                                    Apt 5B,<br/>
                                    Springfield, IL 62704<br/>
                                    United States
                                </p>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </main>
    </body></html>
