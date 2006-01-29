 /* $Id$ */

CREATE TABLE Film(
	FilmID INTEGER NOT NULL,
	FilmTitle VARCHAR(80) NOT NULL,
	FilmYear DATE NOT NULL,
	PRIMARY KEY(FilmID)
);

CREATE TABLE Actor(
	ActorID INTEGER NOT NULL,
	ActorName VARCHAR(80) NOT NULL,
	ActorDOB DATE NOT NULL,
	PRIMARY KEY(ActorID)
);

CREATE TABLE FilmRole(
	Role VARCHAR(80) NULL,
	FilmID INTEGER NOT NULL,
	ActorID INTEGER NOT NULL,
	PRIMARY KEY(Role, FilmID, ActorID),
	FOREIGN KEY(FilmID) REFERENCES Film(FilmID),
	FOREIGN KEY(ActorID) REFERENCES Actor(ActorID)
);

CREATE TABLE Director(
	DirectorID INTEGER NOT NULL,
	DirectorName VARCHAR(80) NOT NULL,
	DirectorDOB DATE NOT NULL,
	PRIMARY KEY(DirectorID)
);

CREATE TABLE Directed(
	FilmID INTEGER NOT NULL,
	DirectorID INTEGER NOT NULL,
	PRIMARY KEY(FilmID, DirectorID),
	FOREIGN KEY(FilmID) REFERENCES Film(FilmID),
	FOREIGN KEY(DirectorID) REFERENCES Director(DirectorID)
);

CREATE TABLE Media(
	Barcode INTEGER NOT NULL,
	Media VARCHAR(20) NOT NULL,
	Sound VARCHAR(20) NOT NULL,
	Region INTEGER NOT NULL,
	AspectRatio VARCHAR(10) NOT NULL,
	PRIMARY KEY(Barcode)
);

CREATE TABLE MediaOptions(
	FilmID INTEGER NOT NULL,
	Barcode INTEGER NOT NULL,
	PRIMARY KEY(FilmID, Barcode),
	FOREIGN KEY (FilmID) REFERENCES Film(FIlmID),
	FOREIGN KEY (Barcode) REFERENCES Media(Barcode)
);

INSERT into Film VALUES (1, 'The West Wing - Season 1', '1-jan-1999');
INSERT into Film VALUES (2, 'Lost In Translation', '01-jan-2003');
INSERT into Film VALUES (3, 'Finding Neverland', '01-jan-2004');
INSERT into Film VALUES (4, 'Fight Club', '01-jan-1999');
INSERT into Film VALUES (5, 'American History X', '01-jan-1999');
INSERT into Film VALUES (6, 'The Negotiator', '01-jan-1998');
INSERT into Film VALUES (7, 'Corpe Bride', '01-jan-2005');


INSERT into Actor VALUES (1, 'Martin Sheen', '03-aug-1940'); 
INSERT into Actor VALUES (2, 'John Spencer', '20-dec-1946'); 
INSERT into Actor VALUES (3, 'Allison Janney', '19-nov-1960'); 
INSERT into Actor VALUES (4, 'Rob Lowe', '17-mar-1964'); 
INSERT into Actor VALUES (5, 'Richard Schiff', '27-may-1955'); 
INSERT into Actor VALUES (6, 'Bradley Whitford', '10-oct-1959'); 

INSERT into Actor VALUES (7, 'Edward Norton', '18-aug-1969');
INSERT into Actor VALUES (8, 'Edward Furlong', '02-aug-1977');

INSERT into Actor VALUES (9, 'Samuel L. Jackson', '21-dec-1948');
INSERT into Actor VALUES (10, 'Kevin Spacey', '26-jul-1959');

INSERT into Actor VALUES (11, 'Brad Pitt', '18-dec-1963');
INSERT into Actor VALUES (12, 'Helena Bonham Carter', '26-may-1966');

INSERT into Actor VALUES (13, 'Johnny Depp', '09-jun-1963');
INSERT into Actor VALUES (14, 'Kate Winslet', '05-oct-1975');

INSERT into Actor VALUES (15, 'Bill Murray', '21-sep-1950');
INSERT into Actor VALUES (16, 'Scarlet Johanssonn', '22-nov-1984');


INSERT into FilmRole VALUES ('Josiah Bartlett', 1, 1);
INSERT into FilmRole VALUES ('Leo McGarry', 1, 2);
INSERT into FilmRole VALUES ('Claudia Jean Cregg', 1, 3);
INSERT into FilmRole VALUES ('Samuel Seabourn', 1, 4);
INSERT into FilmRole VALUES ('Toby Ziegler', 1, 5);
INSERT into FilmRole VALUES ('Joshua Lynam', 1, 6);

INSERT into FilmRole VALUES ('Derek Vinyard', 5, 7);
INSERT into FilmRole VALUES ('Danny Vinyard', 5, 8);

INSERT into FilmRole VALUES ('Danny Roman', 6, 9);
INSERT into FilmRole VALUES ('Chris Sabien', 6, 10);
INSERT into FilmRole VALUES ('Chief Al Travis', 6, 2);

INSERT into FilmRole VALUES ('Narrator', 4, 7);
INSERT into FilmRole VALUES ('Tyler Durden', 4, 10);
INSERT into FilmRole VALUES ('Marla Singer', 4, 11);

INSERT into FilmRole VALUES ('James Matthew Barrie', 3, 13);
INSERT into FilmRole VALUES ('Sylvia Llewelyn Davies', 3, 14);

INSERT into FilmRole VALUES ('Bob Harris', 2, 15);
INSERT into FilmRole VALUES ('Charlotte', 2, 16);

INSERT into FilmRole VALUES ('Victor Van Dort', 7, 13);
INSERT into FilmRole VALUES ('Corpse Bride', 7, 11);


INSERT into Director VALUES (1, 'Chris Misiano', '01-jan-1800'); 
INSERT into Director VALUES (2, 'Tony Kaye', '01-jan-1952'); 
INSERT into Director VALUES (3, 'Sophia Coppola', '14-may-1971'); 
INSERT into Director VALUES (4, 'Tim Burton', '25-aug-1958'); 
INSERT into Director VALUES (5, 'Mike Johnson', '01-jan-1800'); 
INSERT into Director VALUES (6, 'David Fincher', '10-may-1962'); 
INSERT into Director VALUES (7, 'Marc Forster', '01-jan-1969'); 
INSERT into Director VALUES (8, 'F. Gary Grey', '17-jul-1969'); 


INSERT into Directed VALUES (1, 1);
INSERT into Directed VALUES (2, 3);
INSERT into Directed VALUES (3, 7);
INSERT into Directed VALUES (4, 6);
INSERT into Directed VALUES (5, 2);
INSERT into Directed VALUES (6, 8);
INSERT into Directed VALUES (7, 4);
INSERT into Directed VALUES (7, 5);


INSERT into Media VALUES (5017188815567, 'DVD', 'Dolby 5.1 Surround', 2, '2.35:1');
INSERT into Media VALUES (7321900223935, 'DVD', 'Dolby 2.0 Surround', 2, '4:3');
INSERT into Media VALUES (5060049145198, 'DVD', 'Dolby 5.1 Surround', 2, '16:9');
INSERT into Media VALUES (5039036003841, 'DVD', 'Dolby 5.1 Surround', 2, '16:9');
INSERT into Media VALUES (7321900167505, 'DVD', 'Dolby 5.1 Surround', 2, '2.35:1');
INSERT into Media VALUES (5017239190452, 'DVD', 'Dolby 5.1 Surround', 2, '16:9');
INSERT into Media VALUES (0000000000001, 'DVD', 'Dolby 5.1 Surround', 1, '16:9');


INSERT into MediaOptions VALUES (1, 7321900223935);
INSERT into MediaOptions VALUES (2, 5060049145198);
INSERT into MediaOptions VALUES (3, 5017188815567);
INSERT into MediaOptions VALUES (4, 5039036003841);
INSERT into MediaOptions VALUES (5, 7321900167505);
INSERT into MediaOptions VALUES (6, 7321900223935);
INSERT into MediaOptions VALUES (7, 0000000000001);


UPDATE FilmRole SET Role = 'Lt Danny Roman' where (Role = 'Danny Roman' 
	AND FilmID = 6);  
UPDATE FilmRole SET Role = 'Lt Chris Sabien' where Role = 'Chris Sabien' 
	AND FilmID = 6;  
UPDATE FilmRole SET Role = 'Sir James Matthew Barrie' where Role = 
	'James Matthew Barrie' 	AND FilmID = 3;  


CREATE view FilmsAvailable as SELECT FilmTitle, Media, Region from 
	Film, Media, MediaOptions where Film.FilmID = MediaOptions.FilmID AND  
	Media.Barcode = MediaOptions.Barcode;


# Relational Select

SELECT Barcode from Media where (Region = 2 AND AspectRatio = '16:9');

# Join Statement

SELECT ActorName, FilmTitle from Film, FilmRole, Actor 
	where Film.FilmID = FilmRole.FilmID AND
	Actor.ActorID = FilmRole.ActorID;
