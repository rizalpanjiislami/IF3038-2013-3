<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Page</title>
<link rel="stylesheet" href="logincss.css" type="text/css">

<script type="text/javascript" src="ajax.js"></script>

<script language="javascript">
function postRequest(strURL){
var xmlHttp;
	if(window.XMLHttpRequest){ // For Mozilla, Safari, ...
		var xmlHttp = new XMLHttpRequest();
	}
	else if(window.ActiveXObject){ // For Internet Explorer
		var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlHttp.open('POST', strURL, true);
	xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlHttp.onreadystatechange = function(){
		if (xmlHttp.readyState == 4){
			ajaxloginupdate(xmlHttp.responseText);
		}
	}
	xmlHttp.send(strURL);
}

function ajaxloginupdate(str){
	var temp = str;
	var temp2 = str.split("\n");
	
	if(temp2[2]=="ok"){
		alert("Welcome");
		setTimeout("location.href = 'home.jsp?link=selamatdatang'",1);
	}else if(temp2[2]!="ok"){
		alert("Username dan/atau password salah");
	}
}

function loginajax(){
	var username = window.document.form.username.value;
	var password = window.document.form.password.value;
	var url = "proseslogin.jsp?username=" + username + "&password=" +password ;
	postRequest(url);
} 
</script>

<script type="text/javascript">

function check_username_init() {
  var user_field = document.getElementById('registerusername');
  return 'username_exists.php?username=' + user_field.value;
}
function check_username_ajax(results) {
  var results_div = document.getElementById('results_div');
  results_div.innerHTML = results;
}

function check_username() {
  var user_field = document.getElementById('registerusername');
  if (user_field.value.length > 0) {
    //call our AJAX function 
    ajaxHelper('check_username');
  }
  else {
    //clear results field
    var results_div = document.getElementById('results_div');
    results_div.innerHTML = '';
  }
}

function check_email_init() {
  var email = document.getElementById('register_email');
  return 'email_exists.php?email=' + email.value;
}
function check_email_ajax(results) {
  var results_email = document.getElementById('results_email');
  results_email.innerHTML = results;
}

function check_email() {
	
  var email = document.getElementById('register_email');
  if (email.value.length > 0) {
    //call our AJAX function 
    ajaxHelper('check_email');
  }
  else {
    //clear results field
    var results_email = document.getElementById('results_email');
    results_email.innerHTML = '';
  }
}
</script>

<script language="javascript">
function validasi(form){
  if (form.username.value == ""){
    alert("Anda belum mengisikan Username.");
    form.username.focus();
    return (false);
  }
     
  if (form.password.value == ""){
    alert("Anda belum mengisikan Password.");
    form.password.focus();
    return (false);
  }
  
  /*if (form.username.value == "admin" && form.password.value == "admin"){
    alert("Welcome");
    //form.username.focus();
	setTimeout("location.href = 'dashboard.html';",1);
    return (true);
  }else{
		alert("Password Salah");
		return (false);  
  }*/
  
  return (true);
}


function validasi2(form2){
  if (form2.registerusername.value == ""){
    alert("Anda belum mengisikan Username.");
    form2.registerusername.focus();
    return (false);
  }
  
  //buat panjang karakter username min 5 karakter
  var panjang= document.form2.registerusername.value;
  panjang= panjang.length;
  if(panjang < 5){
	alert("Panjang username minimal 5 karakter");
	form2.registerusername.focus();  
	return (false);  
  }
     
  if (form2.registerpassword.value == ""){
    alert("Anda belum mengisikan Password.");
    form2.registerpassword.focus();
    return (false);
  }
  
  if (form2.registerusername.value == form2.registerpassword.value){
    alert("Username dan Password Jangan sama!!");
    form2.registerusername.focus();
    return (false);
  }
  
  if (form2.registerpassword.value == form2.registeremail.value){
    alert("Email dan Password Jangan sama!!");
    form2.registerpassword.focus();
    return (false);
  }
  
  if (form2.registerpassword2.value == ""){
    alert("Anda belum mengisikan Password.");
    form2.registerpassword2.focus();
    return (false);
  }
  
  if (form2.registerpassword.value != form2.registerpassword2.value){
    alert("Password Tidak sama");
	form2.registerpassword.focus();
    return (false);
  }
  
  if (form2.registeremail.value == ""){
    alert("Anda belum mengisikan Email.");
    form2.registeremail.focus();
    return (false);
  }
  
  	var email = document.form2.registeremail.value;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (!filter.test(email)) {
	alert('Please provide a valid email address');
	form2.registeremail.focus;
	return false;
	}

  
  if (form2.registerfullname.value == ""){
    alert("Anda belum mengisikan Full name.");
    form2.registerfullname.focus();
    return (false);
  }
  
  if (form2.pic.value == ""){
    alert("Anda belum memilih Avatar.");
    form2.registerfullname.focus();
    return (false);
  }
  
  //buat panjang karakter username min 8 karakter
  var panjangpass= document.form2.registerpassword.value;
  panjangpass= panjangpass.length;
  if(panjangpass < 8){
	alert("Panjang password minimal 8 karakter");
	form2.registerpassword.focus();  
	return (false);  
  }
  
  //buat upload picture
  var ext = document.form2.pic.value;
  ext = ext.substring(ext.length-3,ext.length);
  ext = ext.toLowerCase();
  if(ext != 'jpg' && ext != 'jpeg') {
    //alert('You selected a .'+ext+' file; please select a .jpg file instead!');
	alert("File harus berekstensi JPG atau JPEG");
    return (false); }
	
  return (true);
}

//buat pengecekan karakter pas diketik (onkeyup)
function check_username()
{
	var objek = document.getElementById("registerusername");
	if (objek.value.length == 0) {
		objek.style.backgroundImage="";
	}
	else if(registerusername.value.length >= 5){
		//clear results field
		objek.style.backgroundImage="url('valid.png')";
		ajaxHelper('check_username');
    
	}else{
		objek.style.backgroundImage="url('warning.png')";
  
	}			
}

//buat pengecekan karakter pas diketik (onkeyup)
function check_password()
{
	var objek = document.getElementById("register_password");
	if (objek.value.length == 0) {
		objek.style.backgroundImage="";
	}
	else if(objek.value.length >= 8){
		//clear results field
		objek.style.backgroundImage="url('valid.png')";
    
	}else{
		objek.style.backgroundImage="url('warning.png')";
  
	}			
}

//buat pengecekan karakter pas diketik (onkeyup)
function check_repassword()
{
	var objek = document.getElementById("register_password2");
	var objekdua = document.getElementById("register_password");
	if (objek.value.length == 0) {
		objek.style.backgroundImage="";
	}
	else if(objek.value.length >= 8){
		//clear results field
		if(objek.value==objekdua.value){
			objek.style.backgroundImage="url('valid.png')";
		}else{
			objek.style.backgroundImage="url('warning.png')";
		}
    
	}else{
		objek.style.backgroundImage="url('warning.png')";
  
	}			
}

//buat pengecekan karakter pas diketik (onkeyup)
function check_registerfullname()
{
	var objek = document.getElementById("register_fullname");

	//var filter = /^.+ .+$/;
	var filter = /^.+ .+$/;
	if (objek!="" && filter.test(objek)) {
		objek.style.backgroundImage="url('valid.png')";
	}else{
		objek.style.backgroundImage="url('warning.png')";
	
	}
				
}

function check_registeremail()
{
	//var objek = document.getElementById("register_email");

	var objek = document.form2.registeremail.value;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (filter.test(objek)) {
		objek.style.backgroundImage="url('valid.png')";
		ajaxHelper('check_email');
	}else{
		objek.style.backgroundImage="url('warning.png')";
	
	}
				
}

function check_date(date)
			{
				var temp = date.split("/");
				var d = new Date(parseInt(temp[2]), parseInt(temp[1]) - 1, parseInt(temp[0]));
				if ((d) && ((d.getMonth() + 1) == parseInt(temp[1])) && (d.getDate() == Number(parseInt(temp[0]))) && (parseInt(temp[2]) >= 1955))
				{
					datePicker.populateTable(d.getMonth(),d.getFullYear());
					return true;
				}
				else
					return false;
			}
				
</script>

<script type="text/javascript" src="js/datepicker.js"></script>
		<script type="text/javascript">	
			window.onload = function() 
			{
				datePicker.init(document.getElementById("calendar"), document.getElementById("form2"));
				setInterval(function(){next_image();}, 5500);
			}
		</script>

<style>
input[type="text"],input[type="password"]
	{
		
		background-position: right top;
		background-repeat: no-repeat;
		
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		-webkit-border-radius: 1px;
		-moz-border-radius: 1px;
		border-radius: 1px;
	}

</style>
</head>

<body OnLoad="document.login.username.focus();">
<div id="wrapper2"><img src="cover.png" width="464" height="637" />  </div>
<form name="form" onsubmit="return validasi(this)">
  <div id="wrapper"><img src="untitled-1.png" width="332" height="200" /> 
<div id="signin">
  <p>SIGN IN</p></div>
  
<div id="textusername">
  <p>Username</p></div>
  
<div id="textpassword">
  <p>Password</p></div>
  
  <div id="inputnama">
    <input name="username" type="text" size="25" maxlength="25" />
</div>

<div id="inputpass">
<input name="password" type="password" size="25" maxlength="25" />
</div>

</div>



<div id="aksi">
  <table width="127" border="0">
    <tr>
      <td width="59"><input name="login" type="button" value="Log In" onclick="loginajax()" /></td>
      <td width="58"><input name="reset" type="reset" value="Reset" /></td>
    </tr>
  </table>
</div>
</form>

<form name="form2" id="form2" method="POST" action="registrasi.php" enctype="multipart/form-data" onSubmit="return validasi2(this)">
<div id="wrapper3"><img src="untitled-2.png" width="332" height="392" /> 
<div id="register"><p>REGISTER</p></div>
<div id="registernama">
  <input name="registerusername" id="registerusername" pattern="^.{5,}$" type="text" size="25" title="panjang username minimal 5 karakter" maxlength="25" onkeyup="check_username();" />
	<div id="results_div"></div>
  </div>
<div id="ceknama">
	
</div>

<div id="registerpassword"><input name="registerpassword"  id="register_password" pattern="^.{8,}$"  type="password" size="25" maxlength="25" title="panjang password minimal 8 karakter"  onkeyup="check_password();" /></div>

<div id="registeremail"> <input name="registeremail" id="register_email" pattern="^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$" type="text" size="25" maxlength="25" title="masukkan email yang valid"  onkeyup="check_email();" />
<div id="results_email"></div></div>

<div id="registerfullname"> <input name="registerfullname"  id="register_fullname"  pattern="^.+ .+$" type="text" size="25" maxlength="25" title="Nama minimal terdiri dari dua kata" onkeyup="check_registerfullname();" /></div>	
<div id="registerpassword2">
  <input name="registerpassword2" id="register_password2" pattern="^.{8,}$" type="password" size="25" maxlength="25" title="panjang password minimal 8 karakter"  onkeyup="check_repassword();" /></div>
<div id="registertextusername"><p>Username</p></div>
<div id="registertextemail"><p>Email</p></div>
<div id="registertextpassword"><p>Password</p></div>
<div id="registertextpassword2"><p>Re-Password</p></div>

<div id="registertexttgl">
  <p>Birthday</p></div>
<div id="registertextusername"></div>
<div id="registertextfullname"><p>Full Name</p></div>
<div id="tanggallahir">
  <input name="birth_date" type="text" title="Tahun harus minimal dari tahun 1955." onclick="datePicker.showCalendar(event);" size="25" maxlength="25" pattern="^[0-3][0-9]/[0-1][0-9]/[1-9][0-9][0-9][0-9]$" required="required"/>
</div>
<div id="datetanggal">
 <a id="date_button_left" class="date_button" title="Prev" onclick="datePicker.prevMonth();">
				<img alt="arrow_left" src="images/date-left.png" />
	  </a>
			<a id="date_button_right" class="date_button" title="Next" onclick="datePicker.nextMonth();">
				<img alt="arrow_right" src="images/date-right.png" />
			</a>
<div id="tableHeader"></div>
			<table id="calendarTable" border=1>
				<tbody id="tableBody">
					<tr>
						<th>Su</th>
						<th>Mo</th>
						<th>Tu</th>
						<th>We</th>
						<th>Th</th>
						<th>Fr</th>
						<th>Sa</th>
					</tr>
				</tbody>
			</table>
</div>
  
<div id="registertextpassword"><p>Password</p></div>
<div id="registertextavatar"><p>Avatar</p></div>
<div id="registeravatar"><input name="pic" type="file" accept="image/jpeg" size="14" /></div>
</div>

</div>
<div id="aksi2">
  <table width="127" border="0">
    <tr>
      <td width="59"><input name="login" type="submit" value="Register" /></td>
      <td width="58"><input name="reset" type="reset" value="Reset" /></td>
    </tr>
  </table>
</div>

</form>

			
		<script type="text/javascript">	
			window.onload = function() 
			{
				datePicker.init(document.getElementById("calendar"), document.getElementById("form2"));
				setInterval(function(){next_image();}, 5500);
			}
		</script>
</body>
</html>