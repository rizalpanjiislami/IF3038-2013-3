<?php
session_start();

include "koneksi.php";

$namatugas = $_POST['namatugas'];
$deadlinetemp = $_POST['deadline'];
$assigne = $_POST['assigne'];
$tag = $_POST['tag'];
$kategori = $_POST['kategori'];

$deadline = substr($deadlinetemp,6,4)."-".substr($deadlinetemp,3,2)."-".substr($deadlinetemp,0,2);

$assignepenggal = (explode(",",$assigne));
$tagpenggal = (explode(",",$tag));

$kodeuser = $_COOKIE['kodeuser'];

$data = mysql_query("SELECT * FROM tugas WHERE kodeuser='$kodeuser'");

$i=1;

while($baris = mysql_fetch_array($data))
{
	$i++;
}

$data = mysql_query("INSERT INTO tugas VALUES ('$kodeuser','$i','$namatugas','$deadline','1','$kategori')");

foreach ($assignepenggal as $a)
{
	$dummy = mysql_query("SELECT * FROM user WHERE username='$a'");
	$baris = mysql_fetch_array($dummy);
	
	$isi = $baris['kodeuser'];
	
	$data = mysql_query("INSERT INTO assigne VALUES('$kodeuser','$i','$isi')");
}

foreach ($tagpenggal as $a)
{	
	$data = mysql_query("INSERT INTO tag VALUES('$kodeuser','$i','$a')");
}

foreach ($_FILES["attachment"]["error"] as $key => $error) {
    if ($error == UPLOAD_ERR_OK) {
			$tmp_name = $_FILES["attachment"]["tmp_name"][$key];
			$name = $_FILES["attachment"]["name"][$key];
			move_uploaded_file($tmp_name, "attachment"."/".$name);
			
			$uploaddir="./attachment/";
			$alamatfile=$uploaddir.$name;
			
			$j = 1;
			$dummy = mysql_query("SELECT * FROM attachment WHERE kodeuser='$kodeuser' AND kodetugas='$i'");
			while($baris=mysql_fetch_array($dummy))
			{
				$j++;
			}
			
			$data = mysql_query("INSERT INTO attachment VALUES('$kodeuser','$i','$j','$alamatfile')");	
	}	
}
?>
<?php echo $_COOKIE['username']; ?>

<SCRIPT LANGUAGE="JavaScript">
			window.alert ("Tugas berhasil ditambahkan");
			setTimeout("location.href = 'home.php?link=halamanprofil&username=<?php echo $_COOKIE['username']; ?>';",1);
</SCRIPT> 