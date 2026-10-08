<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,java.util.Map" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Map<String,Object> app =
        (Map<String,Object>)
        request.getAttribute("application");

    List<Map<String,Object>> rounds =
        (List<Map<String,Object>>)
        request.getAttribute("rounds");

    if (app == null) {
        response.sendRedirect("applications");
        return;
    }

    int nextRoundNumber =
        rounds == null ? 1 : rounds.size() + 1;
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>
    JobFit -
    <%= app.get("company") %>
</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css?v=jobfit-details-2">

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


<main class="page-shell detail-shell">

    <a class="back-link"
       href="applications">

        ← Back to Applications

    </a>


    <section class="application-hero-card">

        <div class="hero-company">

            <div class="company-avatar xl">

                <%= String.valueOf(app.get("company"))
                    .substring(0,1)
                    .toUpperCase() %>

            </div>

            <div>

                <span class="eyebrow light">
                    APPLICATION
                </span>

                <h1>
                    <%= app.get("company") %>
                </h1>

                <p>
                    <%= app.get("role") %>
                    ·
                    <%= app.get("jobType") == null
                        ? "Work mode not specified"
                        : app.get("jobType") %>
                </p>

            </div>

        </div>


        <div class="hero-right">

            <div class="focus-hero <%= app.get("focusClass") %>">

                <span>
                    ★ <%= app.get("focusLabel") %>
                </span>

                <strong>
                    <%= app.get("focusScore") %>
                </strong>

                <small>
                    focus score
                </small>

            </div>


            <span class="status-chip">
                <%= app.get("status") %>
            </span>

        </div>

    </section>



    <section class="info-grid-new">

        <div class="info-tile">

            <span>LOCATION</span>

            <strong>
                <%= app.get("location") == null ||
                    String.valueOf(app.get("location")).isBlank()
                    ? "Not specified"
                    : app.get("location") %>
            </strong>

        </div>


        <div class="info-tile">

            <span>APPLICATION DATE</span>

            <strong>
                <%= app.get("date") == null
                    ? "Not specified"
                    : app.get("date") %>
            </strong>

        </div>


        <div class="info-tile">

            <span>SOURCE</span>

            <strong>
                <%= app.get("source") == null ||
                    String.valueOf(app.get("source")).isBlank()
                    ? "Not specified"
                    : app.get("source") %>
            </strong>

        </div>


        <div class="info-tile">

            <span>ROUNDS</span>

            <strong>
                <%= rounds == null ? 0 : rounds.size() %>
            </strong>

        </div>

    </section>



    <section class="panel journey-panel">

        <div class="panel-heading">

            <div>

                <span class="panel-kicker">
                    INTERVIEW JOURNEY
                </span>

                <h2>
                    Rounds for this application
                </h2>

            </div>


            <a class="primary-btn"
               href="add-round.jsp?applicationId=<%= app.get("id") %>&roundNumber=<%= nextRoundNumber %>">

                + Add Round

            </a>

        </div>


        <div class="journey-line"></div>


        <%
            if (rounds != null &&
                !rounds.isEmpty()) {

                for (Map<String,Object> round : rounds) {

                    String status =
                        String.valueOf(round.get("status"));

                    boolean actionable =
                        !status.equalsIgnoreCase("Cleared")
                        &&
                        !status.equalsIgnoreCase("Not Cleared");
        %>


        <article class="round-card">


            <div class="round-number-badge">

                ROUND
                <%= round.get("number") %>

            </div>


            <div class="round-main">


                <div class="round-header">

                    <div>

                        <h3>

                            <%= round.get("name") == null ||
                                String.valueOf(round.get("name")).isBlank()
                                ? "Untitled Round"
                                : round.get("name") %>

                        </h3>

                        <span class="round-type-label">

                            <%= round.get("type") == null
                                ? "Interview"
                                : round.get("type") %>

                        </span>

                    </div>


                    <span class="round-status
                        <%= status.toLowerCase()
                            .replace(" ","-") %>">

                        <%= status %>

                    </span>

                </div>



                <div class="round-facts">

                    <% if (round.get("date") != null) { %>

                        <span>
                            DATE
                            <strong>
                                <%= round.get("date") %>
                            </strong>
                        </span>

                    <% } %>


                    <% if (round.get("score") != null) { %>

                        <span>
                            SCORE
                            <strong>
                                <%= round.get("score") %>/100
                            </strong>
                        </span>

                    <% } %>

                </div>



                <% if (round.get("skills") != null &&
                       !String.valueOf(round.get("skills")).isBlank()) { %>

                    <div class="round-note">

                        <strong>
                            Skills tested
                        </strong>

                        <p>
                            <%= round.get("skills") %>
                        </p>

                    </div>

                <% } %>



                <% if (round.get("wentWell") != null &&
                       !String.valueOf(round.get("wentWell")).isBlank()) { %>

                    <div class="round-note">

                        <strong>
                            What went well
                        </strong>

                        <p>
                            <%= round.get("wentWell") %>
                        </p>

                    </div>

                <% } %>



                <% if (round.get("improvement") != null &&
                       !String.valueOf(round.get("improvement")).isBlank()) { %>

                    <div class="round-note">

                        <strong>
                            Improve next time
                        </strong>

                        <p>
                            <%= round.get("improvement") %>
                        </p>

                    </div>

                <% } %>



                <div class="round-actions">


                <% if (actionable) { %>


                    <form method="post"
                          action="round">

                        <input type="hidden"
                               name="action"
                               value="status">

                        <input type="hidden"
                               name="applicationId"
                               value="<%= app.get("id") %>">

                        <input type="hidden"
                               name="roundId"
                               value="<%= round.get("id") %>">

                        <input type="hidden"
                               name="newStatus"
                               value="Cleared">

                        <button class="action-btn success-btn"
                                type="submit">

                            Mark Cleared

                        </button>

                    </form>


                    <form method="post"
                          action="round">

                        <input type="hidden"
                               name="action"
                               value="status">

                        <input type="hidden"
                               name="applicationId"
                               value="<%= app.get("id") %>">

                        <input type="hidden"
                               name="roundId"
                               value="<%= round.get("id") %>">

                        <input type="hidden"
                               name="newStatus"
                               value="Not Cleared">

                        <button class="action-btn danger-btn"
                                type="submit">

                            Not Cleared

                        </button>

                    </form>


                <% } %>


                    <form method="post"
                          action="round"
                          onsubmit="return confirm('Remove this interview round?');">

                        <input type="hidden"
                               name="action"
                               value="delete">

                        <input type="hidden"
                               name="applicationId"
                               value="<%= app.get("id") %>">

                        <input type="hidden"
                               name="roundId"
                               value="<%= round.get("id") %>">

                        <button class="icon-delete"
                                type="submit">

                            Remove

                        </button>

                    </form>


                </div>

            </div>

        </article>


        <%
                }

            } else {
        %>


        <div class="empty-state">

            <div class="empty-icon">
                01
            </div>

            <h3>
                No rounds added yet
            </h3>

            <p>
                Add a planned round now, even if the company has not scheduled it yet.
            </p>

            <a class="primary-btn"
               href="add-round.jsp?applicationId=<%= app.get("id") %>&roundNumber=1">

                Add First Round

            </a>

        </div>


        <%
            }
        %>

    </section>



    <% if (app.get("roleDescription") != null &&
           !String.valueOf(app.get("roleDescription")).isBlank()) { %>

    <section class="panel">

        <span class="panel-kicker">
            ROLE CONTEXT
        </span>

        <h2>
            Job description
        </h2>

        <p class="long-copy">
            <%= app.get("roleDescription") %>
        </p>

    </section>

    <% } %>



    <% if (app.get("notes") != null &&
           !String.valueOf(app.get("notes")).isBlank()) { %>

    <section class="panel">

        <span class="panel-kicker">
            YOUR NOTES
        </span>

        <h2>
            Application notes
        </h2>

        <p class="long-copy">
            <%= app.get("notes") %>
        </p>

    </section>

    <% } %>


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
        Need help with this application?
    </p>

    <div class="ai-tip">
        You can add a Pending round now and update its result later.
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