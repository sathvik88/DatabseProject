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
			<form class="form-detail" action="insert" method="post" id="myform">
				<div class="form-row">
					<center><label for="your_email">REGISTER</label></center>
				</div>
				<div class="form-row">
					<label for="username">E-MAIL</label>
					<input type="text" name="username" id="username" class="input-text" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">
				</div>
				<div class="form-row">
					<label for="password">PASSWORD</label>
					<input type="password" name="password" id="password" class="input-text" required>
				</div>
				<div class="form-row">
					<label for="comfirm_password">CONFIRM PASSWORD</label>
					<input type="password" name="comfirm_password" id="comfirm_password" class="input-text" required>
				</div>
				<div class="form-row">
					<label for="firstName">FIRST NAME</label>
					<input type="text" name="firstName" id="firstName" class="input-text" required pattern="[a-zA-Z]{2,20}">
				</div>
				<div class="form-row">
					<label for="lastName">LAST NAME</label>
					<input type="text" name="lastName" id="lastName" class="input-text" required pattern="[a-zA-Z]{2,20}">
				</div>
				<div class="form-row">
					<label for="age">AGE</label>
					<input type="number" name="age" id="age" class="input-text" size="5" required title="Please enter a number" required pattern="[0-9]{1,3}">
				</div>
				<div class="form-row">
					<label for="gender">GENDER</label>
					<input type="text" name="gender" id="gender" class="input-text" size="1" required title="Please enter M or F" required pattern="[M,F]">
				</div>
				<div class="form-row-last">
					<input type="submit" name="register" class="register" value="Register">
					<p>Or<a href="Login.jsp">Login</a></p>
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
		  		comfirm_password: {
		  			required: "Please provide a password",
		      		equalTo: "Password do not match!"
		    	},
		  	    firstName: {
	  			required: "Please provide a First Name"
		  	    },
		  	  	lastName: {
		  		required: "Please provide a Last Name"
			  	},
			  	age: {
		  		required: "Please provide an Age"
			  	},
	  		},
		});
	</script>
</body>
</html>
</html>
