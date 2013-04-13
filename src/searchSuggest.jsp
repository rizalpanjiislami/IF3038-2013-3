<?php
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT" ); 
header("Last-Modified: " . gmdate( "D, d M Y H:i:s" ) . "GMT" ); 
header("Cache-Control: no-cache, must-revalidate" ); 
header("Pragma: no-cache" );
header("Content-Type: text/xml; charset=utf-8");

require('koneksi.php');
if (isset($_GET['search']) && $_GET['search'] != '') {
	$search = addslashes($_GET['search']);
	$suggest_query = mysql_query("SELECT distinct(namatugas) as suggest FROM tugas WHERE namatugas like('" . 
		$search . "%') UNION SELECT distinct (username) as suggest FROM user WHERE username like('" . $search . "%') UNION SELECT distinct(kategori) FROM tugas WHERE kategori like('" . $search . "%') ORDER BY suggest ") ;
	while($suggest = mysql_fetch_array($suggest_query)) {
		echo $suggest['suggest'] . "\n";
	}
}
?>