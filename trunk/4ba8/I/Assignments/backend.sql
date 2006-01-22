-- $Id$

drop table if exists servicetype;
create table servicetype (
	TypeID	int(5) NOT NULL auto_increment,
	TypeName varchar(80) default '',
	PRIMARY KEY(TypeID)
);

drop table if exists service;
create table service (
	ServiceID	int(5)	NOT NULL auto_increment,
	ServiceName	varchar(80) NOT NULL default '',
	ServiceType	int(5) NOT NULL,
	Opening		datetime default NULL,
	Closing		datetime default NULL,
	PRIMARY KEY(ServiceID)
);

drop table if exists instance;
create table instance (
	UniqueID		int(5) NOT NULL auto_increment,
	ServiceID	int(5) NOT NULL,
	ServiceDate	datetime	NOT NULL default '0000-00-00 00:00:00',
	Capacity		int(5) NOT NULL default 0,
	Cost			int(5) NOT NULL default 0,
	Source		varchar(80) default NULL,
	Destination	varchar(80) default NULL,
	Details		varchar(80) default NULL,
	PRIMARY 		KEY(UniqueID)
);

drop table if exists booking;
create table booking (
	BookingID	int(5) NOT NULL auto_increment,
	UniqueID		int(5) NOT NULL,
	Booked		enum('false', 'true') NOT NULL default 'false',
	Flexible		enum('false', 'true') NOT NULL default 'false',
	Cancelled	enum('false', 'true') NOT NULL default 'false',
	Confirmed	enum('false', 'true') NOT NULL default 'false',
	PRIMARY KEY(BookingID)
);

-- Now to populate the database

insert into servicetype values (NULL, 'Airline');
insert into servicetype values (NULL, 'Hotel');
insert into servicetype values (NULL, 'Car Rental');
insert into servicetype values (NULL, 'Bike Rental');
insert into servicetype values (NULL, 'Train');


insert into service values (NULL, 'AerLingus', 1, NULL, NULL); 
insert into service values (NULL, 'Ryanair', 1, NULL, NULL); 
insert into service values (NULL, 'BMI', 1, NULL, NULL); 
insert into service values (NULL, 'PanAm', 1, NULL, NULL); 

insert into service values (NULL, 'Hilton', 2, NULL, NULL); 
insert into service values (NULL, 'Raddison', 2, NULL, NULL); 
insert into service values (NULL, 'Four Seasons', 2, NULL, NULL); 
insert into service values (NULL, 'Lloyd Hotel', 2, NULL, NULL); 

insert into service values (NULL, 'Hertz', 3, NULL, NULL); 
insert into service values (NULL, 'Avis', 3, NULL, NULL); 
insert into service values (NULL, 'Dell Boy Rentals', 3, NULL, NULL); 
insert into service values (NULL, 'Budget Car Rentals', 3, NULL, NULL); 

insert into service values (NULL, 'Bob\'s Bikes', 4, '2005-06-01 09:00:00', '2005-09-30 18:00:00'); 
insert into service values (NULL, 'Mike\'s Bikes', 4, NULL, NULL); 
insert into service values (NULL, 'Bikes R Us', 4, NULL, NULL); 
insert into service values (NULL, 'Raleigh Bike Rentals', 4, NULL, NULL); 

insert into service values (NULL, 'EuroStar', 5, NULL, NULL); 
insert into service values (NULL, 'Virgin Trains', 5, NULL, NULL); 
insert into service values (NULL, 'Irish Rail', 5, NULL, NULL); 
insert into service values (NULL, 'AmTrak', 5, NULL, NULL); 

insert into instance values (NULL, 1, '2006-01-20 16:55:00', 62, 150, 'Dublin', 'London - Heathrow', NULL); 
insert into instance values (NULL, 4, '2006-01-31 15:00:00', 30, 990, 'Dublin', 'Beijing', NULL); 
insert into instance values (NULL, 3, '2006-03-27 12:00:00', 2, 500, 'New York - JFK', 'Geneva', NULL); 
insert into instance values (NULL, 2, '2006-10-01 09:50:30', 92, 400, 'Shannon', 'Boston', NULL); 

insert into instance values (NULL, 5, '2006-02-01 00:00:00', 1, 150, NULL, NULL, NULL); 
insert into instance values (NULL, 6, '2006-01-25 00:00:00', 2, 250, NULL, NULL, NULL); 
insert into instance values (NULL, 8, '2006-02-14 00:00:00', 2, 500, NULL, NULL, NULL); 
insert into instance values (NULL, 7, '2006-02-10 00:00:00', 1, 125, NULL, NULL, NULL); 

insert into instance values (NULL, 12, '2006-03-01 00:00:00', 5, 30, NULL, NULL, 'Ford Taurus'); 
insert into instance values (NULL, 11, '2006-03-15 00:00:00', 5, 50, NULL, NULL, 'Toyota Yarus'); 
insert into instance values (NULL, 9, '2006-03-01 00:00:00', 2, 500, NULL, NULL, 'Ferrari 360'); 
insert into instance values (NULL, 10, '2006-03-01 00:00:00', 5, 75, NULL, NULL, 'BMW 325i'); 

insert into instance values (NULL, 13, '2006-06-07 00:00:00', 1, 5, NULL, NULL, 'Mens 18 Gear Mountain Bike'); 
insert into instance values (NULL, 14, '2006-05-03 00:00:00', 1, 5, NULL, NULL, 'Womens 18 Gear Mountain Bike'); 
insert into instance values (NULL, 15, '2006-04-12 00:00:00', 1, 10, NULL, NULL, 'Mens 18 Gear Mountain Bike'); 
insert into instance values (NULL, 16, '2006-03-31 00:00:00', 2, 20, NULL, NULL, 'Two Person Tandum'); 

insert into instance values (NULL, 17, '2006-03-01 00:00:00', 20, 50, 'London - Paddington', 'Bordeaux', 'First Class'); 
insert into instance values (NULL, 18, '2006-03-15 00:00:00', 40, 15, 'Edinburgh', 'Manchester', 'Second Class'); 
insert into instance values (NULL, 19, '2006-03-01 00:00:00', 200, 20, 'Dublin - Heuston', 'Galway', 'Second Class'); 
insert into instance values (NULL, 20, '2006-03-01 00:00:00', 50, 25, 'Washington', 'New York', 'Second Class'); 

insert into booking values (NULL, 2, 'true', 'true', 'false', 'false'); 
insert into booking values (NULL, 9, 'true', 'false', 'false', 'true'); 
insert into booking values (NULL, 12, 'true', 'false', 'false', 'false'); 
insert into booking values (NULL, 19, 'true', 'true', 'false', 'false'); 
