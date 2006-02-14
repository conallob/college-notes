#!/usr/bin/perl -w

use DBI;

$dbh = DBI->connect('DBI:mysql:4ba8', '4ba8', 'nkm34e',
            { RaiseError => 1, AutoCommit => 1});

#$dbh->do();
$sth = $dbh->prepare("SELECT * from service;");
$sth->execute();
while (@row = $sth->fetchrow_array) {
		  print join("\t", map {defined $_ ? $_ : "(null)"} @row), "\n";
}

$sth->finish;
$dbh->disconnect;
