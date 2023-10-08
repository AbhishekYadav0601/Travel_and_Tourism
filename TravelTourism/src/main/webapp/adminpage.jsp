<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/adminpage.css">
<style>
    .tb{
      border:3px;
   }
</style>
</head>
<body>
	<header class="topnav" id="myTopnav">
		<a href="" class="logo">TRavel&Tourism</a>
		<div class="contnt">
			<a href="#home" class="active">Home</a>
			 <a href="#section1">Profile</a>
			<a href="#section2">Package</a>
			 <a href="#section3">Hotel</a>
			 <a href="#section4">Booked Package</a>
			  <a href="#section5">Booked Hotel</a> <a
				href="index.html" class="active">Logout</a> <a
				href="javascript:void(0);" class="icon" onclick="myFunction()">
				<i class="fa fa-bars"></i>
			</a>
		</div>
		<style>
		.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: black;
}

button:hover, a:hover {
  opacity: 0.7;
}
		</style>
	</header>
	<script>
		function myFunction() {
		var x = document.getElementById("myTopnav");
			if (x.className === "topnav") {
				x.className += " responsive";
			} else {
				x.className = "topnav";
			}
		}
	</script>
	<div id="section1">
	             
	            
				<%
				String email= (String)request.getAttribute("email");
				
				Class.forName("com.mysql.jdbc.Driver");
				 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","root");
		
				PreparedStatement ps = con.prepareStatement("select * from signup  ");
				ResultSet rs = ps.executeQuery();
                  
				while (rs.next()) {
				%>
				
				<h2 style="text-align:center">Admin Profile Card</h2>

<div class="card">
  <img src="img/abhi.png" alt="John" style="width:50%">
  <h1>Name:-<%=rs.getString("name")%></h1>
  <p class="title">Admin and Owner</p>
  <p class="title">Phone No:-<%=rs.getString("phone")%></p>
  <p>Email:-<%=rs.getString("email")%></p><br><br>
</div>
			
			    <%
				}
					
				%>
	
	</div>
	<div id="section2">
		<center>
			<form action="Package" method="post" enctype="multipart/form-data"
				class="form">
				<h1>Add Package</h1>
				<hr>
				<table>
					<tr>
						<td>Place Name</td>
						<td><input type="text" name="place" required
							placeholder="Enter the Place Name"></td>
					</tr>
					<tr>
						<td>City/State Name</td>
						<td><input type="text" name="city" required
							placeholder="Enter the city name"></td>
					</tr>
					<tr>
						<td>Price</td>
						<td><input type="text" name="price" required
							placeholder="Enter the price"></td>
					</tr>
					<tr>
						<td>No of Day</td>
						<td><input type="text" name="day" required
							placeholder="Enter the no of day"></td>
					</tr>
					<tr>
						<td></td>
						<td><textarea rows="5" cols="30" name="dis"
								placeholder="Enter the Discription"></textarea></td>
					</tr>
					</tr>
					<tr>
						<td>select img</td>
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<td></td>
						<td><button type="submit" class="signupbtn">Add</button></td>
					</tr>
				</table>

			</form>
		</center>
	</div>
	<div id="section3">
		<center>
			<form  action="Hotelpage" method="post" class="form" enctype="multipart/form-data">
				<h1>Add Hotel</h1>
				<hr>
				<table>
					<tr>
						<td>Hotel Name</td>
						<td><input type="text" name="name" required
							placeholder="Enter the Hotel Name"></td>
					</tr>
					<tr>
						<td>City/State Name</td>
						<td><input type="text" name="city" required
							placeholder="Enter the State name"></td>
					</tr>
					<tr>
						<td>AC Cost</td>
						<td><input type="text" name="ac" required
							placeholder="Enter the ac cost per day"></td>
					</tr>
					<tr>
						<td>Food Cost</td>
						<td><input type="text" name="food" required
							placeholder="Enter the food cost per day"></td>
					</tr>
					<tr>
						<td>Hotel Cost</td>
						<td><input type="text" name="hotelcost" required
							placeholder="Enter the Hotel cost per day"></td>
					</tr>
					<tr>
						<td>select img</td>
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<td></td>
						<td><button type="submit" class="signupbtn">Add</button></td>
					</tr>

				</table>
			</form>
		</center>
	</div>
	
	<div id="section5">
	<h1>booked Package</h1>
	<table class="table mt-4" border="2px">
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
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "root");

			PreparedStatement s = c.prepareStatement("select * from bookpackage");
			ResultSet r = s.executeQuery();

			while (r.next()) {
			%>
			<tr>

		
 <td><%=r.getString("placename")%></td>
  <td><%=r.getString("Customername")%></td>
   <td><%=r.getString("packageprice")%></td>
    <td><%=r.getString("person")%></td>
     <td><%=r.getString("date")%></td>
			</tr>
		
	<%
	}
	%>
	</tbody>
	</table><br><br>
	</div>
	<div id="section4">
	<h1>booked Hotel</h1>
	<table class="table mt-4" border="2px">
		<thead>
		<th>Place Name</th>
		<th>Customer Name</th>
		<th>Hotel Price</th>
		<th>Total Person</th>
		<th>date</th>
		</thead>
		<tbody>
			<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection d= DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "root");

			PreparedStatement m = d.prepareStatement("select * from bookhotel");
			ResultSet rr = m.executeQuery();

			while (rr.next()) {
			%>
			<tr>

		
 <td><%=rr.getString("placename")%></td>
  <td><%=rr.getString("Customername")%></td>
   <td><%=rr.getString("hotelprice")%></td>
    <td><%=rr.getString("person")%></td>
     <td><%=rr.getString("date")%></td>
			</tr>
		
	<%
	}
	%>
	</tbody>
	</table><br><br>
	</div>
</body>
</html>
