<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/signup.css">
<title>TravelAnd Tourism</title>
<style>
body{
	background-image:url("img/ab.jpg");
    background-repeat: no-repeat;
    background-size: 100%;
}
.a {
     font-size: 18px;
    color: white;
    text-align: center;
    padding:10px 30px;
    text-decoration: none;
    line-height: 12px;
    border-radius: 6px;
    margin: 8px 0px;
	}
  .div{
  background-color: #04AA6D;
	padding: 14px 20px;
	margin: 8px 0;

	border-radius: 6px;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
      }

      }</style>
</head>
<body>
<div class="container">
	<center>
		<form action="Signup" method="post" class="fm">
			<h1>Sign Up</h1>
			<p>Please fill  this form to create an account.</p>
			<hr>
			<table>
				<tr>
					<td>User Name</td>
					<td><input type="text" name="name" required></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="email" required></td>
				</tr>
				<tr>
					<td>Phone</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
				<td> </td>
					<td><button type="submit" class="signupbtn">Sign Up</button></td>

				</tr>
				<tr>
				<td> </td>
					<td><div class="div"><a href="index.html" class="a">cancel</a> </div></td>
	
				</tr>
			</table>
		</form>
	</center>
</body>
</html>