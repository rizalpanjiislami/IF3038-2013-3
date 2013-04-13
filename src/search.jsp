<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<link rel="stylesheet" type="text/css" href="style.css" />

<script src="ajax/jquery.js"> </script>
<script src="ajax/javascript.js"> </script>
<script type="text/javascript" src="ajax/vue1oix.js"></script>
<script type="text/javascript">try{Typekit.load();}catch(e){}</script>

</head>

<body>

<?php

include "koneksi.php";

$cari = $_POST['cari'];
$filter = $_POST['filter'];

if($filter == "semua")
{
	$data = mysql_query("SELECT * FROM tugas WHERE kategori REGEXP '$cari' UNION SELECT * FROM tugas WHERE namatugas REGEXP '$cari' UNION SELECT a.kodeuser,a.kodetugas,a.namatugas,a.deadline,a.statustugas,a.kategori FROM tugas AS A INNER JOIN komentar AS B USING(kodeuser,kodetugas) WHERE B.komentar REGEXP '$cari' LIMIT 10");
	$user = mysql_query("SELECT * FROM user INNER JOIN profil USING(kodeuser) WHERE username REGEXP '$cari' UNION SELECT * FROM user INNER JOIN profil USING(kodeuser) WHERE email REGEXP '$cari' UNION SELECT * FROM user INNER JOIN profil USING(kodeuser) WHERE nama REGEXP '$cari' UNION SELECT * FROM user INNER JOIN profil USING(kodeuser) WHERE tanggallahir REGEXP '$cari' LIMIT 10");
}
else if($filter == "username")
{
	$user = mysql_query("SELECT * FROM user INNER JOIN profil USING(kodeuser) WHERE username REGEXP '$cari' UNION SELECT * FROM user INNER JOIN profil USING(kodeuser) WHERE email REGEXP '$cari' UNION SELECT * FROM user INNER JOIN profil USING(kodeuser) WHERE nama REGEXP '$cari' UNION SELECT * FROM user INNER JOIN profil USING(kodeuser) WHERE tanggallahir REGEXP '$cari' LIMIT 10");
}
else if($filter == "kategori")
{
	$data = mysql_query("SELECT * FROM tugas WHERE kategori REGEXP '$cari' LIMIT 10");
}
else if($filter == "tugas")
{
	$data = mysql_query("SELECT * FROM tugas WHERE namatugas REGEXP '$cari' UNION SELECT a.kodeuser,a.kodetugas,a.namatugas,a.deadline,a.statustugas,a.kategori FROM tugas AS A INNER JOIN komentar AS B USING(kodeuser,kodetugas) WHERE B.komentar REGEXP '$cari' LIMI 10");
}

?>

<?php 
if(($filter=="semua")||($filter=="kategori")||($filter=="tugas"))
{
?>

<div align="center">
  <p><strong>TUGAS YANG BERHUBUNGAN</strong></p>
  <table width="70%" border="1" class="tabelkeren">
    <tr bgcolor="#0099CC">
      <th width="5%" height="34" scope="col">No.</th>
      <th width="22%" scope="col">Nama Tugas</th>
      <th width="14%" scope="col">Deadline</th>
      <th width="14%" scope="col">Tag</th>
      <th width="22%" scope="col">Status Tugas</th>
      <th width="6%" scope="col">&nbsp;</th>
    </tr>
    
<?php
		$i=0;
		while($baris=mysql_fetch_array($data))
		{
			$i++;
			$kodeuser=$baris['kodeuser'];
			$kodetugas=$baris['kodetugas'];
	?>
    		<tr>
            	<td> <?php echo $i; ?> </td>
                <td> <a href="home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&amp;kodeuserasal=<?php echo $kodeuser;?>"> <?php echo $baris['namatugas']; ?> </a></td>
                <td> <?php echo $baris['deadline']; ?> </td>
                <td>
                	<?php 
						$data2= mysql_query("SELECT * FROM tag WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas' LIMIT 10");
						
						while($baris2=mysql_fetch_array($data2))
						{
							echo $baris2['tag']." ";
						}
					?> 
                </td>
                <td> 
					<?php 
						if($baris['statustugas']==1)
						{
							echo "Tugas Belum Selesai";
						}
						else
						{
							echo "Tugas Sudah Selesai";
						}
					?>
                </td>
                <td>
                	<input name="<?php echo $i; ?>" type="checkbox" value="" />
                </td>
            </tr>
    <?php
		}
	?>
  </table>
</div>
---------------------------------------------------------------------------------------------------------------
<?php
} if(($filter=="semua")||($filter=="username"))
{
?>

<div>
  <p></p>
  <p align="center"><strong>USER YANG BERHUBUNGAN </strong></p>
  <p align="center">
  
  <?php
  	while($baris=mysql_fetch_array($user))
	{
	?>
		<a href="home.php?link=halamanprofil&username=<?php echo $baris['username']; ?>"><img src="<?php echo $baris['foto']; ?>" width="80" height="80" /></a>
        <br />	
  		<a href="home.php?link=halamanprofil&username=<?php echo $baris['username']; ?>">
  <?php
	    echo "Username : ".$baris['username']."<br>";
		echo "Nama Lengkap : ".$baris['nama']."<br></a>";
	}
  ?>
  
  </p>
</div>

<?php
}
?>

</body>
</html>