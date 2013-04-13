<?php
$data4 = mysql_query("SELECT * FROM komentar WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas' ORDER BY tanggal,waktu");

while($baris4=mysql_fetch_array($data4))
{
	$dumkod = $baris4['kodeuserkomentar'];
	$dummy = mysql_query("SELECT * FROM user WHERE kodeuser='$dumkod'");
	$dumdata = mysql_fetch_array($dummy);
	echo "<p>".$dumdata['username']." : ".$baris4['komentar']." (".$baris4['tanggal']."-".$baris4['waktu'].")"."</p>";
}
?>