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

@WebServlet("/applications")
public class ApplicationsServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int userId =
                ((Number)session.getAttribute("userId"))
                .intValue();

        List<Map<String,Object>> applications =
                new ArrayList<>();


        String sql =
            "SELECT a.id, a.company_name, a.job_role, " +
            "a.role_description, a.location, a.job_type, " +
            "a.application_date, a.status, " +

            "(SELECT COUNT(*) " +
            " FROM interview_rounds r " +
            " WHERE r.application_id = a.id) " +
            "AS round_count, " +

            "(SELECT MIN(r2.round_number) " +
            " FROM interview_rounds r2 " +
            " WHERE r2.application_id = a.id " +
            " AND r2.status IN ('Pending','Scheduled')) " +
            "AS next_round " +

            "FROM applications a " +
            "WHERE a.user_id = ? " +
            "ORDER BY a.created_at DESC";


        try (
            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql)
        ) {

            ps.setInt(1,userId);

            try (ResultSet rs =
                    ps.executeQuery()) {

                while (rs.next()) {

                    String company =
                        rs.getString("company_name");

                    String role =
                        rs.getString("job_role");

                    String jobType =
                        rs.getString("job_type");

                    String location =
                        rs.getString("location");

                    String status =
                        rs.getString("status");

                    String description =
                        rs.getString("role_description");


                    int focusScore =
                        JobFitScore.calculate(
                            company,
                            role,
                            jobType,
                            location,
                            status,
                            description
                        );


                    Map<String,Object> app =
                            new HashMap<>();

                    app.put("id",
                            rs.getInt("id"));

                    app.put("company",
                            company);

                    app.put("role",
                            role);

                    app.put("location",
                            location);

                    app.put("jobType",
                            jobType);

                    app.put("date",
                            rs.getDate("application_date"));

                    app.put("status",
                            status);

                    app.put(
                        "roundCount",
                        rs.getInt("round_count")
                    );

                    app.put(
                        "nextRound",
                        rs.getObject("next_round")
                    );

                    app.put(
                        "focusScore",
                        focusScore
                    );

                    app.put(
                        "focusLabel",
                        JobFitScore.label(focusScore)
                    );

                    app.put(
                        "focusClass",
                        JobFitScore.cssClass(focusScore)
                    );


                    applications.add(app);
                }
            }


            request.setAttribute(
                "applications",
                applications
            );


            request.getRequestDispatcher(
                "applications.jsp"
            ).forward(request,response);


        } catch(Exception e) {

            e.printStackTrace();

            response.setContentType(
                "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                "Applications Error: "
                + e.getMessage()
            );
        }
    }
}