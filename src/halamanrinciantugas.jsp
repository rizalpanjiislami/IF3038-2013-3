<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%		  
		  Connection con = null;

      	  Class.forName("com.mysql.jdbc.Driver").newInstance();
		  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tubesprogin2", "root", "");
		  
		  String kodeuserlogin = session.getAttribute("kodeuser").toString();
		  String kodeuser = request.getParameter("kodeuserasal");
		  String kodetugas = request.getParameter("kodetugas");
%>

<script>
var ajaxku;
function tambahkomentar(pilihan){
	ajaxku = buatajax();
	var url="tambahkomentar.php";
	url=url+"?kodetugas="+<% out.print(kodetugas); %>;
	url=url+"&kodeuser="+<% out.print(kodeuser); %>;
	url=url+"&komentar="+pilihan;
	url=url+"&sid="+Math.random();
	ajaxku.onreadystatechange=stateChanged;
	ajaxku.open("GET",url,true);
	ajaxku.send(null);
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
			rincian.innerHTML = data;
		}else{
			//document.getElementById("kategori").value = "";
		}
	}
}
</script>

<script>
var ajaxku2;
function proses(pilihan){
	ajaxku2 = buatajax2();
	var url="selesaitidakrincian.php";
	url=url+"?value="+pilihan;
	url=url+"&sid="+Math.random();
	ajaxku2.onreadystatechange=stateChanged2;
	ajaxku2.open("GET",url,true);
	ajaxku2.send(null);
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
			rincian.innerHTML=data2;
		}else{
		}
	}
}
</script>

</head>

<%
	Statement st= con.createStatement();
	ResultSet data=st.executeQuery("SELECT * FROM tugas WHERE kodeuser='"+kodeuser+"' AND kodetugas='"+kodetugas+"'");
	
	Statement st2= con.createStatement();
	ResultSet data2=st2.executeQuery("SELECT * FROM assigne WHERE kodeuser='"+kodeuser+"' AND kodetugas='"+kodetugas+"'");
	
	Statement st3= con.createStatement();
	ResultSet data3=st3.executeQuery("SELECT * FROM tag WHERE kodeuser='"+kodeuser+"' AND kodetugas='"+kodetugas+"'");
	
	Statement st4= con.createStatement();
	ResultSet data4=st4.executeQuery("SELECT * FROM komentar WHERE kodeuser='"+kodeuser+"' AND kodetugas='"+kodetugas+"' ORDER BY tanggal,waktu");
%>

<body>
<div class="corner_inner">
  <div id="main_body">
    <p align="center">
      <%
			String deadline = data.getString("deadline");
	  %>
    </p>
    <div align="center" id="rincian">
      <table width="70%" border="1" class="tabelkeren">
        <tr bgcolor="#0099CC">
          <th height="34" colspan="2" scope="col">RINCIAN TUGAS</th>
        </tr>
        <tr>
          <td width="27%" height="40"><div align="left"><strong>Nama Tugas </strong></div></td>
          <td width="73%"><div align="left"><?php echo $baris['namatugas'];?></div></td>
        </tr>
        <tr>
          <td height="40"><div align="left"><strong>Status Tugas</strong></div></td>
          <td><div align="left">
		    
		
		    <% 
		  
		  	  if(data.getString("statustugas").equals("1"))
			  {
				  %>
			  <input type="checkbox" name="status" id="status" value="<% out.print(kodeuser+"-"+kodetugas+"-"+data.getString("statustugas"));%>" onchange=proses(this.value)>
			  	  <%
				  out.print("Tugas Belum Selesai");
              }
			  else
			  {
				  %>
			  <input type="checkbox" name="status" id="status" value="<% out.print(kodeuser+"-"+kodetugas+"-"+data.getString("statustugas"));%>" checked="checked" onchange=proses(this.value)>
	  	  <%
				  out.print("Tugas Sudah Selesai");
			  }
		  
		  %></div></td>
        </tr>
        <tr>
          <td height="40"><div align="left"><strong>Attachment </strong></div></td>
          <td><div align="left">
            <p>
			<% 
				Statement st5= con.createStatement();
				ResultSet data5=st5.executeQuery("SELECT * FROM attachment WHERE kodeuser='"+kodeuser+"' AND kodetugas='"+kodetugas+"'");
			
				while(data5.next())
				{
					String alamat = data5.getString("alamat");
					
					char[] alamatch = alamat.toCharArray();
					
					int panjang = alamat.length();
					
					String ekstensi;
					
					if(alamatch[panjang-4]!='.')
					{
						ekstensi = Character.toString(alamatch[panjang-4])+Character.toString(alamatch[panjang-3])+Character.toString(alamatch[panjang-2])+Character.toString(alamatch[panjang-1]);
					}
					else
					{
						ekstensi = Character.toString(alamatch[panjang-3])+Character.toString(alamatch[panjang-2])+Character.toString(alamatch[panjang-1]);
					}
					
					if((ekstensi.equals("jpeg")==true)||(ekstensi.equals("jpg")==true))
					{
						%>
                        <img src="<% out.print(data5.getString("alamat"));%>" width="300" height="300" /> <br /> <br />
                        <%
					}
					else
					if(ekstensi.equals("mp4")==true)
					{
						%>
                        <video width="300" height="300" controls>
                          <source src="<% out.print(data.getString("alamat")); %>" type="video/mp4"> <br /> <br />
                        </video> 
                        <%
					}
					else
					{
						%>
                        <a href="<% out.print(data5.getString("alamat"));%>" target="_blank"> <% out.print(data5.getString("alamat"));%> </a> <br /> <br />
                        <%
					}
				}
			%>
			            </p>
</div></td>
        </tr>
        <tr>
          <td height="40"><div align="left"><strong>Deadline </strong></div></td>
          <td><div align="left"><% out.print(deadline); %></div></td>
        </tr>
        <tr>
          <td height="40"><div align="left"><strong>Assigne </strong></div></td>
          <td><div align="left">
            <% 
								  	while(data2.next())
									{
										String dumkod = data2.getString("assigne");
										
										Statement st6= con.createStatement();
										ResultSet data6=st6.executeQuery("SELECT * FROM user WHERE kodeuser='"+dumkod+"'");
			
										%>
<a href="home.jsp?link=halamanprofil&username=<% out.print(data6.getString("username")); %>">
                                        <% 
										    out.print(data6.getString("username")+" ");
										%>
              </a>
                                        <%
									}
								  %>
          </div></td>
        </tr>
        <tr>
          <td height="40"><div align="left"><strong>Komentar </strong></div></td>
          <td><div align="left">
            <%
                                    int jumlahkomentar=0;
									
									while(data4.next())
									{
										jumlahkomentar++;
									}
									
									out.print("Jumlah Komentar : "+jumlahkomentar);
									
									while(data4.next())
									{
										String dumkod = data4.getString("kodeuserkomentar");
										
										Statement st7= con.createStatement();
										ResultSet data7=st7.executeQuery("SELECT * FROM user WHERE kodeuser='"+dumkod+"'");
										
										String avatar = data7.getString("foto");
										out.print("<p><img src='"+avatar+"' width='20' height='20' />"+data7.getString("username")+" : "+data4.getString("komentar")+" ("+data4.getString("tanggal")+"-"+data4.getString("waktu")+")" %> + <% if(data4.getString("kodeuserkomentar").equals(kodeuserlogin)==true) {%> <a href="home.jsp?link=deletekomentar&kodetugas=<% out.print(kodetugas); %>&kodeuser=<% out.print(kodeuser); %>&kodekomentar=<% echo data4.getString("kodekomentar");%>" onClick="return confirm('Apakah komentar ini akan dihapus?')"> Hapus</a> <% }+"</p>");
									}
									%>
          </div></td>
        </tr>
        <tr>
          <td height="40"><div align="left"><strong>Tambah Komentar </strong></div></td>
          <td><div align="center">
            <label for="komentar"></label>
            <form name="komentar" method="GET" action="" >
              <p align="left">
                <textarea name="komentar" id="komentar" cols="50" rows="5"></textarea>
                <label for="kodeuser"></label>
                <input name="kodeuser" type="hidden" id="kodeuser" value="<?php echo $kodeuser; ?>" />
              </p>
              <p align="left">
                <label for="kodeuser"></label>
                <input name="kodetugas" type="hidden" id="kodeuser" value="<?php echo $kodetugas; ?>" />
              </p>
              <p align="left">
                <input type="button" name="kirim" id="kirim" value="Kirim" onclick="tambahkomentar(komentar.value)">
              </p>
            </form>
            </p>
          </div></td>
        </tr>
        <tr>
          <td height="40"><div align="left"><strong>Tag </strong></div></td>
          <td><div align="left">
            <%                                  	  
                                        while(data3.next())
                                        {
                                            out.print(data3.getString("tag")+" ");
                                        }
									  %>
          </div></td>
        </tr>
      </table>
      </p>
    </div>
    <p align="center">&nbsp;
    </p>
    <p align="center"><a href="home.php?link=edittugas&kodetugas=<% out.print(kodetugas); %>&kodeuserasal=<% out.print(kodeuser); %>"> <input type="submit" name="edit" id="edit" value="Edit" /> 
    </a></p>
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