<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");

Connection con = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesprogin2", "root", "");

session.setAttribute("username", username );

Statement st= con.createStatement();
ResultSet data=st.executeQuery("SELECT * FROM user WHERE username='"+username+"'");

if(data.next())
{
	if(data.getString("password").equals(password))
	{
		session.setAttribute("kodeuser",data.getString("kodeuser"));
		session.setAttribute("foto",data.getString("foto"));
		out.print("ok");
	}
	else
	{
		out.print("gagal");
	}
}

%>