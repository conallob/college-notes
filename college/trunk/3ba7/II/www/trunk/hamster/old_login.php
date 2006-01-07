<?php
		  $usname = $_POST["usname"];
		  $passwd = $_POST["passwd"];
		  

		  $flog = "failed_attempts";
		  $fails = 0;

		  if (!($fhandle = fopen($flog, "r"))){
		  		exit("Unable to open $flog");
		  }		

		   while(!feof($fhandle)){
				$buffer = fscanf($fhandle, "user: %s", $name);
				if (($buffer == 1) && ($name == $usname)){
					$fails++;
				}	
		   }

			fclose($fhandle);

			if ($fails >= 3){
				header("Location: lockout.html");
			}
			else{
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
						 $temp = setcookie("nombre","$usname", (time() + 300));
						 header("Location: home.php");
			  }
			  else{
			  			$fhandle = fopen($flog, "a+");
						fwrite($fhandle, "user: $usname, password: $passwd\n");
						fclose($fhandle);
			  			header("Location: index.html");
			  }
			}  
?>
