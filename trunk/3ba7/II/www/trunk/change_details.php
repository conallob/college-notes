<?php
		// $Id$

		 // setup session security
		 include("/3ba7/www/includes/session.inc");
		 ba7_session_setup();
	
?>
<html>
	<head>
		<title>CMSS :: Change User Details</title>
		<link rel="stylesheet" type="text/css" href="style.css" /> 
	</head>
	<body>
		<center><a href="home.php"><img src="cmss.gif" 
					alt="CMSS - Central Magazine Subscription Service" border="0"/></a></center>
		<h1>Change User Details</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php
			
			//print username
			echo "<p>You are logged in as: <b>" . $_SESSION['user'] . "</b></p>\n";

			echo "<li class=\"sel\"><a href=\"change_password.php\">Change Password</a></li>\n";
			
			echo "<p>Your current details:</p>\n";
			
			include ("/3ba7/www/includes/mysql.inc");
			ba7_mysql_setup();

			//get user details
			$sql = "SELECT * FROM users WHERE name='" . $_SESSION['user'] . "'";
			$result = mysql_query($sql);
			if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
			}
			$row = mysql_fetch_row($result);

			echo "<form action=\"update_account.php\" method=\"POST\">\n";

			echo"<p>First Name: <br /> <input type=\"text\" name=\"fname\"
						value=\"$row[5]\" />*</p>\n";
			
			echo"<p>Second Name: <br /> <input type=\"text\" name=\"sname\"
						value=\"$row[6]\" />*</p>\n";
			
			echo"<p>Email Address: <br /> <input type=\"text\" name=\"email\"
						value=\"$row[4]\" />**</p>\n";

			ba7_mysql_cleanup();			

			?>
				<br /><input class="but" type="submit" value="Submit"/>
			</form>
			<p class="err"><i>* - required fields</i><br />
			<i>** - must be valid email address</i></p>
		<br />	
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>

