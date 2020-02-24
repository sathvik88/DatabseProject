<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Here</title>
</head>
<body>
<center>
  <h1>Comedian Database</h1>
  <h2>Login</h2>
</center>
<div align="center">
        <form action="LoginRegister" method = "post">
        	<table>
        	<tr><td>Email:</td> 
        	<td><input type="text" name="username"></td></tr>
        	<tr><td>Password:</td> 
        	<td><input type="password" name="password"></td></tr>
        	<tr> 
        	<td><input type="submit" name="submit" value="login"></td><td><a href="register.jsp">Sign up here!</a></td></tr>
        	<tr>
        	<td><h3 style = "color: red"> ${message}</h3></td>
        	<h3 style = "color: green"> ${successMessage}</h3>
        	</tr>
        	</table>
        </form>
    </div>   

</body>
</html>