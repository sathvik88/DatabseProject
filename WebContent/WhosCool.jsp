<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table class="table table-striped" align="center" cellpadding="5" cellspacing="5" border="1">
			   <thead>
			   	<td><b>ID</b></td>
			   	<td><b>Comedian</b></td>
				<td><b>Score</b></td>
				<td><b>Videos</b></td>
			   </thead>
			<tbody>
				<%
			try {
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "SELECT * FROM comedian.posts where score = 'Excellent'"; // change to match DB
			String query = request.getParameter("q");
			String data;
			if(query!=null){
				data = "select * from posts where comedian like '%"+query+"%'";
			} else{
				data = "select * from posts order by id desc";
			}
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
			%>
			
			<tr bgcolor="#FFFFFF">
				<td><%=resultSet.getString("id")%></td>
				<td><%=resultSet.getString("comedian")%></td>
				<td><%=resultSet.getString("score")%></td>
				<td><form class="form-inline my-2 my-lg-0" action="VideoPosts.jsp" method = "get">
		      <input class="form-control mr-sm-2" type="text" value='<%=resultSet.getString("comedian")%>' name="q" aria-label="Search">
		      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Go</button>
		    </form></td>
				
			</tr>
			<%
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</div>
		</table>
</body>
</html>