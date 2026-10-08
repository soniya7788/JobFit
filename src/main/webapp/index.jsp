<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>JobFit - Smart Job Matching</title>

    <link rel="stylesheet" href="css/style.css">

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f7f9fc;
            color: #172033;
        }

        /* NAVBAR */

        .home-navbar {
            height: 72px;
            background: #111827;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
        }

        .home-logo {
            font-size: 27px;
            font-weight: 700;
            color: white;
            text-decoration: none;
        }

        .home-nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .home-nav-links a {
            color: #e5e7eb;
            text-decoration: none;
            font-size: 15px;
            transition: 0.2s;
        }

        .home-nav-links a:hover {
            color: #60a5fa;
        }

        .nav-register {
            background: #2563eb;
            padding: 10px 18px;
            border-radius: 7px;
            color: white !important;
        }

        .nav-register:hover {
            background: #1d4ed8;
        }

        /* HERO */

        .hero {
            min-height: 600px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 50px;
            padding: 70px 8%;
            background: linear-gradient(135deg, #eef4ff, #ffffff);
        }

        .hero-content {
            max-width: 620px;
        }

        .hero-badge {
            display: inline-block;
            background: #dbeafe;
            color: #1d4ed8;
            padding: 8px 14px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 22px;
        }

        .hero h1 {
            font-size: 52px;
            line-height: 1.1;
            margin-bottom: 22px;
            color: #111827;
        }

        .hero h1 span {
            color: #2563eb;
        }

        .hero p {
            font-size: 18px;
            line-height: 1.7;
            color: #667085;
            margin-bottom: 30px;
        }

        .hero-buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .hero-primary {
            display: inline-block;
            padding: 14px 25px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: 0.2s;
        }

        .hero-primary:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        .hero-secondary {
            display: inline-block;
            padding: 14px 25px;
            background: white;
            color: #2563eb;
            text-decoration: none;
            border: 1px solid #2563eb;
            border-radius: 8px;
            font-weight: 600;
            transition: 0.2s;
        }

        .hero-secondary:hover {
            background: #eff6ff;
        }

        /* MATCH CARD */

        .hero-card {
            width: 390px;
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.10);
        }

        .hero-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .hero-card-header h3 {
            font-size: 18px;
        }

        .status {
            font-size: 12px;
            padding: 6px 10px;
            border-radius: 20px;
            background: #dcfce7;
            color: #15803d;
        }

        .match-score {
            text-align: center;
            margin-bottom: 25px;
        }

        .score-circle {
            width: 145px;
            height: 145px;
            margin: auto;
            border-radius: 50%;
            background: #eff6ff;
            border: 10px solid #3b82f6;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .score-circle strong {
            font-size: 38px;
            color: #2563eb;
        }

        .match-score p {
            margin-top: 12px;
            color: #667085;
        }

        .skill-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #eef0f4;
        }

        .skill-row:last-child {
            border-bottom: none;
        }

        .skill-name {
            color: #344054;
        }

        .skill-match {
            color: #16a34a;
            font-weight: 600;
        }

        /* FEATURES */

        .features {
            padding: 80px 8%;
            background: white;
            text-align: center;
        }

        .section-heading {
            max-width: 650px;
            margin: auto;
        }

        .section-heading h2 {
            font-size: 34px;
            margin-bottom: 12px;
        }

        .section-heading p {
            color: #667085;
            line-height: 1.6;
        }

        .feature-grid {
            max-width: 1100px;
            margin: 45px auto 0;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
        }

        .feature-card {
            text-align: left;
            padding: 28px;
            border: 1px solid #e5e7eb;
            border-radius: 14px;
            background: #ffffff;
            transition: 0.2s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.07);
        }

        .feature-icon {
            width: 48px;
            height: 48px;
            border-radius: 10px;
            background: #eff6ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 18px;
        }

        .feature-card h3 {
            margin-bottom: 10px;
        }

        .feature-card p {
            color: #667085;
            line-height: 1.6;
            font-size: 14px;
        }

        /* HOW IT WORKS */

        .how-section {
            padding: 80px 8%;
            background: #f7f9fc;
            text-align: center;
        }

        .steps {
            max-width: 950px;
            margin: 45px auto 0;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
        }

        .step {
            background: white;
            padding: 28px;
            border-radius: 14px;
        }

        .step-number {
            width: 42px;
            height: 42px;
            margin: 0 auto 15px;
            border-radius: 50%;
            background: #2563eb;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .step h3 {
            margin-bottom: 10px;
        }

        .step p {
            color: #667085;
            line-height: 1.6;
            font-size: 14px;
        }

        /* CTA */

        .cta {
            padding: 80px 20px;
            background: #111827;
            text-align: center;
            color: white;
        }

        .cta h2 {
            font-size: 36px;
            margin-bottom: 15px;
        }

        .cta p {
            color: #cbd5e1;
            margin-bottom: 25px;
        }

        /* FOOTER */

        footer {
            background: #0b1120;
            color: #94a3b8;
            text-align: center;
            padding: 25px;
            font-size: 14px;
        }

        /* RESPONSIVE */

        @media (max-width: 900px) {

            .hero {
                flex-direction: column;
                text-align: center;
            }

            .hero-buttons {
                justify-content: center;
            }

            .feature-grid,
            .steps {
                grid-template-columns: 1fr;
            }

            .hero-card {
                width: 100%;
                max-width: 390px;
            }

        }

        @media (max-width: 650px) {

            .home-navbar {
                padding: 0 20px;
            }

            .home-nav-links {
                gap: 12px;
            }

            .home-nav-links a {
                font-size: 13px;
            }

            .hero {
                padding: 55px 20px;
            }

            .hero h1 {
                font-size: 38px;
            }

            .features,
            .how-section {
                padding: 60px 20px;
            }

        }

    </style>
</head>

<body>

    <!-- NAVBAR -->

    <nav class="home-navbar">

        <a href="index.jsp" class="home-logo">
            JobFit
        </a>

        <div class="home-nav-links">

            <a href="index.jsp">
                Home
            </a>

            <a href="#features">
                Features
            </a>

            <a href="#how-it-works">
                How It Works
            </a>

            <a href="login.jsp">
                Login
            </a>

            <a href="register.jsp" class="nav-register">
                Register
            </a>

        </div>

    </nav>


    <!-- HERO SECTION -->

    <section class="hero">

        <div class="hero-content">

            <div class="hero-badge">
                Smart Career & Job Matching
            </div>

            <h1>
                Find out how well you
                <span>fit the job.</span>
            </h1>

            <p>
                JobFit compares your skills with a job description,
                identifies your strengths and skill gaps, and gives
                you practical recommendations to improve your profile.
            </p>

            <div class="hero-buttons">

                <a href="register.jsp" class="hero-primary">
                    Get Started
                </a>

                <a href="login.jsp" class="hero-secondary">
                    Login
                </a>

            </div>

        </div>


        <!-- SAMPLE MATCH CARD -->

        <div class="hero-card">

            <div class="hero-card-header">

                <h3>
                    Java Developer
                </h3>

                <span class="status">
                    Good Match
                </span>

            </div>

            <div class="match-score">

                <div class="score-circle">
                    <strong>82%</strong>
                </div>

                <p>
                    Profile Match Score
                </p>

            </div>

            <div class="skill-row">

                <span class="skill-name">
                    Java
                </span>

                <span class="skill-match">
                    ✓ Matched
                </span>

            </div>

            <div class="skill-row">

                <span class="skill-name">
                    MySQL
                </span>

                <span class="skill-match">
                    ✓ Matched
                </span>

            </div>

            <div class="skill-row">

                <span class="skill-name">
                    Spring
                </span>

                <span class="skill-match">
                    ✓ Matched
                </span>

            </div>

            <div class="skill-row">

                <span class="skill-name">
                    React
                </span>

                <span style="color:#d97706;font-weight:600;">
                    Improve
                </span>

            </div>

        </div>

    </section>


    <!-- FEATURES -->

    <section class="features" id="features">

        <div class="section-heading">

            <h2>
                Everything you need to understand your job fit
            </h2>

            <p>
                JobFit turns a job description into simple,
                actionable information about your current profile.
            </p>

        </div>


        <div class="feature-grid">

            <div class="feature-card">

                <div class="feature-icon">
                    🎯
                </div>

                <h3>
                    Match Score
                </h3>

                <p>
                    Get a simple percentage showing how closely
                    your current skills match the selected job.
                </p>

            </div>


            <div class="feature-card">

                <div class="feature-icon">
                    ✓
                </div>

                <h3>
                    Matched Skills
                </h3>

                <p>
                    Quickly see which skills from the job
                    description you already have.
                </p>

            </div>


            <div class="feature-card">

                <div class="feature-icon">
                    📌
                </div>

                <h3>
                    Skill Gaps
                </h3>

                <p>
                    Identify important skills that are missing
                    from your current profile.
                </p>

            </div>


            <div class="feature-card">

                <div class="feature-icon">
                    💡
                </div>

                <h3>
                    Recommendations
                </h3>

                <p>
                    Receive practical suggestions about what
                    you should improve before applying.
                </p>

            </div>


            <div class="feature-card">

                <div class="feature-icon">
                    📚
                </div>

                <h3>
                    Learning Roadmap
                </h3>

                <p>
                    Discover which skills you should learn next
                    based on your target role.
                </p>

            </div>


            <div class="feature-card">

                <div class="feature-icon">
                    📊
                </div>

                <h3>
                    Analysis Dashboard
                </h3>

                <p>
                    Keep track of your job analysis and monitor
                    your progress over time.
                </p>

            </div>

        </div>

    </section>


    <!-- HOW IT WORKS -->

    <section class="how-section" id="how-it-works">

        <div class="section-heading">

            <h2>
                How JobFit Works
            </h2>

            <p>
                Three simple steps to understand your profile.
            </p>

        </div>


        <div class="steps">

            <div class="step">

                <div class="step-number">
                    1
                </div>

                <h3>
                    Create Account
                </h3>

                <p>
                    Register your JobFit account and create
                    your personal profile.
                </p>

            </div>


            <div class="step">

                <div class="step-number">
                    2
                </div>

                <h3>
                    Enter Job Details
                </h3>

                <p>
                    Select your target role and paste the
                    job description along with your skills.
                </p>

            </div>


            <div class="step">

                <div class="step-number">
                    3
                </div>

                <h3>
                    Get Your Result
                </h3>

                <p>
                    See your match score, matched skills,
                    skill gaps and recommendations.
                </p>

            </div>

        </div>

    </section>


    <!-- CTA -->

    <section class="cta">

        <h2>
            Ready to find your JobFit?
        </h2>

        <p>
            Start analyzing your profile against your target role.
        </p>

        <a href="register.jsp" class="hero-primary">
            Create Free Account
        </a>

    </section>


    <!-- FOOTER -->

    <footer>

        <p>
            © 2026 JobFit. Built to help freshers understand
            their career fit.
        </p>

    </footer>

</body>

</html>