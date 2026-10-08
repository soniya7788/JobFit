<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String applicationId =
        request.getParameter("applicationId");

    String roundNumber =
        request.getParameter("roundNumber");

    if (applicationId == null ||
        applicationId.isBlank()) {

        response.sendRedirect("applications");
        return;
    }

    if (roundNumber == null ||
        roundNumber.isBlank()) {

        roundNumber = "1";
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>
    JobFit - Add Interview Round
</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css?v=jobfit-round-2">

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

        <a class="active"
           href="applications">

            Applications

        </a>

        <a href="analytics">
            Analytics
        </a>

        <a href="logout"
           class="nav-button">

            Logout

        </a>

    </div>

</nav>


<main class="page-shell form-shell">

    <a class="back-link"
       href="application-details?id=<%= applicationId %>">

        ← Back to Application

    </a>


    <section class="form-card">

        <div class="form-heading">

            <span class="eyebrow">
                INTERVIEW TRACKING
            </span>

            <h1>
                Add interview round
            </h1>

            <p>
                Add a new round whenever the company changes or extends its process.
            </p>

        </div>


        <form action="round"
              method="post">

            <input type="hidden"
                   name="applicationId"
                   value="<%= applicationId %>">

            <input type="hidden"
                   name="action"
                   value="add">


            <div class="form-grid-new">


                <div class="field">

                    <label>
                        Round number
                    </label>

                    <input type="number"
                           name="roundNumber"
                           value="<%= roundNumber %>"
                           min="1"
                           required>

                </div>


                <div class="field">

                    <label>
                        Round name
                    </label>

                    <input type="text"
                           name="roundName"
                           placeholder="e.g. Technical Interview"
                           required>

                </div>


                <div class="field">

                    <label>
                        Round type
                    </label>

                    <select name="roundType"
                            id="roundType"
                            onchange="toggleOtherRound()"
                            required>

                        <option value="">
                            Select type
                        </option>

                        <option>Aptitude</option>
                        <option>Coding</option>
                        <option>Technical</option>
                        <option>Communication</option>
                        <option>HR</option>
                        <option>Managerial</option>
                        <option>Group Discussion</option>
                        <option>Assessment</option>
                        <option>Other</option>

                    </select>

                </div>


                <div class="field"
                     id="otherRoundWrap"
                     style="display:none">

                    <label>
                        Other round type
                    </label>

                    <input type="text"
                           name="otherRoundType"
                           placeholder="Enter round type">

                </div>


                <div class="field">

                    <label>
                        Round date
                    </label>

                    <input type="date"
                           name="roundDate">

                </div>


                <div class="field">

                    <label>
                        Status
                    </label>

                    <select name="status">

                        <option>Pending</option>
                        <option>Scheduled</option>
                        <option>Completed</option>
                        <option>Cleared</option>
                        <option>Not Cleared</option>

                    </select>

                </div>


                <div class="field">

                    <label>
                        Score
                    </label>

                    <input type="number"
                           name="score"
                           min="0"
                           max="100"
                           placeholder="0 - 100">

                </div>


                <div class="field full">

                    <label>
                        Skills tested
                    </label>

                    <input type="text"
                           name="skills"
                           placeholder="Java, SQL, communication, reasoning">

                </div>


                <div class="field full">

                    <label>
                        Round description
                    </label>

                    <textarea
                        name="roundDescription"
                        placeholder="What is expected in this round?"></textarea>

                </div>


                <div class="field">

                    <label>
                        What went well
                    </label>

                    <textarea
                        name="whatWentWell"
                        placeholder="What felt strong?"></textarea>

                </div>


                <div class="field">

                    <label>
                        What to improve
                    </label>

                    <textarea
                        name="improvementNotes"
                        placeholder="What should you improve?"></textarea>

                </div>

            </div>


            <div class="form-actions-new">

                <a class="secondary-btn"
                   href="application-details?id=<%= applicationId %>">

                    Cancel

                </a>

                <button class="primary-btn"
                        type="submit">

                    Save Round

                </button>

            </div>

        </form>

    </section>

</main>


<script>

function toggleOtherRound(){

    const select =
        document.getElementById("roundType");

    const box =
        document.getElementById("otherRoundWrap");

    box.style.display =
        select.value === "Other"
        ? "block"
        : "none";
}

</script>

</body>
</html>