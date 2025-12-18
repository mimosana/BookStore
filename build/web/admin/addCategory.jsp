<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>

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

    <h1 class="text-2xl font-black mb-6">Add New Category</h1>

    <!-- ERROR MESSAGE -->
    <c:if test="${not empty error}">
        <div class="mb-4 p-3 bg-red-100 text-red-700 rounded-lg font-bold">
            ${error}
        </div>
    </c:if>

    <form method="post"
          action="${pageContext.request.contextPath}/admin/categories"
          accept-charset="UTF-8"
          class="space-y-4">

        <input type="hidden" name="action" value="add"/>

        <!-- NAME -->
        <div>
            <label class="block font-bold mb-1">Category Name</label>
            <input type="text"
                   name="categoryName"
                   value="${oldName}"
                   required
                   class="w-full h-10 rounded-lg border-gray-300"/>
        </div>

        <!-- DESCRIPTION -->
        <div>
            <label class="block font-bold mb-1">Description</label>
            <textarea name="description"
                      rows="3"
                      class="w-full rounded-lg border-gray-300">${oldDesc}</textarea>
        </div>

        <!-- STATUS -->
        <div>
            <label class="block font-bold mb-1">Status</label>
            <select name="status"
                    class="w-full h-10 rounded-lg border-gray-300">
                <option value="ACTIVE" ${oldStatus == 'ACTIVE' ? 'selected' : ''}>
                    ACTIVE
                </option>
                <option value="INACTIVE" ${oldStatus == 'INACTIVE' ? 'selected' : ''}>
                    INACTIVE
                </option>
            </select>
        </div>

        <!-- BUTTON -->
        <div class="flex justify-end gap-3 pt-4">
            <a href="${pageContext.request.contextPath}/admin/categories"
               class="px-4 py-2 rounded-lg border">
                Cancel
            </a>
            <button class="px-5 py-2 rounded-lg bg-primary font-bold">
                Add
            </button>
        </div>
    </form>

</div>
</body>
</html>
