<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%		  
		  Connection con = null;

      	  Class.forName("com.mysql.jdbc.Driver").newInstance();
		  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesprogin2", "root", "");
%>
<%

String namakategori = request.getParameter("namakategori");
String penggunapanjang = request.getParameter("pengguna");
String kodeuserpembuat = session.getAttribute("kodeuser");

String[] pengguna = penggunapanjang.split(" ");

foreach($pengguna as $a)
{
	$data = mysql_query("INSERT INTO kategori VALUES('$namakategori','$a','$kodeuserpembuat')");
}
%>

<html>
    <script type='text/javascript'>
    self.close();
    </script>
</html>