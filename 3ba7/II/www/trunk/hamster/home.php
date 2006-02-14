<?php
		 // $Id$

		// Import Configuration
		include("config.inc");
		
		include($install_path."includes/session.inc");
		ba7_session_setup();

?>
<html>
	<head>
		<title>Admin :: Home</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<h1>Admin Home</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php
			include($install_path."includes/mysql.inc");
			ba7_mysql_setup();
			$sql="SELECT * FROM users WHERE name = '". $_SESSION['user'] . "'";
			$result = mysql_query($sql);
			$row = mysql_fetch_row($result);
			echo "<h3>Welcome, $row[5] $row[6]!</h3>";
			ba7_mysql_cleanup();
			if ($_SESSION['permissions'] == 1){
				echo"<li class=\"sel\"><a href=\"view_users.php\">View All Users</a></li>";
				echo"<li class=\"sel\"><a href=\"reenable.php\">Re-Enable Disabled Accounts</a></li>";
				echo"<li class=\"sel\"><a href=\"view_magazines.php\">View All Magazines</a></li>";
				echo"<li class=\"sel\"><a href=\"add_magazine.php\">Add New Magazine</a></li>";
				echo"<li class=\"sel\"><a href=\"rem_magazine.php\">Remove Magazine</a></li>";
			}
			if ($_SESSION['permissions'] == 2){
				echo"<li class=\"sel\"><a href=\"view_mag_subs.php\">View All Magazine Subscriptions</a></li>";
			}	
			if ($_SESSION['permissions'] <= 3){
				echo"<li class=\"sel\"><a href=\"sub_magazine.php\">Subscribe To A Magazine</a></li>";
				echo"<li class=\"sel\"><a href=\"view_subscriptions.php\">View All Current Subscriptions</a></li>";
				echo"<li class=\"sel\"><a href=\"unsub_magazine.php\">Unsubscribe From A Magazine</a></li>";
				echo"<li class=\"sel\"><a href=\"change_details.php\">Change User Details</a></li>";
			}	
			?>

		</div>
	</body>
</html>
