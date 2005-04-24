<?php
		//$Id$

		// start the session
		session_start();

		// if the session exists, kill it
		if ($_SESSION['user']){
			$_SESSION = array();
			session_destroy();
		}

		// redirect to logout.html
		header("Location: logout.html");
?>		
