<html>
<head>
<script>
var ajaxku2;
function proses(pilihan){
	ajaxku2 = buatajax2();
	var url="selesaitidak.php";
	url=url+"?value="+pilihan;
	url=url+"&sid="+Math.random();
	ajaxku2.onreadystatechange=stateChanged2;
	ajaxku2.open("GET",url,true);
	ajaxku2.send(null);
	
	setTimeout("proses(pilihan)", 3000);
}
function buatajax2(){
	if (window.XMLHttpRequest){
		return new XMLHttpRequest();
	}
	if (window.ActiveXObject){
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}

function stateChanged2(){
	var data2;
	if (ajaxku2.readyState==4){
		data2=ajaxku2.responseText;
		if(data2.length>0){
			hasil.innerHTML=data2;
		}else{
		}
	}
}
</script>

</head>

<?php
include "koneksi.php";

$kategori = $_GET['kategori'];
$kodeuser = $_COOKIE['kodeuser'];
$username = $_COOKIE['username'];

if($kategori!="semua"){

?>
<div align="center">
  <p><strong>SELAMAT DATANG <?php echo $username;?></strong></p>
  <p><strong>BERIKUT DAFTAR TO DO LIST ANDA</strong></p>
  <table width="70%" border="1" class="tabelkeren">
    <tr bgcolor="#0099CC">
      <th width="5%" height="34" scope="col">No.</th>
      <th width="22%" scope="col">Nama Tugas</th>
      <th width="14%" scope="col">Deadline</th>
      <th width="14%" scope="col">Tag</th>
      <th width="22%" scope="col">Status Tugas</th>
      <th width="6%" scope="col">&nbsp;</th>
      <th width="17%" scope="col">&nbsp;</th>
    </tr>
  <?php
	$query = mysql_query("SELECT * FROM tugas WHERE kategori='$kategori' AND kodeuser='$kodeuser'");
	$query2 = mysql_query("SELECT DISTINCT kodeuser,kodetugas,namatugas,deadline,statustugas FROM tugas INNER JOIN assigne USING (kodeuser,kodetugas) WHERE kategori='$kategori' AND assigne='$kodeuser'");

	$i=0;
	
	while ($baris = mysql_fetch_array($query))
	{	
		$i++;
		$kodetugas = $baris['kodetugas'];
		$kodeuser = $_COOKIE['kodeuser'];
	?>
    <tr>
      <td> <div align="center"><?php echo $i; ?> </div></td>
      <td> <div align="center"><a href="home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&amp;kodeuserasal=<?php echo $kodeuser;?>"><?php echo $baris['namatugas']; ?> </a></div></td>
      <td> <div align="center"><?php echo $baris['deadline']; ?> </div></td>
      <td> 
        <div align="center">
          <?php
											 	$data3 = mysql_query("SELECT * FROM tugas INNER JOIN tag USING (kodeuser,kodetugas) WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
																								
												while($baris3 = mysql_fetch_array($data3))
												{
													echo $baris3['tag']." ";
												}
											 ?>
      </div></td>
      <td>
        <div align="center">
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
        </div></td>
      <td>
        <div align="center">
          <input name="<?php echo $i; ?>" type="checkbox" value="<?php echo $baris['kodeuser']."-".$baris['kodetugas']."-".$baris['statustugas'];?>" <?php if($baris['statustugas']==0) { echo 'checked="checked"';} ?> onchange="proses(this.value)" />
        </div></td>
      <td> 
        <div align="center"><a href="home.php?link=delete&kodetugas=<?php echo $kodetugas; ?>&kodeuser=<?php echo $kodeuser; ?>" onClick="return confirm('Apakah tugas ini akan dihapus?')"> Hapus</a>
        </div></td>
    </tr>
    <?php	
	}
	
	while($baris2=mysql_fetch_array($query2))
	{
		$i++;
		$kodetugas = $baris2['kodetugas'];
		$kodeuserpembuat = $baris2['kodeuser'];
		
		?>
    
    <tr>
      <td> <div align="center"><?php echo $i; ?> </div></td>
      <td> <div align="center"><a href="home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&amp;kodeuserasal=<?php echo $kodeuserpembuat; ?>"> <?php echo $baris2['namatugas']; ?></a> </div></td>
      <td> <div align="center"><?php echo $baris2['deadline']; ?> </div></td>
      <td><div align="center">
        <?php
    $data3 = mysql_query("SELECT * FROM tugas INNER JOIN tag USING (kodeuser,kodetugas) WHERE kodeuser='$kodeuserpembuat' AND kodetugas='$kodetugas'");		
	while($baris3 = mysql_fetch_array($data3))
	{
		echo $baris3['tag']." ";
	}
?> 
        </div></td>
      <td> 
        <div align="center">
          <?php
                	if($baris2['statustugas']==1)
					{
						echo "Tugas Belum Selesai";
					}
					else
					{
						echo "Tugas Sudah Selesai";
					}
				?>
        </div></td>
      
      <td><div align="center">
        <input name="<?php echo $i; ?>2" type="checkbox" value="<?php echo $baris2['kodeuser']."-".$baris2['kodetugas']."-".$baris2['statustugas'];?>" <?php if($baris2['statustugas']==0) { echo 'checked="checked"';} ?> onchange="proses(this.value)" />
        
        </div>
      </td>
      <td>
      </td>
    </tr>
    
    <?php
	}
	?>
  </table>
  <p>
    <a href="home.php?link=tambahdata&kategori=<?php echo $kategori; ?>"><input type="submit" name="tambah" id="tambah" value="Tambah" /></a>
  </p>
<?php
}
?>
   
<p>
    <?php
if($kategori=="semua")
{
?>
</p>
</div>
<div align="center">
      <p><strong>SELAMAT DATANG <?php echo $username;?></strong> </p>
<p><strong>BERIKUT DAFTAR TO DO LIST ANDA</strong></p>
      <table width="70%" border="1" class="tabelkeren">
        <tr bgcolor="#0099CC">
          <th width="5%" height="34" scope="col">No.</th>
          <th width="22%" scope="col">Nama Tugas</th>
          <th width="14%" scope="col">Deadline</th>
          <th width="14%" scope="col">Tag</th>
          <th width="22%" scope="col">Status Tugas</th>
          <th width="6%" scope="col">&nbsp;</th>
          <th width="17%" scope="col">&nbsp;</th>
        </tr>
        <?php
									include "koneksi.php";
									$kodeuser = $_COOKIE['kodeuser'];
									$data = mysql_query("SELECT * FROM tugas WHERE kodeuser='$kodeuser'");
									$data2 = mysql_query("SELECT * FROM tugas INNER JOIN assigne USING (kodeuser,kodetugas) WHERE assigne='$kodeuser'");
									
									$i=0;
									while($baris = mysql_fetch_array($data))
									{
										$i++; 
										$kodetugas = $baris['kodetugas'];
									?>
        <tr>
          <td><div align="center"><?php echo $i; ?></div></td>
          <td><div align="center"><a href="home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&amp;kodeuserasal=<?php echo $kodeuser;?>"> <?php echo $baris['namatugas']; ?></a></div></td>
          <td><div align="center"><?php echo $baris['deadline']; ?></div></td>
          <td><div align="center">
            <?php
											 	$data3 = mysql_query("SELECT * FROM tugas INNER JOIN tag USING (kodeuser,kodetugas) WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
																								
												while($baris3 = mysql_fetch_array($data3))
												{
													echo $baris3['tag']." ";
												}
											 ?>
          </div></td>
          <td><div align="center">
            <?php 
		  			if($baris['statustugas']==0)
					{
						echo "Tugas Selesai";
					}
					else
					{
						echo "Tugas Belum Selesai";
					}
			  ?>
          </div></td>
          <td><input name="<?php echo $i; ?>" type="checkbox" value="<?php echo $baris['kodeuser']."-".$baris['kodetugas']."-".$baris['statustugas'];?>" <?php if($baris['statustugas']==0) { echo 'checked="checked"';} ?> onchange=proses(this.value)></td>
          <td>
       	  <div align="center"><a href="home.php?link=delete&kodetugas=<?php echo $kodetugas; ?>&kodeuser=<?php echo $kodeuser; ?>" onClick="return confirm('Apakah tugas ini akan dihapus?')"> Hapus</a></div></td>
        </tr>
        <?php
                                    }
								
								?>
        <?php
//ini yang tagnya
while ($baris2 = mysql_fetch_array($data2))
{
	$i++;
	$kodetugas = $baris2['kodetugas'];
	$kodeuserpembuat = $baris2['kodeuser'];
?>
        <tr>
          <td><div align="center"><?php echo $i; ?></div></td>
          <td><div align="center"><a href="home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&amp;kodeuserasal=<?php echo $kodeuserpembuat; ?>"> <?php echo $baris2['namatugas']; ?></a></div></td>
          <td><div align="center"><?php echo $baris2['deadline']; ?></div></td>
          <td><div align="center">
            <?php
    $data3 = mysql_query("SELECT * FROM tugas INNER JOIN tag USING (kodeuser,kodetugas) WHERE kodeuser='$kodeuserpembuat' AND kodetugas='$kodetugas'");		
	while($baris3 = mysql_fetch_array($data3))
	{
		echo $baris3['tag']." ";
	}
?>
          </div></td>
          <td><div align="center">
            <?php 
		  			if($baris2['statustugas']==0)
					{
						echo "Tugas Selesai";
					}
					else
					{
						echo "Tugas Belum Selesai";
					}
			  ?>
          </div></td>
          <td><input name="<?php echo $i; ?>" type="checkbox" value="<?php echo $baris2['kodeuser']."-".$baris2['kodetugas']."-".$baris2['statustugas'];?>" <?php if($baris2['statustugas']==0) { echo 'checked="checked"';} ?> onchange=proses(this.value)></td>
          <td>&nbsp;</td>
          <?php	
}

?>
        </tr>
  </table>
      <p>
        
      </p>
</div>
<?php
}
?>

<html>