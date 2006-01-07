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
		<title>Subscribe to Magazine</title>
		<link rel="stylesheet" type="text/css" href="style.css" />
	</head>
	<body>
		<h1>Subscribe to Magazine</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<p>Here's a list of the current magazines you can subsribe to:</p>
			<?php
					//setup mysql
					include($install_path."includes/mysql.inc");
					ba7_mysql_setup();

					$sql = "SELECT * FROM magazines";
					$result = mysql_query($sql);

					for ($i = 0; $i < mysql_num_rows($result); $i++){
						$row = @ mysql_fetch_row($result);
						echo "<li class=\"sel\"><a href=
								\"sub_mag.php?mid=$row[0]\">$row[3]</a></li>\n";
					}			
					ba7_mysql_cleanup();
			?>
			<p>Click on the link to subscribe to the magazine!</p>
		</div>	
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
