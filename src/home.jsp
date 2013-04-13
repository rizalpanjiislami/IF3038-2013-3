<html>
<head>
<title>Shared To Do List | For Dummies</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="clccss.css" type="text/css">

<script>
var ajaxku;
function ambildata(pilihan){
	ajaxku = buatajax();
	var url="ambildata.jsp";
	url=url+"?kategori="+pilihan;
	url=url+"&sid="+Math.random();
	ajaxku.onreadystatechange=stateChanged;
	ajaxku.open("GET",url,true);
	ajaxku.send(null);
	
	setTimeout("ambildata(pilihan)", 3000);
}
function buatajax(){
	if (window.XMLHttpRequest){
		return new XMLHttpRequest();
	}
	if (window.ActiveXObject){
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}

function stateChanged(){
	var data;
	if (ajaxku.readyState==4){
		data=ajaxku.responseText;
		//alert(data);
		if(data.length>0){
			main_body.innerHTML = data;
		}else{
			document.getElementById("kategori").value = "";
		}
	}
}
</script>

<style type="text/css">

.suggest_link {
				background-color: #FFFFFF;
				padding: 2px 6px 2px 6px;
			}
.suggest_link_over {
				background-color: #3366CC;
				padding: 2px 6px 2px 6px;
			}
#search_suggest {
				position: absolute; 
				background-color: #FFFFFF; 
				text-align: left; 
				border: 1px solid #000000;			
			}

table.tab{ border: 1px solid black; padding: 5px; }

tr #highlight:hover{
	    background-color:#FF8600;
}

.tabelkeren {
	margin:0px;padding:0px;
	width:100%;
	box-shadow: 10px 10px 5px #888888;
	border:1px solid #000000;
	
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
	
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
	
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
	
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}.tabelkeren table{
	width:100%;
	height:100%;
	margin:0px;padding:0px;
}.tabelkeren tr:last-child td:last-child {
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
}
.tabelkeren table tr:first-child td:first-child {
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}
.tabelkeren table tr:first-child td:last-child {
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
}.tabelkeren tr:last-child td:first-child{
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
}.tabelkeren tr:hover td{
	background-color:#d3e9ff;
		

}
.tabelkeren td{
	vertical-align:middle;
		background:-o-linear-gradient(bottom, #ffffff 5%, #d3e9ff 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #d3e9ff) ); 
	background:-moz-linear-gradient( center top, #ffffff 5%, #d3e9ff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#ffffff", endColorstr="#d3e9ff");	background: -o-linear-gradient(top,#ffffff,d3e9ff);

	background-color:#ffffff;

	border:1px solid #000000;
	border-width:0px 1px 1px 0px;
	text-align:left;
	padding:7px;
	font-size:10px;
	font-family:Arial;
	font-weight:normal;
	color:#000000;
}.tabelkeren tr:last-child td{
	border-width:0px 1px 0px 0px;
}.tabelkeren tr td:last-child{
	border-width:0px 0px 1px 0px;
}.tabelkeren tr:last-child td:last-child{
	border-width:0px 0px 0px 0px;
}
.tabelkeren tr:first-child td{
		background:-o-linear-gradient(bottom, #0057af 5%, #007fff 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #0057af), color-stop(1, #007fff) );
	background:-moz-linear-gradient( center top, #0057af 5%, #007fff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#0057af", endColorstr="#007fff");	background: -o-linear-gradient(top,#0057af,007fff);

	background-color:#0057af;
	border:0px solid #000000;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:14px;
	font-family:Arial;
	font-weight:bold;
	color:#ffffff;
}
.tabelkeren tr:first-child:hover td{
	background:-o-linear-gradient(bottom, #0057af 5%, #007fff 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #0057af), color-stop(1, #007fff) );
	background:-moz-linear-gradient( center top, #0057af 5%, #007fff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#0057af", endColorstr="#007fff");	background: -o-linear-gradient(top,#0057af,007fff);

	background-color:#0057af;
}
.tabelkeren tr:first-child td:first-child{
	border-width:0px 0px 1px 0px;
}
.tabelkeren tr:first-child td:last-child{
	border-width:0px 0px 1px 1px;
}


.tombol {
	-moz-box-shadow:inset 0px 1px 0px 0px #bee2f9;
	-webkit-box-shadow:inset 0px 1px 0px 0px #bee2f9;
	box-shadow:inset 0px 1px 0px 0px #bee2f9;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #63b8ee), color-stop(1, #468ccf) );
	background:-moz-linear-gradient( center top, #63b8ee 5%, #468ccf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#63b8ee', endColorstr='#468ccf');
	background-color:#63b8ee;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #3866a3;
	display:inline-block;
	color:#14396a;
	font-family:Arial Black;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:1px 1px 0px #7cacde;
}.tombol:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #468ccf), color-stop(1, #63b8ee) );
	background:-moz-linear-gradient( center top, #468ccf 5%, #63b8ee 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#468ccf', endColorstr='#63b8ee');
	background-color:#468ccf;
}.tombol:active {
	position:relative;
	top:1px;
}




.classname {
	-moz-box-shadow:inset 1px 0px 0px 0px #ffffff;
	-webkit-box-shadow:inset 1px 0px 0px 0px #ffffff;
	box-shadow:inset 1px 0px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-moz-border-radius:7px;
	-webkit-border-radius:7px;
	border-radius:7px;
	border:2px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:arial;
	font-size:14px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:1px -1px 0px #ffffff;
}.classname:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
	background:-moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
	background-color:#dfdfdf;
}.classname:active {
	position:relative;
	top:1px;
}

.classname2 {
	-moz-box-shadow:inset 1px 0px 0px 0px #bbdaf7;
	-webkit-box-shadow:inset 1px 0px 0px 0px #bbdaf7;
	box-shadow:inset 1px 0px 0px 0px #bbdaf7;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5) );
	background:-moz-linear-gradient( center top, #79bbff 5%, #378de5 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5');
	background-color:#79bbff;
	-moz-border-radius:7px;
	-webkit-border-radius:7px;
	border-radius:7px;
	border:2px solid #84bbf3;
	display:inline-block;
	color:#ffffff;
	font-family:arial;
	font-size:16px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:1px -1px 0px #528ecc;
}.classname2:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff) );
	background:-moz-linear-gradient( center top, #378de5 5%, #79bbff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff');
	background-color:#378de5;
}.classname2:active {
	position:relative;
	top:1px;
}

.putih {
	color: #FFF;
}
putih {
	color: #FFF;
}

<!--
table.tab{ border: 1px solid black; padding: 5px; }

tr #highlight:hover{
	    background-color:#FF8600;
}

tr #highlight2:hover{
	    background-color:#cccc66;
}

.style6 {
	color: #FFFFFF;
	font-size: 9px;
}
.style10 {color: #FF0000}
.style11 {color: #6633FF}
.bg_main tr td table tr td .right_edge .corner_inner #main_body table tr td .contentpaneopen tr td .componentheading_1a table {
	text-align: center;
}
-->
</style>

<script language="JavaScript" type="text/javascript" src="ajax_search.js"></script>

</head>
<body class="bg_main" onLoad="startclock()">
<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" id="outer">
  <tr>
    <td><table width="100%" height="80"  border="0" cellpadding="1" cellspacing="1">
      <tr>
        <td colspan="2">
		<div align="center">
        <table width="100%" border="0">
  <tr height="30%">
    <td width="100%" bgcolor="#7190C9">
	  <p><a href="home.jsp?link=selamatdatang"><img src="images2/backgroundlogo.jpg" width="100%" height="168"></a></p>
	  <form name="form1" method="POST" action="home.jsp?link=search">
	    <p align="center">
	      <input type="text" name="cari" id="cari" onKeyUp="searchSuggest();" autocomplete="off">
	      <input type="submit" name="tombolcari" id="tombolcari" value="Search">
	      <label for="filter"></label>
	      <select name="filter" id="filter">
	        <option value="semua">Semua</option>
	        <option value="username">Username</option>
	        <option value="kategori">Kategori</option>
	        <option value="tugas">Tugas</option>
          </select>
          <div id="search_suggest">
          </div>
	   </p>
	   <p align="center">Anda Login Sebagai <a href="home.jsp?link=halamanprofil&username=<% out.print(session.getAttribute("username")); %>"><img src="<% out.print(session.getAttribute("foto")); %>" alt="" width="20" height="20"></a><a href="home.jsp?link=halamanprofil&username=<% out.print(session.getAttribute("username")); %>">
	     <%
			  out.print(session.getAttribute("username"));
	     %>
	      </a> <a href="halamanprofil.html"></a></p>
	    </form></td>
    </tr>
    <tr>
    <td>
    
    </td>
    </tr>
</table>

        </div>
		<div id="can_pathway"> 
          <div align="center"><span class="pathway"><a href="home.jsp?link=selamatdatang">HOME</a> - <a href="home.jsp?link=halamanprofil&username=<% out.print(session.getAttribute("username")); %>">MY PROFILE</a> - <a href="proseslogout.jsp">LOGOUT</a></span></div>
        </div>
		</td>
	  </tr>	
    </table></td>
  </tr>
<tr>
    <td>
 <!-- ----------------TABLE NAVIGASI---------->   
<table width="100%"  border="0" cellspacing="1" cellpadding="1">
      <tr>
        <td width="20%" valign="top" bgcolor="#7190C9">
		<p align="center">&nbsp;</p>
		<table width="100%" border="0">
		  
		  <div align="center">
            <%
			 if (request.getParameter("link").equals("selamatdatang"))
			  {
				  %>
						<tr id="highlight">
							  <td width="62" align="center"><div align="center"><a href="buatkategoribaru.html" onClick="javascript:void window.open('buatkategoribaru.html','1361268565414','width=300,height=300,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0');return false;"><img src="icon/png/64x64/kategori.png" alt="" width="64" height="64"></a></div></td>
							  <td width="97" height="25" align="center"><div align="center" class="putih">
							    <div align="center" class="putih">
							      <div align="left" class="putih"><strong>BUAT KATEGORI BARU</strong></div>
							    </div>
							  </div></td>
                         </tr>
                         
                         <tr id="highlight">
							  <td width="62" align="center"><div align="center"><a href="hapuskategori.jsp" onClick="javascript:void window.open('hapuskategori.jsp','1361268565414','width=300,height=300,toolbar=0,menubar=0,location=0,status=1,scrollbars=1,resizable=1,left=0,top=0');return false;"><img src="icon/png/64x64/delete.png" alt="" width="64" height="64"></a></div></td>
							  <td width="97" height="25" align="center"><div align="center" class="putih">
							    <div align="center" class="putih">
							      <div align="left" class="putih"><strong>HAPUS KATEGORI</strong></div>
							    </div>
							  </div></td>
                         </tr>
			  	  <%
              }
		  %>
          </div>
		  </table>
<!------------------NAVIGASI END ------------------>
		<form name="form2" method="post" action="">
		  <p>&nbsp;</p>
		  <p align="center">
          
          <label for="kategori"></label>
          <%
		  	if(request.getParameter("link").equals("selamatdatang"))
			{
		  %>
		    <select name="kategori" id="kategori" onchange=ambildata(this.value)>
            <option value="semua">SEMUA</option>
          <%@ page import ="java.sql.*" %>
		  <%@ page import ="javax.sql.*" %>
		  <%
		  
		  Connection con = null;

      	  Class.forName("com.mysql.jdbc.Driver").newInstance();
		  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesprogin2", "root", "");
		  
		  Statement st= con.createStatement();
		  ResultSet data=st.executeQuery("SELECT DISTINCT kategori FROM kategori");

		  while(data.next())
		  {
		      String isi = data.getString("kategori");
			  out.print("<a href=''>"+isi+"</a><br><br>");
			  %>
			  <option value="<% out.print(isi); %>"><% out.print(isi); %></option>
              <%
		  }
		  
		  %>
		  </select>
          <%
			}
          %>
          </p>
		  <p align="center">
		    <label for="kategori"></label>
		  </p>
		  </form>
		<p>&nbsp;</p>
		<p align="center">&nbsp;</p></td>
        <td width="80%" valign="top" bgcolor=
        "#FFFFFF">
		  <div class="left_edge">
                      <div class="right_edge">
                        <div class="top_edge">
                          <div class="top_lcorner">
                            <div class="top_rcorner"> </div>
                          </div>
                        </div>
                        <div class="corner_inner">
                          <div id="main_body">
                            <table width="100%" height="171" cellpadding="0" cellspacing="0">
                              <tr>
                                <td valign="top"><div>
                                    <table class="contentpaneopen" width="100%">
                                      <tr>
                                      	<td>
	                                        <div class="componentheading_1a">
	                                          <table width="100%" border="0">
	                                            
	                                            <tr>
	                                              <td width="421"></td>
                                                </tr>
                                              </table>
	                                        </div>
                                        </td>
                                      </tr>
                                    </table>
                                <table class="contentpaneopen2" align="center">
                                      <tr>
                                        <td valign="top" colspan="2">
										  <table width="100%" height="100%" border="0">
										   <tr>
										    <td>
										  <%
										  if (request.getParameter("link").equals("selamatdatang"))    { %> <%@include file="selamatdatang.jsp" %> <%}
										  if (request.getParameter("link").equals("halamanrinciantugas"))    { %> <%@include file="halamanrinciantugas.jsp" %> <%}
										  if (request.getParameter("link").equals("halamanprofil"))    { %> <%@include file="halamanprofil.jsp" %> <%}
										  if (request.getParameter("link").equals("editprofil"))    { %> <%@include file="editprofil.jsp" %> <%}
										  if (request.getParameter("link").equals("edittugas"))    { %> <%@include file="edittugas.jsp" %> <%}
										  if (request.getParameter("link").equals("search"))    { %> <%@include file="search.jsp" %> <%}
										  if (request.getParameter("link").equals("delete"))    { %> <%@include file="delete.jsp" %> <%}
										  if (request.getParameter("link").equals("tambahdata"))    { %> <%@include file="tambahdata.jsp" %> <%}
										  if (request.getParameter("link").equals("deletekomentar"))    { %> <%@include file="deletekomentar.jsp" %> <%}
										  %>
										  </td>
										   </tr>
										  </table>						  
			                            </td>
                                      </tr>
                                  </table></td>
                              </tr>
                            </table>
                          </div>
<div id="tabel"> </div>
                        <div class="bottom_edge">
                          <div class="bot_lcorner">
                            <div class="bot_rcorner"> </div>
                          </div>
                        </div>
                      </div>
          </div>
		</td>
  </tr>
  <tr>
    <td colspan="2"><div id="mid_out"><div id="can_pathway"><span class="pathway"></span></div></td>
  </tr>
</table>
</table>
</body>
</html>