<?php

// $Id$

function ba7_session_setup() {

		 // start the session
		 session_start();
		 header("Cache-control: private"); //IE 6 Fix 

		 // if the session doesn't exist, redirect to login page
		 if (!($_SESSION['user'])){
		 		header("Location: index.html");
		 }
		 // ensure time hasn't run up
		 else if ($_SESSION['time'] < (time() - 300)){
		 		header("Location: timeout.html");
		 }	
		 // otherwise update time
		 else{
		 		$_SESSION['time'] = time();
		 }		
}
