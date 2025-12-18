<%-- 
    Document   : orderDetail
    Created on : Dec 15, 2025, 12:09:07 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Order Invoice Details</title>
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
                        <a class="hover:text-primary transition-colors" href="#">Profile</a>
                        <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                        <a class="hover:text-primary transition-colors" href="#">Orders</a>
                        <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                        <span class="font-semibold text-text-main dark:text-white">Order #48392</span>
                    </nav>
                    <div class="flex flex-col md:flex-row md:items-end justify-between gap-6">
                        <div class="max-w-2xl">
                            <div class="flex items-center gap-3 mb-2">
                                <h2 class="text-4xl md:text-5xl font-black tracking-tight text-text-main dark:text-white">Order #48392</h2>
                                <span class="px-3 py-1 rounded-full bg-primary/10 text-primary text-xs font-bold border border-primary/20 tracking-wide uppercase">Delivered</span>
                            </div>
                            <p class="text-lg text-text-secondary flex items-center gap-2">
                                <span class="material-symbols-outlined text-[20px]">calendar_month</span>
                                Purchased on October 24, 2023
                            </p>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="flex-grow bg-background-light dark:bg-background-dark">
                <div class="max-w-[1400px] mx-auto px-6 lg:px-12 py-12">
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 lg:gap-12">
                        <div class="lg:col-span-8 space-y-6">
                            <div class="flex items-center justify-between pb-4 border-b border-[#eaf3e7] dark:border-[#2a3c25]">
                                <h3 class="text-xl font-bold text-text-main dark:text-white">Items in your order</h3>
                                <span class="text-sm font-semibold text-text-secondary">2 Items</span>
                            </div>
                            <div class="group flex flex-col sm:flex-row gap-6 p-6 bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl hover:shadow-sm transition-all">
                                <div class="w-24 h-36 flex-shrink-0 bg-[#f0f0f0] rounded-xl overflow-hidden shadow-sm relative">
                                    <img alt="Book cover The Psychology of Money" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCpC9PZ4LqON5KXa6Qk4VCkUgy6QPvnS8Hm4Fe230KrqiIBiUkIUURq8KA00fj5PTENLtf2tSdHCzwg3TV1R488PZEiJLr12Uo2flvq0lcXe-nXPL-Sq28wpNsbgbHzZkMCpx6C2VzO74bRbvzv_OsARMAa-wDLO-M5IwZWab0vrzxphjMFoi3j-IRiebH70zWvUr57W46295BB-VC_TmsO6eiWlNfJixwPu1Z4Ur5KwAgnLnjL9iAmD7rP02GlZqQJP9SSWlGPjz4T"/>
                                </div>
                                <div class="flex-grow flex flex-col justify-between">
                                    <div>
                                        <div class="flex justify-between items-start gap-4">
                                            <div>
                                                <h4 class="text-lg font-bold text-text-main dark:text-white leading-tight">The Psychology of Money</h4>
                                                <p class="text-sm font-medium text-text-secondary mt-1">Morgan Housel</p>
                                            </div>
                                            <span class="text-lg font-bold text-text-main dark:text-white">$18.00</span>
                                        </div>
                                        <div class="flex items-center gap-2 mt-2">
                                            <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-[#eaf3e7] dark:bg-[#2a3c25] text-text-secondary">
                                                Hardcover
                                            </span>
                                        </div>
                                    </div>
                                    <div class="flex items-end justify-between mt-4">
                                        <div class="text-sm text-text-main dark:text-white font-medium">
                                            Quantity: <span class="font-bold">1</span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="group flex flex-col sm:flex-row gap-6 p-6 bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl hover:shadow-sm transition-all">
                                <div class="w-24 h-36 flex-shrink-0 bg-[#f0f0f0] rounded-xl overflow-hidden shadow-sm relative">
                                    <img alt="Book cover Atomic Habits" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBBgY7xHFsnFH2vohgXGiAFCeM2NNV_49SK1tU086SqTXLHFxNOqhHLdMVVEFl8j27OeC_pNMtcglUdv-wgqteEnGn8WQ9F1hzaCnw3ydbq9SCCFzlau6rDXflAoEwL6CflSk_iKc_Yb2ARSh1rilQ8pH1rApqerxcTJy01QzAKARJ5h5bJjFUGgy934hiZ6-VisljbmLpnotiPlGQqoHuSN_upzamgm_8HlRmqWferbKbZ5v4mHcCP5pMgdQENPxmlAblts596mNAA"/>
                                </div>
                                <div class="flex-grow flex flex-col justify-between">
                                    <div>
                                        <div class="flex justify-between items-start gap-4">
                                            <div>
                                                <h4 class="text-lg font-bold text-text-main dark:text-white leading-tight">Atomic Habits</h4>
                                                <p class="text-sm font-medium text-text-secondary mt-1">James Clear</p>
                                            </div>
                                            <span class="text-lg font-bold text-text-main dark:text-white">$22.00</span>
                                        </div>
                                        <div class="flex items-center gap-2 mt-2">
                                            <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium bg-[#eaf3e7] dark:bg-[#2a3c25] text-text-secondary">
                                                Paperback
                                            </span>
                                        </div>
                                    </div>
                                    <div class="flex items-end justify-between mt-4">
                                        <div class="text-sm text-text-main dark:text-white font-medium">
                                            Quantity: <span class="font-bold">1</span>
                                        </div>
                                        <button class="text-sm font-bold text-primary hover:text-primary/80 transition-colors">Write a Review</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lg:col-span-4 space-y-6">
                            <div class="p-6 bg-white dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl shadow-sm shadow-[#eaf3e7]/50 dark:shadow-none">
                                <h3 class="text-lg font-bold text-text-main dark:text-white mb-6 flex items-center gap-2">
                                    <span class="material-symbols-outlined text-text-secondary">receipt_long</span>
                                    Payment Summary
                                </h3>
                                <div class="space-y-4 pb-6 border-b border-[#eaf3e7] dark:border-[#2a3c25] text-sm">
                                    <div class="flex justify-between items-center text-text-secondary">
                                        <span>Subtotal</span>
                                        <span class="font-semibold text-text-main dark:text-white">$40.00</span>
                                    </div>
                                    <div class="flex justify-between items-center text-text-secondary">
                                        <span>Shipping estimate</span>
                                        <span class="font-semibold text-text-main dark:text-white">$5.00</span>
                                    </div>
                                    <div class="flex justify-between items-center text-text-secondary">
                                        <span>Tax estimate</span>
                                        <span class="font-semibold text-text-main dark:text-white">$3.20</span>
                                    </div>
                                </div>
                                <div class="pt-6 flex justify-between items-center">
                                    <span class="text-lg font-bold text-text-main dark:text-white">Order Total</span>
                                    <span class="text-2xl font-black text-primary">$48.20</span>
                                </div>
                                <div class="mt-6 pt-6 border-t border-[#eaf3e7] dark:border-[#2a3c25]">
                                    <div class="flex items-center gap-3">
                                        <span class="material-symbols-outlined text-text-secondary">credit_card</span>
                                        <div class="text-sm">
                                            <p class="font-bold text-text-main dark:text-white">Visa ending in 4242</p>
                                            <p class="text-xs text-text-secondary">Exp 12/26</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="p-6 bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl">
                                <h3 class="text-lg font-bold text-text-main dark:text-white mb-4 flex items-center gap-2">
                                    <span class="material-symbols-outlined text-text-secondary">local_shipping</span>
                                    Shipping Details
                                </h3>
                                <div class="space-y-1">
                                    <p class="font-bold text-text-main dark:text-white">Jane Reader</p>
                                    <p class="text-sm text-text-secondary">1234 Bookworm Lane, Apt 4B</p>
                                    <p class="text-sm text-text-secondary">Readington, TX 78209</p>
                                    <p class="text-sm text-text-secondary">United States</p>
                                </div>
                                <div class="mt-4 pt-4 border-t border-[#eaf3e7] dark:border-[#2a3c25]">
                                    <p class="text-xs font-bold text-text-main dark:text-white uppercase tracking-wider mb-1">Method</p>
                                    <p class="text-sm text-text-secondary">Standard Delivery</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>

    </body></html>
