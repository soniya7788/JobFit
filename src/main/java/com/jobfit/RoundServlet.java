package com.jobfit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/round")
public class RoundServlet extends HttpServlet {

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
        String action = request.getParameter("action");

        try {
            int applicationId = Integer.parseInt(request.getParameter("applicationId"));

            if ("delete".equalsIgnoreCase(action)) {
                int roundId = Integer.parseInt(request.getParameter("roundId"));
                deleteRound(userId, applicationId, roundId);
                response.sendRedirect("application-details?id=" + applicationId);
                return;
            }

            if ("status".equalsIgnoreCase(action)) {
                int roundId = Integer.parseInt(request.getParameter("roundId"));
                String newStatus = request.getParameter("newStatus");

                if (!isValidStatus(newStatus)) {
                    throw new IllegalArgumentException("Invalid round status.");
                }

                updateRoundStatus(userId, applicationId, roundId, newStatus);
                response.sendRedirect("application-details?id=" + applicationId);
                return;
            }

            addRound(request, userId, applicationId);
            response.sendRedirect("application-details?id=" + applicationId);

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("Round Error: " + e.getMessage());
        }
    }

    private void addRound(HttpServletRequest request, int userId, int applicationId)
            throws Exception {

        if (!applicationBelongsToUser(userId, applicationId)) {
            throw new IllegalArgumentException("Application not found.");
        }

        String roundNumberText = request.getParameter("roundNumber");
        int roundNumber = Integer.parseInt(roundNumberText);

        String roundName = request.getParameter("roundName");
        String roundType = request.getParameter("roundType");
        String otherRoundType = request.getParameter("otherRoundType");
        String roundDescription = request.getParameter("roundDescription");
        String roundDate = request.getParameter("roundDate");
        String status = request.getParameter("status");
        String scoreText = request.getParameter("score");
        String skills = request.getParameter("skills");
        String whatWentWell = request.getParameter("whatWentWell");
        String improvementNotes = request.getParameter("improvementNotes");

        if ("Other".equals(roundType) && otherRoundType != null && !otherRoundType.isBlank()) {
            roundType = otherRoundType.trim();
        }

        if (status == null || status.isBlank()) {
            status = roundDate == null || roundDate.isBlank() ? "Pending" : "Scheduled";
        }

        if (!isValidStatus(status)) {
            status = "Pending";
        }

        Integer score = null;

        if (scoreText != null && !scoreText.isBlank()) {
            score = Integer.parseInt(scoreText);

            if (score < 0 || score > 100) {
                throw new IllegalArgumentException("Score must be between 0 and 100.");
            }
        }

        String sql =
            "INSERT INTO interview_rounds " +
            "(application_id, round_number, round_name, round_type, other_round_type, " +
            "round_description, round_date, status, score, skills, what_went_well, improvement_notes) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, applicationId);
            ps.setInt(2, roundNumber);
            ps.setString(3, roundName);
            ps.setString(4, roundType);
            ps.setString(5, otherRoundType);
            ps.setString(6, roundDescription);

            if (roundDate == null || roundDate.isBlank()) {
                ps.setNull(7, java.sql.Types.DATE);
            } else {
                ps.setDate(7, java.sql.Date.valueOf(roundDate));
            }

            ps.setString(8, status);

            if (score == null) {
                ps.setNull(9, java.sql.Types.INTEGER);
            } else {
                ps.setInt(9, score);
            }

            ps.setString(10, skills);
            ps.setString(11, whatWentWell);
            ps.setString(12, improvementNotes);

            ps.executeUpdate();

            if ("Not Cleared".equalsIgnoreCase(status)) {
                updateApplicationStatus(con, applicationId, "Rejected");
            } else if ("Cleared".equalsIgnoreCase(status)) {
                updateApplicationStatus(con, applicationId, "Interviewing");
            }
        }
    }

    private void updateRoundStatus(int userId, int applicationId, int roundId,
                                   String status) throws Exception {

        if (!isRoundOwnedByUser(userId, applicationId, roundId)) {
            throw new IllegalArgumentException("Round not found.");
        }

        try (Connection con = DBConnection.getConnection()) {

            try (PreparedStatement ps = con.prepareStatement(
                    "UPDATE interview_rounds SET status = ? " +
                    "WHERE id = ? AND application_id = ?")) {

                ps.setString(1, status);
                ps.setInt(2, roundId);
                ps.setInt(3, applicationId);
                ps.executeUpdate();
            }

            if ("Not Cleared".equalsIgnoreCase(status)) {
                updateApplicationStatus(con, applicationId, "Rejected");
            } else if ("Cleared".equalsIgnoreCase(status)) {
                updateApplicationStatus(con, applicationId, "Interviewing");
            }
        }
    }

    private void deleteRound(int userId, int applicationId, int roundId)
            throws Exception {

        if (!isRoundOwnedByUser(userId, applicationId, roundId)) {
            throw new IllegalArgumentException("Round not found.");
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "DELETE FROM interview_rounds WHERE id = ? AND application_id = ?")) {

            ps.setInt(1, roundId);
            ps.setInt(2, applicationId);
            ps.executeUpdate();
        }

        renumberRounds(applicationId);
    }

    private void renumberRounds(int applicationId) throws Exception {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "SELECT id FROM interview_rounds " +
                "WHERE application_id = ? ORDER BY round_number ASC, id ASC")) {

            ps.setInt(1, applicationId);

            try (ResultSet rs = ps.executeQuery();
                 PreparedStatement update = con.prepareStatement(
                    "UPDATE interview_rounds SET round_number = ? WHERE id = ?")) {

                int number = 1;

                while (rs.next()) {
                    update.setInt(1, number++);
                    update.setInt(2, rs.getInt("id"));
                    update.addBatch();
                }

                update.executeBatch();
            }
        }
    }

    private boolean applicationBelongsToUser(int userId, int applicationId)
            throws Exception {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) FROM applications WHERE id = ? AND user_id = ?")) {

            ps.setInt(1, applicationId);
            ps.setInt(2, userId);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }

    private boolean isRoundOwnedByUser(int userId, int applicationId, int roundId)
            throws Exception {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) " +
                "FROM interview_rounds r " +
                "JOIN applications a ON a.id = r.application_id " +
                "WHERE r.id = ? AND r.application_id = ? AND a.user_id = ?")) {

            ps.setInt(1, roundId);
            ps.setInt(2, applicationId);
            ps.setInt(3, userId);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }

    private void updateApplicationStatus(Connection con, int applicationId, String status)
            throws Exception {

        try (PreparedStatement ps = con.prepareStatement(
            "UPDATE applications SET status = ? WHERE id = ?")) {

            ps.setString(1, status);
            ps.setInt(2, applicationId);
            ps.executeUpdate();
        }
    }

    private boolean isValidStatus(String status) {
        return "Pending".equalsIgnoreCase(status)
            || "Scheduled".equalsIgnoreCase(status)
            || "Completed".equalsIgnoreCase(status)
            || "Cleared".equalsIgnoreCase(status)
            || "Not Cleared".equalsIgnoreCase(status);
    }
}
