<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
// Retrieve form data
String medicineType = request.getParameter("medicine_type");
String medicineName = request.getParameter("medicine_name");
String company = request.getParameter("company");
int quantity = Integer.parseInt(request.getParameter("quantity"));
String supplier = request.getParameter("supplier");

Connection con = null;
PreparedStatement ps = null;

try {
    // Establish database connection
    DbUtil.connect();
    con = DbUtil.con;

    // Prepare SQL statement to insert into product table
    String sql = "INSERT INTO product (medicine_type, medicine_name, company, quantity, supplier) VALUES (?, ?, ?, ?, ?)";
    ps = con.prepareStatement(sql);
    ps.setString(1, medicineType);
    ps.setString(2, medicineName);
    ps.setString(3, company);
    ps.setInt(4, quantity);
    ps.setString(5, supplier);

    // Execute the SQL statement
    int rowsAffected = ps.executeUpdate();

    if (rowsAffected > 0) {
        out.println("<h2>Order submitted successfully!</h2>");
    } else {
        out.println("<h2>Failed to submit order. Please try again.</h2>");
    }
} catch (Exception e) {
    out.println("<h2>Error: " + e.getMessage() + "</h2>");
} finally {
    // Close resources
    try {
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (SQLException ex) {
        out.println("<h2>Error closing resources: " + ex.getMessage() + "</h2>");
    }
}
%>
<script>
   setTimeout(function(){
      window.location.href = "order_product.html"; // Redirect to index page after 3 seconds
   }, 3000); // 3000 milliseconds = 3 seconds
</script>
</body>
</html>