<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="light">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Dashboard</title>

    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>

    <script>
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
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background-color: #eaf3e7; border-radius: 20px; }
    </style>
</head>
<body class="bg-background-light dark:bg-background-dark min-h-screen flex flex-col font-display text-gray-900 dark:text-gray-100">

<%@ include file="menuad.jsp" %>

<main class="flex-1 flex flex-col md:flex-row gap-6 px-4 md:px-10 py-8 w-full">

    <!-- Left Column -->
    <div class="w-full md:w-3/4 flex flex-col gap-8">
        <!-- Summary Cards -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
            <div class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col gap-4">
                <span class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Users</span>
                <span class="text-3xl font-black text-gray-900 dark:text-white">${totalUsers}</span>
            </div>
            <div class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col gap-4">
                <span class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Categories</span>
                <span class="text-3xl font-black text-gray-900 dark:text-white">${totalCategories}</span>
            </div>
            <div class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col gap-4">
                <span class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Books</span>
                <span class="text-3xl font-black text-gray-900 dark:text-white">${totalBooks}</span>
            </div>
            <div class="bg-white dark:bg-gray-900 p-6 rounded-xl shadow-sm border border-gray-100 dark:border-gray-800 flex flex-col gap-4">
                <span class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Orders</span>
                <span class="text-3xl font-black text-gray-900 dark:text-white">${totalOrders}</span>
            </div>
        </div>

        <!-- Orders Chart -->
        <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-sm">
            <h3 class="text-lg font-bold mb-4">Orders Overview</h3>
            <canvas id="ordersChart" height="100"></canvas>
        </div>

       
    </div>

    <!-- Right Column: Quick Actions -->
    <div class="w-full md:w-1/4 flex flex-col gap-6">
        <div class="bg-gradient-to-b from-green-400 to-green-200 dark:from-green-700 dark:to-green-500 p-6 rounded-xl shadow-lg shadow-primary/20 flex flex-col gap-4">
            <h3 class="text-xl font-black mb-2 text-gray-900 dark:text-white">Quick Actions</h3>
            <p class="text-sm font-medium opacity-80 mb-4 text-gray-900 dark:text-white">Manage your store efficiently.</p>

            <a href="<%= request.getContextPath() %>/admin/products?action=add"
               class="flex items-center justify-center gap-2 bg-white dark:bg-gray-700 p-4 rounded-xl shadow hover:shadow-lg transition-transform hover:scale-[1.03]">
                <span class="material-symbols-outlined text-green-600">add_circle</span>
                <span class="font-bold text-gray-900 dark:text-white">Add New Product</span>
            </a>

            <a href="<%= request.getContextPath() %>/admin/orders"
               class="flex items-center justify-center gap-2 bg-white dark:bg-gray-700 p-4 rounded-xl shadow hover:shadow-lg transition-transform hover:scale-[1.03]">
                <span class="material-symbols-outlined text-red-600">shopping_cart</span>
                <span class="font-bold text-gray-900 dark:text-white">Manage Orders</span>
            </a>

            <a href="<%= request.getContextPath() %>/admin/customers"
               class="flex items-center justify-center gap-2 bg-white dark:bg-gray-700 p-4 rounded-xl shadow hover:shadow-lg transition-transform hover:scale-[1.03]">
                <span class="material-symbols-outlined text-blue-600">group</span>
                <span class="font-bold text-gray-900 dark:text-white">View Customers</span>
            </a>
        </div>
    </div>

</main>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('ordersChart').getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
            datasets: [{
                label: 'Orders',
                data: [12,19,7,15,10,20,8],
                borderColor: '#46ec13',
                backgroundColor: 'rgba(70,236,19,0.2)',
                tension: 0.3
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { display: false } },
            scales: { y: { beginAtZero: true } }
        }
    });
</script>

</body>
</html>
