<%-- 
    Document   : Login
    Created on : Sep 28, 2025, 3:32:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minimal Login Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/logout.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                <h2>Sign In</h2>
                <p>Enter your credentials to continue</p>
            </div>
            
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <div class="input-wrapper">
                        <input type="text" name="username" required>
                        <label for="username">Username</label>
                    </div>
<!--                    <span class="error-message" id="emailError"></span>-->
                </div>

                <div class="form-group">
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" required>
                        <label for="password">Password</label>
                        <button type="button" class="password-toggle" id="passwordToggle" aria-label="Toggle password visibility">
                            <span class="toggle-icon"></span>
                        </button>
                    </div>
                    <c:if test="${not empty message}">
                        <span style="color: red">${message==null?"":message}</span>
                    </c:if>
                </div>

                <div class="form-options">
                    <div class="remember-wrapper">
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember" class="checkbox-label">
                            <span class="checkmark"></span>
                            Remember me
                        </label>
                    </div>
                    <a href="#" class="forgot-password">Forgot password?</a>
                </div>

                <button type="submit" class="login-btn">
                    <span class="btn-text">Sign In</span>
                    <span class="btn-loader"></span>
                </button>
                <div>
                        <span class="btn-text">Create a new account.<a href="Register.jsp">Register</a></span>
                    </div>
            </form>
                
        </div>
        </div>
</body>
</html>