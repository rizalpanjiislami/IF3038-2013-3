<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<p align="center">
  <?php

include "koneksi.php";

$kodeuserpembuat = $_COOKIE['kodeuser'];

$data = mysql_query("SELECT DISTINCT kategori FROM kategori WHERE kodeuserpembuat='$kodeuserpembuat'");

?>
  
</p>
<form id="form1" name="form1" method="post" action="">
  <div align="center">
    <table width="70%" border="1" class="tabelkeren">
      <tr bgcolor="#0099CC">
        <th width="10%" height="34" scope="col">No.</th>
        <th width="57%" scope="col">Kategori</th>
        <th width="33%" scope="col">&nbsp;</th>
      </tr>
      
      <?php
	  $i=0;
	  while($baris = mysql_fetch_array($data))
	  {
		  $i++;
	  ?>
      	<tr>
        	<td> <div align="center"><?php echo $i; ?></div></td>
            <td> <div align="center"><?php echo $baris['kategori']; ?> </div></td>
            <td> <div align="center"><a href="hapuskategoritahap2.php?kategori=<?php echo $baris['kategori']; ?>" onCLick="return confirm('Anda yakin akan menghapus kategori ini?')"> Hapus </a></div></td>
        </tr>
      <?php
	  }
	  ?>
    </table>
  </div>
</form>
<p align="center">&nbsp;</p>
</body>
</html>