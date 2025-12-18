<%-- 
    Document   : order
    Created on : Dec 15, 2025, 12:08:54 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Purchased Products Page</title>
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
                        <span class="font-semibold text-text-main dark:text-white">Purchased Products</span>
                    </nav>
                    <div class="flex flex-col md:flex-row md:items-end justify-between gap-6">
                        <div class="max-w-2xl">
                            <h2 class="text-4xl md:text-5xl font-black tracking-tight text-text-main dark:text-white mb-3">Your Orders</h2>
                            <p class="text-lg text-text-secondary">Track your shipments and review your purchase history.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex-grow bg-background-light dark:bg-background-dark">
                <div class="max-w-5xl mx-auto px-6 lg:px-12 py-12">
                    <div class="mb-16">
                        <h3 class="flex items-center gap-3 text-xl font-bold text-text-main dark:text-white mb-6 pb-4 border-b border-[#eaf3e7] dark:border-[#2a3c25]">
                            <span class="material-symbols-outlined text-primary">local_shipping</span>
                            Currently Delivering
                        </h3>
                        <div class="space-y-4">
                            <div class="group flex flex-col md:flex-row gap-6 items-start md:items-center p-6 bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl hover:shadow-lg hover:shadow-primary/5 transition-all">
                                <div class="w-24 h-36 flex-shrink-0 bg-[#f0f0f0] rounded-xl overflow-hidden shadow-sm relative">
                                    <img alt="Book cover The Psychology of Money" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCpC9PZ4LqON5KXa6Qk4VCkUgy6QPvnS8Hm4Fe230KrqiIBiUkIUURq8KA00fj5PTENLtf2tSdHCzwg3TV1R488PZEiJLr12Uo2flvq0lcXe-nXPL-Sq28wpNsbgbHzZkMCpx6C2VzO74bRbvzv_OsARMAa-wDLO-M5IwZWab0vrzxphjMFoi3j-IRiebH70zWvUr57W46295BB-VC_TmsO6eiWlNfJixwPu1Z4Ur5KwAgnLnjL9iAmD7rP02GlZqQJP9SSWlGPjz4T"/>
                                </div>
                                <div class="flex-grow space-y-2">
                                    <div>
                                        <h4 class="text-xl font-bold text-text-main dark:text-white leading-tight">The Psychology of Money</h4>
                                        <p class="text-sm font-medium text-text-secondary">Morgan Housel</p>
                                    </div>
                                    <div class="flex flex-wrap items-center gap-x-6 gap-y-2 text-sm text-text-secondary">
                                        <span class="flex items-center gap-1">
                                            <span class="material-symbols-outlined text-[16px]">calendar_today</span>
                                            Purchased: Oct 24, 2023
                                        </span>
                                        <span class="flex items-center gap-1">
                                            <span class="material-symbols-outlined text-[16px]">numbers</span>
                                            Order #48392
                                        </span>
                                    </div>
                                </div>
                                <div class="w-full md:w-auto flex flex-row md:flex-col justify-between md:justify-end items-center md:items-end gap-3 md:pl-6 md:border-l border-[#eaf3e7] dark:border-[#2a3c25]/30">
                                    <span class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full text-sm font-bold bg-primary/10 text-primary border border-primary/20 md:mb-2">
                                        Arriving Tomorrow
                                    </span>
                                    <div class="flex gap-3 w-full md:w-auto md:flex-col">
                                        <button class="flex-1 md:w-auto px-5 py-2 rounded-xl bg-text-main dark:bg-white text-white dark:text-text-main text-sm font-bold hover:opacity-90 transition-opacity flex items-center justify-center gap-2 whitespace-nowrap">
                                            Track Package
                                        </button>
                                        <button class="flex-1 md:w-auto px-5 py-2 rounded-xl border border-[#eaf3e7] dark:border-[#2a3c25] text-text-main dark:text-white text-sm font-bold hover:border-primary hover:text-primary hover:bg-white dark:hover:bg-surface-dark/50 transition-all flex items-center justify-center gap-2 whitespace-nowrap">
                                            <span class="material-symbols-outlined text-[18px]">receipt_long</span>
                                            View Invoice
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h3 class="flex items-center gap-3 text-xl font-bold text-text-main dark:text-white mb-6 pb-4 border-b border-[#eaf3e7] dark:border-[#2a3c25]">
                            <span class="material-symbols-outlined text-text-secondary">check_circle</span>
                            Delivered
                        </h3>
                        <div class="space-y-4">
                            <div class="group flex flex-col md:flex-row gap-6 items-start md:items-center p-6 bg-white dark:bg-background-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl hover:bg-surface-light dark:hover:bg-surface-dark transition-colors">
                                <div class="w-20 h-28 flex-shrink-0 bg-[#f0f0f0] rounded-xl overflow-hidden shadow-sm opacity-90 group-hover:opacity-100 transition-opacity">
                                    <img alt="Book cover Atomic Habits" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBBgY7xHFsnFH2vohgXGiAFCeM2NNV_49SK1tU086SqTXLHFxNOqhHLdMVVEFl8j27OeC_pNMtcglUdv-wgqteEnGn8WQ9F1hzaCnw3ydbq9SCCFzlau6rDXflAoEwL6CflSk_iKc_Yb2ARSh1rilQ8pH1rApqerxcTJy01QzAKARJ5h5bJjFUGgy934hiZ6-VisljbmLpnotiPlGQqoHuSN_upzamgm_8HlRmqWferbKbZ5v4mHcCP5pMgdQENPxmlAblts596mNAA"/>
                                </div>
                                <div class="flex-grow space-y-1">
                                    <h4 class="text-lg font-bold text-text-main dark:text-white leading-tight">Atomic Habits</h4>
                                    <p class="text-sm font-medium text-text-secondary">James Clear</p>
                                    <p class="text-xs text-text-secondary mt-2">Purchased on Sep 15, 2023</p>
                                </div>
                                <div class="w-full md:w-auto flex items-center justify-between md:flex-col md:items-end gap-2">
                                    <div class="text-right">
                                        <span class="block text-sm font-bold text-text-main dark:text-white">Delivered on Sep 18</span>
                                        <span class="text-xs text-text-secondary">Left at front door</span>
                                    </div>
                                    <div class="flex flex-col items-end gap-2 mt-2 w-full md:w-auto">
                                        <button class="w-full md:w-auto px-4 py-2 rounded-xl border border-[#eaf3e7] dark:border-[#2a3c25] text-text-main dark:text-white text-sm font-bold hover:border-primary hover:text-primary hover:bg-surface-light dark:hover:bg-surface-dark/50 transition-all flex items-center justify-center gap-2">
                                            <span class="material-symbols-outlined text-[18px]">receipt_long</span>
                                            View Invoice
                                        </button>
                                        <button class="text-xs font-semibold text-text-secondary hover:text-primary transition-colors underline py-1">
                                            Write Review
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="group flex flex-col md:flex-row gap-6 items-start md:items-center p-6 bg-white dark:bg-background-dark border border-[#eaf3e7] dark:border-[#2a3c25] rounded-3xl hover:bg-surface-light dark:hover:bg-surface-dark transition-colors">
                                <div class="w-20 h-28 flex-shrink-0 bg-[#f0f0f0] rounded-xl overflow-hidden shadow-sm opacity-90 group-hover:opacity-100 transition-opacity">
                                    <img alt="Book cover Deep Work" class="w-full h-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAH_LOpqgNUlGJ2WZKvw2BbQ6uLfbt4iBBPxyFS6hEBlmR9b6emK2h9E5qCv0G8tr2kN6WKvwM37Sk8-fDz4Tks8b68flMpDbPYbkZGaMnScPE8iYvO4fUBsoMMG-CAOhgmaWZvHADNX0EHshCTXfXbip1AqEa-n9Rmm753_bUMe5W-bdqLprjwD2X5eiC58ZHdwPe8PdaDZO2dmXmnidQJdonsG9Dlq0KoLHulAkZPs8hPQs6p0vDNKL-ibmOwb19UPCxtyG84XNod"/>
                                </div>
                                <div class="flex-grow space-y-1">
                                    <h4 class="text-lg font-bold text-text-main dark:text-white leading-tight">Deep Work</h4>
                                    <p class="text-sm font-medium text-text-secondary">Cal Newport</p>
                                    <p class="text-xs text-text-secondary mt-2">Purchased on Aug 02, 2023</p>
                                </div>
                                <div class="w-full md:w-auto flex items-center justify-between md:flex-col md:items-end gap-2">
                                    <div class="text-right">
                                        <span class="block text-sm font-bold text-text-main dark:text-white">Delivered on Aug 05</span>
                                        <span class="text-xs text-text-secondary">Handed to resident</span>
                                    </div>
                                    <div class="flex flex-col items-end gap-2 mt-2 w-full md:w-auto">
                                        <button class="w-full md:w-auto px-4 py-2 rounded-xl border border-[#eaf3e7] dark:border-[#2a3c25] text-text-main dark:text-white text-sm font-bold hover:border-primary hover:text-primary hover:bg-surface-light dark:hover:bg-surface-dark/50 transition-all flex items-center justify-center gap-2">
                                            <span class="material-symbols-outlined text-[18px]">receipt_long</span>
                                            View Invoice
                                        </button>
                                        <button class="text-xs font-semibold text-text-secondary hover:text-primary transition-colors underline py-1">
                                            Buy Again
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
