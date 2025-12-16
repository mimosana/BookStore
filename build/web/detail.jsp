<%-- 
    Document   : detail
    Created on : Dec 15, 2025, 12:07:38 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en"><head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>The Midnight Library - Book Detail</title>
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
            <main class="flex-1 bg-white">
                <nav aria-label="Breadcrumb" class="mx-auto max-w-7xl px-6 pt-8 lg:px-8">
                    <ol class="flex items-center space-x-2 text-sm text-text-muted">
                        <li>
                            <a class="hover:text-text-main transition-colors" href="#">Home</a>
                        </li>
                        <li><span class="text-gray-300">/</span></li>
                        <li>
                            <a class="hover:text-text-main transition-colors" href="#">Fiction</a>
                        </li>
                        <li><span class="text-gray-300">/</span></li>
                        <li>
                            <span aria-current="page" class="font-medium text-text-main">The Midnight Library</span>
                        </li>
                    </ol>
                </nav>
                <section class="mx-auto max-w-7xl px-6 py-10 lg:px-8 lg:py-16">
                    <div class="lg:grid lg:grid-cols-2 lg:gap-x-16 xl:gap-x-24">
                        <div class="relative mx-auto w-full max-w-md lg:max-w-none">
                            <div class="aspect-[2/3] w-full overflow-hidden rounded-xl bg-gray-50 shadow-sm border border-gray-100">
                                <div class="h-full w-full bg-cover bg-center transition-transform hover:scale-105 duration-700" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDDpb3VjS-DHzCe42mpaonYvLQpzJQ5LJuMeT54tZzpGUeJ8f_lkG4njhcCKSe0SNlsH4qDtpNRU_HqeSTejSZS3RlkkvgXwBvgYkaM8D7UKvzFkcD2fY-48PQJXXUgUjAiASZzkEjsa1XM5w9oMR0Eodhof7twN4OGzsT5gg-Gkkep9QAW5OcLMF0MvQrfx49ZccLMCWuOdsNYZFe4oP1ReuFCJWdmNDHcAc0ZUL0QG32deJOFTtucPsorc3gJRupk_wqWVX-sSysa");'></div>
                            </div>
                            <div class="mt-6 flex gap-4 overflow-x-auto no-scrollbar justify-center lg:justify-start">
                                <button class="h-20 w-16 flex-none rounded-md border-2 border-primary overflow-hidden">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDDpb3VjS-DHzCe42mpaonYvLQpzJQ5LJuMeT54tZzpGUeJ8f_lkG4njhcCKSe0SNlsH4qDtpNRU_HqeSTejSZS3RlkkvgXwBvgYkaM8D7UKvzFkcD2fY-48PQJXXUgUjAiASZzkEjsa1XM5w9oMR0Eodhof7twN4OGzsT5gg-Gkkep9QAW5OcLMF0MvQrfx49ZccLMCWuOdsNYZFe4oP1ReuFCJWdmNDHcAc0ZUL0QG32deJOFTtucPsorc3gJRupk_wqWVX-sSysa");'></div>
                                </button>
                                <button class="h-20 w-16 flex-none rounded-md border border-gray-200 bg-gray-50 overflow-hidden hover:border-gray-400">
                                    <span class="flex h-full w-full items-center justify-center text-xs text-gray-400 font-serif">Back</span>
                                </button>
                                <button class="h-20 w-16 flex-none rounded-md border border-gray-200 bg-gray-50 overflow-hidden hover:border-gray-400">
                                    <span class="flex h-full w-full items-center justify-center text-xs text-gray-400 font-serif">Spine</span>
                                </button>
                            </div>
                        </div>
                        <div class="mt-10 lg:mt-0 flex flex-col h-full">
                            <div class="border-b border-gray-100 pb-8">
                                <div class="mb-4">
                                    <h1 class="font-serif text-4xl font-bold tracking-tight text-text-main sm:text-5xl mb-2">The Midnight Library</h1>
                                    <a class="text-lg text-text-muted hover:text-primary transition-colors underline-offset-4 hover:underline" href="#">Matt Haig</a>
                                </div>
                                <div class="flex items-center gap-4 mb-6">
                                    <div class="flex items-center text-yellow-400">
                                        <span class="material-symbols-outlined text-[20px] fill-current">star</span>
                                        <span class="material-symbols-outlined text-[20px] fill-current">star</span>
                                        <span class="material-symbols-outlined text-[20px] fill-current">star</span>
                                        <span class="material-symbols-outlined text-[20px] fill-current">star</span>
                                        <span class="material-symbols-outlined text-[20px] fill-current text-gray-300">star_half</span>
                                    </div>
                                    <span class="text-sm text-text-muted border-l border-gray-200 pl-4">1,284 Reviews</span>
                                </div>
                                <div class="flex items-end gap-4 mb-8">
                                    <p class="text-3xl font-serif font-bold text-text-main">$13.29</p>
                                    <p class="text-lg text-gray-400 line-through mb-1.5">$26.00</p>
                                    <span class="mb-1.5 rounded bg-green-50 px-2 py-0.5 text-xs font-semibold text-green-700">In Stock</span>
                                </div>
                                <p class="text-base leading-relaxed text-text-muted font-light mb-8">
                                    Between life and death there is a library, and within that library, the shelves go on forever. Every book provides a chance to try another life you could have lived. To see how things would be if you had made other choices... Would you have done anything different, if you had the chance to undo your regrets?
                                </p>
                                <div class="flex flex-col sm:flex-row gap-4">
                                    <button class="flex-1 rounded-full bg-primary px-8 py-4 text-sm font-semibold text-white hover:bg-green-800 transition-all shadow-md active:scale-[0.98]">
                                        Add to Cart
                                    </button>
                                    <button class="flex items-center justify-center rounded-full border border-gray-200 bg-white px-6 py-4 text-text-main hover:bg-gray-50 transition-all group">
                                        <span class="material-symbols-outlined text-[20px] group-hover:fill-current group-hover:text-red-500 transition-colors">favorite</span>
                                    </button>
                                </div>
                            </div>
                            <div class="pt-8">
                                <div class="grid grid-cols-2 gap-y-4 gap-x-8 text-sm">
                                    <div class="flex justify-between border-b border-gray-50 pb-2">
                                        <span class="text-text-muted">Format</span>
                                        <span class="font-medium text-text-main">Hardcover</span>
                                    </div>
                                    <div class="flex justify-between border-b border-gray-50 pb-2">
                                        <span class="text-text-muted">Pages</span>
                                        <span class="font-medium text-text-main">304</span>
                                    </div>
                                    <div class="flex justify-between border-b border-gray-50 pb-2">
                                        <span class="text-text-muted">Publisher</span>
                                        <span class="font-medium text-text-main">Viking</span>
                                    </div>
                                    <div class="flex justify-between border-b border-gray-50 pb-2">
                                        <span class="text-text-muted">Language</span>
                                        <span class="font-medium text-text-main">English</span>
                                    </div>
                                    <div class="flex justify-between border-b border-gray-50 pb-2">
                                        <span class="text-text-muted">ISBN</span>
                                        <span class="font-medium text-text-main">978-0525559474</span>
                                    </div>
                                    <div class="flex justify-between border-b border-gray-50 pb-2">
                                        <span class="text-text-muted">Dimensions</span>
                                        <span class="font-medium text-text-main">6 x 1 x 9 in</span>
                                    </div>
                                </div>
                                <div class="mt-8 flex items-center gap-3 text-sm text-text-muted">
                                    <span class="material-symbols-outlined text-[18px] text-green-600">check_circle</span>
                                    <span>Free shipping on orders over $35</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="border-t border-gray-100 bg-gray-50/50 py-16 lg:py-24">
                    <div class="mx-auto max-w-7xl px-6 lg:px-8">
                        <div class="mx-auto max-w-4xl">
                            <div class="mb-12 flex justify-center border-b border-gray-200">
                                <nav aria-label="Tabs" class="-mb-px flex space-x-8">
                                    <button aria-current="page" class="border-b-2 border-primary py-4 px-1 text-sm font-medium text-primary">
                                        Description
                                    </button>
                                    <button class="border-b-2 border-transparent py-4 px-1 text-sm font-medium text-text-muted hover:border-gray-300 hover:text-text-main transition-all">
                                        Author
                                    </button>
                                    <button class="border-b-2 border-transparent py-4 px-1 text-sm font-medium text-text-muted hover:border-gray-300 hover:text-text-main transition-all">
                                        Reviews (12)
                                    </button>
                                </nav>
                            </div>
                            <div class="space-y-12">
                                <div>
                                    <h3 class="font-serif text-2xl font-bold text-text-main mb-6">About the Book</h3>
                                    <div class="prose prose-gray max-w-none text-text-muted font-light leading-relaxed">
                                        <p class="mb-4">
                                            The Midnight Library is a fantasy novel by Matt Haig, published on 13 August 2020 by Canongate Books. It was a Good Morning America Book Club selection and was shortlisted for the 2021 Women's Prize for Fiction.
                                        </p>
                                        <p class="mb-4">
                                            Nora Seed finds herself in a library between life and death, where every book on the shelves provides a chance to try another life she could have lived. She can undo every decision she regrets, and try to find the perfect life. But things aren't always what she imagined they'd be, and soon her choices place the library and herself in extreme danger. Before time runs out, she must answer the ultimate question: what is the best way to live?
                                        </p>
                                        <p>
                                            A dazzling novel about all the choices that go into a life well lived, from the internationally bestselling author of Reasons to Stay Alive and How To Stop Time.
                                        </p>
                                    </div>
                                </div>
                                <div class="border-t border-gray-200 pt-12">
                                    <div class="flex items-center justify-between mb-8">
                                        <h3 class="font-serif text-2xl font-bold text-text-main">Customer Reviews</h3>
                                        <button class="text-sm font-medium text-primary underline underline-offset-4 decoration-1">Write a Review</button>
                                    </div>
                                    <div class="flex gap-4 py-6 border-b border-gray-100 last:border-0">
                                        <div class="flex-none">
                                            <div class="h-10 w-10 rounded-full bg-green-100 flex items-center justify-center text-green-700 font-bold text-sm">
                                                JD
                                            </div>
                                        </div>
                                        <div class="flex-1">
                                            <div class="flex items-center justify-between mb-2">
                                                <h4 class="text-sm font-bold text-text-main">Jane Doe</h4>
                                                <span class="text-xs text-text-muted">2 days ago</span>
                                            </div>
                                            <div class="flex text-yellow-400 mb-2">
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                            </div>
                                            <p class="text-sm text-text-muted leading-relaxed">
                                                Absolutely loved this book! It really made me think about my own life choices and regrets. Beautifully written and very touching. Highly recommend to anyone feeling a bit lost.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="flex gap-4 py-6 border-b border-gray-100 last:border-0">
                                        <div class="flex-none">
                                            <div class="h-10 w-10 rounded-full bg-green-100 flex items-center justify-center text-green-700 font-bold text-sm">
                                                MS
                                            </div>
                                        </div>
                                        <div class="flex-1">
                                            <div class="flex items-center justify-between mb-2">
                                                <h4 class="text-sm font-bold text-text-main">Michael Smith</h4>
                                                <span class="text-xs text-text-muted">1 week ago</span>
                                            </div>
                                            <div class="flex text-yellow-400 mb-2">
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current">star</span>
                                                <span class="material-symbols-outlined text-[16px] fill-current text-gray-300">star</span>
                                            </div>
                                            <p class="text-sm text-text-muted leading-relaxed">
                                                Good concept but the middle part felt a bit repetitive. Still, a solid read with a great message at the end.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="bg-white py-16 lg:py-24 border-t border-gray-100">
                    <div class="mx-auto max-w-7xl px-6 lg:px-8">
                        <div class="flex items-center justify-between mb-10">
                            <h2 class="font-serif text-3xl font-medium text-text-main">You might also like</h2>
                            <a class="text-sm font-medium text-text-muted hover:text-text-main decoration-1 underline-offset-4 hover:underline" href="#">View all</a>
                        </div>
                        <div class="grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-4">
                            <div class="group relative">
                                <div class="aspect-[2/3] w-full overflow-hidden rounded-md bg-gray-100 mb-4 transition-all group-hover:opacity-90 shadow-sm border border-gray-100">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDmQb1kZ0ybiE3kub5kB4MN7x4Au3-m1rDhzkWTvzc8ZC6HY_zrcOXb7_nraZv1t9iYc6fOMvcJkg7WJSImejjxuNB45klcjS08EIPxrDUeSRo3xZ4ddHsguCvhNQ9tXRSO3y_DUQH4kbOqob8NNj2j7c2JDROv62cGDK8PKamFj1fVFsQAMN1Xrl4ZWXBBLTQKYfy0DPzQKAUmLC0cJQKSYg5hgzTDwOfdrUIWLhJMf0U46tHazWT2rKzjAw5cfGOz7B-_V7-K79ix");'></div>
                                    <button class="absolute right-3 top-3 flex h-8 w-8 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-500 opacity-0 transition-all group-hover:opacity-100 hover:bg-white hover:text-red-500 shadow-sm">
                                        <span class="material-symbols-outlined text-[18px] fill-current">favorite</span>
                                    </button>
                                </div>
                                <div>
                                    <h3 class="text-base font-semibold text-text-main leading-snug">
                                        <a href="#">
                                            <span class="absolute inset-0"></span>
                                            Project Hail Mary
                                        </a>
                                    </h3>
                                    <p class="mt-1 text-sm text-text-muted">Andy Weir</p>
                                    <p class="mt-2 text-sm font-medium text-text-main">$14.99</p>
                                </div>
                            </div>
                            <div class="group relative">
                                <div class="aspect-[2/3] w-full overflow-hidden rounded-md bg-gray-100 mb-4 transition-all group-hover:opacity-90 shadow-sm border border-gray-100">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuA-K1qvGkPrxogOabcu7-lr1H4nszmwcYhShPmEQGePzJk6cinyy_ba-U_E6irZgmB-jb89dn6m5yG5pV8U_5MWZunsMc0ZSxyIuIamgU3YbXBCJsXFiCMmRapuKpvs8XB2cHHLS-IxGx2mtCz34hC-LQOP8BE9JFPbNVTKHczR4Z68GM6bqiXaibfb9iaIB5h3MWL9YtWs_ASOK6p6_j4zqNjIesLTrKJ4OGE86QXfFqdyKbRKF9B8EvPP95u6kOZrfVfUFOPSTc2N");'></div>
                                    <button class="absolute right-3 top-3 flex h-8 w-8 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-500 opacity-0 transition-all group-hover:opacity-100 hover:bg-white hover:text-red-500 shadow-sm">
                                        <span class="material-symbols-outlined text-[18px] fill-current">favorite</span>
                                    </button>
                                </div>
                                <div>
                                    <h3 class="text-base font-semibold text-text-main leading-snug">
                                        <a href="#">
                                            <span class="absolute inset-0"></span>
                                            The Silent Patient
                                        </a>
                                    </h3>
                                    <p class="mt-1 text-sm text-text-muted">Alex Michaelides</p>
                                    <p class="mt-2 text-sm font-medium text-text-main">$12.50</p>
                                </div>
                            </div>
                            <div class="group relative">
                                <div class="aspect-[2/3] w-full overflow-hidden rounded-md bg-gray-100 mb-4 transition-all group-hover:opacity-90 shadow-sm border border-gray-100">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuD4Ajx_LlXu6V6WGf0nTWUkxBCJrOMNNdPzU7EGczjXPRRg7I6zhi03H3QHp7JGhiR6lnaBWfDkZvAk7Fkmy5XD0ixnInaSX5p8x8BAEW8hBMQPpSJRCkbcZFnLFZQ5_U3qq8BogT_CnXNZTKHVRbYOHlGW_bQ3MM-rWmuJloWyeKFLuLuK2MvoOi9Cw73FRuNiKutWXjt40QT7rXWtAlnAErLiHjZlek5seQIC_SzbvCbCSKRrHLVs6aeXOwdLtaastpBsWTtHT_vs");'></div>
                                    <button class="absolute right-3 top-3 flex h-8 w-8 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-500 opacity-0 transition-all group-hover:opacity-100 hover:bg-white hover:text-red-500 shadow-sm">
                                        <span class="material-symbols-outlined text-[18px] fill-current">favorite</span>
                                    </button>
                                </div>
                                <div>
                                    <h3 class="text-base font-semibold text-text-main leading-snug">
                                        <a href="#">
                                            <span class="absolute inset-0"></span>
                                            Atomic Habits
                                        </a>
                                    </h3>
                                    <p class="mt-1 text-sm text-text-muted">James Clear</p>
                                    <p class="mt-2 text-sm font-medium text-text-main">$18.00</p>
                                </div>
                            </div>
                            <div class="group relative">
                                <div class="aspect-[2/3] w-full overflow-hidden rounded-md bg-gray-100 mb-4 transition-all group-hover:opacity-90 shadow-sm border border-gray-100">
                                    <div class="h-full w-full bg-cover bg-center" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAwIkCFIe9mpZIxMRgnTWg6OlRI6uUPXPpDyf45CT2vidCFfhGUMELZ8qm9CQrqT_KaisJ6XHlOVPLZSpWtLHkjg9Hvp90BsnzZJfW3uLCLCGOg0sSOLWLSCWt64e9Ud4p2SwCm3frIuJJPE6_z2wkt_8yg7ncrOMDQwj2E50XExGhSkw22X-XTbeexAvszhLwa06bFdxjCkqNx3vW84IMnIGmCkdS3GMRWxglhqVmBEBVOTClVO3_LWFcDIT_wzO70IYhF1ehTFr_r");'></div>
                                    <button class="absolute right-3 top-3 flex h-8 w-8 items-center justify-center rounded-full bg-white/90 backdrop-blur-sm text-gray-500 opacity-0 transition-all group-hover:opacity-100 hover:bg-white hover:text-red-500 shadow-sm">
                                        <span class="material-symbols-outlined text-[18px] fill-current">favorite</span>
                                    </button>
                                </div>
                                <div>
                                    <h3 class="text-base font-semibold text-text-main leading-snug">
                                        <a href="#">
                                            <span class="absolute inset-0"></span>
                                            Dune
                                        </a>
                                    </h3>
                                    <p class="mt-1 text-sm text-text-muted">Frank Herbert</p>
                                    <p class="mt-2 text-sm font-medium text-text-main">$16.99</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            <%@include file="footer.jsp" %>
        </div>
    </body></html>