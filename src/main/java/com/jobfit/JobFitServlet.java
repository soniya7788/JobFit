package com.jobfit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test-db")
public class JobFitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try {
            Connection con = DBConnection.getConnection();

            if (con != null) {
                out.println("<h1>Database Connected Successfully!</h1>");
                out.println("<p>JobFit is connected to MySQL.</p>");
                con.close();
            } else {
                out.println("<h1>Database Connection Failed!</h1>");
            }

        } catch (Exception e) {
            out.println("<h1>Database Connection Failed!</h1>");
            out.println("<p>" + e.getMessage() + "</p>");
        }
    }
}