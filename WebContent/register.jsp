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
</center>
<div align="center">
        <form action="LoginRegister">
        	<table>
        	<tr><td>E-mail:</td> 
        	<td><input type="userName" name="userName"></td></tr>
        	<tr><td>Password:</td> 
        	<td><input type="password" name="password"></td></tr>
        	<tr><td>Re-Type Password:</td> 
        	<td><input type="password" name="password"></td></tr>
        	<tr><td>First Name:</td> 
        	<td><input type="firstName" name="firstName"></td></tr>
        	<tr><td>Last Name:</td> 
        	<td><input type="lastName" name="lasttName"></td></tr>
        	<tr><td>Age:</td> 
        	<td><input type="number" name="age"></td></tr>
        	<tr><td><input type="submit" name="submit" value="Login"></td><td><a href="Home.jsp">Log in here!</a></td></tr>
        	</table>
        </form>
    </div>   

</body>
</html>