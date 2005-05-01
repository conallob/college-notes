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
		<title>Admin :: Remove Magazine</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<h1>Remove Magazine</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<p>You are logged in as: <b><?php echo $_SESSION['user'] ?></b></p>
			<form action="rem_mag.php" method="POST">
				<p>Select Magazine to be removed:</p>
				<select name="mag">
						<?php
							// setup mysql
							include($install_path."includes/mysql.inc");
							ba7_mysql_setup();

							$sql = "SELECT * FROM magazines";
							$result = mysql_query($sql);

							for ($i = 0; $i < mysql_num_rows($result); $i++){
								$row = @ mysql_fetch_row($result);
								echo "<option value=\"$row[2]\">$row[3]</option>\n";
							}
							ba7_mysql_cleanup();
						?>
				</select><br />
				<input class="but" type="submit" value="Remove Magazine">
			</form>
		<br />	
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>

				
			
