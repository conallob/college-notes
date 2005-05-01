<?php
		// $Id$
		
       // Import Configuration
		 include("config.inc");

		 // setup session security
		 include($install_path."includes/session.inc");
		 ba7_session_setup();

?>		 
<html>
	<head>
		<title>View Magazine Subscriptions</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<h1>View Magazine Subscriptions</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<p>These are the magazines you are currently subscribed to:</p>
			<?php
					//setup mysql
					include($install_path."includes/mysql.inc");
					ba7_mysql_setup();

					$sql = "SELECT * FROM magazines";
					$result = mysql_query($sql);

					for ($i = 0; $i < mysql_num_rows($result); $i++){
						$row = @ mysql_fetch_row($result);
						$sql = "SELECT * FROM $row[2] WHERE user='" . $_SESSION['user'] . "'";
						$result1 = mysql_query($sql);
						if (mysql_num_rows($result1) > 0){
							echo "<li class=\"sel\">$row[3]</li>\n";
						}			
					}	
					ba7_mysql_cleanup();
			?>
			<p>To subscibe to more, click <a href="sub_magazine.php">here</a></p>
			<p>To unsubscibe from a magazine, click <a href="unsub_magazine.php">here</a></p>
		</div>	
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
