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
  <h1>Website</h1>
</center>
<div align="center">
        <form action="LoginRegister">
        	<table>
        	<tr><td>UserName:</td> 
        	<td><input type="text" name="name"></td></tr>
        	<tr><td>Password:</td> 
        	<td><input type="password" name="password"></td></tr>
        	<tr> 
        	<td><input type="submit" name="submit" value="Login"></td><td><a href="register.jsp">Sign up here!</a></td></tr>
        	</table>
        </form>
    </div>   

</body>
</html>