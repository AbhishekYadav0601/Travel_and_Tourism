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
  img{
  overflow-clip-margin: content-box;
    overflow: clip;
    overflow-x: ;
    overflow-y: ;
  
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
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html"></a>
      </li>
      <li class="breadcrumb-item active"></li>
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
		
				PreparedStatement ps = con.prepareStatement("select place_name,city_name,img,price,discription from pakage");
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
					<img   alt=""  src="img/<%=rs.getString("img")%>"><br>
					  <%=rs.getString("place_name")%><br>
					    <%=rs.getString("city_name")%>
					      </div>
 <%
				}
					
				%>
      <div class="col-md-4">
        <h3 class="my-3">Description</h3><br><br>
          <%=rs.getString("discription")%>
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
    