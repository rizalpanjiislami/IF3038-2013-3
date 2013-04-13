<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

</head>

<?php

include "koneksi.php";

$username = $_GET['username'];

$data = mysql_query("SELECT * FROM user WHERE username='$username'");

$baris = mysql_fetch_array($data);

$kodeuser = $baris['kodeuser'];

$data = mysql_query("SELECT * FROM user INNER JOIN profil USING(kodeuser) WHERE kodeuser='$kodeuser'");

$baris = mysql_fetch_array($data);

$data2 = mysql_query("SELECT * FROM tugas WHERE kodeuser='$kodeuser' AND statustugas='1'");

$data3 = mysql_query("SELECT * FROM tugas INNER JOIN assigne USING (kodeuser,kodetugas) WHERE assigne='$kodeuser' AND statustugas='1'"); 

$dataselesai1 = mysql_query("SELECT * FROM tugas WHERE kodeuser='$kodeuser' AND statustugas='0'");

$dataselesai2 = mysql_query("SELECT * FROM tugas INNER JOIN assigne USING (kodeuser,kodetugas) WHERE assigne='$kodeuser' AND statustugas='0'"); 

?>

<body>
<div class="corner_inner">
  <div id="main_body">
    <div align="center">
      <p>&nbsp;</p>
      <table width="100%" border="0" class="tabelkeren1">
        <tr bgcolor="#0099CC">
          <th height="34" colspan="3" scope="col">PROFIL ANDA</th>
        </tr>
        <tr>
          <td width="10%" rowspan="4" scope="row"><div align="center"><img src="<?php echo $baris['foto'];?>" alt="" width="71" height="70" /></div></td>
          <td width="10%" height="50" scope="row"><div align="left"><strong>NAMA </strong></div></td>
          <td width="40%"><div align="left"><?php echo $baris['nama'];?></div></td>
        </tr>
        <tr>
          <td height="40" scope="row"><div align="left"><strong>TANGGAL LAHIR </strong></div></td>
          <td><div align="left"><?php echo $baris['tanggallahir'];?></div></td>
        </tr>
        <tr>
          <td height="40" scope="row"><div align="left"><strong>EMAIL </strong></div></td>
          <td><div align="left"><?php echo $baris['email'];?></div></td>
        </tr>
        <tr>
          <td height="40" scope="row"><div align="left"><strong>USERNAME</strong></div></td>
          <td><div align="left"><?php echo $baris['username'];?></div></td>
        </tr>
      </table>
      <p>
        <?php
		if($username==$_COOKIE['username'])
		{
		?>
        <a href="home.php?link=editprofil&nama=<?php echo $baris['nama'];?>&tanggallahir=<?php echo $baris['tanggallahir'];?>&kodeuser=<?php echo $baris['kodeuser']; ?>"> <input type="submit" name="editprofil" id="editprofile" value="Edit Profile" /></a>
        <?php
		}
		?>
      </p>
    </div>
    <p align="center">&nbsp;</p>
    <p align="center"><strong>TUGAS YANG BELUM SELESAI</strong></p>
    <div align="center">
      <table width="100%" border="1" class="tabelkeren">
        <tr bgcolor="#0099CC">
          <th width="10%" height="34" scope="col">No.</th>
          <th width="40%" scope="col">Nama Tugas</th>
          <th width="25%" scope="col">Deadline</th>
          <th width="25%" scope="col">Tag</th>
        </tr>
        
        <?php
			$i=0;
			
			while($baris=mysql_fetch_array($data2))
			{
				$i++;
				$kodetugas = $baris['kodetugas'];
			?>
            
            	<tr>
                
                	<td> <div align="center"><?php echo $i; ?> </div></td>
                    <td> <div align="center"><a href="home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&amp;kodeuserasal=<?php echo $kodeuser;?>"><?php echo $baris['namatugas'];?></a> </div></td>
                    <td> <div align="center"><?php echo $baris['deadline'];?> </div></td>
                    <td><div align="center">
                      <?php
											 	$data4 = mysql_query("SELECT * FROM tugas INNER JOIN tag USING (kodeuser,kodetugas) WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
																								
												while($baris4 = mysql_fetch_array($data4))
												{
													echo $baris4['tag']." ";
												}
											 ?>
                    </div></td>
                
                </tr>
            
			<?php	
			}
		?>
        
        <?php
		
		while($baris2=mysql_fetch_array($data3))
		{
			$i++;
			$kodetugas = $baris2['kodetugas'];
			$kodeuserpembuat = $baris2['kodeuser'];
		?>
        
        	  <td> <div align="center"><?php echo $i; ?> </div></td>
            <td> <div align="center"><a href="home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&amp;kodeuserasal=<?php echo $kodeuserpembuat; ?>"> <?php echo $baris2['namatugas']; ?> </a></div></td>
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
        
		<?php	
		}
		?>
        
      </table>
    </div>
    <p align="center">&nbsp;</p>
    <p align="center"><strong>TUGAS YANG TELAH SELESAI</strong></p>
    <div align="center">
      <table width="100%" border="1" class="tabelselesai">
        <tr bgcolor="#0099CC">
          <th width="10%" height="34" scope="col">No.</th>
          <th width="40%" scope="col">Nama Tugas</th>
          <th width="25%" scope="col">Deadline</th>
          <th width="25%" scope="col">Tag</th>
        </tr>
       <?php
	   		$i=0;
	   		while($baris=mysql_fetch_array($dataselesai1))
			{
				$i++;
				$kodetugas = $baris['kodetugas'];
				?>
                <tr>
                	<td> <div align="center"><?php echo $i; ?> </div></td>
                    <td> <div align="center"><a href="home.php?link=halamanrinciantugas&kodetugas=<?php echo $kodetugas; ?>&amp;kodeuserasal=<?php echo $kodeuser;?>"> <?php echo $baris['namatugas']; ?> </a></div></td>
                    <td> <div align="center"><?php echo $baris['deadline']; ?> </div></td>
                    <td><div align="center">
                      <?php
											 	$data4 = mysql_query("SELECT * FROM tugas INNER JOIN tag USING (kodeuser,kodetugas) WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
																								
												while($baris4 = mysql_fetch_array($data4))
												{
													echo $baris4['tag']." ";
												}
											 ?>
                    </div></td>
                </tr>
                <?php
					while($baris2=mysql_fetch_array($dataselesai2))
					{
						$i++;
						$kodetugas = $baris2['kodetugas'];
						$kodeuserpembuat = $baris2['kodeuser'];
						?>
                        
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
                        
                        <?php
					}
				?>
                <?php
			}
	   
	   ?>
      </table>
    </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td valign="top"><div>
          <table class="contentpaneopen" align="center">
            <tr>
              <td valign="top" colspan="2"></td>
            </tr>
          </table></td>
      </tr>
    </table>
  </div>
</div>
</body>
</html>