<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="p1.DbUtil" %> <!-- Import the DbUtil class -->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="p1.DbUtil" %> <!-- Import the DbUtil class -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
Connection con;
Statement st;
%>
<% 
//Step 2: Handle form submission
String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");
try
{
    DbUtil.connect(); 
    st = DbUtil.con.createStatement();
    int i = st.executeUpdate("INSERT INTO users VALUES('" + username + "','" + email + "','" + password + "')");
    if(i > 0){
        out.println("<p>Signup successful!</p>");
    }
    else
        out.println("<p>Signup failed!</p>");
} catch(Exception e){
    out.println("Error: " + e.getMessage());
} finally {
    try {
        if (st != null)
            st.close();
        if (con != null)
            con.close();
    } catch (SQLException ex) {
        out.println("<p>Error closing resources: " + ex.getMessage() + "</p>");
    }
}
%>
<script>
   setTimeout(function(){
      window.location.href = "1.html"; // Redirect to index page after 3 seconds
   }, 3000); // 3000 milliseconds = 3 seconds
</script>
</body>
</html>
