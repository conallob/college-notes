<?php
		 // $Id$
		
		include("/3ba7/www/includes/session.inc");
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
			echo "<h3>Welcome, " . $_SESSION['user'] . "!</h3>";
 			?>
			<li class="sel"><a href="reenable.php">Re-Enable Disabled Accounts</a></li>

		</div>
	</body>
</html>
