<?php
$username = trim($_GET['username']);
 
	if (usernameExists($username)) {
	  echo '<span style="color:red";>Username Sudah ada</span>';
	}
	else {
	  echo '<span style="color:green;">Username Available</span>';
	}
  
function usernameExists($input) {
  // in production use we would look up the username in
  // our database, but for this example, we'll just check
  // to see if its in an array of preset usernames.
  $name_array =  array ('okharyadi@gmail.com', 'jon', 'george', 'admin');
  
  if (in_array($input, $name_array)) {
    return true;
  }
  else {
    return false;
  }
}

?>