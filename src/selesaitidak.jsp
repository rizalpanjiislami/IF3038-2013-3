<?php
include "koneksi.php";

$value = $_GET['value'];

$potong = (explode("-",$value));

$kodeuser = $potong[0];
$kodetugas = $potong[1];
$nilai = $potong[2];

if($nilai==1)
{
	$rubah=0;
}
else
{
	$rubah=1;
}

$query = mysql_query("UPDATE tugas SET statustugas='$rubah' WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");

/*if($rubah==0)
{
	echo "Tugas Dirubah Menjadi Selesai";
}
else
{
	echo "Tugas Dirubah Menjadi Belum Selesai";
}*/

//==============================================

$kategori = "semua";
$kodeuser = $_COOKIE['kodeuser'];
$username = $_COOKIE['username'];
//}
?>
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