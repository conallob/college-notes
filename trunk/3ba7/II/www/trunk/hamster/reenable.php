<?php
		
		 // $Id$

       // Import Configuration
		 include("config.inc");
		
		 // setup session security
		 include($install_path."includes/session.inc");
		 ba7_session_setup();

		 // ensure user has correct permissions
		 if ($_SESSION['permissions'] != 1){
		 	header("Location: home.php");
		 }	
?>
<html>
	<head>
		<title>Admin :: Re-Enable Locked Accounts</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<h1>Re-Enable Locked Accounts</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php

			// print username
			echo "<p>You are logged in as: <b>" . $_SESSION['user'] . "</b></p>\n";
			

			include ($install_path."includes/mysql.inc");

			ba7_mysql_setup();
					
			// check for any locked accounts		
			$sql = "SELECT * FROM flogs WHERE attempts >= 3";
			$result = mysql_query($sql);

			// print out all the locked accounts:
			if (mysql_num_rows($result) > 0){
				
				 echo "<p>Select user to be re-enabled</p>\n";
				 echo "<form action=\"clear_fails.php\" method=\"POST\">\n";
			
				while($row = mysql_fetch_row($result)){
					echo "<li class=\"sel\" <input type=\"radio\" name=\"user\"
										value=\"$row[0]\">$row[0]</input></li>\n";
				}
				echo "<input class=\"but\" type=\"submit\" value=\"Re-enable\"/>\n";
				echo "</form>\n";
			}
			// if there are no locked accounts, tell user:
			else{
				echo "<i><p>No users currently disabled</p></i>\n";
			}	

			ba7_mysql_cleanup();

			?>
		<br />	
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
