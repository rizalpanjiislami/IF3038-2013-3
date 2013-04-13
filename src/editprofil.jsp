<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<?php

$nama = $_GET['nama'];
$tanggallahir = $_GET['tanggallahir'];
$kodeuser = $_GET['kodeuser'];

?>

<form id="form1" name="form1" method="post" action="editprofiltahap2.php" enctype="multipart/form-data">
  <div align="center">
    <p>&nbsp;</p>
    <table width="70%" border="0">
      <tr>
        <th colspan="2" scope="col">EDIT PROFIL ANDA</th>
      </tr>
      <tr class="tabelkeren1">
        <td width="34%" height="50" scope="row"><div align="left"><strong>NAMA </strong></div></td>
        <td width="66%"><div align="left">
          <label for="nama"></label>
          
          <input name="nama" type="text" id="nama" value="<?php echo $nama;?>" />
          <label for="kodeuser"></label>
          <input name="kodeuser" type="hidden" id="kodeuser" value="<?php echo $kodeuser; ?>" />
          <input name="nama2" type="hidden" id="nama2" value="<?php echo $nama; ?>" />
        </div></td>
      </tr>
      <tr class="tabelkeren1">
        <td height="40" scope="row"><div align="left"><strong>TANGGAL LAHIR </strong></div></td>
        <td><div align="left">
          <input name="tanggallahir" type="text" id="tanggallahir" value="<?php echo $tanggallahir;?>" />
          <input name="tanggallahir2" type="hidden" id="tanggallahir2" value="<?php echo $tanggallahir; ?>" />
        </div></td>
      </tr>
      <tr class="tabelkeren1">
        <td height="40" scope="row"><div align="left"><strong>PASSWORD</strong></div></td>
        <td><div align="left">
          <input type="password" name="password" id="tanggallahir3" />
        </div></td>
      </tr>
      <tr class="tabelkeren1">
        <td height="40" scope="row"><div align="left"><strong>PASSWORD (LAGI)</strong></div></td>
        <td><div align="left">
          <input type="password" name="password2" id="tanggallahir4" />
        </div></td>
      </tr>
      <tr class="tabelkeren1">
        <td height="40" scope="row"><strong>AVATAR</strong></td>
        <td><input type="file" name="file" id="file"><br></td>
      </tr>
    </table>
    <p>
      <input type="submit" name="Simpan" id="Simpan" value="Simpan" />
    </p>
    <p>&nbsp;</p>
  </div>
</form>
</body>
</html>