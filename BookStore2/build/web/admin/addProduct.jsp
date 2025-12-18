<%-- 
    Document   : addProduct
    Created on : Dec 15, 2025, 3:32:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>BookStore Admin - Add Product</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
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
                        <a class="text-sm font-medium text-primary" href="#">Products</a>
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="#">Orders</a>
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
            <div class="w-full max-w-[960px] flex flex-col gap-6">
                <nav class="flex flex-wrap gap-2 items-center text-sm">
                    <a class="text-gray-500 hover:text-primary dark:text-gray-400" href="#">Dashboard</a>
                    <span class="text-gray-400 material-symbols-outlined text-sm">chevron_right</span>
                    <a class="text-gray-500 hover:text-primary dark:text-gray-400" href="#">Products</a>
                    <span class="text-gray-400 material-symbols-outlined text-sm">chevron_right</span>
                    <span class="text-gray-900 dark:text-white font-medium">Add New Product</span>
                </nav>
                <div class="flex flex-wrap justify-between items-end gap-4 pb-4 border-b border-gray-100 dark:border-gray-800">
                    <div class="flex flex-col gap-2">
                        <h1 class="text-3xl md:text-4xl font-black leading-tight tracking-tight text-gray-900 dark:text-white">Add New Product</h1>
                        <p class="text-gray-500 dark:text-gray-400 text-base">Enter the details below to add a new book to the inventory.</p>
                    </div>
                </div>
                <form class="flex flex-col gap-8 w-full">
                    <section class="flex flex-col gap-6 bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800">
                        <h3 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
                            <span class="material-symbols-outlined text-primary">edit_note</span>
                            General Information
                        </h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <label class="flex flex-col gap-2 md:col-span-2">
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Book Title</span>
                                <input class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary text-gray-900 dark:text-white h-12 px-4 placeholder:text-gray-400 transition-colors" placeholder="e.g. The Great Gatsby" type="text"/>
                            </label>
                            <label class="flex flex-col gap-2">
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Author Name</span>
                                <input class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary text-gray-900 dark:text-white h-12 px-4 placeholder:text-gray-400 transition-colors" placeholder="e.g. F. Scott Fitzgerald" type="text"/>
                            </label>
                            <label class="flex flex-col gap-2">
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Publisher</span>
                                <input class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary text-gray-900 dark:text-white h-12 px-4 placeholder:text-gray-400 transition-colors" placeholder="e.g. Penguin Books" type="text"/>
                            </label>
                        </div>
                        <label class="flex flex-col gap-2">
                            <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Description</span>
                            <textarea class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary text-gray-900 dark:text-white min-h-[140px] p-4 placeholder:text-gray-400 transition-colors resize-y" placeholder="Enter book summary and key details..."></textarea>
                            <span class="text-xs text-gray-400 self-end">0/500 characters</span>
                        </label>
                    </section>
                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                        <section class="lg:col-span-2 flex flex-col gap-6 bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800">
                            <h3 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
                                <span class="material-symbols-outlined text-primary">inventory_2</span>
                                Inventory & Pricing
                            </h3>
                            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                                <label class="flex flex-col gap-2 sm:col-span-2">
                                    <div class="flex items-center justify-between">
                                        <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Category</span>
                                    </div>
                                    <div class="relative">
                                        <select class="w-full rounded-lg bg-background-light dark:bg-gray-800 border border-gray-200 dark:border-gray-700 focus:border-primary focus:ring-1 focus:ring-primary text-gray-900 dark:text-white h-12 px-4 pr-10 appearance-none transition-colors cursor-pointer">
                                            <option disabled="" selected="" value="">Select a category</option>
                                            <option value="fiction">Fiction</option>
                                            <option value="non-fiction">Non-Fiction</option>
                                            <option value="science">Science & Technology</option>
                                            <option value="history">History</option>
                                            <option value="biography">Biography</option>
                                        </select>
                                        <span class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 text-gray-500 pointer-events-none">expand_more</span>
                                    </div>
                                    <details class="group w-full">
                                        <summary class="list-none flex justify-end cursor-pointer outline-none [&::-webkit-details-marker]:hidden">
                                            <span class="text-xs font-bold text-primary hover:text-green-600 dark:hover:text-green-400 transition-colors flex items-center gap-1 select-none py-1">
                                                <span class="material-symbols-outlined text-[16px]">add_circle</span>
                                                Add New Category
                                            </span>
                                        </summary>
                                        <div class="mt-2 p-3 bg-gray-50 dark:bg-gray-800/50 rounded-lg border border-dashed border-gray-300 dark:border-gray-700 flex flex-col sm:flex-row gap-3 items-center">
                                            <div class="relative w-full">
                                                <span class="absolute left-3 top-1/2 -translate-y-1/2 material-symbols-outlined text-gray-400 text-[18px]">category</span>
                                                <input class="w-full rounded-md border border-gray-200 dark:border-gray-600 bg-white dark:bg-gray-900 pl-9 pr-3 py-2 text-sm text-gray-900 dark:text-white focus:border-primary focus:ring-1 focus:ring-primary placeholder:text-gray-400 transition-shadow outline-none" placeholder="Enter new category name" type="text"/>
                                            </div>
                                            <button class="w-full sm:w-auto px-4 py-2 bg-primary text-[#111b0d] text-xs font-bold rounded-md hover:bg-[#3bdb0b] transition-colors shadow-sm whitespace-nowrap flex items-center justify-center gap-1" type="button">
                                                <span class="material-symbols-outlined text-[16px]">check</span>
                                                Save
                                            </button>
                                        </div>
                                    </details>
                                </label>
                            </div>
                        </section>
                        <section class="flex flex-col gap-6 bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 h-full">
                            <h3 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
                                <span class="material-symbols-outlined text-primary">image</span>
                                Book Cover
                            </h3>
                            <div class="flex-1 min-h-[240px] w-full border-2 border-dashed border-gray-300 dark:border-gray-700 rounded-xl bg-background-light dark:bg-gray-800 hover:bg-[#eaf3e7] dark:hover:bg-gray-700 transition-colors cursor-pointer group flex flex-col items-center justify-center p-6 text-center gap-4 relative overflow-hidden">
                                <input accept="image/*" class="absolute inset-0 opacity-0 cursor-pointer z-10" type="file"/>
                                <div class="size-16 rounded-full bg-white dark:bg-gray-600 flex items-center justify-center shadow-sm group-hover:scale-110 transition-transform">
                                    <span class="material-symbols-outlined text-3xl text-primary">cloud_upload</span>
                                </div>
                                <div class="flex flex-col gap-1 z-0">
                                    <p class="text-sm font-semibold text-gray-900 dark:text-white">Click to upload</p>
                                    <p class="text-xs text-gray-500 dark:text-gray-400">or drag and drop</p>
                                </div>
                                <p class="text-[10px] text-gray-400 mt-2">SVG, PNG, JPG or GIF (max. 800x1200px)</p>
                            </div>
                        </section>
                    </div>
                    <section class="flex flex-col gap-6 bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800">
                        <div class="flex flex-wrap items-center justify-between gap-4">
                            <h3 class="text-lg font-bold text-gray-900 dark:text-white flex items-center gap-2">
                                <span class="material-symbols-outlined text-primary">layers</span>
                                Product Variants
                            </h3>
                            <button id="add-variant-button" class="flex items-center gap-2 px-4 py-2 bg-primary/10 hover:bg-primary/20 text-primary rounded-lg text-sm font-bold transition-colors" type="button">
                                <span class="material-symbols-outlined text-[18px]">add_circle</span>
                                Add Variant
                            </button>
                        </div>
                        <div id="product-variants-container" class="flex flex-col gap-3">
                            
                            <div class="flex flex-col md:flex-row gap-4 items-start md:items-end p-4 rounded-xl border border-gray-200 dark:border-gray-700 bg-background-light dark:bg-gray-800/30">
                                <label class="flex-1 w-full flex flex-col gap-2">
                                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Variant Value</span>
                                    <select class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm px-3 text-gray-900 dark:text-white transition-colors">
                                        <option>Paperback</option>
                                        <option>Hardcover</option>
                                        <option>Ebook</option>
                                        <option>Audiobook</option>
                                    </select>
                                </label>
                                <label class="w-full md:w-32 flex flex-col gap-2">
                                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Price</span>
                                    <div class="relative">
                                        <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-xs">$</span>
                                        <input class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm pl-6 pr-3 text-gray-900 dark:text-white transition-colors" placeholder="0.00" type="number" value="12.99"/>
                                    </div>
                                </label>
                                <label class="w-full md:w-32 flex flex-col gap-2">
                                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Stock</span>
                                    <input class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm px-3 text-gray-900 dark:text-white transition-colors" placeholder="0" type="number" value="150"/>
                                </label>
                                <div class="w-full md:w-auto flex justify-end">
                                    <button class="h-10 w-10 flex items-center justify-center rounded-lg text-gray-400 hover:text-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 transition-all remove-variant-button" title="Remove Variant" type="button">
                                        <span class="material-symbols-outlined text-[20px]">delete</span>
                                    </button>
                                </div>
                            </div>
                            
                            <div class="flex flex-col md:flex-row gap-4 items-start md:items-end p-4 rounded-xl border border-gray-200 dark:border-gray-700 bg-background-light dark:bg-gray-800/30">
                                <label class="flex-1 w-full flex flex-col gap-2">
                                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Variant Value</span>
                                    <select class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm px-3 text-gray-900 dark:text-white transition-colors">
                                        <option>Paperback</option>
                                        <option selected="">Hardcover</option>
                                        <option>Ebook</option>
                                        <option>Audiobook</option>
                                    </select>
                                </label>
                                <label class="w-full md:w-32 flex flex-col gap-2">
                                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Price</span>
                                    <div class="relative">
                                        <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-xs">$</span>
                                        <input class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm pl-6 pr-3 text-gray-900 dark:text-white transition-colors" placeholder="0.00" type="number" value="24.99"/>
                                    </div>
                                </label>
                                <label class="w-full md:w-32 flex flex-col gap-2">
                                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Stock</span>
                                    <input class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm px-3 text-gray-900 dark:text-white transition-colors" placeholder="0" type="number" value="45"/>
                                </label>
                                <div class="w-full md:w-auto flex justify-end">
                                    <button class="h-10 w-10 flex items-center justify-center rounded-lg text-gray-400 hover:text-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 transition-all remove-variant-button" title="Remove Variant" type="button">
                                        <span class="material-symbols-outlined text-[20px]">delete</span>
                                    </button>
                                </div>
                            </div>
                            
                            <div class="flex flex-col md:flex-row gap-4 items-start md:items-end p-4 rounded-xl border border-gray-200 dark:border-gray-700 bg-background-light dark:bg-gray-800/30">
                                <label class="flex-1 w-full flex flex-col gap-2">
                                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Variant Value</span>
                                    <select class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm px-3 text-gray-900 dark:text-white transition-colors">
                                        <option disabled="" selected="">Select Variant Type</option>
                                        <option>Paperback</option>
                                        <option>Hardcover</option>
                                        <option>Ebook</option>
                                        <option>Audiobook</option>
                                    </select>
                                </label>
                                <label class="w-full md:w-32 flex flex-col gap-2">
                                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Price</span>
                                    <div class="relative">
                                        <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-xs">$</span>
                                        <input class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm pl-6 pr-3 text-gray-900 dark:text-white transition-colors" placeholder="0.00" type="number"/>
                                    </div>
                                </label>
                                <label class="w-full md:w-32 flex flex-col gap-2">
                                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Stock</span>
                                    <input class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm px-3 text-gray-900 dark:text-white transition-colors" placeholder="0" type="number"/>
                                </label>
                                <div class="w-full md:w-auto flex justify-end">
                                    <button class="h-10 w-10 flex items-center justify-center rounded-lg text-gray-400 hover:text-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 transition-all remove-variant-button" title="Remove Variant" type="button">
                                        <span class="material-symbols-outlined text-[20px]">delete</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="flex items-center justify-end gap-4 pt-4 border-t border-gray-100 dark:border-gray-800">
                        <button class="h-12 px-6 rounded-lg border border-gray-300 dark:border-gray-600 text-gray-700 dark:text-gray-300 font-bold hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors" type="button">
                            Cancel
                        </button>
                        <button class="h-12 px-8 rounded-lg bg-primary hover:bg-[#3bdb0b] text-[#111b0d] font-bold shadow-lg shadow-primary/20 transition-all transform hover:-translate-y-0.5 active:translate-y-0 flex items-center gap-2" type="submit">
                            <span class="material-symbols-outlined text-[20px]">save</span>
                            Save Product
                        </button>
                    </div>
                </form>
            </div>
        </main>
        
        <template id="variant-row-template">
            <div class="flex flex-col md:flex-row gap-4 items-start md:items-end p-4 rounded-xl border border-gray-200 dark:border-gray-700 bg-background-light dark:bg-gray-800/30">
                <label class="flex-1 w-full flex flex-col gap-2">
                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Variant Value</span>
                    <select name="variantValue" class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm px-3 text-gray-900 dark:text-white transition-colors">
                        <option disabled="" selected="">Select Variant Type</option>
                        <option value="paperback">Paperback</option>
                        <option value="hardcover">Hardcover</option>
                        <option value="ebook">Ebook</option>
                        <option value="audiobook">Audiobook</option>
                    </select>
                </label>
                <label class="w-full md:w-32 flex flex-col gap-2">
                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Price</span>
                    <div class="relative">
                        <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 text-xs">$</span>
                        <input name="variantPrice" class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm pl-6 pr-3 text-gray-900 dark:text-white transition-colors" placeholder="0.00" type="number" step="0.01" min="0"/>
                    </div>
                </label>
                <label class="w-full md:w-32 flex flex-col gap-2">
                    <span class="text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Stock</span>
                    <input name="variantStock" class="w-full h-10 rounded-lg bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-600 focus:border-primary focus:ring-1 focus:ring-primary text-sm px-3 text-gray-900 dark:text-white transition-colors" placeholder="0" type="number" min="0"/>
                </label>
                <div class="w-full md:w-auto flex justify-end">
                    <button class="h-10 w-10 flex items-center justify-center rounded-lg text-gray-400 hover:text-red-500 hover:bg-red-50 dark:hover:bg-red-900/20 transition-all remove-variant-button" title="Remove Variant" type="button">
                        <span class="material-symbols-outlined text-[20px]">delete</span>
                    </button>
                </div>
            </div>
        </template>
        
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const addVariantButton = document.getElementById('add-variant-button');
                const variantsContainer = document.getElementById('product-variants-container');
                const variantTemplate = document.getElementById('variant-row-template');

                // Function to add a new variant row
                const addVariantRow = () => {
                    // Clone the content of the template
                    const newVariantRow = variantTemplate.content.cloneNode(true);
                    const newRowDiv = newVariantRow.querySelector('div');

                    // 1. Append the new row to the container
                    variantsContainer.appendChild(newVariantRow);
                    
                    // 2. Add event listener to the new row's remove button
                    const removeButton = newRowDiv.querySelector('.remove-variant-button');
                    removeButton.addEventListener('click', removeVariantRow);
                    
                    // Optional: Scroll to the new element
                    newRowDiv.scrollIntoView({ behavior: 'smooth', block: 'end' });
                };

                // Function to remove a variant row
                const removeVariantRow = (event) => {
                    // The button is inside the variant row div. We need to find the parent div to remove it.
                    const rowToRemove = event.currentTarget.closest('.flex.flex-col.md\\:flex-row');
                    if (rowToRemove) {
                        rowToRemove.remove();
                    }
                };

                // Event listener for the "Add Variant" button
                if (addVariantButton) {
                    addVariantButton.addEventListener('click', addVariantRow);
                }

                // Attach event listener to existing "Remove Variant" buttons on initial load
                variantsContainer.querySelectorAll('.remove-variant-button').forEach(button => {
                    button.addEventListener('click', removeVariantRow);
                });
            });
        </script>
    </body>
</html>