<?php
		 if (!isset($_COOKIE["nombre"])){
				header("Location: index.html");
		 }
?>
<html>
	<head>
		<title>Admin :: Home</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<h1>Admin Home</h1>
		<div class="main">
			<?php
			echo "<h3>Welcome, " . $_COOKIE["nombre"] . "!</h3>";
 			?>
			<p>Select the magazine:<br />
			<li class="sel">One</li>
			<li class="sel">Two</li>
			<li class="sel">Three</li></p>

			<h3>Disabled Users:</h3>
			<p>Select a blocked user to re-enable:</p>
			<form action="clear_fails.php" method="POST">
				<?php
					if (!($connection = mysql_connect("localhost","3ba7","64gZ-qqzP") ) ){
						die("Counld Not Connect to MySQL on localhost");
					}

					if (!(mysql_select_db("3ba7",$connection))){
						die("Count Not Connect to Database 3ba7");
					}
					
					$sql = "SELECT * FROM flogs WHERE attempts >= 3";
					$result = mysql_query($sql);
						while($row = mysql_fetch_row($result)){
						echo "<input type=\"radio\" name=\"user\" value=\"$row[0]\">$row[0]</input>\n";
					}

					if (!(mysql_close($connection)))
					   die("Cannot close connection");

					?>
				<br />	
				<input class="but" type="submit" value="Re-enable"/>
			</form>		
		</div>
	</body>
</html>
