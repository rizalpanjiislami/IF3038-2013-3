<?php

include "koneksi.php";

$username = $_POST['registerusername'];
$password = $_POST['registerpassword'];
$password2 = $_POST['registerpassword2'];
$fullname = $_POST['registerfullname'];
$email = $_POST['registeremail'];
$tgllahirmentah = $_POST['birth_date'];

$tgllahir = substr($tgllahirmentah,6,4)."-".substr($tgllahirmentah,3,2)."-".substr($tgllahirmentah,0,2);

  if ($_FILES["pic"]["error"] > 0)
    {
    //echo "Return Code: " . $_FILES["pic"]["error"] . "<br />";
    }
  else
    {
    //echo "Upload: " . $_FILES["pic"]["name"] . "<br />";
    //echo "Type: " . $_FILES["pic"]["type"] . "<br />";
    //echo "Size: " . ($_FILES["pic"]["size"] / 1024) . " Kb<br />";
    //echo "Temp file: " . $_FILES["pic"]["tmp_name"] . "<br />";

    if (file_exists("upload/" . $_FILES["pic"]["name"]))
      {
      //echo $_FILES["pic"]["name"] . " already exists. ";
      }
    else
      {
      move_uploaded_file($_FILES["pic"]["tmp_name"],
      "upload/" . $_FILES["pic"]["name"]);
      //echo "Stored in: " . "upload/" . $_FILES["pic"]["name"];
      $lokasi = "upload/" . $_FILES["pic"]["name"];
	  }
    }
	
	$data = mysql_query("SELECT * FROM user");
	$i=1;
	while($baris = mysql_fetch_array($data))
	{
		$i++;
	}
	
	$data = mysql_query("INSERT INTO user VALUES('$i','$username','$password','$lokasi')");
	$data = mysql_query("INSERT INTO profil VALUES('$i','$fullname','$tgllahir','$email')");
?>

<SCRIPT LANGUAGE="JavaScript">
			window.alert ("User Berhasil Dibuat");
			setTimeout("location.href = 'index.php';",1);
</SCRIPT>