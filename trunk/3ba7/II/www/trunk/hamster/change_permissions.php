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
		<title>Admin :: Change Account Permissions</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<h1>Change Account Permissions</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php

			// print username
			echo "<p>You are logged in as: <b>" . $_SESSION['user'] . "</b></p>\n";
			

			include ($install_path."includes/mysql.inc");

			ba7_mysql_setup();

			$sql = "SELECT * FROM users";
			$result = mysql_query($sql);

			echo "<form action=\"chpermissions.php\" method=\"POST\">\n";
			echo "<select name=\"user\">\n";

			for ($i = 0; $i < mysql_num_rows($result); $i++){
				$row = @ mysql_fetch_row($result);
				echo "<option value=\"$row[1]\">$row[5] $row[6]</option>\n";
			}
		?>			
				</select>
				<select name="perm">
					<option value="1">Administrator</option>
					<option value="2">Magazine Editor</option>
					<option value="3">Subscriber</option>
				</select><br /><br />
				<input class="but" type="submit" value="Change">
			</form>	
		<br />	
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
			


			
		 
