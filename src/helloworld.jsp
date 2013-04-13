<html>
<head><title>First JSP</title></head>
<body>
  <%
	session.setAttribute("kodeuser", "123" );
	out.println("ini hasilnya "+session.getAttribute("kodeuser"));
  %>
</body>
</html>