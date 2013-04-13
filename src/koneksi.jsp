<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");

Connection con = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesprogin2", "root", "");
out.println("hay");
%>