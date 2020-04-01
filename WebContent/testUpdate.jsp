<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<p><br/></p>

<%
String host = "jdbc:mysql://127.0.0.1:3306/comedian";
Connection conn = null;
Statement stat = null;
ResultSet res = null;
PreparedStatement stmt = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(host, "root", "glamboy99");
%>
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
		<input type="text" class="form-control" name="score" value='<%=res.getString("score")%>'/>
	</div>
	<div class="form-group">
		<label>Comment</label>
		<input type="text" class="form-control" name="comment" value='<%=res.getString("comment")%>'/>
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