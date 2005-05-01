<?php
		// $Id$

       // Import Configuration
		 include("config.inc");

		 // setup session security
		 include($install_path."includes/session.inc");
		 ba7_session_setup();

		 // ensure user has permissions to clear account
		 if ($_SESSION['permissions'] > 2){
		 	header("Location: home.php");
		 }	
?>		 
<html>
	<head>
		<title>Editor :: View All Magazine Subscriptions</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<h1>View All Magazine Subscriptions</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php

			// print username
			echo "<p>You are logged in as: <b>" . $_SESSION['user'] . "</b></p>\n";
			

			include ($install_path."includes/mysql.inc");

			ba7_mysql_setup();

			$sql = "SELECT * FROM magazines WHERE owner='". $_SESSION['user'] ."'";
			$result = mysql_query($sql);

			for ($i = 0; $i < mysql_num_rows($result); $i++){
				$row = @ mysql_fetch_row($result);
				echo "<p><b><u>$row[3]:</u></b></p>\n";
				echo "<table border=\"0\" cellspacing=\"10\">\n";
				echo "<tr><td><p><b>Subscription ID:</b></p></td>\n<td><p><b>Username:</b></p></td></tr>\n";
				$sql = "SELECT * FROM $row[2]";
				$result1 = mysql_query($sql);
				for ($j = 0; $j < mysql_num_rows($result1); $j++){
					$user = @ mysql_fetch_row($result1);
					echo "<tr><td><p>$user[0]</p></td>\n<td><p>$user[1]</p></td></tr>\n";
				}	
			}
			ba7_mysql_cleanup();
		?>	
		</table>
		<br />	
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>

