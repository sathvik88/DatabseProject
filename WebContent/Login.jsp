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
    <title>User Login</title>
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
			<form class="form-detail" action="LoginRegister" method="post" id="myform">
				<div class="form-row">
					<center><label for="your_email">LOGIN</label></center>
				</div>
				<div class="form-row">
					<label for="username">E-MAIL</label>
					<input type="text" name="username" id="username" class="input-text" required>
				</div>
				<div class="form-row">
					<label for="password">PASSWORD</label>
					<input type="password" name="password" id="password" class="input-text" required>
				</div>
				<div class="form-row-last">
					<input type="submit" name="submit" class="register" value="Login">
					<p>Or<a href="Register.jsp">Register</a></p>
				</div>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script>
		// just for the demos, avoids form submit
		jQuery.validator.setDefaults({
		  	debug: false,
		  	success:  function(label){
        		label.attr('id', 'valid');
   		 	},
		});
		$( "#myform" ).validate({
		  	rules: {
			    your_email: {
			      	required: true,
			      	email: true
			    },
			    password: "required",
		    	comfirm_password: {
		      		equalTo: "#password"
		    	}
		  	},
		  	messages: {
		  		username: {
		  			required: "Please provide an email"
		  		},
		  		password: {
	  				required: "Please provide a password"
		  		},
	  		},
		});
	</script>
</body>
</html>
</html>
