<div align="center">

# JobFit

### Track. Analyze. Improve. Get Hired.

**A job application and interview performance platform built for students and freshers.**

<br>

<img src="https://img.shields.io/badge/Java-17%2B-orange?style=for-the-badge&logo=openjdk&logoColor=white">
<img src="https://img.shields.io/badge/JSP-Servlets-0B5CAD?style=for-the-badge&logo=java&logoColor=white">
<img src="https://img.shields.io/badge/JDBC-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/MySQL-9.x-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white">
<img src="https://img.shields.io/badge/Tomcat-10.1-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black">

<br>

<img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/Eclipse-IDE-2C2255?style=for-the-badge&logo=eclipseide&logoColor=white">
<img src="https://img.shields.io/badge/Git-GitHub-F05032?style=for-the-badge&logo=git&logoColor=white">

<br><br>

<img src="https://img.shields.io/badge/Status-Active%20Development-2563EB?style=flat-square">
<img src="https://img.shields.io/badge/Architecture-Java%20Web%20App-0B5CAD?style=flat-square">

</div>

---

## About

JobFit is a Java-based web application for managing the job-search journey of students and freshers.

It brings **applications, interview rounds, results and performance analysis** into one place.

```text
Apply → Track → Interview → Record → Analyze → Improve
```

The long-term goal is to evolve JobFit into a **personal career intelligence platform** with resume analysis, job matching, skill-gap detection and personalized career guidance.

---

## Project Screenshots

### Authentication

| Login | Register |
|---|---|
| <img src="[Screenshot%202026-10-08%20135346.png](https://github.com/soniya7788/project-sc/blob/main/Screenshot%202026-10-08%20135424.png?raw=true)" width="100%"> | <img src="[Screenshot%202026-10-08%20135424.png](https://github.com/soniya7788/project-sc/blob/main/Screenshot%202026-10-08%20135346.png?raw=true)" width="100%"> |

### Main Dashboard

<img src="[localhost_8080_JobFit_dashboard.png](https://github.com/soniya7788/project-sc/blob/main/localhost_8080_JobFit_dashboard.png?raw=true)" width="100%">

### Applications

<img src="localhost_8080_JobFit_applications.png" width="100%">

### Add Application

<img src="localhost_8080_JobFit_add-application.jsp.png" width="100%">

### Application Details & Interview Journey

<img src="localhost_8080_JobFit_application-details_id=11.png" width="100%">

### Add Interview Round

<img src="localhost_8080_JobFit_add-round.jsp_applicationId=2.png" width="100%">

### Analytics

<img src="localhost_8080_JobFit_analytics.png" width="100%">

---

# Current Features

| Feature | Status |
|---|:---:|
| User Registration & Login | ✅ |
| Session Management | ✅ |
| Job Application Tracking | ✅ |
| Application Status | ✅ |
| Application Details | ✅ |
| Interview Round Management | ✅ |
| Interview Scores & Results | ✅ |
| Interview Journey | ✅ |
| Dashboard | ✅ |
| Application Pipeline | ✅ |
| Interview Pipeline | ✅ |
| Performance Analytics | ✅ |
| Interview-Type Analysis | ✅ |
| Company-Wise Analysis | ✅ |
| Performance Focus Indicators | ✅ |

---

# Technical Architecture

```text
                         JOBFIT
                            │
             ┌──────────────┴──────────────┐
             │                             │
          Frontend                      Backend
             │                             │
      JSP / HTML / CSS              Jakarta Servlets
      JavaScript                          │
             │                            │
             └──────────────┬─────────────┘
                            │
                           JDBC
                            │
                            ▼
                     ┌─────────────┐
                     │    MySQL    │
                     └─────────────┘
```

### Request Flow

```text
Browser
   │
   ▼
JSP / HTML Form
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
JSP Response
   │
   ▼
Browser
```

---

# Project Structure

```text
JobFit/
│
├── src/
│   └── main/
│       │
│       ├── java/
│       │   └── com/
│       │       └── jobfit/
│       │           │
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
│           │
│           ├── index.jsp
│           ├── login.jsp
│           ├── register.jsp
│           ├── dashboard.jsp
│           ├── applications.jsp
│           ├── application-details.jsp
│           ├── add-application.jsp
│           ├── add-round.jsp
│           ├── analytics.jsp
│           │
│           ├── css/
│           │   └── style.css
│           │
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

### Main Layers

| Layer | Responsibility |
|---|---|
| `JSP` | User interface |
| `Servlets` | Request handling and application logic |
| `JDBC` | Database communication |
| `MySQL` | Persistent data storage |
| `CSS / JavaScript` | UI styling and interaction |
| `Maven` | Dependency and build management |
| `Tomcat` | Web application server |

---

# Database Structure

JobFit currently uses three core tables.

```text
┌────────────────────┐
│       users        │
├────────────────────┤
│ PK id              │
│ name               │
│ email              │
│ password           │
│ created_at         │
└─────────┬──────────┘
          │
          │ 1 : N
          ▼
┌────────────────────┐
│   applications     │
├────────────────────┤
│ PK id              │
│ FK user_id         │
│ company_name       │
│ job_role           │
│ role_description   │
│ location           │
│ job_type           │
│ application_date   │
│ job_url            │
│ source             │
│ status             │
│ notes              │
│ created_at         │
└─────────┬──────────┘
          │
          │ 1 : N
          ▼
┌────────────────────┐
│ interview_rounds   │
├────────────────────┤
│ PK id              │
│ FK application_id  │
│ round_number       │
│ round_name         │
│ round_type         │
│ other_round_type   │
│ round_description  │
│ round_date         │
│ status             │
│ score              │
│ skills             │
│ what_went_well     │
│ improvement_notes  │
└────────────────────┘
```

### Relationships

```text
One User
   │
   ├── Application
   │      ├── Interview Round
   │      ├── Interview Round
   │      └── Interview Round
   │
   ├── Application
   │      └── Interview Round
   │
   └── Application
          ├── Interview Round
          └── Interview Round
```

### Database Responsibility

| Table | Stores |
|---|---|
| `users` | User accounts |
| `applications` | Job and application information |
| `interview_rounds` | Round details, scores, skills and outcomes |

---

# Application & Interview Flow

```text
                    JOB APPLICATION
                          │
                          ▼
                       Applied
                          │
                          ▼
                    Interviewing
                          │
             ┌────────────┼────────────┐
             ▼            ▼            ▼
          Round 1      Round 2      Round 3
             │            │            │
             ▼            ▼            ▼
          Result       Result       Result
             │            │            │
             └────────────┼────────────┘
                          ▼
                 Offer / Rejected
```

### Interview Round Status

```text
Pending
   │
   ▼
Scheduled
   │
   ├──────────────► Cleared
   │
   └──────────────► Not Cleared
```

---

# Analytics Approach

JobFit uses different representations depending on the data being shown.

| Data Context | Representation |
|---|---|
| Overall KPIs | Metric Cards |
| Application Status | Pipeline / Distribution |
| Interview Status | Round Pipeline |
| Interview-Type Performance | Horizontal Bars |
| Company Performance | Comparison Cards |
| Application Journey | Timeline / Journey |
| Weak Areas | Focus Indicators |
| Future Historical Data | Trend Charts |

This keeps the analytics page focused on **understanding patterns**, rather than displaying everything as a plain table.

---

# Development Roadmap

## Phase 1 — Application & Interview Tracking

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
- [ ] Filter by role
- [ ] Filter by status
- [ ] Sort applications
- [ ] Edit applications
- [ ] Edit interview rounds
- [ ] Application history
- [ ] Timeline view
- [ ] Target role / career goal

## Phase 3 — Resume Intelligence

- [ ] Resume upload
- [ ] Resume text extraction
- [ ] Resume section analysis
- [ ] Resume improvement suggestions
- [ ] Job Description input
- [ ] Job Description analysis
- [ ] Important keyword extraction
- [ ] Resume ↔ JD comparison

## Phase 4 — Job Matching

- [ ] Job match percentage
- [ ] Matched skills
- [ ] Missing skills
- [ ] Partially matched skills
- [ ] Missing keywords
- [ ] Job suitability score
- [ ] Role-specific recommendations

## Phase 5 — Career Intelligence

- [ ] Skill-gap analysis
- [ ] Target-role analysis
- [ ] Personalized skill roadmap
- [ ] Interview preparation
- [ ] Performance trends
- [ ] Learning recommendations
- [ ] Job recommendations

## Phase 6 — AI-Powered JobFit

- [ ] AI resume feedback
- [ ] AI job-fit explanation
- [ ] AI interview preparation
- [ ] AI skill recommendations
- [ ] AI learning roadmap
- [ ] Personalized career assistant

---

# Future Scope

The future direction of JobFit is to move from **tracking** to **personalized career guidance**.

```text
                         FUTURE JOBFIT

                            Resume
                              │
                              ▼
                       Resume Analysis
                              │
                              ▼
                       Job Description
                              │
                              ▼
                         Job Matching
                              │
                              ▼
                           Apply
                              │
                              ▼
                         Interview
                              │
                              ▼
                          Analytics
                              │
                              ▼
                         Skill Gaps
                              │
                              ▼
                      Learning Roadmap
                              │
                              ▼
                    Personalized Guidance
                              │
                              ▼
                         Get Hired
```

### Planned Future Modules

| Module | Goal |
|---|---|
| **Resume Analyzer** | Evaluate resume sections and identify improvements |
| **JD Analyzer** | Extract skills, requirements and keywords from a job description |
| **Resume ↔ JD Match** | Compare a resume with a specific job |
| **Skill Gap Engine** | Identify skills missing for the target role |
| **Career Goal** | Let users define their desired role |
| **Skill Roadmap** | Generate a personalized learning direction |
| **Interview Preparation** | Prepare according to the target role |
| **Performance Trends** | Track improvement across interviews |
| **Job Recommendations** | Recommend roles based on user profile |
| **AI Career Assistant** | Provide personalized career guidance |

---

# Example Future Job Match

```text
Target Role: Java Developer

              JOB MATCH
                 82%
          ───────────────

Matched
✓ Java
✓ OOP
✓ SQL
✓ JDBC
✓ Git

Needs Improvement
△ Spring Boot
△ REST API
△ React

Next Focus
→ Strengthen Spring Boot + REST API
```

---

# Example Future Skill Roadmap

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

# Example Future AI Flow

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
┌──────────────────────┐
│  AI Career Assistant │
└──────────┬───────────┘
           │
           ▼
Personalized Suggestions
```

Possible future recommendations:

> Improve REST API knowledge before applying to similar Java Developer roles.

> Your technical performance is strong, but communication scores are comparatively lower.

> Add Spring Boot projects to strengthen your profile for this target role.

---

# Setup & Installation

### Requirements

| Requirement | Version / Tool |
|---|---|
| Java | JDK 17+ |
| IDE | Eclipse |
| Server | Apache Tomcat 10.1 |
| Database | MySQL |
| Database Tool | MySQL Workbench |
| Build Tool | Maven |
| Version Control | Git |

### Clone

```bash
git clone https://github.com/soniya7788/JobFit.git
cd JobFit
```

### Database

Create the database in MySQL:

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

### Database Configuration

Open:

```text
src/main/java/com/jobfit/DBConnection.java
```

Configure your local MySQL credentials:

```java
private static final String URL =
        "jdbc:mysql://localhost:3306/jobfit";

private static final String USER = "root";

private static final String PASSWORD =
        "YOUR_PASSWORD";
```

> Never commit real database credentials to a public repository.

### Run

1. Import the project into Eclipse as a Maven project.
2. Configure JDK 17 or later.
3. Configure Apache Tomcat 10.1.
4. Update Maven dependencies.
5. Add JobFit to the Tomcat server.
6. Start the server.

Open:

```text
http://localhost:8080/JobFit/
```

---

# Security Notes

The current project is primarily an educational and portfolio application.

For production deployment, the following should be strengthened:

| Area | Production Improvement |
|---|---|
| Authentication | Secure password hashing |
| Credentials | Environment variables / secret management |
| Sessions | Secure session configuration |
| Input | Strong validation and sanitization |
| SQL | Prepared statements |
| Transport | HTTPS |
| Authorization | User-level access control |
| Secrets | Never commit credentials |

---

# Git Workflow

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

Typical update:

```bash
git add .
git commit -m "Update JobFit features"
git push
```

---

# Why JobFit?

Traditional job-search flow:

```text
Find Job → Apply → Wait → Repeat
```

JobFit aims for:

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

> **Every interview should teach you something about your next one.**

---

# Learning Outcomes

This project provides hands-on experience with:

| Area | Technologies / Concepts |
|---|---|
| Programming | Java |
| Frontend | JSP, HTML, CSS, JavaScript |
| Backend | Jakarta Servlets |
| Database | MySQL, SQL |
| Connectivity | JDBC |
| Build | Maven |
| Server | Apache Tomcat |
| IDE | Eclipse |
| Version Control | Git, GitHub |
| Web Concepts | HTTP, Sessions, Request/Response |
| Application Design | Java Web Architecture |
| Analytics | Performance metrics and visualizations |

---

# Project Status

<div align="center">

### 🚧 Active Development

| Current | Next |
|---|---|
| Application Tracking | Resume Analysis |
| Interview Management | Job Matching |
| Dashboard | Skill Gap Analysis |
| Analytics | Career Roadmap |
| Performance Insights | AI Career Guidance |

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

**Track your applications.  
Understand your performance.  
Improve your chances.**

</div>
