<?php

/* $Id$ */

include("/3ba7/www/includes/common.inc");

?>
<html>

<head>
<title>Register User Form</title>
</head>

<body>
<?php

// Select what action we're doing

if (!isset($_GET['action'])) {
	$action = "register"; // default to register
} else {
	$action = $_GET['action']; // otherwise pull value from GET method
}

switch($action) {

	
	case "post":

			$email  = $_POST['email'];
		   $name   = $_POST['name'];
		   
      	
			// Is the address valid? 
		   if (checkEmail($email)) {
//		  		if(!mysql_query(/* Insert SELECT statement here */)) {
		  		
		  			ba7_add_user($name, $email);
/*		  	
		  		} else {
		  			echo "Error: The address $email is already subscribed";
		  		} 
*/    
			} else {
	   		echo "Error: $email does not look like a valid email address. 
					Please enter a valid address.\n <br />";
			}
		
		break;
		
		default:

			echo "<form method=\"post\" action=\"".$_SERVER['PHP_SELF']."?action=post\">\n\n"; //<fieldset>\n";
			
			echo "<fieldset>\n";
     
			echo "<input name=\"name\" id=\"name\" size=\"25\" value=\"Your Name\" />\n";

			echo "\n<br />\n\n<br />\n\n";
			
			echo "<input name=\"email\" id=\"email\" size=\"25\" value=\"Your Email Address\" />\n";
      
			echo "</fieldset>\n\n<fieldset>\n";
			
			echo "<input type=\"submit\" value=\"Register\" />\n";
			
			echo "</fieldset>\n\n";
			
			echo "</form>\n";

		break;
}

?>

</body>

</html>