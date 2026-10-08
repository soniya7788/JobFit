package com.jobfit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/application")
public class ApplicationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("applications");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        int userId = (Integer) session.getAttribute("userId");

        String companyName = request.getParameter("companyName");
        String jobRole = request.getParameter("jobRole");
        String otherRole = request.getParameter("otherRole");
        String roleDescription = request.getParameter("roleDescription");
        String location = request.getParameter("location");
        String jobType = request.getParameter("jobType");
        String otherJobType = request.getParameter("otherJobType");
        String applicationDate = request.getParameter("applicationDate");
        String jobUrl = request.getParameter("jobUrl");
        String source = request.getParameter("source");
        String otherSource = request.getParameter("otherSource");
        String notes = request.getParameter("notes");

        if ("Other".equals(jobRole) && otherRole != null && !otherRole.isBlank()) {
            jobRole = otherRole.trim();
        }

        if ("Other".equals(jobType) && otherJobType != null && !otherJobType.isBlank()) {
            jobType = otherJobType.trim();
        }

        if ("Other".equals(source) && otherSource != null && !otherSource.isBlank()) {
            source = otherSource.trim();
        }

        String[] roundNames = request.getParameterValues("initialRoundName");
        String[] roundTypes = request.getParameterValues("initialRoundType");
        String[] otherRoundTypes = request.getParameterValues("initialOtherRoundType");
        String[] roundDates = request.getParameterValues("initialRoundDate");

        String applicationSql =
            "INSERT INTO applications " +
            "(user_id, company_name, job_role, role_description, location, job_type, " +
            "other_job_type, application_date, job_url, source, other_source, status, notes) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        String roundSql =
            "INSERT INTO interview_rounds " +
            "(application_id, round_number, round_name, round_type, other_round_type, " +
            "round_description, round_date, status, score, skills, what_went_well, improvement_notes) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection()) {

            con.setAutoCommit(false);

            try {
                int applicationId;

                try (PreparedStatement ps =
                         con.prepareStatement(applicationSql, Statement.RETURN_GENERATED_KEYS)) {

                    ps.setInt(1, userId);
                    ps.setString(2, companyName);
                    ps.setString(3, jobRole);
                    ps.setString(4, roleDescription);
                    ps.setString(5, location);
                    ps.setString(6, jobType);
                    ps.setString(7, otherJobType);

                    if (applicationDate == null || applicationDate.isBlank()) {
                        ps.setNull(8, java.sql.Types.DATE);
                    } else {
                        ps.setDate(8, java.sql.Date.valueOf(applicationDate));
                    }

                    ps.setString(9, jobUrl);
                    ps.setString(10, source);
                    ps.setString(11, otherSource);
                    ps.setString(12, "Applied");
                    ps.setString(13, notes);

                    ps.executeUpdate();

                    try (ResultSet keys = ps.getGeneratedKeys()) {
                        if (!keys.next()) {
                            throw new java.sql.SQLException("Could not retrieve application ID.");
                        }
                        applicationId = keys.getInt(1);
                    }
                }

                if (roundNames != null && roundTypes != null) {
                    try (PreparedStatement ps = con.prepareStatement(roundSql)) {

                        int roundNumber = 1;

                        for (int i = 0; i < roundTypes.length; i++) {

                            String type = valueAt(roundTypes, i);
                            String name = valueAt(roundNames, i);
                            String otherType = valueAt(otherRoundTypes, i);
                            String date = valueAt(roundDates, i);

                            if (type.isBlank() && name.isBlank()) {
                                continue;
                            }

                            if ("Other".equals(type) && !otherType.isBlank()) {
                                type = otherType;
                            }

                            String status = date.isBlank() ? "Pending" : "Scheduled";

                            ps.setInt(1, applicationId);
                            ps.setInt(2, roundNumber++);
                            ps.setString(3, name.isBlank() ? type : name);
                            ps.setString(4, type);
                            ps.setString(5, otherType);
                            ps.setString(6, "");
                            if (date.isBlank()) {
                                ps.setNull(7, java.sql.Types.DATE);
                            } else {
                                ps.setDate(7, java.sql.Date.valueOf(date));
                            }
                            ps.setString(8, status);
                            ps.setNull(9, java.sql.Types.INTEGER);
                            ps.setString(10, "");
                            ps.setString(11, "");
                            ps.setString(12, "");

                            ps.executeUpdate();
                        }
                    }
                }

                con.commit();
                response.sendRedirect("applications?success=added");

            } catch (Exception e) {
                con.rollback();
                throw e;
            } finally {
                con.setAutoCommit(true);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("Application Error: " + e.getMessage());
        }
    }

    private String valueAt(String[] values, int index) {
        if (values == null || index >= values.length || values[index] == null) {
            return "";
        }
        return values[index].trim();
    }
}
