<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
<center>
  <h1>Comedian Database</h1>
  <h2>Register</h2>
</center>
<div align="center">
        <form action="LoginRegister" method = "post">
        	<table>
        	<tr><td>Email:</td> 
        	<td><input type="text" name="username"></td></tr>
        	<tr><td>Password:</td> 
        	<td><input type="password" name="password1"></td></tr>
        	<tr><td>Re-Type Password:</td> 
        	<td><input type="password" name="password2"></td></tr>
        	<tr><td>First Name:</td> 
        	<td><input type="text" name="firstName"></td></tr>
        	<tr><td>Last Name:</td> 
        	<td><input type="text" name="lastName"></td></tr>
        	<tr><td>Age:</td> 
        	<td><input type="number" name="age"></td></tr>
        	<tr><td><input type="submit" name="submit" value="register"></td><td><a href="login.jsp">Log in here!</a></td></tr>
        	</table>
        </form>
    </div>   

</body>
</html>