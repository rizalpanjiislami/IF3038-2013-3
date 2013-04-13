<?php

$kodetugas = $_GET['kodetugas'];
$kodeuser = $_GET['kodeuser'];

include "koneksi.php";

$data = mysql_query("SELECT* FROM attachment WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	
	while($baris = mysql_fetch_array($data))
	{
		unlink($baris['alamat']);
	}

mysql_query("DELETE FROM komentar WHERE kodetugas='$kodetugas' AND kodeuser='$kodeuser'");

mysql_query("DELETE FROM assigne WHERE kodetugas='$kodetugas' AND kodeuser='$kodeuser'");

mysql_query("DELETE FROM tag WHERE kodetugas='$kodetugas' AND kodeuser='$kodeuser'");

mysql_query("DELETE FROM attachment WHERE kodetugas='$kodetugas' AND kodeuser='$kodeuser'");

mysql_query("DELETE FROM tugas WHERE kodetugas='$kodetugas' AND kodeuser='$kodeuser'");
?>

<SCRIPT LANGUAGE="JavaScript">
			window.alert ("Task Berhasil Dihapus");
			setTimeout("location.href = 'home.php?link=selamatdatang';",1);
</SCRIPT> 