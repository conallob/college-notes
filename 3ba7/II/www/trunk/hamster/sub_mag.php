<?php
		// $Id$
		
       // Import Configuration
		 include("config.inc");
				  
		 // setup session security
		 include($install_path."includes/session.inc");
		 ba7_session_setup();

		 $mid = $_GET["mid"];

		 include($install_path."includes/mysql.inc");
		 ba7_mysql_setup();

		 $sql = "SELECT * FROM magazines where mid='$mid'";
		 $result = mysql_query($sql);
		 if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
		 }
		 $row1 = mysql_fetch_row($result);
		 
		 $sql = "INSERT INTO $row1[2] VALUES(0,'" . $_SESSION['user'] . "')";
		 $result = mysql_query($sql);
		 if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
		 }

		 ba7_mysql_cleanup();

		 $content = "<p>You have been successfully subscribed to $row1[3].</p>";

?>

<html>
	<head>
		<title>Subscribe to Magazine</title>
		<link rel="stylesheet" type="text/css" href="style.css" /> 
	</head>
	<body>
		<h1>Subscribe to Magazine</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php echo $content; ?>
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
			




