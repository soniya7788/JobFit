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

    <title>JobFit - Analyze Job</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>


    <!-- NAVBAR -->

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


    <!-- ANALYZER -->

    <main class="analyzer-page">

        <div class="analyzer-wrapper">


            <div class="analyzer-heading">

                <div class="analyzer-badge">
                    Smart Job Analysis
                </div>

                <h1>
                    Find your JobFit
                </h1>

                <p>
                    Tell us about your skills and the role you're
                    targeting. We'll identify your strengths and gaps.
                </p>

            </div>


            <div class="analyzer-card">

                <form action="analyze" method="post">


                    <div class="analyzer-grid">


                        <!-- ROLE -->

                        <div class="analyzer-field">

                            <label for="role">
                                Target Job Role
                            </label>

                            <select
                                id="role"
                                name="role"
                                required>

                                <option value="">
                                    Select your target role
                                </option>

                                <option value="Java Developer">
                                    Java Developer
                                </option>

                                <option value="Python Developer">
                                    Python Developer
                                </option>

                                <option value="Web Developer">
                                    Web Developer
                                </option>

                                <option value="Frontend Developer">
                                    Frontend Developer
                                </option>

                                <option value="Backend Developer">
                                    Backend Developer
                                </option>

                                <option value="Software Tester">
                                    Software Tester
                                </option>

                            </select>

                            <div class="field-hint">
                                Choose the role you're interested in.
                            </div>

                        </div>


                        <!-- SKILLS -->

                        <div class="analyzer-field">

                            <label for="skills">
                                Your Skills
                            </label>

                            <textarea
                                id="skills"
                                name="skills"
                                placeholder="Example: Java, Python, HTML, CSS, JavaScript, MySQL, Git..."
                                required></textarea>

                            <div class="field-hint">
                                Separate skills using commas.
                            </div>

                        </div>


                        <!-- JOB DESCRIPTION -->

                        <div class="analyzer-field full">

                            <label for="jobDescription">
                                Job Description
                            </label>

                            <textarea
                                id="jobDescription"
                                name="jobDescription"
                                placeholder="Paste the job description here...

Example:
We are looking for a Java Developer with knowledge of Java,
MySQL, Spring, REST API and Git."
                                required></textarea>

                            <div class="field-hint">
                                Copy the requirements from the job posting
                                and paste them here.
                            </div>

                        </div>


                    </div>


                    <button
                        type="submit"
                        class="analyze-button">

                        Analyze My Job Fit
                        &nbsp; →
                        
                    </button>


                </form>

            </div>

        </div>

    </main>

</body>

</html>