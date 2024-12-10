<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="p1.DbUtil" %> <!-- Import the DbUtil class -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login - OTT Subscription Management System</title>
</head>
<body>
<%!
Connection con;
Statement st;
ResultSet rs;
%>
<% 
//Step 2: Handle form submission
String username = request.getParameter("login_username");
String password = request.getParameter("login_password");
try {
    DbUtil.connect(); 
    st = DbUtil.con.createStatement();
    rs = st.executeQuery("SELECT * FROM users WHERE username='" + username + "' AND password='" + password + "'");
    if(rs.next()) {
    	session.setAttribute("username", username);
        response.sendRedirect("order_product.html");
        
    } else {
        // Username and password don't match, display error message
        out.println("<p>Login failed. Please check your username and password.</p>");
    }
} catch(Exception e){
    out.println("Error: " + e.getMessage());
} finally {
    try {
        if (rs != null)
            rs.close();
        if (st != null)
            st.close();
        if (con != null)
            con.close();
    } catch (SQLException ex) {
        out.println("<p>Error closing resources: " + ex.getMessage() + "</p>");
    }
}
%>
</body>
</html>
