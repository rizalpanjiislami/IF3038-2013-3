<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<script>
var ajaxku2;
function proses(pilihan){
	ajaxku2 = buatajax2();
	var url="selesaitidak.php";
	url=url+"?value="+pilihan;
	url=url+"&sid="+Math.random();
	ajaxku2.onreadystatechange=stateChanged2;
	ajaxku2.open("GET",url,true);
	ajaxku2.send(null);
	
	setTimeout("proses(pilihan)", 3000);
}
function buatajax2(){
	if (window.XMLHttpRequest){
		return new XMLHttpRequest();
	}
	if (window.ActiveXObject){
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}

function stateChanged2(){
	var data2;
	if (ajaxku2.readyState==4){
		data2=ajaxku2.responseText;
		if(data2.length>0){
			hasil.innerHTML=data2;
		}else{
		}
	}
}
</script>

</head>

<body>
<div class="corner_inner">
  <div id="main_body">
    <div align="center" id="hasil">
      <p align="center"><strong>SELAMAT DATANG <?php echo $_COOKIE['username'];?></strong></p>
      <p align="center"><strong>BERIKUT DAFTAR TO DO LIST ANDA</strong>      </p>
      <table width="70%" border="1" class="tabelkeren">
        <tr bgcolor="#0099CC">
          <th width="5%" height="34" scope="col">No.</th>
          <th width="22%" scope="col">Nama Tugas</th>
          <th width="14%" scope="col">Deadline</th>
          <th width="14%" scope="col">Tag</th>
          <th width="22%" scope="col">Status Tugas</th>
          <th width="6%" scope="col">&nbsp;</th>
          <th width="17%" scope="col">&nbsp;</th>
        </tr>
        <%@ page import ="java.sql.*" %>
		  <%@ page import ="javax.sql.*" %>
		  <%
		  
		  Connection con = null;

      	  Class.forName("com.mysql.jdbc.Driver").newInstance();
		  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesprogin2", "root", "");
		  
		  String kodeuser = session.getAttribute("kodeuser").toString();
		  
		  Statement st= con.createStatement();
		  ResultSet data=st.executeQuery("SELECT * FROM tugas WHERE kodeuser='"+kodeuser+"'");
		  
		  Statement st2= con.createStatement();
		  ResultSet data2=st2.executeQuery("SELECT * FROM tugas INNER JOIN assigne USING (kodeuser,kodetugas) WHERE assigne='"+kodeuser+"'");
		  
		  int i =0;
		  int kodetugas=0;
		  
		  while(data.next())
		  {
			  i++;
			  kodetugas = Integer.parseInt(data.getString("kodetugas"));
		  
		  %>
		
		
		
		<tr>
          <td><div align="center"><% out.print(i); %></div></td>
          <td><div align="center"><a href="home.jsp?link=halamanrinciantugas&kodetugas=<% out.print(kodetugas); %>&amp;kodeuserasal=<% out.print(kodeuser); %>"> <% out.print(data.getString("namatugas")); %></a></div></td>
          <td><div align="center"><% out.print(data.getString("deadline")); %></div></td>
          <td><div align="center">
            <%
											 	Statement st3= con.createStatement();
												ResultSet data3=st3.executeQuery("SELECT * FROM tugas INNER JOIN tag USING (kodeuser,kodetugas) WHERE kodeuser='"+kodeuser+"' AND kodetugas='"+kodetugas+"'");												
												
												while(data3.next())
												{
													out.print(data3.getString("tag"));
												}
			%>
          </div></td>
          <td><div align="center">
            <% 
		  			if(data.getString("statustugas").equals("0"))
					{
						out.print("Tugas Selesai");
					}
					else
					{
						out.print("Tugas Belum Selesai");
					}
			  %>
          </div></td>
          <td><input name="<% out.print(i); %>" type="checkbox" value="<% out.print(data.getString("kodeuser")+"-"+data.getString("kodetugas")+"-"+data.getString("statustugas"));%>" <% if(data.getString("statustugas").equals("0")) { out.print("checked='checked'");} %> onchange=proses(this.value)></td>
          <td>
       	  <div align="center"><a href="home.jsp?link=delete&kodetugas=<% out.print(kodetugas); %>&kodeuser=<% out.print(kodeuser); %>" onClick="return confirm('Apakah tugas ini akan dihapus?')"> Hapus</a></div></td>
        </tr>
        <%
                                    }
								
								%>
        <%
//ini yang tagnya
while (data2.next())
{
	i++;
	kodetugas = Integer.parseInt(data2.getString("kodetugas"));
	int kodeuserpembuat = Integer.parseInt(data2.getString("kodeuser"));
%>
        <tr>
          <td><div align="center"><% out.print(i); %></div></td>
          <td><div align="center"><a href="home.php?link=halamanrinciantugas&kodetugas=<% out.print(kodetugas); %>&amp;kodeuserasal=<% out.print(kodeuserpembuat); %>"> <% out.print(data2.getString("namatugas")); %></a></div></td>
          <td><div align="center"><% out.print(data2.getString("deadline")); %></div></td>
          <td><div align="center">
            <%
    Statement st4= con.createStatement();
	ResultSet data4=st4.executeQuery("SELECT * FROM tugas INNER JOIN tag USING (kodeuser,kodetugas) WHERE kodeuser='"+kodeuserpembuat+"' AND kodetugas='"+kodetugas+"'");												
												
    while(data4.next())
	{
		out.print(data4.getString("tag")+" ");
	}
%>
          </div></td>
          <td><div align="center">
            <% 
		  			if(data2.getString("statustugas").equals("0"))
					{
						out.print("Tugas Selesai");
					}
					else
					{
						out.print("Tugas Belum Selesai");
					}
			  %>
          </div></td>
          <td><input name="<% out.print(i); %>" type="checkbox" value="<% out.print(data2.getString("kodeuser")+"-"+data2.getString("kodetugas")+"-"+data2.getString("statustugas"));%>" <% if(data2.getString("statustugas").equals("0")) { out.print("checked='checked'");} %> onchange=proses(this.value)></td>
          <td>&nbsp;</td>
          <%	
}

%>
        </tr>
      </table>
    </div>
    <p align="center">&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td valign="top"><div>
          <table class="contentpaneopen" align="center">
            <tr>
              <td valign="top" colspan="2"></td>
            </tr>
          </table></td>
      </tr>
    </table>
  </div>
</div>
</body>
</html>