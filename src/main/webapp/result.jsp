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

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>JobFit - Your Result</title>

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


<main class="result-page">

    <div class="result-wrapper">


        <div class="result-heading">

            <h1>
                Your JobFit Result
            </h1>

            <p>
                Analysis for
                <strong>
                    <%= session.getAttribute("role") %>
                </strong>
            </p>

        </div>


        <div class="score-card">

            <div class="score-circle">

                <span>
                    <%= session.getAttribute("score") %>%
                </span>

            </div>

            <h2 style="margin-top:20px;">
                Profile Match Score
            </h2>

        </div>


        <div class="result-grid">


            <div class="result-card">

                <h2>
                    ✓ Matched Skills
                </h2>

                <ul>

                    <%
                        java.util.List<String> matched =
                            (java.util.List<String>)
                            session.getAttribute("matchedSkills");

                        for (String skill : matched) {
                    %>

                    <li>
                        <%= skill %>
                    </li>

                    <%
                        }
                    %>

                </ul>

            </div>


            <div class="result-card missing">

                <h2>
                    Skill Gaps
                </h2>

                <ul>

                    <%
                        java.util.List<String> missing =
                            (java.util.List<String>)
                            session.getAttribute("missingSkills");

                        for (String skill : missing) {
                    %>

                    <li>
                        <%= skill %>
                    </li>

                    <%
                        }
                    %>

                </ul>

            </div>


        </div>


        <div class="recommendation">

            <h2>
                JobFit Recommendation
            </h2>

            <p style="margin-top:10px;">
                <%= session.getAttribute("suggestion") %>
            </p>

        </div>


        <div class="result-action">

            <a href="analyzer.jsp"
               class="primary-link">

                Analyze Another Job →

            </a>

        </div>


    </div>

</main>

</body>

</html>