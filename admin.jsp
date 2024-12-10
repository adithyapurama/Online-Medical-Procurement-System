<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Get parameters from the form submission
    String username = request.getParameter("admin_username");
    String password = request.getParameter("admin_password");

    // Check if username and password are correct
    if ("adithya".equals(username) && "APNeymar".equals(password)) {
        // Redirect to admin.html if login is successful
        response.sendRedirect("table.jsp");
    } else {
        // Display an error message if login fails
        out.println("<p>Invalid username or password.</p>");
    }
%>
