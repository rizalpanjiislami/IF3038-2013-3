<?php 

  include "koneksi.php";
  
  $data = mysql_query("SELECT username FROM user");
  $baris = mysql_fetch_array($data);
  
  echo json_encode($baris);

?>