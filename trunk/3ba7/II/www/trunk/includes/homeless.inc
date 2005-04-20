<?php

// $Id$

/*

A collection of useful functions to test for certain conditions, etc...

*/


/* http:// or https:// ?	*/

function isSSLSecure() {

	switch($_SERVER["HTTPS"]) {

		case "on":
        
		return true;  // We're secure. Yah!
        
		break;
        
		case "off":
        
		return false; // Maybe not...
        
		break;
        
		default:
        
		return false; // Defaults to false
        
		break;

	}

}


/* v4 or v6 ?	 */

function ipv4oripv6() {

        if (ereg("^[0-9A-Fa-f:]+$", $_SERVER["REMOTE_ADDR"])) {

                return 1; // IPv6

        } else {

                return 0; // IPv4

        }

}



?>
