<div align="center">

# JobFit

### **Track. Analyze. Improve. Get Hired.**

A Java-based job application and interview performance platform built for students and freshers.

<p>
  <img src="https://img.shields.io/badge/Java-17%2B-orange?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java">
  <img src="https://img.shields.io/badge/JSP-Servlets-0B5CAD?style=for-the-badge&logo=java&logoColor=white" alt="JSP Servlets">
  <img src="https://img.shields.io/badge/JDBC-Database%20Layer-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="JDBC">
  <img src="https://img.shields.io/badge/MySQL-9.x-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
</p>

<p>
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" alt="HTML5">
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS3">
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JavaScript">
  <img src="https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white" alt="Maven">
  <img src="https://img.shields.io/badge/Apache%20Tomcat-10.1-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black" alt="Apache Tomcat">
  <img src="https://img.shields.io/badge/Eclipse-IDE-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white" alt="Eclipse">
</p>

<p>
  <img src="https://img.shields.io/badge/Project-Portfolio%20Ready-111827?style=flat-square" alt="Portfolio Ready">
  <img src="https://img.shields.io/badge/Status-In%20Development-2563EB?style=flat-square" alt="Status">
  <img src="https://img.shields.io/badge/Backend-Java%20%2B%20Servlets-0B5CAD?style=flat-square" alt="Backend">
  <img src="https://img.shields.io/badge/Database-MySQL-4479A1?style=flat-square" alt="Database">
</p>

</div>

---

## What is JobFit?

**JobFit** is a web-based platform that helps freshers manage the complete job-search and interview journey in one place.

Instead of keeping applications, interview rounds, scores, results and improvement notes scattered across spreadsheets, notes and messages, JobFit brings them together into a single dashboard.

### The idea in one line

> **Don't just track where you applied — understand how you perform, where you are losing opportunities, and what to improve next.**

---

## Why JobFit?

| Common Problem | JobFit Approach |
|---|---|
| Applications are tracked manually | Centralized application tracking |
| Difficult to remember interview rounds | Round-by-round interview journey |
| Interview results are scattered | Structured scores and outcomes |
| Hard to identify weak areas | Performance analytics |
| No clear view of job-search progress | Dashboard + application pipeline |
| Repeated mistakes across interviews | Improvement notes and focus areas |
| Resume and JD analysis are separate | Planned future Resume ↔ JD matching |
| Freshers don't know what to improve next | Planned skill-gap and career roadmap |

---

## Core Modules

```text
┌───────────────────────────────────────────────────────────┐
│                         JOBFIT                            │
├───────────────────────────────────────────────────────────┤
│                                                           │
│  AUTHENTICATION                                            │
│  Register → Login → Session → Logout                      │
│                                                           │
│  APPLICATIONS                                             │
│  Company → Role → Location → Source → Status → Notes     │
│                                                           │
│  INTERVIEWS                                               │
│  Round → Type → Date → Score → Skills → Result           │
│                                                           │
│  ANALYTICS                                                │
│  Scores → Clearance → Round Performance → Company Data   │
│                                                           │
│  IMPROVEMENT                                              │
│  Performance → Focus Areas → Preparation Direction       │
│                                                           │
└───────────────────────────────────────────────────────────┘
```

---

# Features

## 1. Authentication

- User registration
- User login
- Session-based authentication
- Logout
- User-specific application data

---

## 2. Application Tracking

Store and manage job applications with details such as:

- Company
- Job role
- Role description
- Location
- Work mode
- Application date
- Job source
- Job URL
- Application status
- Notes

### Application lifecycle

```text
Applied
   │
   ▼
Resume Screening
   │
   ▼
Interviewing
   │
   ├──► Rejected
   │
   ├──► On Hold
   │
   └──► Offer
```

---

## 3. Interview Round Management

Each application can contain multiple interview rounds.

Supported round types include:

- Aptitude
- Technical
- Coding
- Communication
- HR
- Managerial
- Custom / Other

Each round can store:

| Data | Purpose |
|---|---|
| Round Number | Interview sequence |
| Round Name | Custom round title |
| Round Type | Aptitude / Technical / HR etc. |
| Date | Interview schedule |
| Status | Pending / Scheduled / Cleared / Not Cleared |
| Score | Performance measurement |
| Skills | Skills tested |
| Description | Round details |
| What Went Well | Positive observations |
| Improvement Notes | Areas to work on |

---

## 4. Interview Journey

Every application can be viewed as a journey rather than just a status.

```text
                    APPLICATION
                         │
                         ▼
                 ┌───────────────┐
                 │    Round 1    │
                 │    Aptitude   │
                 │     78/100    │
                 └───────┬───────┘
                         │
                         ▼
                 ┌───────────────┐
                 │    Round 2    │
                 │   Technical   │
                 │     82/100    │
                 └───────┬───────┘
                         │
                         ▼
                 ┌───────────────┐
                 │    Round 3    │
                 │      HR       │
                 │     74/100    │
                 └───────┬───────┘
                         │
                         ▼
                       RESULT
```

---

## 5. Dashboard

The dashboard provides a quick view of the user's job-search activity.

### Current dashboard insights

- Total applications
- Interviewing applications
- Cleared rounds
- Clearance rate
- Total interview rounds
- Overall interview performance
- Application pipeline
- Interview round pipeline
- Recent applications
- Performance by interview type
- Focus / improvement indicators

### Dashboard data model

```text
Applications
     │
     ├── Applied
     ├── Interviewing
     ├── Offer
     └── Rejected

Interview Rounds
     │
     ├── Pending
     ├── Scheduled
     ├── Cleared
     └── Not Cleared
```

---

## 6. Analytics

The analytics module converts interview history into useful performance information.

### Current analytics

- Total rounds
- Cleared rounds
- Not-cleared rounds
- Pending rounds
- Scheduled rounds
- Average score
- Clearance rate
- Performance by interview type
- Company-wise performance
- Next-step focus

### Why multiple visualizations?

Different data needs different representations.

| Data Context | Representation |
|---|---|
| Overall totals | Metric cards |
| Interview type scores | Horizontal performance bars |
| Round status | Pipeline visualization |
| Company performance | Comparison cards |
| Application status | Pipeline / distribution |
| Individual interview journey | Timeline-style journey |
| Improvement areas | Focus indicators |

The goal is to make the data readable at a glance instead of displaying everything as plain tables.

---

# Technology Stack

<div align="center">

### Frontend

<img src="https://skillicons.dev/icons?i=html,css,js" alt="HTML CSS JavaScript">

### Backend

<img src="https://skillicons.dev/icons?i=java" alt="Java">

**JSP · Jakarta Servlets · JDBC**

### Database

<img src="https://skillicons.dev/icons?i=mysql" alt="MySQL">

### Tools & Runtime

<img src="https://skillicons.dev/icons?i=eclipse,maven,git,github" alt="Eclipse Maven Git GitHub">

**Apache Tomcat 10.1 · MySQL Workbench**

</div>

---

# Architecture

JobFit follows a traditional Java web application architecture using JSP, Servlets and JDBC.

```text
┌──────────────────────────────┐
│          Browser             │
│     HTML / CSS / JS / JSP    │
└──────────────┬───────────────┘
               │ HTTP Request
               ▼
┌──────────────────────────────┐
│       Jakarta Servlets       │
│                              │
│ LoginServlet                 │
│ RegisterServlet              │
│ DashboardServlet             │
│ ApplicationServlet           │
│ ApplicationsServlet          │
│ ApplicationDetailsServlet   │
│ RoundServlet                 │
│ AnalyticsServlet             │
└──────────────┬───────────────┘
               │
               │ JDBC
               ▼
┌──────────────────────────────┐
│       MySQL Database         │
│                              │
│ users                        │
│ applications                │
│ interview_rounds             │
└──────────────────────────────┘
```

---

# Request Flow

```text
User Action
    │
    ▼
JSP Form / Page
    │
    ▼
HTTP Request
    │
    ▼
Servlet
    │
    ▼
JDBC / SQL
    │
    ▼
MySQL
    │
    ▼
Servlet Processing
    │
    ▼
JSP Response
    │
    ▼
Updated UI
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
├── pom.xml
├── .gitignore
└── README.md
```

> The repository intentionally excludes Eclipse-generated project metadata and Maven build output through `.gitignore`.

---

# Database Design

JobFit currently uses three core entities:

```text
┌───────────────┐
│     users     │
├───────────────┤
│ id            │
│ name          │
│ email         │
│ password      │
│ created_at    │
└───────┬───────┘
        │ 1
        │
        │ many
        ▼
┌─────────────────────┐
│    applications     │
├─────────────────────┤
│ id                  │
│ user_id             │
│ company_name        │
│ job_role            │
│ role_description    │
│ location            │
│ job_type            │
│ application_date    │
│ job_url             │
│ source              │
│ status              │
│ notes               │
└──────────┬──────────┘
           │ 1
           │
           │ many
           ▼
┌─────────────────────┐
│  interview_rounds   │
├─────────────────────┤
│ id                  │
│ application_id      │
│ round_number        │
│ round_name          │
│ round_type          │
│ round_date          │
│ status              │
│ score               │
│ skills              │
│ what_went_well      │
│ improvement_notes   │
└─────────────────────┘
```

---

# Application Status

The platform is designed around a clear application pipeline.

```text
              ┌───────────┐
              │  Applied  │
              └─────┬─────┘
                    │
                    ▼
            ┌───────────────┐
            │ Interviewing  │
            └───────┬───────┘
                    │
          ┌─────────┼─────────┐
          ▼         ▼         ▼
       Rejected    Offer    On Hold
```

---

# Interview Status

```text
Pending
   │
   ▼
Scheduled
   │
   ├──────────────► Not Cleared
   │
   └──────────────► Cleared
```

---

# Screenshots

> Add the following images to a `screenshots/` folder in the repository.

### Login

<img src="screenshots/login.png" alt="JobFit Login" width="900">

### Dashboard

<img src="screenshots/dashboard.png" alt="JobFit Dashboard" width="900">

### Applications

<img src="screenshots/applications.png" alt="JobFit Applications" width="900">

### Application Journey

<img src="screenshots/application-details.png" alt="JobFit Application Details" width="900">

### Analytics

<img src="screenshots/analytics.png" alt="JobFit Analytics" width="900">

---

# Setup & Installation

## Requirements

Before running JobFit, install:

- JDK 17 or later
- Eclipse IDE
- Apache Tomcat 10.1
- MySQL Server
- MySQL Workbench
- Maven

---

## 1. Clone the Repository

```bash
git clone https://github.com/soniya7788/JobFit.git
cd JobFit
```

---

## 2. Create the Database

Open MySQL Workbench:

```sql
CREATE DATABASE jobfit;

USE jobfit;
```

Create the required tables before starting the application.

---

## 3. Configure Database Connection

Open:

```text
src/main/java/com/jobfit/DBConnection.java
```

Configure:

```java
private static final String URL =
        "jdbc:mysql://localhost:3306/jobfit";

private static final String USER = "root";

private static final String PASSWORD =
        "YOUR_PASSWORD";
```

> Never commit real database credentials to a public repository.

---

## 4. Import into Eclipse

1. Open Eclipse
2. Import the project as an existing Maven project
3. Select the JobFit project
4. Allow Maven dependencies to download
5. Configure the JDK
6. Add Apache Tomcat 10.1
7. Add JobFit to the Tomcat server
8. Start Tomcat

---

## 5. Open the Application

The application runs through Apache Tomcat.

Typical local URL:

```text
http://localhost:8080/JobFit/
```

---

# Security Note

This project is currently an educational / portfolio application.

For production use, authentication should be strengthened with:

- Password hashing
- Environment-based database credentials
- CSRF protection
- Input validation
- Prepared statements everywhere
- Secure session configuration
- HTTPS
- Proper authorization checks
- Production database configuration

---

# Current Development Status

### Completed

- [x] Project setup with Maven
- [x] Java + JSP + Servlet architecture
- [x] MySQL connectivity
- [x] User registration
- [x] User login
- [x] Session management
- [x] Logout
- [x] Dashboard
- [x] Application creation
- [x] Application listing
- [x] Application details
- [x] Interview round creation
- [x] Interview round tracking
- [x] Interview scores
- [x] Interview results
- [x] Application pipeline
- [x] Interview pipeline
- [x] Performance calculations
- [x] Interview-type analytics
- [x] Company-wise analytics
- [x] Improvement / focus indicators
- [x] Responsive UI styling

---

# Roadmap

## Phase 1 — Job Tracking

- [x] Authentication
- [x] Applications
- [x] Application status
- [x] Interview rounds
- [x] Interview scores
- [x] Dashboard
- [x] Analytics

## Phase 2 — Better Job Management

- [ ] Search applications
- [ ] Filter by status
- [ ] Filter by role
- [ ] Filter by company
- [ ] Sort applications
- [ ] Edit applications
- [ ] Edit interview rounds
- [ ] Complete application history
- [ ] Career goal / target role

## Phase 3 — Resume Intelligence

- [ ] Resume upload
- [ ] Resume text extraction
- [ ] Resume section analysis
- [ ] Resume improvement suggestions
- [ ] Job Description input
- [ ] Job Description analysis
- [ ] Resume ↔ JD comparison
- [ ] Match percentage
- [ ] Missing keywords
- [ ] Matched skills
- [ ] Missing skills

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
- [ ] AI personalized career assistant
- [ ] AI skill recommendations
- [ ] AI learning roadmap
- [ ] Personalized career insights

---

# Future Vision

JobFit is planned to evolve from a **job application tracker** into a **personal career intelligence platform**.

```text
                    ┌──────────────┐
                    │    RESUME    │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │  JOB / JD    │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │  JOB MATCH   │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   APPLY      │
                    └──────┬───────┘
                           │
                           ▼
              ┌─────────────────────────┐
              │    INTERVIEW ROUNDS     │
              └────────────┬────────────┘
                           │
                           ▼
              ┌─────────────────────────┐
              │       ANALYTICS         │
              └────────────┬────────────┘
                           │
                           ▼
              ┌─────────────────────────┐
              │      SKILL GAPS         │
              └────────────┬────────────┘
                           │
                           ▼
              ┌─────────────────────────┐
              │    LEARNING ROADMAP     │
              └────────────┬────────────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   GET HIRED  │
                    └──────────────┘
```

### The final direction

**Resume → Match → Apply → Interview → Analyze → Improve → Prepare → Get Hired**

---

# Design Philosophy

JobFit is designed around three principles:

### 01 — Track

Keep the complete job-search journey organized.

### 02 — Understand

Turn application and interview history into useful information.

### 03 — Improve

Use that information to identify weaknesses and guide preparation.

```text
TRACK  ─────────►  UNDERSTAND  ─────────►  IMPROVE
  │                    │                      │
  ▼                    ▼                      ▼
Jobs               Analytics              Skills
Rounds             Scores                 Roadmap
Results            Trends                 Preparation
```

---

# What Makes JobFit Different?

Job portals primarily help users **find and apply for jobs**.

JobFit is designed to help users understand what happens **after applying**.

```text
Traditional Job Search

Find Job → Apply → Wait → Repeat


JobFit

Find Job
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
Find Weakness
   ↓
Improve
   ↓
Apply Better
```

---

# Learning Outcomes

This project provides practical experience with:

- Java web development
- JSP
- Jakarta Servlets
- JDBC
- SQL and relational databases
- CRUD operations
- HTTP request/response flow
- Session management
- MVC-style separation
- Maven dependency management
- Apache Tomcat
- Frontend development
- Data visualization concepts
- Git and GitHub
- Software project structure
- Debugging and deployment concepts

---

# Git Workflow

The project is maintained using Git and GitHub.

```text
Local Eclipse Project
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

---

# Project Status

<div align="center">

### 🚧 Actively Developing

JobFit is an evolving portfolio project.  
The current version focuses on application tracking, interview management and performance analytics.

Future versions will expand into resume intelligence, job matching, skill-gap analysis and AI-powered career guidance.

</div>

---

# Author

<div align="center">

## Soniya Yadav

**B.Tech Computer Science & Engineering**

Java Developer · Web Development · Database Applications

Building practical software projects and continuously improving development skills.

</div>

---

# Repository

**JobFit — Job Application & Career Improvement Platform**

Built with:

**Java · JSP · Jakarta Servlets · JDBC · MySQL · HTML · CSS · JavaScript · Maven · Apache Tomcat**

---

<div align="center">

### Track your applications. Understand your performance. Improve your chances.

**JobFit**

</div>
