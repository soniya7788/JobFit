package com.jobfit;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/analyze")
public class AnalyzeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String role = request.getParameter("role");
        String skills = request.getParameter("skills").toLowerCase();
        String jobDescription =
                request.getParameter("jobDescription").toLowerCase();

        String[] importantSkills = {
            "java",
            "python",
            "html",
            "css",
            "javascript",
            "mysql",
            "sql",
            "react",
            "spring",
            "git",
            "github",
            "testing",
            "selenium",
            "php",
            "node"
        };

        List<String> matchedSkills = new ArrayList<>();
        List<String> missingSkills = new ArrayList<>();

        int totalRequired = 0;
        int matched = 0;

        for (String skill : importantSkills) {

            if (jobDescription.contains(skill)) {

                totalRequired++;

                if (skills.contains(skill)) {
                    matchedSkills.add(skill);
                    matched++;
                } else {
                    missingSkills.add(skill);
                }
            }
        }

        int score = 0;

        if (totalRequired > 0) {
            score = (matched * 100) / totalRequired;
        }

        String suggestion;

        if (score >= 80) {
            suggestion = "Excellent fit! Your skills closely match this role.";
        } else if (score >= 60) {
            suggestion = "Good fit. Strengthen the missing skills to improve your profile.";
        } else if (score >= 40) {
            suggestion = "Moderate fit. You should work on the missing technical skills.";
        } else {
            suggestion = "Low current match. Follow a learning roadmap before applying.";
        }

        HttpSession session = request.getSession();

        session.setAttribute("role", role);
        session.setAttribute("score", score);
        session.setAttribute("matchedSkills", matchedSkills);
        session.setAttribute("missingSkills", missingSkills);
        session.setAttribute("suggestion", suggestion);

        response.sendRedirect("result.jsp");
    }
}