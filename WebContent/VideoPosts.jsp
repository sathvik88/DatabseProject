<!-- 
==============================================================================================	
-CSC 4710 - Database
-By:
------Sathvik Konuganti
------Santhosh Abraham
==============================================================================================
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 
===============================================================================================================================
															HTML Code
===============================================================================================================================
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Welcome the Video page!</title>
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
		    <form class="form-inline my-2 my-lg-0" method = "get">
		      <input class="form-control mr-sm-2" type="text" placeholder="Search" name="q" aria-label="Search">
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		    </form>
		  </div>
		</nav>
<!-- 
===============================================================================================================================
												Posting 			
===============================================================================================================================
-->
		<div class="container">
			 <h2>User Posts</h2>
			 <p>Pulling data from Comedian Database</p>   
			 
			 
	<nav class="navbar navbar-light bg-white">
    <div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">
                <!-- <div class="card">
                    <div class="card-body">
                        <div class="h5">@User</div>
                        <div class="h7 text-muted">Fullname: Username </div>
                    </div>
                </div> -->
            </div>
            <div class="col-md-6 gedf-main">

                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Post a Video</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="page-content">
								<form class="text-center border border-light p-5" action="insertPost" method="post" id="myform">
									<input type="text" id="comedian" name ="comedian" class="form-control mb-4" placeholder="Comedian name">	
								    <input type="text" id="url" name ="url" class="form-control mb-4" placeholder="Youtube URL">
									<input type="text" id="title" name ="title" class="form-control mb-4" placeholder="Youtube Title">
									<input type="text" id="description" name ="description" class="form-control mb-4" placeholder="Description">
									<input type="text" id="tags" name ="tags" class="form-control mb-4" placeholder="Tags">
									<input type="submit" onclick="alert('Only 5 posts per day!');" class="btn btn-primary" name="register" class="register" value="Post">
								</form>

                        </div>
                    </div>
                </div>
                
                <!-- Post /////-->
                <!-- <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">@User</div>
                                    <div class="h7 text-muted">User Name</div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">

                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">Edit</a>
                                        <a class="dropdown-item" href="#">Delete</a>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                        

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>10 min ago</div>
                        <a class="card-link" href="#">
                            <h5 class="card-title">Video Title Here</h5>
                        </a>

                        <p class="card-text">
                            Video Description
                        </p>
                        <div>
                            <span class="badge badge-primary">Tag1</span>
                            <span class="badge badge-primary">Tag2</span>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Share</a>
                    </div>
                </div> -->
                <!-- Post /////-->
        </div>
    </div>
			 
<!-- 
===============================================================================================================================
												Table			
===============================================================================================================================
-->			 
			 
			       
			 <table class="table table-striped" align="center" cellpadding="5" cellspacing="5" border="1">
			   <thead>
			   	<td><b>ID</b></td>
			   	<td><b>Comedian</b></td>
			    <td><b>URL</b></td>
				<td><b>Title</b></td>
				<td><b>Description</b></td>
				<td><b>Tags</b></td>
				<td><b>Score</b></td>
				<td><b>Comment</b></td>
				<td><b>Time</b></td>
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
					data = "select * from posts where url like '%"+query+"%' or title like '%"+query+"%' or description like '%"+query+"%' or tags like '%"+query+"%' or comedian like '%"+query+"%'";
				} else{
					data = "select * from posts order by id desc";
				}
				
				res = stat.executeQuery(data);
				while(res.next()){ 
				%>
			</tbody>
			<tr bgcolor="#FFFFFF">
				<td><%=res.getString("id")%></td>
				<td><%=res.getString("comedian")%></td>
				<td><%=res.getString("url")%></td>
				<td><%=res.getString("title")%></td>
				<td><%=res.getString("description")%></td>
				<td><%=res.getString("tags")%></td>
				<td><%=res.getString("score")%></td>
				<td><%=res.getString("comment")%></td>
				<td><%=res.getString("created")%></td>
				<td><a href='testUpdate.jsp?u=<%=res.getString("id")%>' class="btn btn-warning">Review</a>
				<a href='Delete.jsp?d=<%=res.getString("id")%>' class="btn btn-danger">Delete</a></td>
			</tr>
			<%
				}
			%>
			
			</div>
		</table>
		<form action="Reviews"> 
			<input  class="btn btn-outline-primary" id = "Review" type="submit" value="Add to Reviews">
		</form>
	</body>
</html>





