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

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("userId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int userId =
                ((Number) session.getAttribute("userId")).intValue();

        int totalApplications = 0;
        int interviews = 0;
        int totalRounds = 0;
        int clearedRounds = 0;
        int notClearedRounds = 0;
        int pendingRounds = 0;
        int scheduledRounds = 0;

        int applied = 0;
        int interviewing = 0;
        int offers = 0;
        int rejected = 0;

        double averageScore = 0;

        List<Map<String,Object>> performance =
                new ArrayList<>();

        List<Map<String,Object>> recentApplications =
                new ArrayList<>();

        try (Connection con =
                     DBConnection.getConnection()) {


            /* ============================
               TOTAL APPLICATIONS
               ============================ */

            totalApplications = singleInt(
                con,
                "SELECT COUNT(*) " +
                "FROM applications " +
                "WHERE user_id = ?",
                userId
            );


            /* ============================
               ACTIVE INTERVIEWING
               ============================ */

            interviews = singleInt(
                con,
                "SELECT COUNT(*) " +
                "FROM applications " +
                "WHERE user_id = ? " +
                "AND status = 'Interviewing'",
                userId
            );


            /* ============================
               TOTAL ROUNDS
               ============================ */

            totalRounds = singleInt(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON r.application_id = a.id " +
                "WHERE a.user_id = ?",
                userId
            );


            /* ============================
               CLEARED ROUNDS
               ============================ */

            clearedRounds = singleInt(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON r.application_id = a.id " +
                "WHERE a.user_id = ? " +
                "AND r.status = 'Cleared'",
                userId
            );


            /* ============================
               NOT CLEARED
               ============================ */

            notClearedRounds = singleInt(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON r.application_id = a.id " +
                "WHERE a.user_id = ? " +
                "AND r.status = 'Not Cleared'",
                userId
            );


            /* ============================
               PENDING
               ============================ */

            pendingRounds = singleInt(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON r.application_id = a.id " +
                "WHERE a.user_id = ? " +
                "AND r.status = 'Pending'",
                userId
            );


            /* ============================
               SCHEDULED
               ============================ */

            scheduledRounds = singleInt(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON r.application_id = a.id " +
                "WHERE a.user_id = ? " +
                "AND r.status = 'Scheduled'",
                userId
            );


            /* ============================
               AVERAGE SCORE
               ============================ */

            averageScore = singleDouble(
                con,
                "SELECT AVG(r.score) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON r.application_id = a.id " +
                "WHERE a.user_id = ? " +
                "AND r.score IS NOT NULL",
                userId
            );


            /* ============================
               APPLICATION STATUS
               ============================ */

            String statusSql =
                "SELECT status, COUNT(*) " +
                "FROM applications " +
                "WHERE user_id = ? " +
                "GROUP BY status";

            try (PreparedStatement ps =
                    con.prepareStatement(statusSql)) {

                ps.setInt(1, userId);

                try (ResultSet rs =
                        ps.executeQuery()) {

                    while (rs.next()) {

                        String status =
                                rs.getString(1);

                        int count =
                                rs.getInt(2);

                        if ("Applied".equalsIgnoreCase(status)) {

                            applied = count;

                        } else if (
                            "Interviewing"
                            .equalsIgnoreCase(status)) {

                            interviewing = count;

                        } else if (
                            "Offer"
                            .equalsIgnoreCase(status)) {

                            offers = count;

                        } else if (
                            "Rejected"
                            .equalsIgnoreCase(status)) {

                            rejected = count;
                        }
                    }
                }
            }


            /* ============================
               PERFORMANCE BY ROUND TYPE
               ============================ */

            String performanceSql =
                "SELECT r.round_type, " +
                "AVG(r.score) AS avg_score, " +
                "COUNT(r.id) AS total " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON a.id = r.application_id " +
                "WHERE a.user_id = ? " +
                "AND r.score IS NOT NULL " +
                "GROUP BY r.round_type " +
                "ORDER BY avg_score DESC";

            try (PreparedStatement ps =
                    con.prepareStatement(performanceSql)) {

                ps.setInt(1, userId);

                try (ResultSet rs =
                        ps.executeQuery()) {

                    while (rs.next()) {

                        Map<String,Object> row =
                                new HashMap<>();

                        row.put(
                            "type",
                            rs.getString("round_type")
                        );

                        row.put(
                            "score",
                            Math.round(
                                rs.getDouble("avg_score")
                            )
                        );

                        row.put(
                            "total",
                            rs.getInt("total")
                        );

                        performance.add(row);
                    }
                }
            }


            /* ============================
               RECENT APPLICATIONS
               ============================ */

            String recentSql =
                "SELECT a.id, a.company_name, " +
                "a.job_role, a.role_description, " +
                "a.job_type, a.location, a.status, " +
                "a.application_date, " +

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
                "ORDER BY a.created_at DESC " +
                "LIMIT 5";

            try (PreparedStatement ps =
                    con.prepareStatement(recentSql)) {

                ps.setInt(1, userId);

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

                        app.put(
                            "id",
                            rs.getInt("id")
                        );

                        app.put(
                            "company",
                            company
                        );

                        app.put(
                            "role",
                            role
                        );

                        app.put(
                            "status",
                            status
                        );

                        app.put(
                            "date",
                            rs.getDate("application_date")
                        );

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

                        recentApplications.add(app);
                    }
                }
            }


            /* ============================
               CLEARANCE RATE
               ============================ */

            int clearanceRate = 0;

            if (totalRounds > 0) {

                clearanceRate =
                    (int)Math.round(
                        clearedRounds * 100.0
                        / totalRounds
                    );
            }


            /* ============================
               SEND DATA TO JSP
               ============================ */

            request.setAttribute(
                "totalApplications",
                totalApplications
            );

            request.setAttribute(
                "interviews",
                interviews
            );

            request.setAttribute(
                "totalRounds",
                totalRounds
            );

            request.setAttribute(
                "clearedRounds",
                clearedRounds
            );

            request.setAttribute(
                "notClearedRounds",
                notClearedRounds
            );

            request.setAttribute(
                "pendingRounds",
                pendingRounds
            );

            request.setAttribute(
                "scheduledRounds",
                scheduledRounds
            );

            request.setAttribute(
                "averageScore",
                Math.round(averageScore)
            );

            request.setAttribute(
                "clearanceRate",
                clearanceRate
            );

            request.setAttribute(
                "applied",
                applied
            );

            request.setAttribute(
                "interviewing",
                interviewing
            );

            request.setAttribute(
                "offers",
                offers
            );

            request.setAttribute(
                "rejected",
                rejected
            );

            request.setAttribute(
                "performance",
                performance
            );

            request.setAttribute(
                "recentApplications",
                recentApplications
            );


            request.getRequestDispatcher(
                "dashboard.jsp"
            ).forward(request,response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                "Dashboard Error: "
                + e.getMessage()
            );
        }
    }


    private int singleInt(
            Connection con,
            String sql,
            int userId)
            throws Exception {

        try (PreparedStatement ps =
                con.prepareStatement(sql)) {

            ps.setInt(1,userId);

            try (ResultSet rs =
                    ps.executeQuery()) {

                return rs.next()
                    ? rs.getInt(1)
                    : 0;
            }
        }
    }


    private double singleDouble(
            Connection con,
            String sql,
            int userId)
            throws Exception {

        try (PreparedStatement ps =
                con.prepareStatement(sql)) {

            ps.setInt(1,userId);

            try (ResultSet rs =
                    ps.executeQuery()) {

                return rs.next()
                    ? rs.getDouble(1)
                    : 0;
            }
        }
    }
}