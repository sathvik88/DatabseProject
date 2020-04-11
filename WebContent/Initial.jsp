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
	String dbName = "comedian"; // change schema name to match, also change on line 62
	String userId = "root";
	String password = "glamboy99";
	
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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">      
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
	<body>
				
<!-- 
===============================================================================================================================
															NavBar
===============================================================================================================================
-->
		
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="Home.jsp">Comedian Database</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		     <li class="nav-item active">
		        <a class="nav-link" href="Home.jsp">Home<span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="VideoPosts.jsp">Post/View Videos<span class="sr-only"></span></a>
		      </li>
		      <li class="nav-item active">
		        <a class="btn btn-outline-danger" href="Login.jsp">Logout<span class="sr-only"></span></a>
		      </li>
		    </ul>
		  </div>
		</nav>	
			
			
		<center><h1>Welcome root - Initialize Database</h1></center>
			
			
			
			
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
			String sql = "SELECT * FROM comedian.users"; // change to match DB
			
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
		<form action="Initializer"> 
			<input  class="btn btn-outline-primary" id = "Initialize" type="submit" value="Initialize Database">
		</form>
		<a href="WhosCool.jsp">Who's Cool?</a><br>
		<a href="AllTags.jsp">All the tags</a><br>
		<a href="PoorReviews.jsp">Poor reviews</a>
	</body>
</html>





