# $Id$

service ENUM ('Hotel', 'Car', 'Bike', 'Airline', 'Train');

create table servicetype (
	TypeID	INTEGER NOT NULL AUTO_INCREMENT,
	TypeName VARCHAR(80),
	PRIMARY 		KEY(TypeID)
);

create table service (
	ServiceID	INTEGER	NOT NULL AUTO_INCREMENT,
	ServiceName	VARCHAR(80) NOT NULL,
	ServiceType	INTEGER NOT NULL,
	PRIMARY 		KEY(ServiceID)
);

create table instance (
	UniqueID		INTEGER NOT NULL AUTO_INCREMENT,
	ServiceID	INTEGER	NOT NULL AUTO_INCREMENT,
	ServiceDate	DATE	NOT NULL,
	ServiceDate	NOT NULL,
	Capacity		INTEGER	NOT NULL,
	Cost			INTEGER NOT NULL,
	PRIMARY 		KEY(UniqueID),
	FOREIGN 		KEY(ServiceID) REFERENCES service (ServiceID);
);

create table booking (
	BookingID	INTEGER NOT NULL AUTO_INCREMENT,
	UniqueID		INTEGER NOT NULL AUTO_INCREMENT,
	Booked		BOOLEAN,
	Flexible		BOOLEAN,
	Cancelled	BOOLEAN,
	Confirmed	BOOLEAN,
	PRIMARY KEY(BookingID),
	FOREIGN KEY(UniqueID) REFERENCES instance (UniqueID);
);
