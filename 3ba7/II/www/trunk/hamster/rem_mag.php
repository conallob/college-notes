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

		 $smag_name = $_POST["mag"];

		 include($install_path."includes/mysql.inc");
		 ba7_mysql_setup();

		 $sql = "DROP TABLE $smag_name";
		 $result = mysql_query($sql);
		 if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
		 }
		 
		 $sql = "DELETE FROM magazines WHERE magname='$smag_name'";
		 $result = mysql_query($sql);
		 if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
		 }

		 ba7_mysql_cleanup();

		 $content = "<p>Magazine $smag_name has been removed from the system.</p>";

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
			<?php echo $content; ?>
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
