<!-- 
==============================================================================================	
-CSC 4710 - Database
-By:
------Sathvik Konuganti
------Santhosh Abraham
==============================================================================================
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!-- 
===============================================================================================================================
									Connecting to the database to collect table information
===============================================================================================================================
-->
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "comediandb"; // change schema name to match, also change on line 62
	String userId = "root";
	String password = "pass1234";
	
	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<!-- 
===============================================================================================================================
															HTML Code
===============================================================================================================================
-->
<!DOCTYPE html>
<html>
<head>
	<title>Welcome the Home page!</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
	<body>
		<center><h1>Welcome the Home page!</h1></center>
			
		<div class="container">
			 <h2>User Accounts</h2>
			 <p>Pulling data from Comedian Database</p>            
			 <table class="table table-striped" align="center" cellpadding="5" cellspacing="5" border="1">
			   <thead>
			    <td><b>Username</b></td>
				<td><b>Password</b></td>
				<td><b>First Name</b></td>
				<td><b>Last Name</b></td>
				<td><b>Age</b></td>
				<td><b>Gender</b></td>
			   </thead>
		
<!-- 
===============================================================================================================================
													Pulling Data from DB 
===============================================================================================================================
-->
			<%
			try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT * FROM comediandb.users"; // change to match DB
			
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
			%>
			
			<tr bgcolor="#FFFFFF">
				<td><%=resultSet.getString("username")%></td>
				<td><%=resultSet.getString("password")%></td>
				<td><%=resultSet.getString("firstName")%></td>
				<td><%=resultSet.getString("lastName")%></td>
				<td><%=resultSet.getString("age")%></td>
				<td><%=resultSet.getString("gender")%></td>
			</tr>
			<%
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</div>
		</table>
<!-- 
===============================================================================================================================
										Initialize Button - linked with initializer.java
===============================================================================================================================
-->
<!-- 		<form action="Initializer">  -->
<!-- 			<input id = "Initialize" type="submit" value="Initialize Database" style="color : blue"> -->
<!-- 			<p><a href="Home.jsp">Click here to refresh the page!</a></p> -->
<!-- 		</form> -->
			<p><a href="Login.jsp">Click here to Log Out!</a></p>
	</body>
</html>





