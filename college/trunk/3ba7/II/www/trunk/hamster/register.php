<?php

/* $Id$ */

// Import Configuration
include("config.inc");


include($install_path."includes/common.inc");

function mkpasswd(){
	$one = array("a","c","e","g","i","k","m","o","q","s","u","w","y");
	$two = array("b","d","f","h","j","l","n","p","r","t","v","x","z");
	$three = array("A","B","C","D","E","F","G","H","I","J","K","L","M",
							"N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
	$four = array("0","1","2","3","4","5","6","7","8","9");
	$five = array("!","|","[","]","(",")","-","+","%","$","£","*","@","#");

	$r = rand(0,12);
	$passwd[] = $one[$r];
	$r = rand(0,12);
	$passwd[] = $one[$r];
	$r = rand(0,12);
	$passwd[] = $one[$r];
	$r = rand(0,12);
	$passwd[] = $two[$r];
	$r = rand(0,12);
	$passwd[] = $two[$r];
	$r = rand(0,12);
	$passwd[] = $two[$r];
	$r = rand(0,25);
	$passwd[] = $three[$r];
	$r = rand(0,9);
	$passwd[] = $four[$r];
	$r = rand(0,13);
	$passwd[] = $five[$r];

	shuffle($passwd);

	$password = implode("",$passwd);
	
	return $password;
	
	
}

function send_mail($usname, $passwd, $email){

$mailheaders = "From: CMSS Team $admin_email\nReply-To: CMSS Team $admin_reply_email\nX-Mailer: CMSS\n";

$message = "Hello!
You are receiving this email because you have been subscribed to the CMS Service.
If you have not subscribed to this service, please forward this e-mail to $admin_email 

Your username is $usname
Your password is $passwd

You may change your password in the \"Change User Details\" section when you log in.

Enjoy the service!

The CMSS Team";

$success = mail($email,"CMSS Subscription Confirmation",$mailheaders.$message);

return $success;
}
?>
<html>

		 <head>
					 <title>Registration</title>
					 <link rel="stylesheet" type="text/css" href="style.css">
		 </head>

		 <body>
					 <h1>Register</h1>
					 <div class="main">
<?php

// Select what action we're doing

if (!isset($_GET['action'])) {
	$action = "register"; // default to register
} else {
	$action = $_GET['action']; // otherwise pull value from GET method
}

switch($action) {

	
	case "post":

			$email = $_POST['email'];
		   $fname = $_POST['fname'];
			$sname = $_POST['sname'];
			$usname = $_POST['usname'];

			include($install_path."includes/mysql.inc");
			ba7_mysql_setup();

			$sql = "SELECT * FROM users WHERE email='$email'";
			$email_check = mysql_query($sql);
		   
      	
			// Is the address valid? 
		   if (checkEmail($email)) {
		  		if(mysql_num_rows($email_check) == 0) {
					$sql = "SELECT * FROM users WHERE name='$usname'";
					$usname_check = mysql_query($sql);
					if (mysql_num_rows($usname_check) == 0){
							
							$passwd = mkpasswd();
							$sql = "INSERT INTO users VALUES(0,'$usname','$passwd',3,'$email','$fname','$sname')";
							if (!($add_user = mysql_query($sql))){
								die ("Could not run query: " . mysql_error());
							}
							if (!(send_mail($usname, $passwd, $email))){
								die ("Unable to send e-mail to $email");
							}	
							else{
								$content = "You have been successfully registered<br />\n";
								$content .= "Your username is $usname and your password has been sent to $email";
							}	
					}
					else{
							$content = "Unfortunately the username $usname has already been taken.<br />";
							$content .= "To try again, click <a href=\"register.php\">here</a>";
					}
		  		}
		  		else {
		  			$content = "Error: The address $email is already subscribed";
		  		} 
    
			}
			else {
	   		$content = "Error: $email does not look like a valid email address. 
					Please enter a valid address.\n <br />";
			}
		echo "<p>$content</p>\n";
		break;
		
		default:

			echo "<form method=\"post\" action=\"".$_SERVER['PHP_SELF']."?action=post\">\n\n";
			
			echo "<p>First Name:<br />\n<input name=\"fname\" id=\"fname\" size=\"25\" />*</p>\n";

			echo "<p>Sir Name:<br />\n<input name=\"sname\" id=\"sname\" size=\"25\" />*</p>\n";
			
			echo "<p>Email Address:<br />\n<input name=\"email\" id=\"email\" size=\"25\" />**</p>\n";
      
			echo "<p>Desired Username:<br />\n<input name=\"usname\" id=\"usname\" size=\"25\" />*</p>\n";
      
			echo "<input type=\"submit\" class=\"but\" value=\"Register\" />\n";
			
			echo "</form>\n";

			echo "<p class=\"err\"><i>* - required fields</i><br />\n";

			echo "<i>** - must be valid email address</i></p>\n";

		break;
}

?>	
			</div>
	</body>

</html>
