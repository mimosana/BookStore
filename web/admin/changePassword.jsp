<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms"></script>

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: { primary: "#46ec13" },
                    fontFamily: { display: ["Manrope", "sans-serif"] }
                }
            }
        }
    </script>
</head>

<body class="bg-gray-100 font-display">
    <%@include file="menuad.jsp" %>

    <div class="max-w-xl mx-auto mt-10 bg-white rounded-xl shadow p-6">
        
        <div class="mb-4">
           <a href="${pageContext.request.contextPath}/admin/customers" class="flex items-center gap-1 text-gray-500 hover:text-black transition-colors text-sm font-medium">
                <span class="material-symbols-outlined text-sm">arrow_back</span>
                Back to list
            </a>
        </div>

        <h1 class="text-2xl font-black mb-6">Change Password</h1>

        <c:if test="${not empty error}">
            <div class="mb-4 p-3 bg-red-100 text-red-700 rounded-lg font-bold">
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/admin/change-password" method="post" class="space-y-4">
    <input type="hidden" name="userId" value="${userId}" />

    <c:if test="${not empty errorMessage}">
        <div class="p-3 bg-red-100 text-red-700 rounded-lg font-bold">
            ${errorMessage}
        </div>
    </c:if>

    <c:if test="${not empty successMessage}">
        <div class="p-3 bg-green-100 text-green-700 rounded-lg font-bold">
            ${successMessage}
        </div>
    </c:if>

    <div>
        <label class="block font-bold mb-1">New Password</label>
        <input type="password" 
               name="newPassword" 
               placeholder="Enter new password"
               required
               class="w-full h-10 rounded-lg border-gray-300 focus:border-primary focus:ring-primary"/>
    </div>

    <div>
        <label class="block font-bold mb-1">Confirm Password</label>
        <input type="password" 
               name="confirmPassword" 
               placeholder="Confirm new password"
               required
               class="w-full h-10 rounded-lg border-gray-300 focus:border-primary focus:ring-primary"/>
    </div>

    <div class="flex justify-end gap-3 pt-4">
        <a href="${pageContext.request.contextPath}/admin/customers"
           class="px-4 py-2 rounded-lg border border-gray-300 hover:bg-gray-50 transition-colors font-medium text-gray-700">
            Cancel
        </a>

        <button type="submit" 
                class="px-5 py-2 rounded-lg bg-primary font-bold text-[#111b0d] hover:opacity-90 transition-opacity shadow-sm">
            Update Password
        </button>
    </div>
</form>

    </div>
</body>
</html>