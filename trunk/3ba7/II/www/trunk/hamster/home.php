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
		</div>
	</body>
</html>
