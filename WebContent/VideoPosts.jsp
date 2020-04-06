<!-- 
==============================================================================================	
-CSC 4710 - Database
-By:
------Sathvik Konuganti
------Santhosh Abraham
==============================================================================================
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 
===============================================================================================================================
									Connecting to the database to collect table information
===============================================================================================================================
-->

<!-- 
===============================================================================================================================
															HTML Code
===============================================================================================================================
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<center><h1>Welcome to the Posts!</h1></center>
			
		<div class="container">
			 <h2>User Posts</h2>
			 <p>Pulling data from Comedian Database</p>  
			 <form action="" method = "get">
			 	<input type="text" class="form-control" name="q" placeholder="Search here"/>
			 </form>          
			 <table class="table table-striped" align="center" cellpadding="5" cellspacing="5" border="1">
			   <thead>
			   	<td><b>ID</b></td>
			    <td><b>URL</b></td>
				<td><b>Title</b></td>
				<td><b>Description</b></td>
				<td><b>Tags</b></td>
				<td><b>Score</b></td>
				<td><b>Comment</b></td>
				<td><b>Action</b></td>
			   </thead>
			<tbody>
				<%
				String host = "jdbc:mysql://127.0.0.1:3306/comedian";
				Connection conn = null;
				Statement stat = null;
				ResultSet res = null;
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(host, "root", "glamboy99");
				stat = conn.createStatement();
				String query = request.getParameter("q");
				String data;
				if(query!=null){
					data = "select * from posts where url like '%"+query+"%' or title like '%"+query+"%' or description like '%"+query+"%' or tags like '%"+query+"%'";
				} else{
					data = "select * from posts order by id desc";
				}
				
				res = stat.executeQuery(data);
				while(res.next()){ 
				%>
			</tbody>
			<tr bgcolor="#FFFFFF">
				<td><%=res.getString("id")%></td>
				<td><%=res.getString("url")%></td>
				<td><%=res.getString("title")%></td>
				<td><%=res.getString("description")%></td>
				<td><%=res.getString("tags")%></td>
				<td><%=res.getString("score")%></td>
				<td><%=res.getString("comment")%></td>
				<td class="text-center"><a href='testUpdate.jsp?u=<%=res.getString("id")%>' class="btn btn-warning">Edit</a>
				<a href='Delete.jsp?d=<%=res.getString("id")%>' class="btn btn-danger">Delete</a></td>
				
			</tr>
			<%
				}
			%>
<!-- 
===============================================================================================================================
													Pulling Data from DB 
===============================================================================================================================
-->
			
			
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
			<p><a href="Post.jsp">Post another video!</a></p>
	</body>
</html>





