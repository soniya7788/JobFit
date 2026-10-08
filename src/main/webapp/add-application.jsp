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

<title>
    JobFit - Add Application
</title>

<link rel="stylesheet"
      href="<%= request.getContextPath() %>/css/style.css?v=jobfit-form-2">

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


<main class="page-shell form-shell">

    <a class="back-link"
       href="applications">

        ← Back to Applications

    </a>


    <section class="form-card">

        <div class="form-heading">

            <span class="eyebrow">
                NEW OPPORTUNITY
            </span>

            <h1>
                Add a job application
            </h1>

            <p>
                Save the opportunity now and keep updating its interview journey later.
            </p>

        </div>


        <form action="application"
              method="post">


            <!-- JOB INFORMATION -->

            <div class="form-section-new">

                <div class="section-heading-new">

                    <span>01</span>

                    <div>

                        <h2>
                            Job information
                        </h2>

                        <p>
                            Basic information about the opportunity.
                        </p>

                    </div>

                </div>


                <div class="form-grid-new">


                    <div class="field">

                        <label>
                            Company name *
                        </label>

                        <input type="text"
                               name="companyName"
                               placeholder="e.g. TCS"
                               required>

                    </div>


                    <div class="field">

                        <label>
                            Job role *
                        </label>

                        <select name="jobRole"
                                id="jobRole"
                                onchange="toggleOther('jobRole','otherRoleWrap')"
                                required>

                            <option value="">
                                Select role
                            </option>

                            <option>Java Developer</option>
                            <option>Python Developer</option>
                            <option>Frontend Developer</option>
                            <option>Backend Developer</option>
                            <option>Full Stack Developer</option>
                            <option>Software Tester</option>
                            <option>QA Tester</option>
                            <option>Web Developer</option>
                            <option>Data Analyst</option>
                            <option>Support Engineer</option>
                            <option>DevOps Engineer</option>
                            <option>Other</option>

                        </select>

                    </div>


                    <div class="field full"
                         id="otherRoleWrap"
                         style="display:none">

                        <label>
                            Other role
                        </label>

                        <input type="text"
                               name="otherRole"
                               placeholder="Enter exact role">

                    </div>


                    <div class="field full">

                        <label>
                            Role / job description
                        </label>

                        <textarea name="roleDescription"
                                  placeholder="Paste the job description or main responsibilities."></textarea>

                    </div>

                </div>

            </div>


            <div class="form-divider-new"></div>


            <!-- APPLICATION DETAILS -->

            <div class="form-section-new">

                <div class="section-heading-new">

                    <span>02</span>

                    <div>

                        <h2>
                            Application details
                        </h2>

                        <p>
                            These details help JobFit calculate your focus signal.
                        </p>

                    </div>

                </div>


                <div class="form-grid-new">


                    <div class="field">

                        <label>
                            Location
                        </label>

                        <input type="text"
                               name="location"
                               placeholder="Pune / Remote / Bengaluru">

                    </div>


                    <div class="field">

                        <label>
                            Work mode / job type
                        </label>

                        <select name="jobType"
                                id="jobType"
                                onchange="toggleOther('jobType','otherJobTypeWrap')">

                            <option value="">
                                Select
                            </option>

                            <option>Full Time</option>
                            <option>Part Time</option>
                            <option>Internship</option>
                            <option>Contract</option>
                            <option>Remote</option>
                            <option>Other</option>

                        </select>

                    </div>


                    <div class="field full"
                         id="otherJobTypeWrap"
                         style="display:none">

                        <label>
                            Other work mode
                        </label>

                        <input type="text"
                               name="otherJobType"
                               placeholder="e.g. Hybrid">

                    </div>


                    <div class="field">

                        <label>
                            Application date
                        </label>

                        <input type="date"
                               name="applicationDate">

                    </div>


                    <div class="field">

                        <label>
                            Source
                        </label>

                        <select name="source"
                                id="source"
                                onchange="toggleOther('source','otherSourceWrap')">

                            <option value="">
                                Select
                            </option>

                            <option>Company Website</option>
                            <option>Naukri</option>
                            <option>LinkedIn</option>
                            <option>Referral</option>
                            <option>Campus</option>
                            <option>Walk-in</option>
                            <option>Other</option>

                        </select>

                    </div>


                    <div class="field full"
                         id="otherSourceWrap"
                         style="display:none">

                        <label>
                            Other source
                        </label>

                        <input type="text"
                               name="otherSource"
                               placeholder="Where did you find this job?">

                    </div>


                    <div class="field full">

                        <label>
                            Job URL
                        </label>

                        <input type="url"
                               name="jobUrl"
                               placeholder="https://...">

                    </div>


                    <div class="field full">

                        <label>
                            Private notes
                        </label>

                        <textarea name="notes"
                                  placeholder="Recruiter, salary, preparation notes, important requirements..."></textarea>

                    </div>

                </div>

            </div>


            <div class="form-divider-new"></div>


            <!-- INITIAL ROUNDS -->

            <div class="form-section-new">

                <div class="section-heading-new">

                    <span>03</span>

                    <div>

                        <h2>
                            Interview plan
                            <em>optional</em>
                        </h2>

                        <p>
                            Add rounds you already know.
                            You can add more later.
                        </p>

                    </div>

                </div>


                <div id="roundBuilder"></div>


                <button type="button"
                        class="outline-btn"
                        onclick="addRoundRow()">

                    + Add planned round

                </button>

            </div>


            <div class="form-actions-new">

                <a class="secondary-btn"
                   href="applications">

                    Cancel

                </a>

                <button class="primary-btn"
                        type="submit">

                    Save Application

                </button>

            </div>

        </form>

    </section>

</main>


<script>

let roundIndex = 0;


function toggleOther(selectId,wrapId){

    const select =
        document.getElementById(selectId);

    const wrap =
        document.getElementById(wrapId);

    if(wrap){

        wrap.style.display =
            select.value === "Other"
            ? "block"
            : "none";
    }
}


function addRoundRow(){

    roundIndex++;

    const builder =
        document.getElementById("roundBuilder");

    const row =
        document.createElement("div");

    row.className =
        "planned-round-row";


    row.innerHTML = `

        <div class="planned-number">
            ${roundIndex}
        </div>


        <div class="field">

            <label>
                Round name
            </label>

            <input
                name="initialRoundName"
                placeholder="e.g. Technical Interview">

        </div>


        <div class="field">

            <label>
                Round type
            </label>

            <select
                name="initialRoundType"
                onchange="
                    this.nextElementSibling.style.display =
                    this.value === 'Other'
                    ? 'block'
                    : 'none';
                ">

                <option value="">
                    Select
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


            <input
                class="inline-other"
                name="initialOtherRoundType"
                placeholder="Other type"
                style="display:none">

        </div>


        <div class="field">

            <label>
                Known date
            </label>

            <input
                type="date"
                name="initialRoundDate">

        </div>


        <button
            type="button"
            class="remove-round"
            onclick="
                this.parentElement.remove();
                renumberRows();
            ">

            Remove

        </button>

    `;


    builder.appendChild(row);
}


function renumberRows(){

    document
        .querySelectorAll(".planned-round-row")
        .forEach((row,index)=>{

            row.querySelector(
                ".planned-number"
            ).textContent = index + 1;

        });
}

</script>

</body>
</html>