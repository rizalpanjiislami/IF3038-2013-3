<?php

$kodeuser = $_GET['kodeuser'];
$kodetugas = $_GET['kodetugas'];
$kodekomentar= $_GET['kodekomentar'];

include "koneksi.php";

$data = mysql_query("DELETE FROM komentar WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas' AND kodekomentar='$kodekomentar'");

?>

<script language="javascript">

window.alert("Komentar Berhasil Dihapus!");
setTimeout("location.href = 'home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&kodeuserasal=<?php echo $kodeuser; ?>';",1);

</script>