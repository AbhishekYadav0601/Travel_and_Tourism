<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content=""> <title>Tour India</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/goldentemple.css" rel="stylesheet">
  <link rel="stylesheet" href="css/adminpage.css">
  <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>
</head>
<body>
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">Tour India</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="homepage.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.jsp">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="package.jsp">Package</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="hotel.jsp">Hotel</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="contact.jsp">Contact</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="index.html">logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <div class="container">
  <h1 class="mt-4 mb-3">Show All Tourism
      <small>Indai</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="homepage">Home</a>
      </li>
      <li class="breadcrumb-item active">Tourism</li>
    </ol>
  
    <%
						String msg = (String) session.getAttribute("msg");
						if (msg != null) {
						
						session.removeAttribute("msg");
						}
						%>
					
		
				<%
				Class.forName("com.mysql.jdbc.Driver");
				 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root","root");
		
				PreparedStatement ps = con.prepareStatement("select * from pakage");
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
				%>

    <div class="row">

      <div class="col-md-8">
     
                  
					<%
					if (rs.getString("img").endsWith(".pdf")) {
					%>

					<img alt="" src="img/pdf.png" >


					<%
					} else if (rs.getString("img").endsWith(".xlsx")) {
					%>

				<img alt="" src="img/xls.jpg">


					<%
					} else {
					%>
					<img  class="img-fluid" alt=""  src="img/<%=rs.getString("img")%>"><br>
					  
					      </div>
 <%
				}
					
				%>
      <div class="col-md-4">
        <h3 class="my-3">Package details</h3><br><br>
    <P> place Name:-<%=rs.getString("place_name")%></P><br>
   <p>  City Name:- <%=rs.getString("city_name")%></p><br>
     <p> Number Of Day:- <%=rs.getString("no_of_day")%><p><br>
     <p>  Price:- <%=rs.getString("city_name")%></p><br>
     <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Book Package</button>

<div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form class="modal-content" action="Bookpackage" method="post">
    <div class="container">
      <h1>Book Package</h1>
      <hr>
      <label for="placename"><b>Place Name</b></label>
      <input type="text" placeholder="Enter place name" name="placename" required>

      <label for="psw"><b>Customer Name</b></label>
      <input type="text" placeholder="Enter Customer" name="customername" required>
      <label for="psw"><b>Package Price</b></label>
      <input type="text" placeholder="Enter package price" name="packageprice" required>
      <label for="psw-repeat"><b>Total Person</b></label>
      <input type="text" placeholder="Repeat Password" name="person" required>
     <label for="psw-repeat"><b>Date</b></label>
      <input type="text" placeholder="Enter date" name="date" required>
       <div class="clearfix">
       <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
            <button type="submit" class="signupbtn">Book Package</button>
      </div>
    </div>
  </form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
     
     
        <br>
      </div>

    </div>
 <hr>
   <br>
				<%
				}
					
				%>
</body>

</html>
    