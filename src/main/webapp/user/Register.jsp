<%-- 
    Document   : Login
    Created on : Sep 28, 2025, 3:32:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <h2>Register</h2>
                    <p>Enter your credentials to continue</p>
                </div>

                <form class="login-form" id="loginForm" action="${pageContext.request.contextPath}/register" method="get" >
                    <!--               User name-->
                    <div class="form-group">
                        <div class="input-wrapper">
                            <input type="text" name="username" required>
                            <label for="email">Username</label>
                        </div>
                        <span style="color:red">${ername==null?"":ername}</span>
                    </div>
                    <!--               First name-->
                    <div class="form-group">
                        <div class="input-wrapper">
                            <input type="text" name="firstName" required>
                            <label for="email">First Name </label>
                        </div>
                        <!--               <span class="error-message" id="emailError"></span>-->
                    </div>
                    <!--               Last name-->
                    <div class="form-group">
                        <div class="input-wrapper">
                            <input type="text"  name="lastName" required>
                            <label for="email">Last Name </label>
                        </div>
                        <!--                    <span class="error-message" id="emailError"></span>-->
                    </div>
                    <!--               Address-->       
                    <div class="form-group">
                        <div class="input-wrapper">
                            <input type="text" id="email" name="address" required>
                            <label for="email">Address</label>
                        </div>
                        <!--                  <span class="error-message" id="emailError"></span>-->
                    </div>
                    <!--               Email-->       
                    <div class="form-group">
                        <div class="input-wrapper">
                            <input type="email" id="email" name="email" required>
                            <label for="email">Email</label>
                        </div>
                        <span style="color:red">${eremail==null?"":eremail}</span>
                    </div>

                    <!--               Password-->
                    <div class="form-group">
                        <div class="input-wrapper">
                            <input type="password" name="password" required autocomplete="current-password">
                            <label for="password">Password</label>
<!--                            <button type="button" class="password-toggle" id="passwordToggle" aria-label="Toggle password visibility">
                                <span class="toggle-icon"></span>
                            </button>-->
                        </div>
                        <!--                        <span class="error-message" id="passwordError"></span>-->
                    </div>

                    <!--      Confirm Password-->
                    <div class="form-group">
                        <div class="input-wrapper">
                            <input type="password" name="confirmPass" required autocomplete="current-password">
                            <label for="password">Confirm Password</label>
<!--                            <button type="button" class="password-toggle" id="passwordToggle" aria-label="Toggle password visibility">
                                <span class="toggle-icon"></span>
                            </button>-->
                        </div>
                        <span style="color:red">${confirmPass==null?"":confirmPass}</span>
                    </div>


                    <button type="submit" class="login-btn">
                        <span class="btn-text">Sign up</span>
                        <span class="btn-loader"></span>
                    </button>

                    <div>
                        <span class="btn-text">Do you have a account?<a href="Login.jsp">Log in</a></span>
                    </div>
                </form>
            </div>
        </div>


        <!--    <script src="../../shared/js/form-utils.js"></script>
            <script src="../js/script.js"></script>-->
    </body>
</html>