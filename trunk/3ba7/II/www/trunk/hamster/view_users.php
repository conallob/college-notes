<?php
		// $Id$

       // Import Configuration
       include("config.inc");

		 // setup session security
		 include($install_path."includes/session.inc");
		 ba7_session_setup();

		 // ensure user has permissions to clear account
		 if ($_SESSION['permissions'] != 1){
		 	header("Location: home.php");
		 }	
?>		 
<html>
	<head>
		<title>Admin :: View All Users</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<h1>View All Users</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php

			// print username
			echo "<p>You are logged in as: <b>" . $_SESSION['user'] . "</b></p>\n";
			

			include ($install_path."includes/mysql.inc");

			ba7_mysql_setup();

			$sql = "SELECT * FROM users";
			$result = mysql_query($sql);
			?>
			<li class="sel"><a href="change_permissions.php">Change User Permissions</a></li>

			<table border=\"0\" cellspacing=\"10\">
			<tr>
				<td>User Id:</td>
				<td>Username:</td>
				<td>Permissions:</td>
				<td>Email Address:</td>
				<td>First Name</td>
				<td>Last Name</td>
			</tr>	
			<?php

			for ($i = 0; $i < mysql_num_rows($result); $i++){
				$row = @ mysql_fetch_row($result);
				echo "<tr>\n";
				for ($j = 0; $j < 7; $j++){
					if ($j == 2){
						$j++;
					}	
					echo "<td>$row[$j]</td>\n";
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

