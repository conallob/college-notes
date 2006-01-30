#!/usr/bin/perl -w

# $Id$

use strict;
   
use CGI;
use XMLRPC::Transport::HTTP;
use DBI;

my $dbh = DBI->connect('DBI:mysql:4ba8', '4ba8', 'nkm34e', 
								{ RaiseError => 1, AutoCommit => 1});

#print "Content-Type: text/plain\n\n";

my $daemon = XMLRPC::Transport::HTTP::CGI
    ->dispatch_to('ba8')
    ->handle;

package ba8;

sub echoParam {
	if (exists($_{'id'})) {
		print "$_{'id'}";
	} else {
		print "Foobar!";
	}
}
	
sub GetBooking {
	my $id = shift;
		  
  	my ($BookingID, $UniqueID, $Booked, 
			$Flexible, $Cancelled, $Confirmed);
 
  	my $sth = $dbh->prepare("SELECT * from booking where BookingID=$id;");
  	$sth->execute();

	if (my @row = $sth->fetchrow_array) {
		return +{		  
			BookingID	=> $row[0],
			UniqueID 	=> $row[1],
			Booked 	 	=> XMLRPC::Data->type('boolean', BooleanENUMConvert($row[2])),
			Flexible 	=> XMLRPC::Data->type('boolean', BooleanENUMConvert($row[3])),
			Cancelled	=> XMLRPC::Data->type('boolean', BooleanENUMConvert($row[4])),
			Confirmed 	=> XMLRPC::Data->type('boolean', BooleanENUMConvert($row[5]))
		};
	}
}

sub BooleanENUMConvert  {
		  my $z = shift;
		  if ($z eq 'true') {
					 return 1;
		  } else {
					 return 0;
		  }
}
