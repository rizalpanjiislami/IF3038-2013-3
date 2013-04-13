<?
$username=$_GET["username"];
$password=$_GET["password"];
if($username=="root" && $password=="root"){
echo "ok";
}else{
echo "fail";
}
?>