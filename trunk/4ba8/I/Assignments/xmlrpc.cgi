#!/usr/bin/perl -w

# $Id$

use strict;
   
use CGI;
use XMLRPC::Transport::HTTP;
use DBI;
use Switch;

my $dbh = DBI->connect('DBI:mysql:4ba8', '4ba8', 'nkm34e', 
								{ RaiseError => 1, AutoCommit => 1});


my $sth;

print "Content-Type: text/plain\n\n";

print "Content-Type: text/plain\n\n";

print "Content-Type: text/plain\n\n";

print "Content-Type: text/plain\n\n";

print "Content-Type: text/plain\n\n";

print "Content-Type: text/plain\n\n";

print "Content-Type: text/plain\n\n";

my $daemon = XMLRPC::Transport::HTTP::CGI
    ->dispatch_to('ba8')
    ->handle;


package ba8;

	#
	# Functions to Manipulate Service Types
	#

	sub AddServiceType {
		shift;
		my ($name) = @_;

		if (! defined($name)) {
			warn "Warning: I can't work with undefined parameters";
		}

  	  	$sth = $dbh->prepare("INSERT into servicetype values(NULL, '$name');");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}


	sub EditServiceType {
		shift;
		my ($oldname, $newname) = @_;

		if (! defined($oldname) || ! defined($newname)) {
			warn "Warning: I can't work with undefined parameters";
		}

  	  	$sth = $dbh->prepare("UPDATE servicetype SET TypeName='$newname' where TypeName='$oldname';");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}


	sub DeleteServiceType {
		shift;
		my ($name) = @_;

		if (! defined($name)) {
			warn "Warning: I can't work with undefined parameters";
		}

  	  	$sth = $dbh->prepare("DROP * from servicetype where TypeName='$name';");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}

	
	sub GetServiceType {
		shift;
		my ($id) = @_;

		if (! defined($id)) {
			warn "Warning: I can't work with undefined parameters";
		}
			  
  	  	$sth = $dbh->prepare("SELECT TypeName from servicetype where TypeID=$id;");
  	  	if ($sth->execute()) {
			if (my @row = $sth->fetchrow_array) {
				return {		  
					TypeName	=> $row[0]
				};	
			} else {
				warn $dbh->strerr;
			}
		} else {
			return false;
		}
	}


	#
	# Functions to Manipulate Service Types
	#


	sub AddOperator {
		shift;
		my ($name, $type, $opening, $closing) = @_;

		if (! defined($name) || ! defined($type)) {
			warn "Warning: I can't work with undefined parameters";
		}

		# Do lookup of TypeID from servicetype

		# Do checks to see if $opening and $closing are defined
		
  	  	$sth = $dbh->prepare("INSERT into service values(NULL, '$name', $type, $opening, $closing);");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}

	
	sub EditOperator {
		shift;
		my ($oldname, $prop, $value) = @_;

		if (! defined($oldname) || ! defined ($prop) || 
				  ! defined ($value)) {
			warn "Warning: I can't work with undefined parameters";
		}

  	  	$sth = $dbh->prepare("UPDATE service SET $prop=$value where ServiceName='$oldname';");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}


	sub DeleteOperator {
		shift;
		my ($name) = @_;

		if (! defined($name)) {
			warn "Warning: I can't work with undefined parameters";
		}

		# dependencies in instances, and bookings...
		
  	  	$sth = $dbh->prepare("DROP * from service where ServiceName='$name';");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}

	
	sub GetOperator {
		shift;
		my ($id) = @_;

		if (! defined($id)) {
			warn "Warning: I can't work with undefined parameters";
		}

  	  	$sth = $dbh->prepare("SELECT * from service where ServiceID=$id);");

		if ($sth->execute()) {
			if (my @row = $sth->fetchrow_array) {
				return {		  
					ServiceName	=> $row[1],
					ServiceType	=> $row[2],
					Opening		=> $row[3],
					Closing 		=> $row[4]
				};
			}
		} else {
			return false;
		}
	}


	sub AddInstance {
		shift;
		my ($operator, $date, $capacity, $cost, $src, $dest, $details) = @_;

		if (! defined($operator) || ! defined ($date) || 
				  ! defined ($capacity) || ! defined ($cost)) {
			warn "Warning: I can't work with undefined parameters";
		}

		# Do lookup of TypeID from servicetype

		my $operatorid;
		
  	  	$sth = $dbh->prepare("SELECT ServiceID from service where ServiceName='$operator';");

		if ($sth->execute()) {
			if (my @row = $sth->fetchrow_array) {
				$operatorid = $row[0];
			}
		} else {
			return false;
		}

  	  	$sth = $dbh->prepare("INSERT into instance values(NULL, $operatorid, '$date', $capacity, $cost, '$src', '$dest', '$details');");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}


	sub EditInstance {
		shift;
		my ($id, $flag, $newvalue) = @_;

		if (! defined($id) || ! defined ($flag) || 
				  ! defined ($newvalue)) {
			warn "Warning: I can't work with undefined parameters";
		}
		  
  	  	$sth = $dbh->prepare("UPDATE instance SET $flag=$newvalue where UniqueID=$id;");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}

	
	sub DeleteInstance { 
		shift;
		my ($id) = @_;

		if (! defined($id)) {
			warn "Warning: I can't work with undefined parameters";
		}

  	  	$sth = $dbh->prepare("DROP * from instance where UniqueID=$id;");

		if ($sth->execute()) {
			return true;
		} else {
			return false;	  
		}
	}

	
	sub GetInstance {
		shift;
		my ($id) = @_;
			  
		if (! defined($id)) {
			warn "Warning: I can't work with undefined parameters";
		}
			  
  	  	$sth = $dbh->prepare("SELECT * from booking where BookingID=$id;");
  	  	
		if($sth->execute()) {
			if (my @row = $sth->fetchrow_array) {
				return {		  
					ServiceID	=> $row[1],
					ServiceDate	=> $row[2],
					Capacity		=> $row[3],
					Cost			=> $row[4],
					Source		=> $row[5],
					Destination	=> $row[6],
					Details		=> $row[7]
				};
			} else {
				warn $dth->errstr;  
			}
		} else {
			return false;
		}
	}


	#
	# Functions to Manipulate Bookings
	#


	sub AddBooking {
		shift;
		my ($id) = @_;

		if (! defined($id)) {
			warn "Warning: I can't work with undefined parameters";
		}

		my $booked 		= "true";
		my $flexible	= "false";
		my $cancelled 	= "false";
		my $confirmed 	= "false";
			  
  	  	$sth = $dbh->prepare("INSERT into booking values(NULL, $id, '$booked', '$flexible', '$cancelled', '$confirmed');");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}


	sub EditBooking {
		shift;
		my ($id, $flag, $newvalue) = @_;

		if (! defined($id) || ! defined ($flag) || 
				  ! defined ($newvalue)) {
			warn "Warning: I can't work with undefined parameters";
		}
			  
  	  	$sth = $dbh->prepare("UPDATE booking SET $flag=$newvalue where BookingID=$id;");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}


	sub DeleteBooking {
		shift;
		my ($id) = @_;

		if (! defined($id)) {
			warn "Warning: I can't work with undefined parameters";
		}

  	  	$sth = $dbh->prepare("DROP * from booking where BookingID=$id;");

		if ($sth->execute()) {
			return true;
		} else {
			return false;
		}
	}

	
	sub GetBooking {
		shift;
		my ($id) = @_;

		if (! defined($id)) {
			warn "Warning: I can't work with undefined parameters";
		}
			  
  	  	$sth = $dbh->prepare("SELECT * from booking where BookingID=$id;");
  	  	
		if($sth->execute()) {
			if (my @row = $sth->fetchrow_array) {
				return {		  
					BookingID	=> $row[0],
					Booked 	 	=> XMLRPC::Data->type('boolean', BooleanENUMConvert($row[2])),
					Flexible 	=> XMLRPC::Data->type('boolean', BooleanENUMConvert($row[3])),
					Cancelled	=> XMLRPC::Data->type('boolean', BooleanENUMConvert($row[4])),
					Confirmed 	=> XMLRPC::Data->type('boolean', BooleanENUMConvert($row[5]))
				};
			} else {
				warn $dth->errstr;
			}
		} else {
			return false;
		}
	}


	#
	# Helper functions to save repeating myself
	#


	sub BooleanENUMConvert  {
			  my $z = shift;
			  if ($z eq 'true') {
						 return 1;
			  } else {
						 return 0;
			  }
	}


