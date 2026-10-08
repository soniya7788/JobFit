<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,java.util.Map" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String,Object>> applications =
        (List<Map<String,Object>>)
        request.getAttribute("applications");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>JobFit - Applications</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css?v=jobfit-applications-2">

</head>

<body>

<nav class="navbar">

    <a href="dashboard" class="logo">
        JobFit<span>.</span>
    </a>

    <div class="nav-links">

        <a href="dashboard">
            Dashboard
        </a>

        <a class="active" href="applications">
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


<main class="page-shell">

    <section class="page-title-row">

        <div>

            <span class="eyebrow">
                YOUR OPPORTUNITY BOARD
            </span>

            <h1>
                Applications
            </h1>

            <p>
                Track every company, role and interview journey in one place.
            </p>

        </div>

        <a class="primary-btn"
           href="add-application.jsp">

            + Add Application

        </a>

    </section>


    <%
        if ("added".equals(request.getParameter("success"))) {
    %>

        <div class="alert success">
            Application and initial interview rounds were saved successfully.
        </div>

    <%
        }
    %>


    <div class="application-board">

    <%
        if (applications != null &&
            !applications.isEmpty()) {

            for (Map<String,Object> app : applications) {

                String company =
                    String.valueOf(app.get("company"));

                String focusClass =
                    String.valueOf(app.get("focusClass"));

                int roundCount =
                    ((Number)app.get("roundCount"))
                    .intValue();
    %>


        <article class="application-card-new">


            <div class="application-card-top">

                <a class="company-block"
                   href="application-details?id=<%= app.get("id") %>">

                    <div class="company-avatar large">

                        <%= company.substring(0,1)
                            .toUpperCase() %>

                    </div>

                    <div>

                        <span class="company-title">
                            <%= company %>
                        </span>

                        <span class="role-title">
                            <%= app.get("role") %>
                        </span>

                    </div>

                </a>


                <div class="focus-badge <%= focusClass %>">

                    <span>★</span>

                    <%= app.get("focusLabel") %>

                    <small>
                        <%= app.get("focusScore") %>/100
                    </small>

                </div>

            </div>



            <div class="application-details-grid">

                <div>

                    <span>STATUS</span>

                    <strong>
                        <%= app.get("status") %>
                    </strong>

                </div>


                <div>

                    <span>WORK MODE</span>

                    <strong>
                        <%= app.get("jobType") == null ||
                            String.valueOf(app.get("jobType")).isBlank()
                            ? "Not specified"
                            : app.get("jobType") %>
                    </strong>

                </div>


                <div>

                    <span>LOCATION</span>

                    <strong>
                        <%= app.get("location") == null ||
                            String.valueOf(app.get("location")).isBlank()
                            ? "Not specified"
                            : app.get("location") %>
                    </strong>

                </div>


                <div>

                    <span>ROUNDS</span>

                    <strong>
                        <%= roundCount %>
                    </strong>

                </div>

            </div>



            <div class="application-card-footer">

                <div>

                <%
                    if (app.get("nextRound") != null) {
                %>

                    <span class="next-round">

                        <span class="pulse-dot"></span>

                        Next:
                        Round <%= app.get("nextRound") %>

                    </span>

                <%
                    } else if (roundCount > 0) {
                %>

                    <span class="muted-text">
                        All currently recorded rounds completed
                    </span>

                <%
                    } else {
                %>

                    <span class="muted-text">
                        No interview rounds yet
                    </span>

                <%
                    }
                %>

                </div>


                <a class="secondary-btn"
                   href="application-details?id=<%= app.get("id") %>">

                    View Journey

                </a>

            </div>

        </article>


    <%
            }

        } else {
    %>


        <div class="empty-state large">

            <div class="empty-icon">
                +
            </div>

            <h2>
                No applications yet
            </h2>

            <p>
                Start with your first opportunity.
                You can add interview rounds later.
            </p>

            <a class="primary-btn"
               href="add-application.jsp">

                Add Application

            </a>

        </div>


    <%
        }
    %>

    </div>

</main>


<button class="ai-fab"
        onclick="toggleAssistant()">

    AI

</button>


<div class="ai-panel"
     id="aiPanel">

    <div class="ai-head">

        <strong>
            JobFit Assistant
        </strong>

        <button onclick="toggleAssistant()">
            ×
        </button>

    </div>

    <p>
        I can help you decide which application needs attention.
    </p>

    <div class="ai-tip">
        Focus scores are guidance signals based on the information you entered.
    </div>

</div>


<script>

function toggleAssistant(){

    document
        .getElementById("aiPanel")
        .classList
        .toggle("show");

}

</script>

</body>
</html>