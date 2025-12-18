<%-- 
    Document   : cart
    Created on : Dec 15, 2025, 12:07:51 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Shopping Cart</title>
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
            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            input[type=number] {
                -moz-appearance: textfield;
            }
        </style>
    </head>
    <body class="bg-background-light dark:bg-background-dark text-text-main font-display antialiased min-h-screen flex flex-col">
        <%@include file="menu.jsp" %>
        <main class="flex-grow flex flex-col">
            <div class="bg-surface-light dark:bg-background-dark border-b border-[#eaf3e7] dark:border-[#2a3c25]">
                <div class="max-w-[1400px] mx-auto px-6 lg:px-12 py-8">
                    <nav class="flex items-center gap-2 text-sm text-text-secondary mb-6">
                        <a class="hover:text-primary transition-colors" href="#">Home</a>
                        <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                        <a class="hover:text-primary transition-colors" href="#">Shop</a>
                        <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                        <span class="font-semibold text-text-main dark:text-white">Shopping Cart</span>
                    </nav>
                    <div class="flex flex-col md:flex-row md:items-end justify-between gap-6">
                        <div class="max-w-2xl">
                            <h2 class="text-4xl md:text-5xl font-black tracking-tight text-text-main dark:text-white mb-3">Your Cart</h2>
                            <p class="text-lg text-text-secondary">Review your selection before proceeding to checkout.</p>
                        </div>
                        <div class="text-right hidden md:block">
                            <p class="text-sm font-medium text-text-secondary">3 Items in cart</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex-grow bg-background-light dark:bg-background-dark">
                <div class="max-w-[1400px] mx-auto px-6 lg:px-12 py-10">
                    <div class="flex flex-col lg:flex-row gap-12">
                        <div class="flex-grow">
                            <div class="hidden md:grid grid-cols-12 gap-4 pb-4 border-b border-[#eaf3e7] dark:border-[#2a3c25] text-sm font-semibold text-text-secondary uppercase tracking-wider">
                                <div class="col-span-6 pl-4">Product</div>
                                <div class="col-span-2 text-center">Price</div>
                                <div class="col-span-3 text-center">Quantity</div>
                                <div class="col-span-1 text-center"></div>
                            </div>
                            <div class="group flex flex-col md:grid md:grid-cols-12 gap-6 items-center py-6 border-b border-[#eaf3e7] dark:border-[#2a3c25] hover:bg-surface-light/50 dark:hover:bg-surface-dark/50 transition-colors rounded-xl md:rounded-none px-4 md:px-0">
                                <div class="col-span-6 flex gap-6 items-center w-full">
                                    <div class="w-20 h-28 flex-shrink-0 bg-[#f0f0f0] rounded-lg overflow-hidden shadow-sm relative group-hover:shadow-md transition-shadow">
                                        <img alt="Book cover The Psychology of Money" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCpC9PZ4LqON5KXa6Qk4VCkUgy6QPvnS8Hm4Fe230KrqiIBiUkIUURq8KA00fj5PTENLtf2tSdHCzwg3TV1R488PZEiJLr12Uo2flvq0lcXe-nXPL-Sq28wpNsbgbHzZkMCpx6C2VzO74bRbvzv_OsARMAa-wDLO-M5IwZWab0vrzxphjMFoi3j-IRiebH70zWvUr57W46295BB-VC_TmsO6eiWlNfJixwPu1Z4Ur5KwAgnLnjL9iAmD7rP02GlZqQJP9SSWlGPjz4T"/>
                                    </div>
                                    <div class="flex flex-col gap-1">
                                        <h3 class="text-lg font-bold text-text-main dark:text-white leading-tight">The Psychology of Money</h3>
                                        <p class="text-sm font-medium text-text-secondary">Morgan Housel</p>
                                        <div class="text-xs text-text-secondary mt-1 bg-[#eaf3e7] dark:bg-[#2a3c25] inline-block px-2 py-0.5 rounded-full w-fit">Paperback</div>
                                    </div>
                                </div>
                                <div class="col-span-2 flex justify-between md:justify-center w-full md:w-auto items-center">
                                    <span class="md:hidden text-sm font-medium text-text-secondary">Price:</span>
                                    <span class="text-lg font-bold text-text-main dark:text-white">$18.00</span>
                                </div>
                                <div class="col-span-3 flex justify-between md:justify-center w-full md:w-auto items-center">
                                    <span class="md:hidden text-sm font-medium text-text-secondary">Quantity:</span>
                                    <div class="flex items-center border border-[#eaf3e7] dark:border-[#2a3c25] rounded-full bg-white dark:bg-surface-dark">
                                        <button class="w-8 h-8 flex items-center justify-center text-text-secondary hover:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-[18px]">remove</span>
                                        </button>
                                        <input class="w-10 text-center bg-transparent border-none p-0 text-sm font-bold text-text-main dark:text-white focus:ring-0" type="number" value="1"/>
                                        <button class="w-8 h-8 flex items-center justify-center text-text-secondary hover:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-[18px]">add</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-span-1 flex justify-center w-full md:w-auto mt-2 md:mt-0">
                                    <button class="text-gray-400 hover:text-red-500 transition-colors p-2 rounded-full hover:bg-red-50 dark:hover:bg-red-900/20" title="Remove item">
                                        <span class="material-symbols-outlined">delete</span>
                                    </button>
                                </div>
                            </div>
                            <div class="group flex flex-col md:grid md:grid-cols-12 gap-6 items-center py-6 border-b border-[#eaf3e7] dark:border-[#2a3c25] hover:bg-surface-light/50 dark:hover:bg-surface-dark/50 transition-colors rounded-xl md:rounded-none px-4 md:px-0">
                                <div class="col-span-6 flex gap-6 items-center w-full">
                                    <div class="w-20 h-28 flex-shrink-0 bg-[#f0f0f0] rounded-lg overflow-hidden shadow-sm relative group-hover:shadow-md transition-shadow">
                                        <img alt="Book cover Atomic Habits" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBBgY7xHFsnFH2vohgXGiAFCeM2NNV_49SK1tU086SqTXLHFxNOqhHLdMVVEFl8j27OeC_pNMtcglUdv-wgqteEnGn8WQ9F1hzaCnw3ydbq9SCCFzlau6rDXflAoEwL6CflSk_iKc_Yb2ARSh1rilQ8pH1rApqerxcTJy01QzAKARJ5h5bJjFUGgy934hiZ6-VisljbmLpnotiPlGQqoHuSN_upzamgm_8HlRmqWferbKbZ5v4mHcCP5pMgdQENPxmlAblts596mNAA"/>
                                    </div>
                                    <div class="flex flex-col gap-1">
                                        <h3 class="text-lg font-bold text-text-main dark:text-white leading-tight">Atomic Habits</h3>
                                        <p class="text-sm font-medium text-text-secondary">James Clear</p>
                                        <div class="text-xs text-text-secondary mt-1 bg-[#eaf3e7] dark:bg-[#2a3c25] inline-block px-2 py-0.5 rounded-full w-fit">Hardcover</div>
                                    </div>
                                </div>
                                <div class="col-span-2 flex justify-between md:justify-center w-full md:w-auto items-center">
                                    <span class="md:hidden text-sm font-medium text-text-secondary">Price:</span>
                                    <span class="text-lg font-bold text-text-main dark:text-white">$16.99</span>
                                </div>
                                <div class="col-span-3 flex justify-between md:justify-center w-full md:w-auto items-center">
                                    <span class="md:hidden text-sm font-medium text-text-secondary">Quantity:</span>
                                    <div class="flex items-center border border-[#eaf3e7] dark:border-[#2a3c25] rounded-full bg-white dark:bg-surface-dark">
                                        <button class="w-8 h-8 flex items-center justify-center text-text-secondary hover:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-[18px]">remove</span>
                                        </button>
                                        <input class="w-10 text-center bg-transparent border-none p-0 text-sm font-bold text-text-main dark:text-white focus:ring-0" type="number" value="2"/>
                                        <button class="w-8 h-8 flex items-center justify-center text-text-secondary hover:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-[18px]">add</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-span-1 flex justify-center w-full md:w-auto mt-2 md:mt-0">
                                    <button class="text-gray-400 hover:text-red-500 transition-colors p-2 rounded-full hover:bg-red-50 dark:hover:bg-red-900/20" title="Remove item">
                                        <span class="material-symbols-outlined">delete</span>
                                    </button>
                                </div>
                            </div>
                            <div class="group flex flex-col md:grid md:grid-cols-12 gap-6 items-center py-6 border-b border-[#eaf3e7] dark:border-[#2a3c25] hover:bg-surface-light/50 dark:hover:bg-surface-dark/50 transition-colors rounded-xl md:rounded-none px-4 md:px-0">
                                <div class="col-span-6 flex gap-6 items-center w-full">
                                    <div class="w-20 h-28 flex-shrink-0 bg-[#f0f0f0] rounded-lg overflow-hidden shadow-sm relative group-hover:shadow-md transition-shadow">
                                        <img alt="Book cover Deep Work" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAH_LOpqgNUlGJ2WZKvw2BbQ6uLfbt4iBBPxyFS6hEBlmR9b6emK2h9E5qCv0G8tr2kN6WKvwM37Sk8-fDz4Tks8b68flMpDbPYbkZGaMnScPE8iYvO4fUBsoMMG-CAOhgmaWZvHADNX0EHshCTXfXbip1AqEa-n9Rmm753_bUMe5W-bdqLprjwD2X5eiC58ZHdwPe8PdaDZO2dmXmnidQJdonsG9Dlq0KoLHulAkZPs8hPQs6p0vDNKL-ibmOwb19UPCxtyG84XNod"/>
                                    </div>
                                    <div class="flex flex-col gap-1">
                                        <h3 class="text-lg font-bold text-text-main dark:text-white leading-tight">Deep Work</h3>
                                        <p class="text-sm font-medium text-text-secondary">Cal Newport</p>
                                        <div class="text-xs text-text-secondary mt-1 bg-[#eaf3e7] dark:bg-[#2a3c25] inline-block px-2 py-0.5 rounded-full w-fit">E-Book</div>
                                    </div>
                                </div>
                                <div class="col-span-2 flex justify-between md:justify-center w-full md:w-auto items-center">
                                    <span class="md:hidden text-sm font-medium text-text-secondary">Price:</span>
                                    <span class="text-lg font-bold text-text-main dark:text-white">$21.00</span>
                                </div>
                                <div class="col-span-3 flex justify-between md:justify-center w-full md:w-auto items-center">
                                    <span class="md:hidden text-sm font-medium text-text-secondary">Quantity:</span>
                                    <div class="flex items-center border border-[#eaf3e7] dark:border-[#2a3c25] rounded-full bg-white dark:bg-surface-dark">
                                        <button class="w-8 h-8 flex items-center justify-center text-text-secondary hover:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-[18px]">remove</span>
                                        </button>
                                        <input class="w-10 text-center bg-transparent border-none p-0 text-sm font-bold text-text-main dark:text-white focus:ring-0" type="number" value="1"/>
                                        <button class="w-8 h-8 flex items-center justify-center text-text-secondary hover:text-primary transition-colors">
                                            <span class="material-symbols-outlined text-[18px]">add</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-span-1 flex justify-center w-full md:w-auto mt-2 md:mt-0">
                                    <button class="text-gray-400 hover:text-red-500 transition-colors p-2 rounded-full hover:bg-red-50 dark:hover:bg-red-900/20" title="Remove item">
                                        <span class="material-symbols-outlined">delete</span>
                                    </button>
                                </div>
                            </div>
                            <div class="flex justify-between items-center mt-8">
                                <a class="flex items-center gap-2 text-text-secondary hover:text-primary font-semibold text-sm transition-colors" href="#">
                                    <span class="material-symbols-outlined">arrow_back</span>
                                    Continue Shopping
                                </a>
                                <button class="text-text-secondary hover:text-red-500 text-sm font-semibold transition-colors">
                                    Clear Cart
                                </button>
                            </div>
                        </div>
                        <div class="w-full lg:w-96 flex-shrink-0">
                            <div class="sticky top-28 space-y-6">
                                <div class="bg-surface-light dark:bg-surface-dark p-6 lg:p-8 rounded-3xl border border-[#eaf3e7] dark:border-[#2a3c25]">
                                    <h3 class="text-xl font-bold text-text-main dark:text-white mb-6">Order Summary</h3>
                                    <div class="space-y-4 mb-6">
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-text-secondary">Subtotal</span>
                                            <span class="font-bold text-text-main dark:text-white">$72.98</span>
                                        </div>
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-text-secondary">Shipping Estimate</span>
                                            <span class="font-bold text-text-main dark:text-white">$5.00</span>
                                        </div>
                                        <div class="flex justify-between items-center text-sm">
                                            <span class="text-text-secondary">Tax Estimate</span>
                                            <span class="font-bold text-text-main dark:text-white">$6.20</span>
                                        </div>
                                    </div>
                                    <div class="border-t border-dashed border-[#eaf3e7] dark:border-[#2a3c25] my-6"></div>
                                    <div class="flex justify-between items-center mb-8">
                                        <span class="text-lg font-bold text-text-main dark:text-white">Total</span>
                                        <span class="text-2xl font-black text-primary">$84.18</span>
                                    </div>
                                    <button class="w-full bg-primary hover:bg-green-500 text-white font-bold py-4 rounded-xl transition-all shadow-lg shadow-primary/20 hover:shadow-primary/40 flex items-center justify-center gap-2">
                                        <span>Proceed to Checkout</span>
                                        <span class="material-symbols-outlined">arrow_forward</span>
                                    </button>
                                    <div class="mt-4 text-center">
                                        <p class="text-xs text-text-secondary flex items-center justify-center gap-1">
                                            <span class="material-symbols-outlined text-[14px]">lock</span>
                                            Secure Checkout
                                        </p>
                                    </div>
                                </div>
                                <div class="bg-surface-light dark:bg-surface-dark p-6 rounded-3xl border border-[#eaf3e7] dark:border-[#2a3c25]">
                                    <h4 class="font-bold text-text-main dark:text-white mb-3 flex items-center gap-2">
                                        <span class="material-symbols-outlined text-primary">local_offer</span>
                                        Have a coupon code?
                                    </h4>
                                    <div class="flex gap-2">
                                        <input class="w-full px-4 py-2 rounded-lg bg-background-light dark:bg-background-dark border border-[#eaf3e7] dark:border-[#2a3c25] text-sm focus:ring-1 focus:ring-primary focus:border-primary outline-none" placeholder="Enter code" type="text"/>
                                        <button class="px-4 py-2 bg-text-main dark:bg-white text-white dark:text-text-main font-bold rounded-lg text-sm hover:opacity-90 transition-opacity">
                                            Apply
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>

    </body></html>
