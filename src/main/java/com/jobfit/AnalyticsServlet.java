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

@WebServlet("/analytics")
public class AnalyticsServlet extends HttpServlet {

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


        int totalRounds = 0;
        int clearedRounds = 0;
        int notClearedRounds = 0;
        int pendingRounds = 0;
        int scheduledRounds = 0;

        double averageScore = 0;


        List<Map<String,Object>> typeStats =
                new ArrayList<>();

        List<Map<String,Object>> companyStats =
                new ArrayList<>();


        try(Connection con =
                DBConnection.getConnection()) {


            totalRounds = count(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON a.id=r.application_id " +
                "WHERE a.user_id=?",
                userId
            );


            clearedRounds = count(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON a.id=r.application_id " +
                "WHERE a.user_id=? " +
                "AND r.status='Cleared'",
                userId
            );


            notClearedRounds = count(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON a.id=r.application_id " +
                "WHERE a.user_id=? " +
                "AND r.status='Not Cleared'",
                userId
            );


            pendingRounds = count(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON a.id=r.application_id " +
                "WHERE a.user_id=? " +
                "AND r.status='Pending'",
                userId
            );


            scheduledRounds = count(
                con,
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON a.id=r.application_id " +
                "WHERE a.user_id=? " +
                "AND r.status='Scheduled'",
                userId
            );


            averageScore = average(
                con,
                "SELECT AVG(r.score) " +
                "FROM interview_rounds r " +
                "JOIN applications a " +
                "ON a.id=r.application_id " +
                "WHERE a.user_id=? " +
                "AND r.score IS NOT NULL",
                userId
            );


            /* ============================
               ROUND TYPE ANALYSIS
               ============================ */

            String typeSql =
                "SELECT r.round_type, " +
                "COUNT(*) AS total, " +
                "AVG(r.score) AS avg_score, " +
                "SUM(CASE WHEN r.status='Cleared' " +
                "THEN 1 ELSE 0 END) AS cleared " +

                "FROM interview_rounds r " +

                "JOIN applications a " +
                "ON a.id=r.application_id " +

                "WHERE a.user_id=? " +

                "GROUP BY r.round_type " +

                "ORDER BY avg_score DESC";


            try(PreparedStatement ps =
                    con.prepareStatement(typeSql)) {

                ps.setInt(1,userId);

                try(ResultSet rs =
                        ps.executeQuery()) {

                    while(rs.next()) {

                        Map<String,Object> row =
                                new HashMap<>();

                        row.put(
                            "type",
                            rs.getString("round_type")
                        );

                        row.put(
                            "total",
                            rs.getInt("total")
                        );

                        row.put(
                            "score",
                            rs.getObject("avg_score")
                        );

                        row.put(
                            "cleared",
                            rs.getInt("cleared")
                        );

                        typeStats.add(row);
                    }
                }
            }


            /* ============================
               COMPANY ANALYSIS
               ============================ */

            String companySql =
                "SELECT a.company_name, " +
                "COUNT(r.id) AS rounds, " +
                "AVG(r.score) AS avg_score, " +
                "SUM(CASE WHEN r.status='Cleared' " +
                "THEN 1 ELSE 0 END) AS cleared " +

                "FROM applications a " +

                "JOIN interview_rounds r " +
                "ON a.id=r.application_id " +

                "WHERE a.user_id=? " +

                "GROUP BY a.id,a.company_name " +

                "ORDER BY avg_score DESC " +

                "LIMIT 10";


            try(PreparedStatement ps =
                    con.prepareStatement(companySql)) {

                ps.setInt(1,userId);

                try(ResultSet rs =
                        ps.executeQuery()) {

                    while(rs.next()) {

                        Map<String,Object> row =
                                new HashMap<>();

                        row.put(
                            "company",
                            rs.getString("company_name")
                        );

                        row.put(
                            "rounds",
                            rs.getInt("rounds")
                        );

                        row.put(
                            "score",
                            rs.getObject("avg_score")
                        );

                        row.put(
                            "cleared",
                            rs.getInt("cleared")
                        );

                        companyStats.add(row);
                    }
                }
            }


            int clearanceRate =
                totalRounds == 0
                ? 0
                : (int)Math.round(
                    clearedRounds * 100.0
                    / totalRounds
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
                "typeStats",
                typeStats
            );

            request.setAttribute(
                "companyStats",
                companyStats
            );


            request.getRequestDispatcher(
                "analytics.jsp"
            ).forward(request,response);


        } catch(Exception e) {

            e.printStackTrace();

            response.setContentType(
                "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                "Analytics Error: "
                + e.getMessage()
            );
        }
    }


    private int count(
            Connection con,
            String sql,
            int userId)
            throws Exception {

        try(PreparedStatement ps =
                con.prepareStatement(sql)) {

            ps.setInt(1,userId);

            try(ResultSet rs =
                    ps.executeQuery()) {

                return rs.next()
                    ? rs.getInt(1)
                    : 0;
            }
        }
    }


    private double average(
            Connection con,
            String sql,
            int userId)
            throws Exception {

        try(PreparedStatement ps =
                con.prepareStatement(sql)) {

            ps.setInt(1,userId);

            try(ResultSet rs =
                    ps.executeQuery()) {

                return rs.next()
                    ? rs.getDouble(1)
                    : 0;
            }
        }
    }
}