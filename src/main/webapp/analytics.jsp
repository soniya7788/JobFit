<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,java.util.Map" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int totalRounds =
        request.getAttribute("totalRounds") == null
        ? 0
        : ((Number)request.getAttribute("totalRounds")).intValue();

    int cleared =
        request.getAttribute("clearedRounds") == null
        ? 0
        : ((Number)request.getAttribute("clearedRounds")).intValue();

    int failed =
        request.getAttribute("notClearedRounds") == null
        ? 0
        : ((Number)request.getAttribute("notClearedRounds")).intValue();

    int pending =
        request.getAttribute("pendingRounds") == null
        ? 0
        : ((Number)request.getAttribute("pendingRounds")).intValue();

    int scheduled =
        request.getAttribute("scheduledRounds") == null
        ? 0
        : ((Number)request.getAttribute("scheduledRounds")).intValue();

    long average =
        request.getAttribute("averageScore") == null
        ? 0
        : ((Number)request.getAttribute("averageScore")).longValue();

    int rate =
        request.getAttribute("clearanceRate") == null
        ? 0
        : ((Number)request.getAttribute("clearanceRate")).intValue();


    List<Map<String,Object>> types =
        (List<Map<String,Object>>)
        request.getAttribute("typeStats");

    List<Map<String,Object>> companies =
        (List<Map<String,Object>>)
        request.getAttribute("companyStats");


    int maxPipeline =
        Math.max(
            1,
            Math.max(
                Math.max(cleared,failed),
                Math.max(pending,scheduled)
            )
        );
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>
    JobFit - Analytics
</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css?v=jobfit-analytics-2">

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

        <a href="applications">
            Applications
        </a>

        <a class="active"
           href="analytics">

            Analytics

        </a>

        <a href="logout"
           class="nav-button">

            Logout

        </a>

    </div>

</nav>


<main class="page-shell analytics-shell">


    <section class="page-title-row">

        <div>

            <span class="eyebrow">
                YOUR PERFORMANCE LAB
            </span>

            <h1>
                Interview Analytics
            </h1>

            <p>
                Understand your performance,
                outcomes and preparation gaps.
            </p>

        </div>

    </section>



    <!-- METRICS -->

    <section class="analytics-metrics">

        <div class="metric-card">

            <span class="metric-label">
                TOTAL ROUNDS
            </span>

            <strong class="metric-value">
                <%= totalRounds %>
            </strong>

            <span class="metric-note">
                Across all companies
            </span>

        </div>


        <div class="metric-card">

            <span class="metric-label">
                AVERAGE SCORE
            </span>

            <strong class="metric-value">
                <%= average %>%
            </strong>

            <span class="metric-note">
                Scored rounds only
            </span>

        </div>


        <div class="metric-card">

            <span class="metric-label">
                CLEARANCE RATE
            </span>

            <strong class="metric-value">
                <%= rate %>%
            </strong>

            <span class="metric-note">
                <%= cleared %> cleared
            </span>

        </div>


        <div class="metric-card">

            <span class="metric-label">
                NOT CLEARED
            </span>

            <strong class="metric-value">
                <%= failed %>
            </strong>

            <span class="metric-note">
                Areas to review
            </span>

        </div>

    </section>



    <!-- PERFORMANCE -->

    <section class="analytics-layout">


        <div class="panel">

            <div class="panel-heading">

                <div>

                    <span class="panel-kicker">
                        PERFORMANCE
                    </span>

                    <h2>
                        Score by interview type
                    </h2>

                </div>

                <span class="score-pill">
                    /100
                </span>

            </div>


            <%
                if (types != null &&
                    !types.isEmpty()) {

                    for (Map<String,Object> stat : types) {

                        Object scoreObject =
                            stat.get("score");

                        int score =
                            scoreObject == null
                            ? 0
                            : (int)Math.round(
                                ((Number)scoreObject)
                                .doubleValue()
                              );

                        int total =
                            ((Number)stat.get("total"))
                            .intValue();

                        int clearedType =
                            ((Number)stat.get("cleared"))
                            .intValue();
            %>


            <div class="analytics-bar-card">

                <div class="analytics-bar-top">

                    <div>

                        <strong>
                            <%= stat.get("type") %>
                        </strong>

                        <span>
                            <%= total %>
                            round<%= total == 1 ? "" : "s" %>
                        </span>

                    </div>

                    <strong>
                        <%= score %>%
                    </strong>

                </div>


                <div class="bar-track">

                    <div class="bar-fill"
                         style="width:<%= score %>%">
                    </div>

                </div>


                <div class="analytics-subline">

                    <span>
                        <%= clearedType %> cleared
                    </span>

                    <span>
                        <%= Math.max(
                            0,
                            total-clearedType
                        ) %>
                        other
                    </span>

                </div>

            </div>


            <%
                    }

                } else {
            %>


                <div class="empty-state">

                    Add scored interview rounds
                    to see category performance.

                </div>


            <%
                }
            %>

        </div>



        <!-- PIPELINE -->

        <div class="panel">

            <div class="panel-heading">

                <div>

                    <span class="panel-kicker">
                        OUTCOME MIX
                    </span>

                    <h2>
                        Round pipeline
                    </h2>

                </div>

            </div>


            <div class="pipeline-chart">


                <div class="pipeline-segment cleared"
                     style="height:<%= Math.max(
                        12,
                        Math.round(
                            cleared*100.0/maxPipeline
                        )
                     ) %>%">

                    <span>
                        <%= cleared %>
                    </span>

                </div>


                <div class="pipeline-segment scheduled"
                     style="height:<%= Math.max(
                        12,
                        Math.round(
                            scheduled*100.0/maxPipeline
                        )
                     ) %>%">

                    <span>
                        <%= scheduled %>
                    </span>

                </div>


                <div class="pipeline-segment pending"
                     style="height:<%= Math.max(
                        12,
                        Math.round(
                            pending*100.0/maxPipeline
                        )
                     ) %>%">

                    <span>
                        <%= pending %>
                    </span>

                </div>


                <div class="pipeline-segment failed"
                     style="height:<%= Math.max(
                        12,
                        Math.round(
                            failed*100.0/maxPipeline
                        )
                     ) %>%">

                    <span>
                        <%= failed %>
                    </span>

                </div>

            </div>


            <div class="pipeline-legend">

                <span>
                    <i class="dot cleared-dot"></i>
                    Cleared
                </span>

                <span>
                    <i class="dot scheduled-dot"></i>
                    Scheduled
                </span>

                <span>
                    <i class="dot pending-dot"></i>
                    Pending
                </span>

                <span>
                    <i class="dot failed-dot"></i>
                    Not cleared
                </span>

            </div>

        </div>

    </section>



    <!-- COMPANY ANALYSIS -->

    <section class="panel">

        <div class="panel-heading">

            <div>

                <span class="panel-kicker">
                    COMPANY VIEW
                </span>

                <h2>
                    Performance by company
                </h2>

            </div>

            <span class="muted-text">
                Up to 10 companies
            </span>

        </div>


        <div class="company-analytics-grid">


        <%
            if (companies != null &&
                !companies.isEmpty()) {

                for (Map<String,Object> company
                        : companies) {

                    Object scoreObject =
                        company.get("score");

                    int score =
                        scoreObject == null
                        ? 0
                        : (int)Math.round(
                            ((Number)scoreObject)
                            .doubleValue()
                          );
        %>


            <div class="company-analytics-card">

                <div class="company-avatar">

                    <%= String.valueOf(
                        company.get("company")
                    ).substring(0,1)
                      .toUpperCase() %>

                </div>


                <div class="company-analytics-main">

                    <strong>
                        <%= company.get("company") %>
                    </strong>

                    <span>
                        <%= company.get("rounds") %>
                        rounds ·
                        <%= company.get("cleared") %>
                        cleared
                    </span>


                    <div class="bar-track small">

                        <div class="bar-fill"
                             style="width:<%= score %>%">
                        </div>

                    </div>

                </div>


                <strong class="company-score">
                    <%= score %>%
                </strong>

            </div>


        <%
                }

            } else {
        %>


            <div class="empty-state">

                Company analytics will appear
                after interview rounds are added.

            </div>


        <%
            }
        %>


        </div>

    </section>



    <section class="analytics-callout">

        <div>

            <span class="panel-kicker light">
                NEXT STEP
            </span>

            <h2>
                Turn analytics into preparation.
            </h2>

            <p>
                Use your lowest-performing interview type
                to decide what to revise before the next round.
            </p>

        </div>


        <a class="primary-btn"
           href="applications">

            Review applications

        </a>

    </section>


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
        Your analytics are ready.
    </p>

    <div class="ai-tip">
        Start with the interview category where your average score is lowest.
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