<?php

$kategori = $_GET['kategori'];

include "koneksi.php";

$data = mysql_query("DELETE FROM kategori WHERE kategori='$kategori'");

$data = mysql_query("SELECT DISTINCT kodeuser,kodetugas FROM tugas WHERE kategori='$kategori'");

while($baris = mysql_fetch_array($data))
{
	$data2 = mysql_query("DELETE FROM komentar WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	
	$data2 = mysql_query("DELETE FROM attachment WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");

	$data2 = mysql_query("DELETE FROM assigne WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");

	$data2 = mysql_query("DELETE FROM tag WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	
	$data2 = mysql_query("DELETE tugas komentar WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
}

?>

<html>
    <script type='text/javascript'>
    self.close();
    </script>
</html>