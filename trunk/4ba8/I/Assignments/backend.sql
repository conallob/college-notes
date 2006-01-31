-- $Id$

drop table if exists servicetype;
create table servicetype (
	TypeID	int(5) NOT NULL auto_increment,
	TypeName varchar(80) default '',
	PRIMARY KEY(TypeID)
);

create table servicetype (
	TypeID	INTEGER NOT NULL AUTO_INCREMENT,
	TypeName VARCHAR(80),
	PRIMARY 		KEY(TypeID)
);

create table service (
	ServiceID	int(5)	NOT NULL auto_increment,
	ServiceName	varchar(80) NOT NULL default '',
	ServiceType	int(5) NOT NULL,
	PRIMARY KEY(ServiceID)
);

drop table if exists instance;
create table instance (
	UniqueID		int(5) NOT NULL auto_increment,
	ServiceID	int(5) NOT NULL auto_increment,
	ServiceDate	datetime	NOT NULL default '0000-00-00 00:00:00',
	Capacity		int(5) NOT NULL default 0,
	Cost			int(5) NOT NULL default 0,
	PRIMARY 		KEY(UniqueID)
);

drop table if exists booking;
create table booking (
	BookingID	int(5) NOT NULL auto_increment,
	UniqueID		int(5) NOT NULL auto_increment,
	Booked		int(1),
	Flexible		int(1),
	Cancelled	int(1),
	Confirmed	int(1),
	PRIMARY KEY(BookingID)
);
