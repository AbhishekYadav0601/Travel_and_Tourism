<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content=""> <title>Tour India</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/goldentemple.css" rel="stylesheet">
 <!--  <link rel="stylesheet" href="css/adminpage.css"> -->
  <link rel="stylesheet" type="text/css" href="css/contact.css">
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
            <a class="nav-link" href="">Home</a>
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
	 <section class="contact">
        <div class="contact">
            <h2>Contact Us</h2>
            <p>If have any query please contact us. </p>
        </div>
        <div class="container">
            <div class="contactInfo">
                <div class="box">
                    <div class="icon"> <i class="fa fa-map-marker" aria-hidden="true"></i>
                </div>
        <div class="text">
                        <h3>Address</h3>
                        <h3>jec hostel jabalpur MP</h3>  
                    </div>
                </div>
            <div class="box">
                <div class="icon"><i class="fa fa-phone" aria-hidden="true"></i>
                </div>
               
                <div class="text">
                    <h3>Phone</h3>
                    <h3>9340453976</h3>
            </div>
            </div>
                <div class="box">
                    <div class="icon"><i class="fa fa-envelope" aria-hidden="true"></i>
                    </div>
                    <div class="text">
                        <h3>Email</h3>
                        <h3>Edutechclasses@gmail.com</h3>
                    </div>
                </div>
            </div>
      <div class="contactForm">
                <form action="Contact" method="post" >
                    <h2>Send Message</h2>
                    <div class="inputBox">
                        <input type="text" name="name" required="required" placeholder="Enter Your Name">
                        
                    </div>
                    <div class="inputBox">
                        <input type="text" name="email" required="required" placeholder="Enter your Email">
                     
                    </div>
                    <div class="inputBox">
                        <textarea required="required" name="textarea" placeholder="Write Your Queries"></textarea>
                        
                    </div>
                    <div class="inputBox">
                        <input type="submit" name="" value="Send" placeholder=" Contact">
                    
                    </div>
                </form>
            </div>
     </section>
	</body></html>