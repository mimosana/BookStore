<%-- 
    Document   : home
    Created on : Dec 14, 2025, 11:57:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Bookstore Homepage</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&amp;family=Playfair+Display:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
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
    <body class="bg-background font-sans text-text-main antialiased selection:bg-green-100">
        <div class="flex min-h-screen w-full flex-col">
            <%@include file="menu.jsp" %>
            <main class="flex-1">
                <section class="mx-auto max-w-7xl px-6 py-12 lg:px-8 lg:py-24">
                    <div class="grid gap-12 lg:grid-cols-2 lg:items-center">
                        <div class="max-w-xl">
                            <h1 class="font-serif text-5xl font-medium tracking-tight text-text-main sm:text-6xl mb-6 leading-tight">
                                Stories that stay <br/> with you.
                            </h1>
                            <p class="text-lg leading-relaxed text-text-muted mb-8 max-w-md font-light">
                                Discover our curated collection of timeless classics and modern masterpieces designed to inspire.
                            </p>
                            <div class="flex items-center gap-4">
                                <button class="rounded-full bg-primary px-8 py-3.5 text-sm font-medium text-white shadow-sm hover:bg-primary-dark transition-all focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary">
                                    Shop Collection
                                </button>
                                <button class="text-sm font-medium leading-6 text-text-main hover:text-primary flex items-center gap-2 group px-4 py-3 transition-colors">
                                    Read the Blog <span class="material-symbols-outlined text-[16px] transition-transform group-hover:translate-x-1">arrow_forward</span>
                                </button>
                            </div>
                        </div>
                        <div class="relative lg:ml-auto w-full max-w-md lg:max-w-full">
                            <div class="aspect-[16/9] w-full overflow-hidden rounded-2xl bg-gray-50 lg:aspect-[3/2] shadow-sm">
                                <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuD8XLRqPa8m1Spb_Sp8KM5gcrbDk0WzQQq_Ki4TJrgs4hfEBsfvDz2vm6pnrw5g23shobtNUnP1Fm08_VFIMSycPirhWxP4P8vKkDhXRA65yz14wVbWcfQN927jGBV29k7mdpGsP2H5MgT3N60zdSODERpse4cRNspcRRoij-X3uPTbxVmGEUnzXbf9jlZDEHznVU-96UOrIpSOpeJ9qHh-_xJiopS77MVSo1VWbAz5xnXMggZJHufbgBKWYEvwVVJ7nZ0b-Ju8HUbW");'></div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="border-y border-gray-100 bg-white">
                    <div class="mx-auto max-w-7xl px-6 py-12 lg:px-8">
                        <div class="flex items-center justify-between mb-8">
                            <h2 class="font-serif text-2xl font-medium text-text-main">Explore Categories</h2>
                            <a class="text-sm font-medium text-primary hover:text-primary-dark flex items-center gap-1 transition-colors" href="#">
                                View all categories
                                <span class="material-symbols-outlined text-[16px]">chevron_right</span>
                            </a>
                        </div>
                        <div class="relative">
                            <div class="flex gap-4 overflow-x-auto no-scrollbar pb-4">
                                <button class="flex-none rounded-lg border border-primary bg-green-50 px-6 py-3 text-sm font-medium text-primary hover:bg-green-100 transition-all min-w-[120px] text-center">
                                    All Books
                                </button>
                                <button class="flex-none rounded-lg border border-gray-200 bg-white px-6 py-3 text-sm font-medium text-text-muted hover:text-primary hover:border-primary hover:bg-white transition-all min-w-[120px] text-center">
                                    Fiction
                                </button>
                                <button class="flex-none rounded-lg border border-gray-200 bg-white px-6 py-3 text-sm font-medium text-text-muted hover:text-primary hover:border-primary hover:bg-white transition-all min-w-[120px] text-center">
                                    Non-Fiction
                                </button>
                                <button class="flex-none rounded-lg border border-gray-200 bg-white px-6 py-3 text-sm font-medium text-text-muted hover:text-primary hover:border-primary hover:bg-white transition-all min-w-[120px] text-center">
                                    Sci-Fi
                                </button>
                                <button class="flex-none rounded-lg border border-gray-200 bg-white px-6 py-3 text-sm font-medium text-text-muted hover:text-primary hover:border-primary hover:bg-white transition-all min-w-[120px] text-center">
                                    Biographies
                                </button>
                                <button class="flex-none rounded-lg border border-gray-200 bg-white px-6 py-3 text-sm font-medium text-text-muted hover:text-primary hover:border-primary hover:bg-white transition-all min-w-[120px] text-center">
                                    Thriller
                                </button>
                                <button class="flex-none rounded-lg border border-gray-200 bg-white px-6 py-3 text-sm font-medium text-text-muted hover:text-primary hover:border-primary hover:bg-white transition-all min-w-[120px] text-center">
                                    Young Adult
                                </button>
                                <button class="flex-none rounded-lg border border-gray-200 bg-white px-6 py-3 text-sm font-medium text-text-muted hover:text-primary hover:border-primary hover:bg-white transition-all min-w-[120px] text-center">
                                    History
                                </button>
                                <button class="flex-none rounded-lg border border-gray-200 bg-white px-6 py-3 text-sm font-medium text-text-muted hover:text-primary hover:border-primary hover:bg-white transition-all min-w-[120px] text-center">
                                    Design
                                </button>
                                <button class="flex-none rounded-lg border border-gray-200 bg-white px-6 py-3 text-sm font-medium text-text-muted hover:text-primary hover:border-primary hover:bg-white transition-all min-w-[120px] text-center">
                                    Romance
                                </button>
                            </div>
                            <div class="pointer-events-none absolute inset-y-0 right-0 w-24 bg-gradient-to-l from-white to-transparent"></div>
                        </div>
                    </div>
                </section>
                <section class="mx-auto max-w-7xl px-6 py-16 lg:px-8">
                    <div class="flex items-center justify-between mb-10">
                        <h2 class="font-serif text-3xl font-medium text-text-main">Trending Now</h2>
                        <a class="text-sm font-medium text-text-muted hover:text-primary decoration-1 underline-offset-4 hover:underline transition-colors" href="#">View all</a>
                    </div>
                    <div class="grid grid-cols-1 gap-x-6 gap-y-12 sm:grid-cols-2 lg:grid-cols-4">
                        <div class="group relative">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-lg bg-gray-100 mb-5 shadow-sm transition-all group-hover:shadow-md">
                                <div class="h-full w-full bg-cover bg-center transition-transform duration-500 group-hover:scale-105" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDmQb1kZ0ybiE3kub5kB4MN7x4Au3-m1rDhzkWTvzc8ZC6HY_zrcOXb7_nraZv1t9iYc6fOMvcJkg7WJSImejjxuNB45klcjS08EIPxrDUeSRo3xZ4ddHsguCvhNQ9tXRSO3y_DUQH4kbOqob8NNj2j7c2JDROv62cGDK8PKamFj1fVFsQAMN1Xrl4ZWXBBLTQKYfy0DPzQKAUmLC0cJQKSYg5hgzTDwOfdrUIWLhJMf0U46tHazWT2rKzjAw5cfGOz7B-_V7-K79ix");'></div>
                                <button class="absolute right-3 top-3 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-400 opacity-0 transition-all group-hover:opacity-100 hover:text-red-500 shadow-sm">
                                    <span class="material-symbols-outlined text-[20px] fill-current">favorite</span>
                                </button>
                            </div>
                            <div>
                                <h3 class="text-base font-semibold text-text-main leading-snug group-hover:text-primary transition-colors">
                                    <a href="#">
                                        <span class="absolute inset-0"></span>
                                        Project Hail Mary
                                    </a>
                                </h3>
                                <p class="mt-1 text-sm text-text-muted">Andy Weir</p>
                                <p class="mt-2 text-sm font-medium text-primary">$14.99</p>
                            </div>
                        </div>
                        <div class="group relative">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-lg bg-gray-100 mb-5 shadow-sm transition-all group-hover:shadow-md">
                                <div class="h-full w-full bg-cover bg-center transition-transform duration-500 group-hover:scale-105" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuA-K1qvGkPrxogOabcu7-lr1H4nszmwcYhShPmEQGePzJk6cinyy_ba-U_E6irZgmB-jb89dn6m5yG5pV8U_5MWZunsMc0ZSxyIuIamgU3YbXBCJsXFiCMmRapuKpvs8XB2cHHLS-IxGx2mtCz34hC-LQOP8BE9JFPbNVTKHczR4Z68GM6bqiXaibfb9iaIB5h3MWL9YtWs_ASOK6p6_j4zqNjIesLTrKJ4OGE86QXfFqdyKbRKF9B8EvPP95u6kOZrfVfUFOPSTc2N");'></div>
                                <button class="absolute right-3 top-3 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-400 opacity-0 transition-all group-hover:opacity-100 hover:text-red-500 shadow-sm">
                                    <span class="material-symbols-outlined text-[20px] fill-current">favorite</span>
                                </button>
                            </div>
                            <div>
                                <h3 class="text-base font-semibold text-text-main leading-snug group-hover:text-primary transition-colors">
                                    <a href="#">
                                        <span class="absolute inset-0"></span>
                                        The Silent Patient
                                    </a>
                                </h3>
                                <p class="mt-1 text-sm text-text-muted">Alex Michaelides</p>
                                <p class="mt-2 text-sm font-medium text-primary">$12.50</p>
                            </div>
                        </div>
                        <div class="group relative">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-lg bg-gray-100 mb-5 shadow-sm transition-all group-hover:shadow-md">
                                <div class="h-full w-full bg-cover bg-center transition-transform duration-500 group-hover:scale-105" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuD4Ajx_LlXu6V6WGf0nTWUkxBCJrOMNNdPzU7EGczjXPRRg7I6zhi03H3QHp7JGhiR6lnaBWfDkZvAk7Fkmy5XD0ixnInaSX5p8x8BAEW8hBMQPpSJRCkbcZFnLFZQ5_U3qq8BogT_CnXNZTKHVRbYOHlGW_bQ3MM-rWmuJloWyeKFLuLuK2MvoOi9Cw73FRuNiKutWXjt40QT7rXWtAlnAErLiHjZlek5seQIC_SzbvCbCSKRrHLVs6aeXOwdLtaastpBsWTtHT_vs");'></div>
                                <button class="absolute right-3 top-3 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-400 opacity-0 transition-all group-hover:opacity-100 hover:text-red-500 shadow-sm">
                                    <span class="material-symbols-outlined text-[20px] fill-current">favorite</span>
                                </button>
                                <div class="absolute left-3 top-3 rounded-md bg-white/95 px-2.5 py-1 text-[10px] font-bold uppercase tracking-wider text-primary shadow-sm">New</div>
                            </div>
                            <div>
                                <h3 class="text-base font-semibold text-text-main leading-snug group-hover:text-primary transition-colors">
                                    <a href="#">
                                        <span class="absolute inset-0"></span>
                                        Atomic Habits
                                    </a>
                                </h3>
                                <p class="mt-1 text-sm text-text-muted">James Clear</p>
                                <p class="mt-2 text-sm font-medium text-primary">$18.00</p>
                            </div>
                        </div>
                        <div class="group relative">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-lg bg-gray-100 mb-5 shadow-sm transition-all group-hover:shadow-md">
                                <div class="h-full w-full bg-cover bg-center transition-transform duration-500 group-hover:scale-105" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAwIkCFIe9mpZIxMRgnTWg6OlRI6uUPXPpDyf45CT2vidCFfhGUMELZ8qm9CQrqT_KaisJ6XHlOVPLZSpWtLHkjg9Hvp90BsnzZJfW3uLCLCGOg0sSOLWLSCWt64e9Ud4p2SwCm3frIuJJPE6_z2wkt_8yg7ncrOMDQwj2E50XExGhSkw22X-XTbeexAvszhLwa06bFdxjCkqNx3vW84IMnIGmCkdS3GMRWxglhqVmBEBVOTClVO3_LWFcDIT_wzO70IYhF1ehTFr_r");'></div>
                                <button class="absolute right-3 top-3 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-400 opacity-0 transition-all group-hover:opacity-100 hover:text-red-500 shadow-sm">
                                    <span class="material-symbols-outlined text-[20px] fill-current">favorite</span>
                                </button>
                            </div>
                            <div>
                                <h3 class="text-base font-semibold text-text-main leading-snug group-hover:text-primary transition-colors">
                                    <a href="#">
                                        <span class="absolute inset-0"></span>
                                        Dune
                                    </a>
                                </h3>
                                <p class="mt-1 text-sm text-text-muted">Frank Herbert</p>
                                <p class="mt-2 text-sm font-medium text-primary">$16.99</p>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="mx-auto max-w-7xl px-6 pb-20 lg:px-8">
                    <div class="flex items-center justify-between mb-10">
                        <h2 class="font-serif text-3xl font-medium text-text-main">Bestsellers</h2>
                        <a class="text-sm font-medium text-text-muted hover:text-primary decoration-1 underline-offset-4 hover:underline transition-colors" href="#">View all</a>
                    </div>
                    <div class="grid grid-cols-1 gap-x-6 gap-y-12 sm:grid-cols-2 lg:grid-cols-4">
                        <div class="group relative">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-lg bg-gray-100 mb-5 shadow-sm transition-all group-hover:shadow-md">
                                <div class="h-full w-full bg-cover bg-center transition-transform duration-500 group-hover:scale-105" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDDpb3VjS-DHzCe42mpaonYvLQpzJQ5LJuMeT54tZzpGUeJ8f_lkG4njhcCKSe0SNlsH4qDtpNRU_HqeSTejSZS3RlkkvgXwBvgYkaM8D7UKvzFkcD2fY-48PQJXXUgUjAiASZzkEjsa1XM5w9oMR0Eodhof7twN4OGzsT5gg-Gkkep9QAW5OcLMF0MvQrfx49ZccLMCWuOdsNYZFe4oP1ReuFCJWdmNDHcAc0ZUL0QG32deJOFTtucPsorc3gJRupk_wqWVX-sSysa");'></div>
                                <button class="absolute right-3 top-3 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-400 opacity-0 transition-all group-hover:opacity-100 hover:text-red-500 shadow-sm">
                                    <span class="material-symbols-outlined text-[20px] fill-current">favorite</span>
                                </button>
                                <div class="absolute left-3 top-3 flex h-7 w-7 items-center justify-center rounded-full bg-primary text-[11px] font-bold text-white shadow-sm ring-2 ring-white">1</div>
                            </div>
                            <div>
                                <h3 class="text-base font-semibold text-text-main leading-snug group-hover:text-primary transition-colors">
                                    <a href="#">
                                        <span class="absolute inset-0"></span>
                                        The Midnight Library
                                    </a>
                                </h3>
                                <p class="mt-1 text-sm text-text-muted">Matt Haig</p>
                                <p class="mt-2 text-sm font-medium text-primary">$13.29</p>
                            </div>
                        </div>
                        <div class="group relative">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-lg bg-gray-100 mb-5 shadow-sm transition-all group-hover:shadow-md">
                                <div class="h-full w-full bg-cover bg-center transition-transform duration-500 group-hover:scale-105" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuD4Ajx_LlXu6V6WGf0nTWUkxBCJrOMNNdPzU7EGczjXPRRg7I6zhi03H3QHp7JGhiR6lnaBWfDkZvAk7Fkmy5XD0ixnInaSX5p8x8BAEW8hBMQPpSJRCkbcZFnLFZQ5_U3qq8BogT_CnXNZTKHVRbYOHlGW_bQ3MM-rWmuJloWyeKFLuLuK2MvoOi9Cw73FRuNiKutWXjt40QT7rXWtAlnAErLiHjZlek5seQIC_SzbvCbCSKRrHLVs6aeXOwdLtaastpBsWTtHT_vs");'></div>
                                <button class="absolute right-3 top-3 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-400 opacity-0 transition-all group-hover:opacity-100 hover:text-red-500 shadow-sm">
                                    <span class="material-symbols-outlined text-[20px] fill-current">favorite</span>
                                </button>
                                <div class="absolute left-3 top-3 flex h-7 w-7 items-center justify-center rounded-full bg-white text-[11px] font-bold text-primary shadow-sm ring-1 ring-gray-100">2</div>
                            </div>
                            <div>
                                <h3 class="text-base font-semibold text-text-main leading-snug group-hover:text-primary transition-colors">
                                    <a href="#">
                                        <span class="absolute inset-0"></span>
                                        Atomic Habits
                                    </a>
                                </h3>
                                <p class="mt-1 text-sm text-text-muted">James Clear</p>
                                <p class="mt-2 text-sm font-medium text-primary">$18.00</p>
                            </div>
                        </div>
                        <div class="group relative">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-lg bg-gray-100 mb-5 shadow-sm transition-all group-hover:shadow-md">
                                <div class="h-full w-full bg-cover bg-center transition-transform duration-500 group-hover:scale-105" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuA-K1qvGkPrxogOabcu7-lr1H4nszmwcYhShPmEQGePzJk6cinyy_ba-U_E6irZgmB-jb89dn6m5yG5pV8U_5MWZunsMc0ZSxyIuIamgU3YbXBCJsXFiCMmRapuKpvs8XB2cHHLS-IxGx2mtCz34hC-LQOP8BE9JFPbNVTKHczR4Z68GM6bqiXaibfb9iaIB5h3MWL9YtWs_ASOK6p6_j4zqNjIesLTrKJ4OGE86QXfFqdyKbRKF9B8EvPP95u6kOZrfVfUFOPSTc2N");'></div>
                                <button class="absolute right-3 top-3 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-400 opacity-0 transition-all group-hover:opacity-100 hover:text-red-500 shadow-sm">
                                    <span class="material-symbols-outlined text-[20px] fill-current">favorite</span>
                                </button>
                                <div class="absolute left-3 top-3 flex h-7 w-7 items-center justify-center rounded-full bg-white text-[11px] font-bold text-primary shadow-sm ring-1 ring-gray-100">3</div>
                            </div>
                            <div>
                                <h3 class="text-base font-semibold text-text-main leading-snug group-hover:text-primary transition-colors">
                                    <a href="#">
                                        <span class="absolute inset-0"></span>
                                        The Silent Patient
                                    </a>
                                </h3>
                                <p class="mt-1 text-sm text-text-muted">Alex Michaelides</p>
                                <p class="mt-2 text-sm font-medium text-primary">$12.50</p>
                            </div>
                        </div>
                        <div class="group relative">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-lg bg-gray-100 mb-5 shadow-sm transition-all group-hover:shadow-md">
                                <div class="h-full w-full bg-cover bg-center transition-transform duration-500 group-hover:scale-105" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAwIkCFIe9mpZIxMRgnTWg6OlRI6uUPXPpDyf45CT2vidCFfhGUMELZ8qm9CQrqT_KaisJ6XHlOVPLZSpWtLHkjg9Hvp90BsnzZJfW3uLCLCGOg0sSOLWLSCWt64e9Ud4p2SwCm3frIuJJPE6_z2wkt_8yg7ncrOMDQwj2E50XExGhSkw22X-XTbeexAvszhLwa06bFdxjCkqNx3vW84IMnIGmCkdS3GMRWxglhqVmBEBVOTClVO3_LWFcDIT_wzO70IYhF1ehTFr_r");'></div>
                                <button class="absolute right-3 top-3 flex h-9 w-9 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-400 opacity-0 transition-all group-hover:opacity-100 hover:text-red-500 shadow-sm">
                                    <span class="material-symbols-outlined text-[20px] fill-current">favorite</span>
                                </button>
                                <div class="absolute left-3 top-3 flex h-7 w-7 items-center justify-center rounded-full bg-white text-[11px] font-bold text-primary shadow-sm ring-1 ring-gray-100">4</div>
                            </div>
                            <div>
                                <h3 class="text-base font-semibold text-text-main leading-snug group-hover:text-primary transition-colors">
                                    <a href="#">
                                        <span class="absolute inset-0"></span>
                                        Dune
                                    </a>
                                </h3>
                                <p class="mt-1 text-sm text-text-muted">Frank Herbert</p>
                                <p class="mt-2 text-sm font-medium text-primary">$16.99</p>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="bg-gray-50 py-16 lg:py-24 border-y border-gray-100">
                    <div class="mx-auto max-w-7xl px-6 lg:px-8">
                        <div class="mx-auto flex max-w-5xl flex-col gap-12 lg:flex-row lg:items-center lg:gap-20">
                            <div class="w-full lg:w-1/3 order-2 lg:order-1">
                                <div class="relative aspect-[2/3] w-full rounded-lg shadow-xl overflow-hidden ring-1 ring-black/5">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDDpb3VjS-DHzCe42mpaonYvLQpzJQ5LJuMeT54tZzpGUeJ8f_lkG4njhcCKSe0SNlsH4qDtpNRU_HqeSTejSZS3RlkkvgXwBvgYkaM8D7UKvzFkcD2fY-48PQJXXUgUjAiASZzkEjsa1XM5w9oMR0Eodhof7twN4OGzsT5gg-Gkkep9QAW5OcLMF0MvQrfx49ZccLMCWuOdsNYZFe4oP1ReuFCJWdmNDHcAc0ZUL0QG32deJOFTtucPsorc3gJRupk_wqWVX-sSysa");'></div>
                                </div>
                            </div>
                            <div class="w-full lg:w-2/3 order-1 lg:order-2">
                                <div class="inline-block mb-6">
                                    <span class="text-xs font-bold tracking-widest text-primary uppercase border-b-2 border-primary pb-1">Book of the Month</span>
                                </div>
                                <h2 class="font-serif text-3xl font-bold tracking-tight text-text-main sm:text-4xl mb-3">The Midnight Library</h2>
                                <p class="text-lg font-medium text-text-muted mb-6">Matt Haig</p>
                                <p class="text-lg leading-relaxed text-text-muted mb-8 font-light">
                                    "Between life and death there is a library, and within that library, the shelves go on forever. Every book provides a chance to try another life you could have lived."
                                </p>
                                <div class="flex items-center gap-8">
                                    <button class="rounded-full bg-primary px-8 py-3.5 text-sm font-medium text-white shadow-md hover:bg-primary-dark hover:shadow-lg transition-all">
                                        View Details
                                    </button>
                                    <span class="text-xl font-bold text-text-main">$13.29</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="mx-auto max-w-7xl px-6 py-24 lg:px-8">
                    <div class="rounded-2xl bg-white p-8 sm:p-16 text-center border border-gray-100 shadow-sm relative overflow-hidden">
                        <div class="absolute -top-24 -right-24 h-64 w-64 rounded-full bg-green-50 opacity-50 blur-3xl"></div>
                        <div class="absolute -bottom-24 -left-24 h-64 w-64 rounded-full bg-green-50 opacity-50 blur-3xl"></div>
                        <div class="relative z-10">
                            <h2 class="font-serif text-3xl font-medium tracking-tight text-text-main sm:text-4xl">Join our community</h2>
                            <p class="mx-auto mt-4 max-w-xl text-text-muted font-light text-lg">
                                Get weekly book recommendations and exclusive offers delivered to your inbox.
                            </p>
                            <div class="mx-auto mt-10 flex max-w-md flex-col gap-3 sm:flex-row">
                                <input class="w-full flex-1 rounded-full border-gray-200 bg-gray-50 px-5 py-3.5 text-sm placeholder:text-gray-400 focus:border-primary focus:ring-1 focus:ring-primary outline-none transition-all" placeholder="Enter your email" type="email"/>
                                <button class="rounded-full bg-primary px-8 py-3.5 text-sm font-medium text-white shadow-sm hover:bg-primary-dark transition-all whitespace-nowrap">
                                    Subscribe
                                </button>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            <%@include file="footer.jsp" %>
        </div>
    </body></html>