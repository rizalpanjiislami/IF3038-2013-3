<?php

include "koneksi.php";

$offset = is_numeric($_POST['offset']) ? $_POST['offset'] : die();
$postnumbers = is_numeric($_POST['number']) ? $_POST['number'] : die();


$run = mysql_query("SELECT * FROM tugas WHERE namatugas REGEXP '$cari' UNION SELECT a.kodeuser,a.kodetugas,a.namatugas,a.deadline,a.statustugas,a.kategori FROM tugas AS A INNER JOIN komentar AS B USING(kodeuser,kodetugas) WHERE B.komentar REGEXP '$cari' LIMIT ".$postnumbers." OFFSET ".$offset);


while($row = mysql_fetch_array($run)) {
	
	$content = substr(strip_tags($row['post_content']), 0, 500);
	
	echo '<h1><a href="'.$row['guid'].'">'.$row['post_title'].'</a></h1><hr />';
	echo '<p>'.$content.'...</p><hr />';

}

?>