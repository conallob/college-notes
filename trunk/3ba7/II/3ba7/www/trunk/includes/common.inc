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


/* Add a new user		*/

/*
function ba7_add_user($user, $email) {
	echo "Insert $user\n <br />";

	echo "Insert $email\n <br />";
}
*/

/* Is $email a valid, RFC-822 compliant email address?

Found at http://blogs.linux.ie/xeer/2005/02/16/validate-email-address-in-php/

*/

function checkEmail($email)
{
  // checks proper syntax
  if( !preg_match( "/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/", $email))
  {
    return false;
  }     
	
  // gets domain name
  list($username,$domain)=split('@',$email);
  // checks for if MX records in the DNS
  $mxhosts = array();
  if(!getmxrr($domain, $mxhosts))
  {
    // no mx records, ok to check domain
    if (!fsockopen($domain,25,$errno,$errstr,30))
    {
      return false;
    }
    else
    {
      return true;
    }
  }
  else
  {
    // mx records found
    foreach ($mxhosts as $host)
    {
      if (fsockopen($host,25,$errno,$errstr,30))
      {
        return true;
      }
    }
    return false;
  }
}


?>
