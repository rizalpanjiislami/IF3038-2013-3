<?php 
// Developed by Roshan Bhattarai 
// Visit http://roshanbh.com.np for this script and more.
// This notice MUST stay intact for legal use
$country=$_REQUEST['country'];
switch($country)
{
	case "1" :
		echo "USD";
		break;
	case "2" :	
		echo "GBP";
		break;
	case "3" :	
		echo "NPR";
		break;
}
?>
