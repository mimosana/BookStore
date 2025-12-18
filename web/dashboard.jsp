<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>

<%
    User u = (User) session.getAttribute("account");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial; background: #f4f6f9; }
        .container { width: 80%; margin: auto; }
        .card {
            display: inline-block;
            width: 22%;
            margin: 1%;
            padding: 20px;
            background: white;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h2 { margin: 10px 0; }
    </style>
</head>
<body>

<div class="container">
    <h1>Admin Dashboard</h1>
    <p>Xin chào, <b><%= u.getFullName() %></b></p>

    <div class="card">
        <h2>${totalUsers}</h2>
        <p>Users</p>
    </div>

    <div class="card">
        <h2>${totalCategories}</h2>
        <p>Categories</p>
    </div>

    <div class="card">
        <h2>${totalBooks}</h2>
        <p>Books</p>
    </div>

    <div class="card">
        <h2>${totalOrders}</h2>
        <p>Orders</p>
    </div>

    <br><br>
    <a href="<%= request.getContextPath() %>/logout">Logout</a>
</div>

</body>
</html>
