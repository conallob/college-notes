<?php
		  $usname = $_POST["usname"];
		  $passwd = $_POST["passwd"];
		  
		  $file = file("passwords");
		  $found = false;
		  $i = 0;
		  
		  while ($file[$i] && !$found){
					 $line = explode(",",$file[$i]);
					 $line[1] = rtrim($line[1]);
					 if (($line[0] == $usname) && ($line[1] == $passwd)){
								$found = true;
					 }
					 $i++;
		  }
		  if ($found == true){
					 $temp = setcookie("nombre","$usname", (time() + 1800));
					 header("Location: home.php");
		  }
		  else{
					 echo "Password Not Found - Now, Piss off!\n";
		  }
?>
