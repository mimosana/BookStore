<%-- 
    Document   : menuad
    Created on : Dec 17, 2025, 12:19:23 PM
    Author     : luong
--%>


<!DOCTYPE html>
<html>
   <header class="w-full border-b bg-background-light dark:bg-background-dark sticky top-0 z-50">
            <div class="px-6 py-3 flex items-center justify-between">
                <div class="flex items-center gap-8">
                    <div class="flex items-center gap-3 font-bold text-lg">
                        <span class="material-symbols-outlined text-primary">auto_stories</span>
                        BookStore Admin
                    </div>

                    <nav class="hidden md:flex gap-6 text-sm font-medium">
                        <a href="${pageContext.request.contextPath}/dashboard" class="hover:text-primary">Dashboard</a>
                        <a href="${pageContext.request.contextPath}/admin/categoryManagement" class="hover:text-primary">Categories</a>
                                                <a href="${pageContext.request.contextPath}/admin/products" class="hover:text-primary">Products</a>
                        <a href="${pageContext.request.contextPath}/admin/orders"  class="hover:text-primary">Orders</a>
                       <a href="${pageContext.request.contextPath}/admin/customers" class="hover:text-primary">Customers</a>
                        <a href="#" class="hover:text-primary">Settings</a>
                    </nav>
                </div>

               <div class="relative flex items-center gap-4">
    <!-- Avatar -->
    <button id="avatarBtn" type="button"
            class="size-9 rounded-full bg-primary/20 flex items-center justify-center hover:bg-primary/30 transition-colors"
            title="User Menu">
        <span class="material-symbols-outlined text-primary">person</span>
    </button>

    <!-- Dropdown menu -->
    <div id="avatarDropdown" class="hidden absolute right-0 mt-2 w-36 bg-white dark:bg-gray-800 rounded-lg shadow-lg border z-50">
        <a href="${pageContext.request.contextPath}/logout"
           class="block px-4 py-2 text-sm text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">
            Log Out
        </a>
        <!-- B?n có th? thêm option khác ? ?ây -->
    </div>
</div>

<script>
    const avatarBtn = document.getElementById('avatarBtn');
    const avatarDropdown = document.getElementById('avatarDropdown');

    // Toggle dropdown khi click avatar
    avatarBtn.addEventListener('click', () => {
        avatarDropdown.classList.toggle('hidden');
    });

    // Click ra ngoài thì ?óng dropdown
    document.addEventListener('click', function(event) {
        if (!avatarBtn.contains(event.target) && !avatarDropdown.contains(event.target)) {
            avatarDropdown.classList.add('hidden');
        }
    });
</script>


            </div>
        </header>
</html>
