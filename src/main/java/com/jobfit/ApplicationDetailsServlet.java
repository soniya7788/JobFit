package com.jobfit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/application-details")
public class ApplicationDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        String idParameter = request.getParameter("id");

        if (idParameter == null || idParameter.isBlank()) {
            response.sendRedirect("applications");
            return;
        }

        int applicationId;

        try {
            applicationId = Integer.parseInt(idParameter);
        } catch (NumberFormatException e) {
            response.sendRedirect("applications");
            return;
        }

        Map<String, Object> application = new HashMap<>();
        List<Map<String, Object>> rounds = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String applicationSql =
                "SELECT * FROM applications WHERE id = ? AND user_id = ?";

            try (PreparedStatement ps = con.prepareStatement(applicationSql)) {
                ps.setInt(1, applicationId);
                ps.setInt(2, userId);

                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) {
                        response.sendRedirect("applications");
                        return;
                    }

                    String company = rs.getString("company_name");
                    String role = rs.getString("job_role");
                    String jobType = rs.getString("job_type");
                    String location = rs.getString("location");
                    String status = rs.getString("status");
                    String description = rs.getString("role_description");

                    int focusScore = JobFitScore.calculate(
                        company, role, jobType, location, status, description
                    );

                    application.put("id", rs.getInt("id"));
                    application.put("company", company);
                    application.put("role", role);
                    application.put("roleDescription", description);
                    application.put("location", location);
                    application.put("jobType", jobType);
                    application.put("date", rs.getDate("application_date"));
                    application.put("url", rs.getString("job_url"));
                    application.put("source", rs.getString("source"));
                    application.put("status", status);
                    application.put("notes", rs.getString("notes"));
                    application.put("focusScore", focusScore);
                    application.put("focusLabel", JobFitScore.label(focusScore));
                    application.put("focusClass", JobFitScore.cssClass(focusScore));
                }
            }

            String roundSql =
                "SELECT * FROM interview_rounds " +
                "WHERE application_id = ? " +
                "ORDER BY round_number ASC, id ASC";

            try (PreparedStatement ps = con.prepareStatement(roundSql)) {
                ps.setInt(1, applicationId);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Map<String, Object> round = new HashMap<>();

                        round.put("id", rs.getInt("id"));
                        round.put("number", rs.getInt("round_number"));
                        round.put("name", rs.getString("round_name"));
                        round.put("type", rs.getString("round_type"));
                        round.put("description", rs.getString("round_description"));
                        round.put("date", rs.getDate("round_date"));
                        round.put("status", rs.getString("status"));
                        round.put("score", rs.getObject("score"));
                        round.put("skills", rs.getString("skills"));
                        round.put("wentWell", rs.getString("what_went_well"));
                        round.put("improvement", rs.getString("improvement_notes"));

                        rounds.add(round);
                    }
                }
            }

            request.setAttribute("application", application);
            request.setAttribute("rounds", rounds);

            request.getRequestDispatcher("application-details.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("Details Error: " + e.getMessage());
        }
    }
}
