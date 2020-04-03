<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
String id = request.getParameter("d");
String host = "jdbc:mysql://127.0.0.1:3306/comedian";
int no = Integer.parseInt(id);
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection(host, "root", "glamboy99");
Statement stat = conn.createStatement();
stat.executeUpdate("delete from posts where id ='"+no+"'");
response.sendRedirect("VideoPosts.jsp");
%>