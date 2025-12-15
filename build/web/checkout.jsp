<%-- 
    Document   : checkout
    Created on : Dec 15, 2025, 12:08:04 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Checkout Page</title>
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
        <style>::-webkit-scrollbar {
                width: 8px;
            }
            ::-webkit-scrollbar-track {
                background: transparent;
            }
            ::-webkit-scrollbar-thumb {
                background-color: #eaf3e7;
                border-radius: 20px;
            }
            .form-checkbox:checked, .form-radio:checked {
                background-color: #46ec13;
                border-color: #46ec13;
            }
            .form-checkbox, .form-radio {
                color: #46ec13;
            }
        </style>
    </head>
    <body class="bg-background-light dark:bg-background-dark text-text-main font-display antialiased min-h-screen flex flex-col">
        <%@include file="menu.jsp" %>
        <main class="flex-grow flex flex-col bg-background-light dark:bg-background-dark">
            <div class="max-w-[1400px] mx-auto w-full px-6 lg:px-12 py-8">
                <nav class="flex items-center gap-2 text-sm text-text-secondary mb-8">
                    <a class="hover:text-primary transition-colors" href="#">Home</a>
                    <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                    <a class="hover:text-primary transition-colors" href="#">Cart</a>
                    <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                    <span class="font-semibold text-text-main dark:text-white">Checkout</span>
                </nav>
                <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-24">
                    <div class="lg:col-span-7 xl:col-span-8 space-y-12">
                        <div>
                            <h1 class="text-3xl md:text-4xl font-bold tracking-tight text-text-main dark:text-white mb-2">Checkout</h1>
                            <p class="text-text-secondary">Please enter your details below to complete your order.</p>
                        </div>
                        <section aria-labelledby="contact-heading">
                            <div class="flex items-center justify-between mb-6">
                                <h2 class="text-xl font-bold text-text-main dark:text-white flex items-center gap-3" id="contact-heading">
                                    <span class="flex items-center justify-center w-8 h-8 rounded-full bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] text-sm text-primary font-bold">1</span>
                                    Contact Information
                                </h2>
                                <span class="text-sm text-text-secondary">Already have an account? <a class="text-primary hover:underline" href="#">Log in</a></span>
                            </div>
                            <div class="space-y-4">
                                <label class="block">
                                    <span class="text-sm font-medium text-text-main dark:text-gray-300 mb-1 block">Email address</span>
                                    <input class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" placeholder="you@example.com" type="email"/>
                                </label>
                                <label class="flex items-center gap-3">
                                    <input class="rounded border-gray-300 text-primary focus:ring-primary form-checkbox h-5 w-5" type="checkbox"/>
                                    <span class="text-sm text-text-secondary">Email me with news and offers</span>
                                </label>
                            </div>
                        </section>
                        <section aria-labelledby="shipping-heading" class="border-t border-[#eaf3e7] dark:border-[#2a3c25] pt-10">
                            <h2 class="text-xl font-bold text-text-main dark:text-white flex items-center gap-3 mb-6" id="shipping-heading">
                                <span class="flex items-center justify-center w-8 h-8 rounded-full bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] text-sm text-primary font-bold">2</span>
                                Shipping Address
                            </h2>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div class="space-y-1">
                                    <label class="text-sm font-medium text-text-main dark:text-gray-300">Receiver Name</label>
                                    <input class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" type="text"/>
                                </div>
                                <div class="space-y-1">
                                    <label class="text-sm font-medium text-text-main dark:text-gray-300">Phone</label>
                                    <input class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" type="tel"/>
                                </div>
                                <div class="space-y-1 md:col-span-2">
                                    <label class="text-sm font-medium text-text-main dark:text-gray-300">Shipping Address</label>
                                    <input class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" type="text"/>
                                </div>
                                <div class="space-y-1 md:col-span-2">
                                    <label class="text-sm font-medium text-text-main dark:text-gray-300">City</label>
                                    <input class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" type="text"/>
                                </div>
                            </div>
                        </section>
                        <section aria-labelledby="payment-heading" class="border-t border-[#eaf3e7] dark:border-[#2a3c25] pt-10 pb-8">
                            <h2 class="text-xl font-bold text-text-main dark:text-white flex items-center gap-3 mb-6" id="payment-heading">
                                <span class="flex items-center justify-center w-8 h-8 rounded-full bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] text-sm text-primary font-bold">3</span>
                                Payment
                            </h2>
                            <div class="rounded-xl border border-[#eaf3e7] dark:border-[#2a3c25] overflow-hidden">
                                <div class="border-b border-[#eaf3e7] dark:border-[#2a3c25] bg-surface-light/50 dark:bg-surface-dark/50 p-4">
                                    <label class="flex items-center gap-4 cursor-pointer">
                                        <input checked="" class="h-5 w-5 text-primary border-gray-300 focus:ring-primary" name="payment_method" type="radio"/>
                                        <span class="font-medium text-text-main dark:text-white">Credit Card</span>
                                        <div class="ml-auto flex gap-2">
                                            <div class="h-6 w-10 bg-gray-200 rounded flex items-center justify-center text-[8px] text-gray-600">VISA</div>
                                            <div class="h-6 w-10 bg-gray-200 rounded flex items-center justify-center text-[8px] text-gray-600">MC</div>
                                        </div>
                                    </label>
                                </div>
                                <div class="p-6 bg-white dark:bg-background-dark grid grid-cols-2 gap-6">
                                    <div class="col-span-2 space-y-1">
                                        <label class="text-sm font-medium text-text-main dark:text-gray-300">Card number</label>
                                        <div class="relative">
                                            <input class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] pl-10 pr-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" placeholder="0000 0000 0000 0000" type="text"/>
                                            <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-text-secondary">credit_card</span>
                                        </div>
                                    </div>
                                    <div class="col-span-2 space-y-1">
                                        <label class="text-sm font-medium text-text-main dark:text-gray-300">Name on card</label>
                                        <input class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" placeholder="Name" type="text"/>
                                    </div>
                                    <div class="space-y-1">
                                        <label class="text-sm font-medium text-text-main dark:text-gray-300">Expiration (MM/YY)</label>
                                        <input class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" placeholder="MM/YY" type="text"/>
                                    </div>
                                    <div class="space-y-1">
                                        <label class="text-sm font-medium text-text-main dark:text-gray-300">CVC</label>
                                        <div class="relative">
                                            <input class="w-full rounded-xl bg-surface-light dark:bg-surface-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-3 focus:ring-2 focus:ring-primary focus:border-primary outline-none transition-all dark:text-white" placeholder="123" type="text"/>
                                            <span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 text-text-secondary text-[18px]">help</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="border-t border-[#eaf3e7] dark:border-[#2a3c25] bg-surface-light/50 dark:bg-surface-dark/50 p-4">
                                    <label class="flex items-center gap-4 cursor-pointer">
                                        <input class="h-5 w-5 text-primary border-gray-300 focus:ring-primary" name="payment_method" type="radio"/>
                                        <span class="font-medium text-text-main dark:text-white">PayPal</span>
                                        <span class="ml-auto material-symbols-outlined text-text-secondary">account_balance_wallet</span>
                                    </label>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="lg:col-span-5 xl:col-span-4">
                        <div class="sticky top-24 space-y-6">
                            <div class="bg-surface-light dark:bg-surface-dark rounded-3xl p-6 lg:p-8 border border-[#eaf3e7] dark:border-[#2a3c25]">
                                <h3 class="text-xl font-bold text-text-main dark:text-white mb-6">Order Summary</h3>
                                <div class="space-y-6 mb-8 max-h-80 overflow-y-auto pr-2 custom-scrollbar">
                                    <div class="flex gap-4">
                                        <div class="h-20 w-16 flex-shrink-0 overflow-hidden rounded-lg bg-gray-100 border border-[#eaf3e7]">
                                            <img alt="The Psychology of Money" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCpC9PZ4LqON5KXa6Qk4VCkUgy6QPvnS8Hm4Fe230KrqiIBiUkIUURq8KA00fj5PTENLtf2tSdHCzwg3TV1R488PZEiJLr12Uo2flvq0lcXe-nXPL-Sq28wpNsbgbHzZkMCpx6C2VzO74bRbvzv_OsARMAa-wDLO-M5IwZWab0vrzxphjMFoi3j-IRiebH70zWvUr57W46295BB-VC_TmsO6eiWlNfJixwPu1Z4Ur5KwAgnLnjL9iAmD7rP02GlZqQJP9SSWlGPjz4T"/>
                                        </div>
                                        <div class="flex flex-1 flex-col justify-between py-1">
                                            <div>
                                                <h4 class="font-bold text-text-main dark:text-white line-clamp-1">The Psychology of Money</h4>
                                                <p class="text-xs text-text-secondary">Morgan Housel</p>
                                            </div>
                                            <div class="flex justify-between items-center">
                                                <span class="text-sm font-semibold text-text-main dark:text-white">$18.00</span>
                                                <span class="text-xs text-text-secondary">Qty: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="flex gap-4">
                                        <div class="h-20 w-16 flex-shrink-0 overflow-hidden rounded-lg bg-gray-100 border border-[#eaf3e7]">
                                            <img alt="Atomic Habits" class="h-full w-full object-cover" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBBgY7xHFsnFH2vohgXGiAFCeM2NNV_49SK1tU086SqTXLHFxNOqhHLdMVVEFl8j27OeC_pNMtcglUdv-wgqteEnGn8WQ9F1hzaCnw3ydbq9SCCFzlau6rDXflAoEwL6CflSk_iKc_Yb2ARSh1rilQ8pH1rApqerxcTJy01QzAKARJ5h5bJjFUGgy934hiZ6-VisljbmLpnotiPlGQqoHuSN_upzamgm_8HlRmqWferbKbZ5v4mHcCP5pMgdQENPxmlAblts596mNAA"/>
                                        </div>
                                        <div class="flex flex-1 flex-col justify-between py-1">
                                            <div>
                                                <h4 class="font-bold text-text-main dark:text-white line-clamp-1">Atomic Habits</h4>
                                                <p class="text-xs text-text-secondary">James Clear</p>
                                            </div>
                                            <div class="flex justify-between items-center">
                                                <span class="text-sm font-semibold text-text-main dark:text-white">$16.99</span>
                                                <span class="text-xs text-text-secondary">Qty: 1</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="flex gap-2 mb-8">
                                    <input class="flex-1 rounded-xl bg-white dark:bg-background-dark border border-[#eaf3e7] dark:border-[#2a3c25] px-4 py-2 text-sm focus:ring-2 focus:ring-primary focus:border-primary outline-none" placeholder="Discount code" type="text"/>
                                    <button class="bg-[#eaf3e7] dark:bg-[#2a3c25] text-text-main dark:text-white px-4 py-2 rounded-xl text-sm font-semibold hover:bg-gray-200 dark:hover:bg-gray-700 transition-colors">Apply</button>
                                </div>
                                <div class="space-y-3 border-t border-[#eaf3e7] dark:border-[#2a3c25] pt-6">
                                    <div class="flex justify-between text-sm text-text-secondary">
                                        <span>Subtotal</span>
                                        <span class="font-medium text-text-main dark:text-white">$34.99</span>
                                    </div>
                                    <div class="flex justify-between text-sm text-text-secondary">
                                        <span>Shipping</span>
                                        <span class="font-medium text-text-main dark:text-white">$5.00</span>
                                    </div>
                                    <div class="flex justify-between text-sm text-text-secondary">
                                        <span>Tax</span>
                                        <span class="font-medium text-text-main dark:text-white">$2.80</span>
                                    </div>
                                    <div class="flex justify-between items-center pt-4 border-t border-[#eaf3e7] dark:border-[#2a3c25]">
                                        <span class="text-base font-bold text-text-main dark:text-white">Total</span>
                                        <span class="text-2xl font-black text-primary">$42.79</span>
                                    </div>
                                </div>
                                <button class="w-full mt-8 bg-primary hover:bg-[#3cd610] text-text-main font-bold py-4 rounded-xl transition-all shadow-lg shadow-primary/20 flex items-center justify-center gap-2 group">
                                    <span class="material-symbols-outlined group-hover:translate-x-1 transition-transform">lock</span>
                                    Pay $42.79
                                </button>
                                <p class="text-center text-xs text-text-secondary mt-4 flex items-center justify-center gap-1">
                                    <span class="material-symbols-outlined text-[14px]">security</span>
                                    Secure encrypted payment
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body></html>
