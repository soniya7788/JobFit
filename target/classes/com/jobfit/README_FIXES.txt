JOBFIT UI + DATA FIX PACK
=========================

Replace the existing files with the versions in this package.

UPDATED:
- JobFitScore.java
- ApplicationServlet.java
- ApplicationsServlet.java
- ApplicationDetailsServlet.java
- DashboardServlet.java
- AnalyticsServlet.java
- RoundServlet.java
- add-application.jsp
- add-round.jsp
- applications.jsp
- application-details.jsp
- dashboard.jsp
- analytics.jsp
- style.css

IMPORTANT:
1. The old application-details.jsp expected keys such as company_name and job_role, while ApplicationDetailsServlet was putting company and role into the map. That mismatch caused the visible "null" values.
2. /add-round was a 404 because the project had add-round.jsp but no servlet mapped to /add-round. The new UI links directly to add-round.jsp.
3. The new RoundServlet supports add, status update, and delete actions.
4. Applications now show round count, next pending/scheduled round, and a calculated Focus badge.
5. The application form can create planned interview rounds during application creation.
6. Later, rounds can be added, marked Cleared/Not Cleared, or removed.
7. The AI button is a front-end assistant shell only. It does not call an AI API yet.
8. No database columns are required by this fix pack.

DATABASE ASSUMPTION:
applications must contain:
id, user_id, company_name, job_role, role_description, location,
job_type, other_job_type, application_date, job_url, source,
other_source, status, notes, created_at

interview_rounds must contain:
id, application_id, round_number, round_name, round_type,
other_round_type, round_description, round_date, status, score,
skills, what_went_well, improvement_notes

AFTER COPYING:
- Project > Clean
- Maven > Update Project
- Restart Tomcat
- Hard refresh browser (Ctrl+F5)

The Focus score is a transparent heuristic based on entered company/role/work-mode/location/status information. It is not an AI prediction.
