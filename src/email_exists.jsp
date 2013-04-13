<?php
$email = $_GET['email'];
  
if (emailExists($email)) {
  echo '<span style="color:red";>email Sudah ada</span>';
}
else {
  echo '<span style="color:green;">email Available</span>';
}
  
function emailExists($input) {
  // in production use we would look up the email in
  // our database, but for this example, we'll just check
  // to see if its in an array of preset emails.
  $name_array =  array ('okharyadi@gmail.com', 'ade@gmail.com', 'rizal@gmail.com', 'admin@gmail.com');
  
  if (in_array($input, $name_array)) {
    return true;
  }
  else {
    return false;
  }
}
?>