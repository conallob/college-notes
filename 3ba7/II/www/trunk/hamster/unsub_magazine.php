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
		<title>Unsubscribe from Magazine</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<h1>Unsubscribe from Magazine</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<p>Which magazine would you like to unsubscribe from?</p>
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
							echo "<li class=\"sel\"><a href=
									\"unsub_mag.php?mid=$row[0]\">$row[3]</a></li>\n";
						}			
					}	
					ba7_mysql_cleanup();
			?>
			<p>Click on the link to unsubscribe from the magazine!</p>
		</div>	
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
