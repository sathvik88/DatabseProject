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
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "comedian"; // change schema name to match, also change on line 76
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
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>Post</title>
    <style type="text/css">
	    <%@include file="bootstrap-4.3.1-dist/css/opensans-font.css" %>
	    <%@include file="bootstrap-4.3.1-dist/fonts/line-awesome/css/line-awesome-font-awesome.min.css" %>
	    <%@include file="bootstrap-4.3.1-dist/css/style.css" %>
	</style>
	
	<script src="bootstrap/js/jquery.js"></script>
	<script src="bootstrap-4.3.1-dist/js/bootstrap.js"></script>
</head>
<body class="form-v7">
<%
			try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT * FROM comedian.posts"; // change to match DB
			
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
			%>
	<div class="page-content">
		<div class="form-v7-content">
			<form class="form-detail" action="update" method="post" id="myform">
				<div class="form-row">
					<center><label for="your_email">post</label></center>
				</div>
				<input type="hidden" name="id" value='<%=resultSet.getString("id")%>'/>
				<div class="form-row">
					<label for="url">YouTube URL</label>
					<input type="text" name="url" id="url" class="input-text" value='<%=resultSet.getString("url")%>'>
				</div>
				<div class="form-row">
					<label for="title">Title</label>
					<input type="text" name="title" id="title" class="input-text"value='<%=resultSet.getString("title")%>'>
				</div>
				<div class="form-row">
					<label for="description">Description</label>
					<input type="text" name="description" id="description" class="input-text" value='<%=resultSet.getString("description")%>'>
				</div>
				<div class="form-row">
					<label for="tags">Tags</label>
					<input type="text" name="tags" id="tags" class="input-text" value='<%=resultSet.getString("tags")%>'>
				</div>
				<div class="form-row">
					<label for="score">Score</label>
					<input type="text" name="score" id="score" class="input-text" value='<%=resultSet.getString("score")%>'>
				</div>
				<div class="form-row">
					<label for="comment">Comment</label>
					<input type="text" name="comment" id="comment" class="input-text" value='<%=resultSet.getString("comment")%>'>
				</div>
				<div class="form-row-last">
					<input type="submit" name="register" class="register" value="Post">
				</div>
			</form>
		</div>
		<%
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
	</div>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
</body>
</html>

