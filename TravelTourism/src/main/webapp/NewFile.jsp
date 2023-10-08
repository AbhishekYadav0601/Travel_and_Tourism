<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Travel</title>
<style type="text/css">
body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

img {
	border-radius: 10px;
}

table tr td h2 {
	color: blue;
}

table tr td p {
	font-size: 15px;
	color: black;
	left: 12px;
}
</style>
</head>
<body>
	<p class="text-center fs-3">Show pakage</p>
	<%
	String msg = (String) session.getAttribute("msg");
	if (msg != null) {
	%>
	<h4><%=msg%></h4>
	<%
	session.removeAttribute("msg");
	}
	%>

	<table class="table mt-4">
		<thead>
		<th>Place Name</th>
		<th>Customer Name</th>
		<th>Package Price</th>
		<th>Total Person</th>
		<th>date</th>
		</thead>
		<tbody>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "root");

			PreparedStatement ps = con.prepareStatement("select place_name,city_name,img,price,discription from pakage");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
			%>
			<tr>

		
 <td><%=rs.getString("placename")%></td>
  <td><%=rs.getString("Customername")%></td>
   <td><%=rs.getString("packageprice")%></td>
    <td><%=rs.getString("person")%></td>
     <td><%=rs.getString("date")%></td>
			</tr>
		</tbody>
	</table>
	<%
	}
	%>
</body>
</html>