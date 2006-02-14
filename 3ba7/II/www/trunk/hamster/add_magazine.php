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
		<title>Admin :: Add New Magazine</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<h1>Add New Magazine</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<p>You are logged in as: <b><?php echo $_SESSION['user'] ?></b></p>
			<form action="add_mag.php" method="POST">
				<p>Short name for magazine[for use in database]:<br /><input type="text" name="smagname" /></p>
				<p>Full name of magazine:<br /><input type="text" name="fmagname" /></p>
				<p>Magazine Editor:<br /><select name="user">
						<?php
							// setup mysql
							include($install_path."includes/mysql.inc");
							ba7_mysql_setup();

							$sql = "SELECT * FROM users WHERE permissions = 2";
							$result = mysql_query($sql);

							for ($i = 0; $i < mysql_num_rows($result); $i++){
								$row = @ mysql_fetch_row($result);
								echo "<option value=\"$row[1]\">$row[5] $row[6]</option>\n";
							}
							ba7_mysql_cleanup();
						?>
				</select>
				<input class="but" type="submit" value="Add Magazine">
			</form>
		<br />	
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
