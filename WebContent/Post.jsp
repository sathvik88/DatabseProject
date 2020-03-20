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
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <title>User Register</title>
    <style type="text/css">
	    <%@include file="bootstrap-4.3.1-dist/css/opensans-font.css" %>
	    <%@include file="bootstrap-4.3.1-dist/fonts/line-awesome/css/line-awesome-font-awesome.min.css" %>
	    <%@include file="bootstrap-4.3.1-dist/css/style.css" %>
	</style>
	
	<script src="bootstrap/js/jquery.js"></script>
	<script src="bootstrap-4.3.1-dist/js/bootstrap.js"></script>
</head>
<body class="form-v7">
	<div class="page-content">
		<div class="form-v7-content">
			<form class="form-detail" action="insertPost" method="post" id="myform">
				<div class="form-row">
					<center><label for="your_email">post</label></center>
				</div>
				<div class="form-row">
					<label for="url">YouTube URL</label>
					<input type="text" name="url" id="url" class="input-text" >
				</div>
				<div class="form-row">
					<label for="title">Title</label>
					<input type="text" name="title" id="title" class="input-text">
				</div>
				<div class="form-row">
					<label for="description">Description</label>
					<input type="text" name="description" id="description" class="input-text">
				</div>
				<div class="form-row">
					<label for="tags">Tags</label>
					<input type="text" name="tags" id="tags" class="input-text">
				</div>
				<div class="form-row-last">
					<input type="submit" name="register" class="register" value="Register">
				</div>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
</body>
</html>
</html>
