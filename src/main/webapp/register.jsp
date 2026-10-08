<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>JobFit - Create Account</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <div class="auth-container">

        <!-- LEFT SIDE: BRANDING & BENEFITS -->

        <div class="auth-left">

            <div class="auth-left-content">

                <h2>
                    Start Your JobFit Journey
                </h2>

                <p>
                    Join thousands of professionals discovering their perfect career fit and building their skills.
                </p>

                <div class="auth-benefits">

                    <div class="auth-benefit">
                        Free job fit analysis
                    </div>

                    <div class="auth-benefit">
                        Track all applications
                    </div>

                    <div class="auth-benefit">
                        Get career insights
                    </div>

                </div>

            </div>

        </div>

        <!-- RIGHT SIDE: REGISTRATION FORM -->

        <div class="auth-right">

            <div class="auth-form-wrapper">

                <div class="auth-form-header">

                    <div class="auth-form-logo">
                        JobFit
                    </div>

                    <h1>
                        Create your account
                    </h1>

                    <p>
                        Start discovering your perfect job fit
                    </p>

                </div>

                <form action="register" method="post" class="auth-form">

                    <div class="auth-form-group">

                        <label for="name">
                            Full name
                        </label>

                        <input
                            type="text"
                            id="name"
                            name="name"
                            placeholder="Enter your full name"
                            required>

                    </div>

                    <div class="auth-form-group">

                        <label for="email">
                            Email address
                        </label>

                        <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="you@example.com"
                            required>

                    </div>

                    <div class="auth-form-group">

                        <label for="password">
                            Password
                        </label>

                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Create a secure password"
                            required>

                    </div>

                    <button type="submit" class="auth-form-submit">
                        Create My JobFit Account
                    </button>

                </form>

                <div class="auth-form-footer">

                    Already have an account?

                    <a href="login.jsp">
                        Login
                    </a>

                </div>

            </div>

        </div>

    </div>

</body>

</html>