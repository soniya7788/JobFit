<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>JobFit - Login</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <div class="auth-container">

        <!-- LEFT SIDE: BRANDING & BENEFITS -->

        <div class="auth-left">

            <div class="auth-left-content">

                <h2>
                    Welcome to JobFit
                </h2>

                <p>
                    Discover which jobs match your current skills and identify the areas where you can improve.
                </p>

                <div class="auth-benefits">

                    <div class="auth-benefit">
                        Analyze job fit instantly
                    </div>

                    <div class="auth-benefit">
                        Track your interview journey
                    </div>

                    <div class="auth-benefit">
                        Get personalized insights
                    </div>

                </div>

            </div>

        </div>

        <!-- RIGHT SIDE: LOGIN FORM -->

        <div class="auth-right">

            <div class="auth-form-wrapper">

                <div class="auth-form-header">

                    <div class="auth-form-logo">
                        JobFit
                    </div>

                    <h1>
                        Welcome back
                    </h1>

                    <p>
                        Login to your account to continue
                    </p>

                </div>

                <form action="login" method="post" class="auth-form">

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
                            placeholder="Enter your password"
                            required>

                    </div>

                    <button type="submit" class="auth-form-submit">
                        Login to JobFit
                    </button>

                </form>

                <div class="auth-form-footer">

                    Don't have an account?

                    <a href="register.jsp">
                        Create one
                    </a>

                </div>

            </div>

        </div>

    </div>

</body>

</html>