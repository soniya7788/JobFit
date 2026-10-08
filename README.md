<div align="center">

# JobFit

### Track. Analyze. Improve. Get Hired.

**A job application and interview performance platform built for students and freshers.**

<br>

<img src="https://img.shields.io/badge/Java-17%2B-orange?style=for-the-badge&logo=openjdk&logoColor=white">
<img src="https://img.shields.io/badge/JSP-Servlets-0B5CAD?style=for-the-badge&logo=java&logoColor=white">
<img src="https://img.shields.io/badge/MySQL-9.x-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white">
<img src="https://img.shields.io/badge/Tomcat-10.1-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black">

<br>

<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/JDBC-Database%20Layer-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/Eclipse-IDE-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white">

<br><br>

<img src="https://img.shields.io/badge/Status-Active%20Development-2563EB?style=flat-square">
<img src="https://img.shields.io/badge/Project-Portfolio-111827?style=flat-square">
<img src="https://img.shields.io/badge/Backend-Java-0B5CAD?style=flat-square">
<img src="https://img.shields.io/badge/Database-MySQL-4479A1?style=flat-square">

</div>

---

## What is JobFit?

JobFit is a web-based platform designed to help students and freshers manage their complete job-search and interview journey in one place.

Instead of keeping applications, interview rounds, scores, results and improvement notes scattered across spreadsheets, notes or messages, JobFit brings them together into a single platform.

### The idea

> **Don't just track where you applied — understand how you perform, where you are losing opportunities, and what to improve next.**

```text
Apply
  ↓
Track
  ↓
Interview
  ↓
Record Results
  ↓
Analyze
  ↓
Identify Weak Areas
  ↓
Improve
  ↓
Get Hired
```

---

# Project Preview

The current version focuses on application tracking, interview management, dashboard insights and performance analytics.

### Login

<img src="screenshots/login.png" alt="JobFit Login" width="900">

### Dashboard

<img src="screenshots/dashboard.png" alt="JobFit Dashboard" width="900">

### Applications

<img src="screenshots/applications.png" alt="JobFit Applications" width="900">

### Interview Journey

<img src="screenshots/application-details.png" alt="JobFit Interview Journey" width="900">

### Analytics

<img src="screenshots/analytics.png" alt="JobFit Analytics" width="900">

---

# Core Features

| Module | What it does |
|---|---|
| **Authentication** | Registration, login, session management and logout |
| **Applications** | Add, view and track job applications |
| **Interview Rounds** | Record multiple rounds for each application |
| **Interview Scores** | Store scores and performance details |
| **Interview Journey** | Follow the complete round-by-round progress |
| **Dashboard** | View overall job-search activity |
| **Analytics** | Understand interview and company performance |
| **Focus Indicators** | Identify areas that may need improvement |

---

# Application Tracking

Each application stores the information needed to follow its complete journey.

| Information | Examples |
|---|---|
| Company | TCS, Infosys, Wipro |
| Role | Java Developer, QA Tester |
| Location | Pune, Remote |
| Work Mode | On-site, Hybrid, Remote |
| Application Date | Date applied |
| Source | LinkedIn, Naukri, Company Website |
| Job URL | Original job posting |
| Status | Applied, Interviewing, Offer, Rejected |
| Notes | Personal application notes |

### Application Flow

```text
                 ┌────────────┐
                 │   Applied  │
                 └─────┬──────┘
                       ↓
              ┌────────────────┐
              │  Interviewing  │
              └───────┬────────┘
                      │
          ┌───────────┼───────────┐
          ↓           ↓           ↓
      Rejected      Offer       On Hold
```

---

# Interview Management

Each application can contain multiple interview rounds.

| Round Type | Example |
|---|---|
| Aptitude | Quantitative / Logical |
| Technical | Java / SQL / OOP |
| Coding | Programming problems |
| Communication | Speaking / Communication |
| HR | Behavioral questions |
| Managerial | Managerial discussion |
| Other | Custom interview type |

Each round can store:

```text
Round Number
Round Name
Round Type
Interview Date
Status
Score
Skills Tested
Description
What Went Well
Improvement Notes
```

### Interview Journey

```text
Application
     │
     ▼
┌───────────────┐
│ Round 1       │
│ Aptitude      │
│ Score: 78     │
└───────┬───────┘
        ↓
┌───────────────┐
│ Round 2       │
│ Technical     │
│ Score: 82     │
└───────┬───────┘
        ↓
┌───────────────┐
│ Round 3       │
│ HR            │
│ Score: 74     │
└───────┬───────┘
        ↓
      Result
```

---

# Dashboard

The dashboard provides a quick overview of the user's job-search activity without requiring them to inspect every application individually.

### Dashboard Metrics

| Metric | Purpose |
|---|---|
| **Total Applications** | Number of jobs tracked |
| **Interviewing** | Active interview processes |
| **Cleared Rounds** | Successful interview rounds |
| **Clearance Rate** | Overall round success |
| **Total Rounds** | Total interview activity |
| **Overall Score** | Average interview performance |

### Dashboard also provides

- Application pipeline
- Interview round pipeline
- Recent applications
- Performance by interview type
- Focus areas
- Application status distribution

---

# Analytics

JobFit does **not use the same visualization for every type of data**.

Different information is represented according to what makes it easiest to understand.

| Data Context | Representation |
|---|---|
| Overall numbers | Metric cards |
| Interview-type scores | Horizontal performance bars |
| Application status | Pipeline / distribution |
| Round status | Round pipeline |
| Company performance | Comparison cards |
| Interview journey | Timeline-style flow |
| Weak areas | Focus indicators |
| Historical performance | Trend visualization |

### Example

```text
Interview Performance

Technical       ████████████████  87%
Coding          █████████████████ 91%
Communication   ███████████████    80%
Aptitude        ██████████████     78%
HR              █████████████████  91%
```

The purpose is to quickly answer:

> **Where am I strong, where am I struggling, and what should I improve?**

---

# Architecture

JobFit follows a Java web application architecture using JSP, Jakarta Servlets, JDBC and MySQL.

```text
                    USER
                     │
                     ▼
            ┌─────────────────┐
            │     Browser     │
            │                 │
            │ JSP / HTML / CSS│
            │   JavaScript    │
            └────────┬────────┘
                     │
                     │ HTTP
                     ▼
            ┌─────────────────┐
            │    Servlets     │
            │                 │
            │ Login           │
            │ Register        │
            │ Dashboard       │
            │ Applications    │
            │ Application     │
            │ Details         │
            │ Rounds          │
            │ Analytics       │
            └────────┬────────┘
                     │
                     │ JDBC
                     ▼
            ┌─────────────────┐
            │      MySQL      │
            │                 │
            │ users           │
            │ applications    │
            │ interview_rounds│
            └─────────────────┘
```

---

# Request Flow

```text
JSP / Browser
     │
     ▼
HTTP Request
     │
     ▼
Servlet
     │
     ▼
JDBC
     │
     ▼
MySQL
     │
     ▼
Servlet Processing
     │
     ▼
JSP
     │
     ▼
Updated UI
```

---

# Database Design

JobFit currently revolves around three main entities.

```text
┌──────────────┐
│    users     │
└──────┬───────┘
       │
       │ 1 : many
       ▼
┌──────────────────┐
│   applications   │
└────────┬─────────┘
         │
         │ 1 : many
         ▼
┌──────────────────┐
│ interview_rounds │
└──────────────────┘
```

### Main Data

| Table | Purpose |
|---|---|
| `users` | User accounts and authentication |
| `applications` | Job application information |
| `interview_rounds` | Interview rounds, scores and results |

### Relationship

```text
One User
   │
   ├── Application 1
   │      ├── Round 1
   │      ├── Round 2
   │      └── Round 3
   │
   ├── Application 2
   │      ├── Round 1
   │      └── Round 2
   │
   └── Application 3
          └── Round 1
```

---

# Project Structure

```text
JobFit/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── jobfit/
│       │           ├── DBConnection.java
│       │           ├── LoginServlet.java
│       │           ├── RegisterServlet.java
│       │           ├── LogoutServlet.java
│       │           ├── DashboardServlet.java
│       │           ├── ApplicationServlet.java
│       │           ├── ApplicationsServlet.java
│       │           ├── ApplicationDetailsServlet.java
│       │           ├── RoundServlet.java
│       │           └── AnalyticsServlet.java
│       │
│       └── webapp/
│           ├── index.jsp
│           ├── login.jsp
│           ├── register.jsp
│           ├── dashboard.jsp
│           ├── applications.jsp
│           ├── application-details.jsp
│           ├── add-application.jsp
│           ├── add-round.jsp
│           ├── analytics.jsp
│           ├── css/
│           │   └── style.css
│           └── WEB-INF/
│               └── web.xml
│
├── screenshots/
│   ├── login.png
│   ├── dashboard.png
│   ├── applications.png
│   ├── application-details.png
│   └── analytics.png
│
├── pom.xml
├── .gitignore
└── README.md
```

---

# Current Status

<div align="center">

| Area | Status |
|---|:---:|
| Project Setup | ✅ |
| Maven Configuration | ✅ |
| MySQL Connection | ✅ |
| User Registration | ✅ |
| User Login / Logout | ✅ |
| Application Tracking | ✅ |
| Application Details | ✅ |
| Interview Rounds | ✅ |
| Interview Scores | ✅ |
| Dashboard | ✅ |
| Analytics | ✅ |
| Company Analysis | ✅ |
| Interview-Type Analysis | ✅ |
| Performance Focus | ✅ |
| Resume Analyzer | 🔜 |
| Job Matching | 🔜 |
| Skill Gap Analysis | 🔜 |
| AI Career Assistant | 🔜 |

</div>

---

# Roadmap

## Phase 1 — Job Tracking

- [x] Authentication
- [x] Application management
- [x] Application status
- [x] Interview rounds
- [x] Interview scores
- [x] Dashboard
- [x] Analytics

## Phase 2 — Advanced Job Management

- [ ] Search applications
- [ ] Filter by company
- [ ] Filter by status
- [ ] Filter by role
- [ ] Sort applications
- [ ] Edit applications
- [ ] Edit interview rounds
- [ ] Complete application history
- [ ] Target role / career goal

## Phase 3 — Resume Intelligence

- [ ] Resume upload
- [ ] Resume text extraction
- [ ] Resume section analysis
- [ ] Resume improvement suggestions
- [ ] Job Description input
- [ ] Job Description analysis
- [ ] Resume ↔ JD comparison
- [ ] Match percentage
- [ ] Matched skills
- [ ] Missing skills
- [ ] Missing keywords

## Phase 4 — Career Intelligence

- [ ] Skill-gap analysis
- [ ] Personalized skill roadmap
- [ ] Target-role analysis
- [ ] Job suitability score
- [ ] Personalized preparation plan
- [ ] Interview preparation
- [ ] Performance trends
- [ ] Job recommendations

## Phase 5 — AI-Powered JobFit

- [ ] AI resume feedback
- [ ] AI job-fit explanation
- [ ] AI interview preparation
- [ ] AI skill recommendations
- [ ] AI learning roadmap
- [ ] Personalized career assistant

---

# Future Scope

The long-term goal is to evolve JobFit from a **job application tracker** into a **personal career intelligence platform**.

### Future User Journey

```text
        ┌──────────────┐
        │    RESUME    │
        └──────┬───────┘
               ↓
        ┌──────────────┐
        │   JOB / JD   │
        └──────┬───────┘
               ↓
        ┌──────────────┐
        │  JOB MATCH   │
        └──────┬───────┘
               ↓
        ┌──────────────┐
        │    APPLY     │
        └──────┬───────┘
               ↓
        ┌──────────────┐
        │  INTERVIEW   │
        └──────┬───────┘
               ↓
        ┌──────────────┐
        │   ANALYZE    │
        └──────┬───────┘
               ↓
        ┌──────────────┐
        │  SKILL GAP   │
        └──────┬───────┘
               ↓
        ┌──────────────┐
        │   ROADMAP    │
        └──────┬───────┘
               ↓
        ┌──────────────┐
        │   GET HIRED  │
        └──────────────┘
```

### Planned Intelligence

| Future Feature | Purpose |
|---|---|
| **Resume Analyzer** | Identify resume weaknesses |
| **JD Analyzer** | Extract job requirements |
| **Resume ↔ JD Match** | Measure suitability for a role |
| **Skill Gap Analysis** | Identify missing skills |
| **Career Goal** | Personalize recommendations |
| **Skill Roadmap** | Suggest what to learn next |
| **Interview Preparation** | Prepare for target roles |
| **Performance Trends** | Track improvement over time |
| **Job Recommendations** | Find better-fit opportunities |
| **AI Assistant** | Provide personalized career guidance |

---

# Future Resume & Job Matching

One of the major planned features is comparing a user's resume against a specific job description.

```text
                    RESUME
                      │
                      ▼
             ┌─────────────────┐
             │ Resume Analyzer │
             └────────┬────────┘
                      │
                      │
JOB DESCRIPTION ──────┤
                      ▼
             ┌─────────────────┐
             │  Job Analyzer   │
             └────────┬────────┘
                      │
                      ▼
             ┌─────────────────┐
             │  Match Engine   │
             └────────┬────────┘
                      │
          ┌───────────┼───────────┐
          ▼           ▼           ▼
       Matched      Missing     Partial
       Skills       Skills      Matches
```

---

# Example Future Job Match

```text
Target Role: Java Developer

                JOB MATCH
                   82%
             ───────────────

Matched Skills
✓ Java
✓ OOP
✓ SQL
✓ JDBC
✓ Git

Needs Improvement
△ Spring Boot
△ REST API
△ React

Suggested Next Step
→ Strengthen Spring Boot + REST API
```

---

# Example Skill Gap Analysis

```text
Target Role: Java Developer

Skill               Current Level       Target Level
────────────────────────────────────────────────────
Java                 ██████████  Strong     ██████████
SQL                  ████████    Good       █████████
JDBC                 ████████    Good       █████████
Git                  ███████     Good       ████████
REST API             █████       Basic      █████████
Spring Boot          ███         Beginner   █████████
React                ██          Beginner   ███████
```

---

# Example Personalized Roadmap

```text
TARGET ROLE
Java Developer
      │
      ▼
Core Java
      │
      ▼
OOP + Collections
      │
      ▼
SQL + JDBC
      │
      ▼
REST APIs
      │
      ▼
Spring Boot
      │
      ▼
Git + GitHub
      │
      ▼
Projects
      │
      ▼
Interview Preparation
```

---

# AI Career Assistant — Future

A future version may provide personalized recommendations based on:

```text
Resume
  +
Job Description
  +
Application History
  +
Interview Scores
  +
Target Role
  +
Skill Gaps
       │
       ▼
  AI Career Assistant
       │
       ▼
Personalized Guidance
```

Example:

> "Your technical interview scores are strong, but your communication scores are consistently lower. Focus on mock HR interviews and communication practice before your next interview."

Possible future capabilities:

- Resume feedback
- Job-fit explanation
- Interview preparation
- Skill recommendations
- Career roadmap
- Learning suggestions
- Personalized interview feedback
- Target-role preparation

---

# Security Considerations

This project is currently intended as an educational and portfolio application.

For production deployment, the following improvements would be required:

| Area | Production Improvement |
|---|---|
| Passwords | Secure password hashing |
| Database | Environment-based credentials |
| Sessions | Secure session configuration |
| Input | Strong validation and sanitization |
| SQL | Prepared statements |
| HTTPS | Encrypted communication |
| Authorization | Strong user-level access control |
| Secrets | Never store credentials in source code |

---

# Setup

## Requirements

- JDK 17+
- Eclipse IDE
- Apache Tomcat 10.1
- MySQL Server
- MySQL Workbench
- Maven

## Clone Repository

```bash
git clone https://github.com/soniya7788/JobFit.git
cd JobFit
```

## Create Database

Open MySQL Workbench:

```sql
CREATE DATABASE jobfit;
USE jobfit;
```

Create the required tables:

```text
users
applications
interview_rounds
```

## Configure Database Connection

Open:

```text
src/main/java/com/jobfit/DBConnection.java
```

Configure your local database credentials:

```java
private static final String URL =
        "jdbc:mysql://localhost:3306/jobfit";

private static final String USER = "root";

private static final String PASSWORD =
        "YOUR_PASSWORD";
```

> Never commit your real database password to a public repository.

## Run the Application

1. Import the project into Eclipse as a Maven project.
2. Configure JDK 17 or later.
3. Configure Apache Tomcat 10.1.
4. Update Maven dependencies.
5. Add JobFit to Tomcat.
6. Start the Tomcat server.

Open:

```text
http://localhost:8080/JobFit/
```

---

# Git Workflow

```text
                    Local Project
                         │
                         ▼
                      git add
                         │
                         ▼
                    git commit
                         │
                         ▼
                     git push
                         │
                         ▼
                       GitHub
```

Typical workflow:

```bash
git add .
git commit -m "Update JobFit features"
git push
```

---

# Why JobFit?

Most job platforms mainly focus on:

```text
Find Job → Apply
```

JobFit is designed around the complete journey:

```text
Find
 ↓
Apply
 ↓
Track
 ↓
Interview
 ↓
Record
 ↓
Analyze
 ↓
Improve
 ↓
Apply Better
 ↓
Get Hired
```

The central idea is:

> **Every interview should teach you something about your next one.**

---

# Learning & Technical Experience

This project provides practical experience with:

| Area | Experience |
|---|---|
| Programming | Java |
| Web | JSP, HTML, CSS, JavaScript |
| Backend | Jakarta Servlets |
| Database | MySQL |
| Database Access | JDBC |
| Build | Maven |
| Server | Apache Tomcat |
| IDE | Eclipse |
| Version Control | Git & GitHub |
| Application Design | Web application architecture |
| Data | Analytics and performance visualization |

---

# Project Status

<div align="center">

### 🚧 Actively Developing

JobFit currently focuses on:

**Application Tracking → Interview Management → Performance Analytics**

The next major direction is:

**Resume Intelligence → Job Matching → Skill Gap Analysis**

followed by:

**Personalized AI-Powered Career Guidance**

<br>

### Track → Analyze → Improve → Get Hired

</div>

---

# Author

<div align="center">

## Soniya Yadav

**B.Tech Computer Science & Engineering**

Java Developer • Web Development • Database Applications

Building practical software projects and continuously improving development skills.

<br>

<a href="https://github.com/soniya7788">
<img src="https://img.shields.io/badge/GitHub-soniya7788-181717?style=for-the-badge&logo=github&logoColor=white">
</a>

</div>

---

<div align="center">

## JobFit

### A smarter way to understand your job-search journey.

**Track your applications.**

**Understand your performance.**

**Improve your chances.**

</div>
