<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,java.util.Map" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int totalApplications = request.getAttribute("totalApplications") == null ? 0 :
            ((Number)request.getAttribute("totalApplications")).intValue();

    int interviews = request.getAttribute("interviews") == null ? 0 :
            ((Number)request.getAttribute("interviews")).intValue();

    int totalRounds = request.getAttribute("totalRounds") == null ? 0 :
            ((Number)request.getAttribute("totalRounds")).intValue();

    int clearedRounds = request.getAttribute("clearedRounds") == null ? 0 :
            ((Number)request.getAttribute("clearedRounds")).intValue();

    int notClearedRounds = request.getAttribute("notClearedRounds") == null ? 0 :
            ((Number)request.getAttribute("notClearedRounds")).intValue();

    int pendingRounds = request.getAttribute("pendingRounds") == null ? 0 :
            ((Number)request.getAttribute("pendingRounds")).intValue();

    int scheduledRounds = request.getAttribute("scheduledRounds") == null ? 0 :
            ((Number)request.getAttribute("scheduledRounds")).intValue();

    long averageScore = request.getAttribute("averageScore") == null ? 0 :
            ((Number)request.getAttribute("averageScore")).longValue();

    int clearanceRate = request.getAttribute("clearanceRate") == null ? 0 :
            ((Number)request.getAttribute("clearanceRate")).intValue();

    int applied = request.getAttribute("applied") == null ? 0 :
            ((Number)request.getAttribute("applied")).intValue();

    int interviewing = request.getAttribute("interviewing") == null ? 0 :
            ((Number)request.getAttribute("interviewing")).intValue();

    int offers = request.getAttribute("offers") == null ? 0 :
            ((Number)request.getAttribute("offers")).intValue();

    int rejected = request.getAttribute("rejected") == null ? 0 :
            ((Number)request.getAttribute("rejected")).intValue();

    List<Map<String,Object>> performance =
            (List<Map<String,Object>>) request.getAttribute("performance");

    List<Map<String,Object>> recent =
            (List<Map<String,Object>>) request.getAttribute("recentApplications");

    int statusTotal =
    	    applied + interviewing + offers + rejected;

    	if (statusTotal == 0) {
    	    statusTotal = 1;
    	}
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>JobFit - Dashboard</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css?v=jobfit-dashboard-2">

</head>

<body>

<nav class="navbar">

    <a href="dashboard" class="logo">
        JobFit<span>.</span>
    </a>

    <div class="nav-links">

        <a class="active" href="dashboard">
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


<main class="page-shell dashboard-shell">


    <!-- HERO -->

    <section class="dashboard-hero">

        <div>

            <div class="eyebrow">
                YOUR JOB SEARCH COMMAND CENTER
            </div>

            <h1>
                Welcome back,
                <%= session.getAttribute("userName") %>
            </h1>

            <p>
                See what needs attention, where you are performing well,
                and which opportunities deserve your focus.
            </p>

        </div>

        <a class="primary-btn" href="add-application.jsp">
            + Add Application
        </a>

    </section>



    <!-- STAT CARDS -->

    <section class="stat-grid">

        <div class="metric-card">

            <div class="metric-icon blue">
                A
            </div>

            <div class="metric-label">
                APPLICATIONS
            </div>

            <div class="metric-value">
                <%= totalApplications %>
            </div>

            <div class="metric-note">
                Opportunities tracked
            </div>

        </div>


        <div class="metric-card">

            <div class="metric-icon purple">
                I
            </div>

            <div class="metric-label">
                INTERVIEWING
            </div>

            <div class="metric-value">
                <%= interviews %>
            </div>

            <div class="metric-note">
                Companies with rounds
            </div>

        </div>


        <div class="metric-card">

            <div class="metric-icon green">
                C
            </div>

            <div class="metric-label">
                CLEARED
            </div>

            <div class="metric-value">
                <%= clearedRounds %>
            </div>

            <div class="metric-note">
                Successful rounds
            </div>

        </div>


        <div class="metric-card">

            <div class="metric-icon orange">
                %
            </div>

            <div class="metric-label">
                CLEARANCE RATE
            </div>

            <div class="metric-value">
                <%= clearanceRate %>%
            </div>

            <div class="metric-note">
                <%= totalRounds %> total rounds
            </div>

        </div>

    </section>



    <!-- PERFORMANCE + APPLICATION PIPELINE -->

    <section class="dashboard-grid">


        <!-- PERFORMANCE -->

        <div class="panel performance-panel">

            <div class="panel-heading">

                <div>

                    <span class="panel-kicker">
                        INTERVIEW PERFORMANCE
                    </span>

                    <h2>
                        Your strongest and weakest areas
                    </h2>

                </div>

                <div class="score-pill">
                    <%= averageScore %>/100
                </div>

            </div>


            <div class="overall-score">

                <div class="score-ring"
                     style="--score:<%= averageScore %>;">

                    <strong>
                        <%= averageScore %>
                    </strong>

                    <span>
                        /100
                    </span>

                </div>


                <div>

                    <strong>
                        Overall interview score
                    </strong>

                    <p>
                        Based on rounds where you entered a score.
                    </p>

                </div>

            </div>


            <%

                if (performance != null && !performance.isEmpty()) {

                    for (Map<String,Object> p : performance) {

                        int score = ((Number)p.get("score")).intValue();

            %>


            <div class="bar-row">

                <div class="bar-label">

                    <span>
                        <%= p.get("type") %>
                    </span>

                    <strong>
                        <%= score %>%
                    </strong>

                </div>


                <div class="bar-track">

                    <div class="bar-fill"
                         style="width:<%= Math.min(100,score) %>%">
                    </div>

                </div>

            </div>


            <%

                    }

                } else {

            %>

                <div class="empty-inline">
                    Add round scores to unlock your performance breakdown.
                </div>

            <%

                }

            %>

        </div>



        <!-- APPLICATION STATUS -->

        <div class="panel status-panel">

            <div class="panel-heading">

                <div>

                    <span class="panel-kicker">
                        APPLICATION PIPELINE
                    </span>

                    <h2>
                        Where your applications stand
                    </h2>

                </div>

            </div>


            <div class="status-donut"
                 style="
    --a:<%= Math.round(applied * 100.0 / statusTotal) %>;
    --b:<%= Math.round(interviewing * 100.0 / statusTotal) %>;
    --c:<%= Math.round(offers * 100.0 / statusTotal) %>;
    --d:<%= Math.round(rejected * 100.0 / statusTotal) %>;
                 ">

                <div>

                    <strong>
                        <%= totalApplications %>
                    </strong>

                    <span>
                        total
                    </span>

                </div>

            </div>


            <div class="legend">

                <div>

                    <i class="dot applied"></i>

                    <span>
                        Applied
                    </span>

                    <strong>
                        <%= applied %>
                    </strong>

                </div>


                <div>

                    <i class="dot interviewing"></i>

                    <span>
                        Interviewing
                    </span>

                    <strong>
                        <%= interviewing %>
                    </strong>

                </div>


                <div>

                    <i class="dot offer"></i>

                    <span>
                        Offers
                    </span>

                    <strong>
                        <%= offers %>
                    </strong>

                </div>


                <div>

                    <i class="dot rejected"></i>

                    <span>
                        Rejected
                    </span>

                    <strong>
                        <%= rejected %>
                    </strong>

                </div>

            </div>

        </div>

    </section>



    <!-- ROUND PIPELINE -->

    <section class="pipeline-strip">

        <div>

            <span>
                ROUND PIPELINE
            </span>

            <strong>
                <%= pendingRounds %>
            </strong>

            <small>
                Pending
            </small>

        </div>


        <div>

            <span>
                ROUND PIPELINE
            </span>

            <strong>
                <%= scheduledRounds %>
            </strong>

            <small>
                Scheduled
            </small>

        </div>


        <div>

            <span>
                ROUND PIPELINE
            </span>

            <strong>
                <%= clearedRounds %>
            </strong>

            <small>
                Cleared
            </small>

        </div>


        <div>

            <span>
                ROUND PIPELINE
            </span>

            <strong>
                <%= notClearedRounds %>
            </strong>

            <small>
                Not cleared
            </small>

        </div>

    </section>



    <!-- RECENT APPLICATIONS -->

    <section class="panel">

        <div class="panel-heading">

            <div>

                <span class="panel-kicker">
                    OPPORTUNITIES
                </span>

                <h2>
                    Recent applications
                </h2>

            </div>

            <a class="text-link"
               href="applications">

                View all

            </a>

        </div>


        <div class="opportunity-list">


        <%

            if (recent != null && !recent.isEmpty()) {

                for (Map<String,Object> app : recent) {

        %>


            <a class="opportunity-row"
               href="application-details?id=<%= app.get("id") %>">


                <div class="company-avatar">

                    <%= String.valueOf(app.get("company"))
                        .substring(0,1)
                        .toUpperCase() %>

                </div>


                <div class="opportunity-main">

                    <strong>
                        <%= app.get("company") %>
                    </strong>

                    <span>
                        <%= app.get("role") %>
                    </span>

                </div>


                <div class="round-mini">

                    <strong>
                        <%= app.get("roundCount") %>
                    </strong>

                    <span>
                        rounds
                    </span>

                </div>


                <div class="opportunity-status">

                    <%= app.get("status") %>

                </div>


                <div class="focus-badge <%= app.get("focusClass") %>">

                    <span class="focus-star">
                        ★
                    </span>

                    <%= app.get("focusLabel") %>

                </div>


            </a>


        <%

                }

            } else {

        %>


            <div class="empty-state">

                <div class="empty-icon">
                    +
                </div>

                <h3>
                    Your job search starts here
                </h3>

                <p>
                    Add your first application and JobFit will build your tracking dashboard.
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

    </section>



    <!-- FOCUS -->

    <section class="focus-card">

        <div class="focus-glow"></div>


        <div class="focus-content">

            <span class="panel-kicker light">
                JOBFIT FOCUS
            </span>

            <h2>
                Focus on the opportunities that matter most.
            </h2>

            <p>
                JobFit highlights applications with a stronger combination
                of company, role, work mode and current progress.
                It is a guidance signal, not a prediction.
            </p>

        </div>


        <div class="focus-stat">

            <strong>
                ★
            </strong>

            <span>
                High Focus
            </span>

        </div>

    </section>


</main>


<!-- AI ASSISTANT -->

<script>

function toggleAssistant(){

    document
        .getElementById('aiPanel')
        .classList
        .toggle('show');

}

</script>


</body>
</html>