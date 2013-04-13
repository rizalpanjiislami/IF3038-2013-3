<?php
	include "koneksi.php";
	
	$kodeuser = $_GET['kodeuser'];
	$kodetugas = $_GET['kodetugas'];
	
	$data = mysql_query("SELECT* FROM attachment WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	
	while($baris = mysql_fetch_array($data))
	{
		unlink($baris['alamat']);
	}
	
	$data = mysql_query("DELETE FROM komentar WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");

	$data = mysql_query("DELETE FROM assigne WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	
	$data = mysql_query("DELETE FROM tag WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	
	$data = mysql_query("DELETE FROM attachment WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	
	$data = mysql_query("DELETE FROM tugas WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	
?>

<SCRIPT LANGUAGE="JavaScript">
			window.alert ("Task Berhasil Dihapus");
			setTimeout("location.href = 'home.php?link=selamatdatang';",1);
</SCRIPT> 