<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

<%
String host = "jdbc:mysql://127.0.0.1:3306/comediandb";
Connection conn = null;
Statement stat = null;
ResultSet res = null;
PreparedStatement stmt = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(host, "root", "pass1234");
%>

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


<div class="container">
			 <h2>Edit/Rate Post</h2>
			 <p>Pulling data from Comedian Database</p>   
			 
			 
	<nav class="navbar navbar-light bg-white">
    <div class="container-fluid gedf-wrapper">
   
            

    </div>
</nav>

<form action="" method="post">
	<%
	stat = conn.createStatement();
	String u = request.getParameter("u");
	int num = Integer.parseInt(u);
	String data = "select * from posts where id='"+num+"'";
	res = stat.executeQuery(data);
	while(res.next()){
		
	%>
	<input type="hidden" name="id" value='<%=res.getString("id")%>'/>
	<div class="form-group">
		<label>URL</label>
		<input type="text" class="form-control" name="url" value='<%=res.getString("url")%>'/>
	</div>
	<div class="form-group">
		<label>Title</label>
		<input type="text" class="form-control" name="title" value='<%=res.getString("title")%>'/>
	</div>
	<div class="form-group">
		<label>Description</label>
		<input type="text" class="form-control" name="description" value='<%=res.getString("description")%>'/>
	</div>
	<div class="form-group">
		<label>Tags</label>
		<input type="text" class="form-control" name="tags" value='<%=res.getString("tags")%>'/>
	</div>
	<div class="form-group">
		<label>Score</label>
		<label for="score">Score</label>
			<select id = "score" name="score">
				<option>*Select Score*</option>
				<option value="Excellent">Excellent</option>
				<option value="Good">Good</option>
				<option value="Fair">Fair</option>
				<option value="Poor">Poor</option>
			</select>
	</div>
	<div class="form-group">
		<label>Comment</label>
		<textarea class="form-control" name="comment" placeholder="add a comment"></textarea>
		
	</div>
	<%
	}
	%>
	<button type="submit" class="btn btn-warning">Update</button>
</form>
<%
String a = request.getParameter("id");
String b = request.getParameter("url");
String c = request.getParameter("title");
String d = request.getParameter("description");
String e = request.getParameter("tags");
String f = request.getParameter("score");
String g = request.getParameter("comment");
if(a!=null && b!=null && c!=null && d!=null && e!=null && f!=null && g!=null){
	String query = "update posts set url=?, title=?, description=?, tags=?, score=?, comment=? where id='"+a+"'";
	stmt = conn.prepareStatement(query);
	stmt.setString(1,b);
	stmt.setString(2,c);
	stmt.setString(3,d);
	stmt.setString(4,e);
	stmt.setString(5,f);
	stmt.setString(6,g);
	stmt.executeUpdate();
	response.sendRedirect("VideoPosts.jsp");
}
%>
</html>