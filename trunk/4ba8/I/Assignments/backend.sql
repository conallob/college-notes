-- $Id$

drop table if exists servicetype;
create table servicetype (
	TypeID	int(5) NOT NULL auto_increment,
	TypeName varchar(80) default '',
	PRIMARY KEY(TypeID)
) ENGINE=MyISAM;

drop table if exists service;
create table service (
	ServiceID	int(5)	NOT NULL auto_increment,
	ServiceName	varchar(80) NOT NULL default '',
	ServiceType	int(5) NOT NULL,
	PRIMARY KEY(ServiceID)
) ENGINE=MyISAM;

drop table if exists instance;
create table instance (
	UniqueID		int(5) NOT NULL auto_increment,
	ServiceID	int(5) NOT NULL,
	ServiceDate	datetime	NOT NULL default '0000-00-00 00:00:00',
	Capacity		int(5) NOT NULL default 0,
	Cost			int(5) NOT NULL default 0,
	PRIMARY 		KEY(UniqueID),
) ENGINE=MyISAM;

drop table if exists booking;
create table booking (
	BookingID	int(5) NOT NULL auto_increment,
	UniqueID		int(5) NOT NULL,
	Booked		enum('false', 'true') NOT NULL default 'false',
	Flexible		enum('false', 'true') NOT NULL default 'false',
	Cancelled	enum('false', 'true') NOT NULL default 'false',
	Confirmed	enum('false', 'true') NOT NULL default 'false',
	PRIMARY KEY(BookingID),
) ENGINE=MyISAM;
