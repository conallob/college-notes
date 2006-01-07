<?php
		// $Id$

		 // setup session security
		 include("/3ba7/www/includes/session.inc");
		 ba7_session_setup();

		 // ensure user has permissions to clear account
		 if ($_SESSION['permissions'] != 1){
		 	header("Location: home.php");
		 }	

		 $user = $_POST["user"];
		 $smag_name = $_POST["smagname"];
		 $fmag_name = $_POST["fmagname"];
		 $description = $_POST["description"];

		 include("/3ba7/www/includes/mysql.inc");
		 ba7_mysql_setup();

		 $sql = "CREATE TABLE $smag_name (sid INT AUTO_INCREMENT key, user VARCHAR(20) NOT NULL)";
		 $result = mysql_query($sql);
		 if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
		 }
		 
		 $sql = "INSERT INTO magazines VALUES(0,'$user','$smag_name','$fmag_name','$description')";
		 $result = mysql_query($sql);
		 if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
		 }

		 ba7_mysql_cleanup();

		 $content = "<p>Magazine $fmag_name has been added to the system.</p>";
		 $content .= "<p>The editor of the magazine is user: $user.";

?>

<html>
	<head>
		<title>CMSS :: Admin :: Add New Magazine</title>
		<link rel="stylesheet" type="text/css" href="style.css" /> 
	</head>
	<body>
		<center><a href="home.php"><img src="cmss.gif" 
							alt="CMSS - Central Magazine Subscription Service" border="0"/></a></center>
		<h1>Add New Magazine</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php echo $content; ?>
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
			



