<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JobFit - Dashboard</title>
    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <nav class="navbar">

        <a href="dashboard" class="logo">
            JobFit
        </a>

        <div class="nav-links">

            <a href="dashboard">
                Dashboard
            </a>

            <a href="applications">
                Applications
            </a>

            <a href="analytics">
                Analytics
            </a>

            <a href="logout" class="nav-button">
                Logout
            </a>

        </div>

    </nav>

    <main class="dashboard-page" style="min-height: calc(100vh - 72px);">

        <div class="dashboard-container" style="max-width: 1200px;">

            <div class="dashboard-header">

                <div>

                    <h1>
                        Welcome, <%= session.getAttribute("userName") %>
                    </h1>

                    <p style="margin-top: 8px;">
                        Your latest job analysis results
                    </p>

                </div>

            </div>

            <div class="dashboard-card" style="margin-top: 30px;">

                <div class="card-header">

                    <h2>
                        Latest Analysis
                    </h2>

                </div>

                <%
                    if (session.getAttribute("role") != null) {
                %>

                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px;">

                        <div class="stat-card">
                            <h3>Target Role</h3>
                            <div class="stat-value" style="margin-top: 12px;">
                                <%= session.getAttribute("role") %>
                            </div>
                        </div>

                        <div class="stat-card">
                            <h3>Match Score</h3>
                            <div class="stat-value" style="margin-top: 12px; color: var(--primary);">
                                <%= session.getAttribute("score") %>%
                            </div>
                        </div>

                    </div>

                <%
                    } else {
                %>

                    <p style="color: var(--muted); text-align: center; padding: 40px 20px;">
                        You haven't analyzed a job yet.
                    </p>

                <%
                    }
                %>

                <div style="margin-top: 30px;">

                    <a href="analyzer.jsp" class="primary-btn" style="display: inline-block;">
                        Start New Analysis
                    </a>

                </div>

            </div>

        </div>

    </main>

</body>

</html>