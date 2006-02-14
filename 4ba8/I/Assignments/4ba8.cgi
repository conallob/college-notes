#!/usr/bin/perl -w
   
use strict;

use CGI;

use CGI::Carp qw(fatalsToBrowser);

use XMLRPC::Lite +trace => 'all';

print "Content-Type: text/plain\n\n<html>\n\n";


my $session = XMLRPC::Lite
	-> proxy('http://master-4ba8.conall.ie/cgi/xmlrpc.cgi')
	-> on_fault(sub { die "Transport error: " . $_[1]->faultstring })
	-> call('ba8.GetServiceType', 4)
	-> result;

print $session->{'TypeName'};



print "</html>";	
