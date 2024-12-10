<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Information</title>
    <title>Product Information</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        td.actions {
            text-align: center;
        }

        .action-btn {
            padding: 8px 12px;
            margin: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .delete-btn {
            background-color: #e74c3c;
            color: #fff;
        }

        .confirm-btn {
            background-color: #3498db;
            color: #fff;
        }

        .delivered-btn {
            background-color: #2ecc71;
            color: #fff;
        }

        .action-btn:hover {
            opacity: 0.8;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>

    <header>
        <h1>Admin Dashboard</h1>
    </header>
<h2>Product Information</h2>

<table>
    <tr>
        <th>Medicine Type</th>
        <th>Medicine Name</th>
        <th>Company</th>
        <th>Quantity</th>
        <th>Supplier</th>
    </tr>
    
    <%-- Java code to retrieve and display product information --%>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="p1.DbUtil" %>
    <%
    try {
        // Establish database connection
        DbUtil.connect();
        Connection con = DbUtil.con;

        // Prepare SQL statement to retrieve data from product table
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM product");

        // Iterate through the result set and populate the table rows
        while (rs.next()) {
    %>
            <tr>
                <td><%= rs.getString("medicine_type") %></td>
                <td><%= rs.getString("medicine_name") %></td>
                <td><%= rs.getString("company") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getString("supplier") %></td>
            </tr>
    <%
        }
        // Close resources
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
    }
    %>
</table>
<button onclick="location.href='1.html';">logout</button>
 <footer>
        <p>&copy; 2024 Admin Dashboard. All rights reserved.</p>
    </footer>
</body>
</html>

