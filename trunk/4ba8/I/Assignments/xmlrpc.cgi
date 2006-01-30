#!/usr/bin/perl -w

# $Id$

use strict;
   
use CGI;
use XMLRPC::Transport::HTTP;
use DBI;

my $dbh = DBI->connect('DBI:mysql:4ba8', '4ba8', 'nkm34e', 
								{ RaiseError => 1, AutoCommit => 1});

print "Content-Type: text/plain\n\n";

my $daemon = XMLRPC::Transport::HTTP::CGI
    ->dispatch_to('ba8')
    ->handle;

package ba8;

	# Testing Functions
	
	sub echoParam {
		shift;
		print @_;
		return [ @_ ];
	}


	#
	# Functions to Manipulate Service Types
	#


	sub AddServiceType {
		shift;
		my ($name) = @_;

  	  	my $sth = $dbh->prepare("INSERT into servicetype values(NULL, '$name');");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}


	sub EditServiceType {
		shift;
		my ($oldname, $newname) = @_;

  	  	my $sth = $dbh->prepare("UPDATE servicetype SET TypeName=$newname where TypeName=$oldname;");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}


	sub DeleteServiceType {
		shift;
		my ($id) = @_;

  	  	my $sth = $dbh->prepare("DROP * from servicetype where TypeID=$id;");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}

	
	sub GetServiceType {
		shift;
		my ($id) = @_;
			  
  	  	my $sth = $dbh->prepare("SELECT TypeName from servicetype where TypeID=$id;");
  	  	if ($sth->execute()) {
			if (my @row = $sth->fetchrow_array) {
				return {		  
					TypeName	=> $row[0]
				};	
			} else {
				# MySQL Fetch Error
			}
		} else {
			# Bad status code
		}
	}


	#
	# Functions to Manipulate Service Types
	#


	sub AddOperator {
		shift;
		my ($name, $type, $opening, $closing) = @_;

		# Do lookup of TypeID from servicetype

		# Do checks to see if $opening and $closing are defined
		
  	  	my $sth = $dbh->prepare("INSERT into service values(NULL, '$name', $type, $opening, '$closing');");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}

	
	sub EditOperator {
		shift;
		my ($oldname, $prop, $value) = @_;

  	  	my $sth = $dbh->prepare("UPDATE service SET $prop=$value where ServiceName=$oldname;");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}


	sub DeleteOperator {
		shift;
		my ($name) = @_;

		# dependencies in instances, and bookings...
		
  	  	my $sth = $dbh->prepare("DROP * from service where ServiceName=$name;");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}

	
	sub GetOperator {
		shift;
		my ($id) = @_;

  	  	my $sth = $dbh->prepare("SELECT * from service where ServiceID=$id);");

		if ($sth->execute()) {
			if (my @row = $sth->fetchrow_array) {
				return {		  
					ServiceName	=> $row[1],
					ServiceType	=> $row[2],
					Opening		=> $row[3],
					Closing 		=> $row[4]
				};
			# Good status code
		} else {
			# Bad status code
		}
	}


	sub AddInstance {
		shift;
		my ($operator, $date, $capacity, $cost, $src, $dest, $details) = @_;

		# Do lookup of TypeID from servicetype

		
  	  	my $sth = $dbh->prepare("SELECT ServiceID from service where ServiceName='$operator';");

		if ($sth->execute()) {
			if (my @row = $sth->fetchrow_array) {
				$operatorid = $row[0];
			}
			# Good status code
		} else {
			# Bad status code
		}

  	  	$sth = $dbh->prepare("INSERT into instance values(NULL, $operatorid, '$date', $capacity, $cost, '$src', '$dest', '$details');");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}


	#sub EditInstance 
	
	sub EditInstance {
		shift;
		my ($id, $flag, $newvalue) = @_;
			  
  	  	my $sth = $dbh->prepare("UPDATE instance SET $flag=$newvalue where UniqueID=$id;");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}

	
	sub DeleteInstance { 
		shift;
		my ($id) = @_;

  	  	my $sth = $dbh->prepare("DROP * from instance where UniqueID=$id;");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}

	
	sub GetInstance {
		shift;
		my ($id) = @_;
			  
  	  	my $sth = $dbh->prepare("SELECT * from booking where BookingID=$id;");
  	  	
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
				# MySQL Fetch Error
			}
		} else {
			# Bad status code
		}
	}


	#
	# Functions to Manipulate Bookings
	#


	sub AddBooking {
		shift;
		my ($id) = @_;

		my $booked 		= "true";
		my $flexible	= "false";
		my $cancelled 	= "false";
		my $confirmed 	= "false";
			  
  	  	my $sth = $dbh->prepare("INSERT into booking values(NULL, $id, '$booked', '$flexible', '$cancelled', '$confirmed');");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}


	sub EditBooking {
		shift;
		my ($id, $flag, $newvalue) = @_;
			  
  	  	my $sth = $dbh->prepare("UPDATE booking SET $flag=$newvalue where BookingID=$id;");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}


	sub DeleteBooking {
		shift;
		my ($id) = @_;

  	  	my $sth = $dbh->prepare("DROP * from booking where BookingID=$id;");

		if ($sth->execute()) {
			# Good status code
		} else {
			# Bad status code
		}
	}

	
	sub GetBooking {
		shift;
		my ($id) = @_;
			  
  	  	my $sth = $dbh->prepare("SELECT * from booking where BookingID=$id;");
  	  	
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
				# MySQL Fetch Error
			}
		} else {
			# Bad status code
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
