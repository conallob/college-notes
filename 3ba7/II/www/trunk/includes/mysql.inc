<?php

/* $Id$ */

$db_username = "3ba7";
$db_password = "64gZ-qqzP";
$db_hostname = "localhost";
$db_name = "3ba7";


$connection;

function ba7_mysql_setup() {

global $connection;
global $db_username;
global $db_password;
global $db_hostname;
global $db_name;


         if (!($connection = mysql_connect($db_hostname, $db_username, $db_password) ) ){
            die("Could Not Connect to MySQL on $db_hostname");
         } 

         if (!(mysql_select_db($db_name,$connection))){
            die("Could Not Connect to Database 3ba7");
         }       

}

function ba7_mysql_cleanup() {

global $connection;
global $db_username;
global $db_password;
global $db_hostname;
global $db_name;

         if (!(mysql_close($connection)))
               die("Cannot close connection");

}

?>
