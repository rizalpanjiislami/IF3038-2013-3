<?php

$kodeuser = $_POST['kodeuserlama'];
$kodetugas = $_POST['kodetugaslama'];

$deadline=$_POST['deadline'];
$assigne=$_POST['assigne'];
$tag=$_POST['tag'];

$assignepenggal = (explode(",",$assigne));
$tagpenggal = (explode(",",$tag));

include "koneksi.php";

$data = mysql_query("UPDATE tugas SET deadline='$deadline' WHERE kodetugas='$kodetugas' AND kodeuser='$kodeuser'");

$data = mysql_query("DELETE FROM assigne WHERE kodetugas='$kodetugas' AND kodeuser='$kodeuser'");

foreach($assignepenggal as $a)
{
	$dummy = mysql_query("SELECT * FROM user WHERE username='$a'");
	$baris = mysql_fetch_array($dummy);
	$isi = $baris['kodeuser'];
	
	$data = mysql_query("INSERT INTO assigne VALUES('$kodeuser','$kodetugas','$isi')");
}

$data = mysql_query("DELETE FROM tag WHERE kodetugas='$kodetugas' AND kodeuser='$kodeuser'");

foreach($tagpenggal as $a)
{
	$data = mysql_query("INSERT INTO tag VALUES('$kodeuser','$kodetugas','$a')");
}

?>


<SCRIPT LANGUAGE="JavaScript">
			window.alert ("Tugas Berhasil Diedit");
			setTimeout("location.href = 'home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&kodeuserasal=<?php echo $kodeuser; ?>';",1);
</SCRIPT> 