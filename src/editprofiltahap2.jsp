<?php
include "koneksi.php";
$kodeuser = $_POST['kodeuser'];

if ($_FILES["file"]["error"] > 0)
  {
  echo "Error: " . $_FILES["file"]["error"] . "<br>";
  }
else
  {
	  echo "Upload: " . $_FILES["file"]["name"] . "<br>";
	  echo "Type: " . $_FILES["file"]["type"] . "<br>";
	  echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
	  
      if (file_exists("upload/" . $_FILES["file"]["name"]))
      {
	      echo $_FILES["file"]["name"] . " already exists. ";
      }
     else
      {
		  move_uploaded_file($_FILES["file"]["tmp_name"],
		  "upload/" . $_FILES["file"]["name"]);
		  echo "Stored in: " . "upload/" . $_FILES["file"]["name"];
		  $alamat = "upload/" . $_FILES["file"]["name"];
		  
		  $temp = mysql_query("SELECT foto FROM user WHERE kodeuser='$kodeuser'");
		  $baristemp = mysql_fetch_array($temp);
		  
		  $data = mysql_query("UPDATE user SET foto='$alamat' WHERE kodeuser='$kodeuser'");
		  setcookie("foto", "$alamat", time()+3600);  
	  
      }
  
  }
  
  $nama = $_POST['nama'];
  $tanggallahir = $_POST['tanggallahir'];
  $password = $_POST['password'];
  
  $data = mysql_query("UPDATE user SET password='$password' WHERE kodeuser='$kodeuser'");
  $data2 = mysql_query("UPDATE profil SET nama='$nama' WHERE kodeuser='$kodeuser'"); 
  $data2 = mysql_query("UPDATE profil SET tanggallahir='$tanggallahir' where kodeuser='$kodeuser'");

  $username = $_COOKIE['username'];
  
  if($data2)
  {
?>

<SCRIPT LANGUAGE="JavaScript">
			window.alert ("Profil berhasil dirubah");
			setTimeout("location.href = 'home.php?link=halamanprofil&username=<?php echo $username; ?>';",1);
</SCRIPT> 

<?php
  }
?>