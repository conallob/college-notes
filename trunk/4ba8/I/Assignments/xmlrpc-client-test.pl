#!/usr/bin/perl -w
   
use strict;

#use XMLRPC::Lite;
use XMLRPC::Lite +trace => 'all';

print XMLRPC::Lite
	-> proxy('http://master-4ba8.conall.ie/cgi/xmlrpc.cgi')
	-> on_fault(sub { die "Transport error: " . $_[1]->faultstring })
	-> call('ba8.echoParam', { 'id' => 'Hello' , 'bla' => "World!" } )
	#-> call('GetBooking' => 3)
	-> result;   

print "\n";
