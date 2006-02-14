# $Id$

CREATE TABLE Film(
	FilmID INTEGER NOT NULL AUTO_INCREMENT,
	FilmTitle VARCHAR(80) NOT NULL,
	FilmYear DATE NOT NULL,
	PRIMARY KEY(FilmID)
);

CREATE TABLE Actor(
	ActorID INTEGER NOT NULL AUTO_INCREMENT,
	ActorName VARCHAR(80) NOT NULL,
	ActorDOB DATE NOT NULL,
	PRIMARY KEY(ActorID)
);

CREATE TABLE FilmRole(
	Role VARCHAR(80) NULL,
	FilmID INTEGER NOT NULL AUTO_INCREMENT,
	ActorID INTEGER NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(Role, FilmID, ActorID)
	FOREIGN KEY(FilmID) REFERENCES Film(FilmID),
	FOREIGN KEY(ActorID) REFERENCES Actor(ActorID),
);

CREATE TABLE Director(
	DirectorID INTEGER NOT NULL AUTO_INCREMENT,
	DirectorName VARCHAR(80) NOt NULL,
	DirectorDOB DATE NOT NULL,
	PRIMARY KEY(DirectorID)
);

CREATE TABLE Directed(
	FilmID INTEGER NOT NULL AUTO_INCREMENT,
	DirectorID INTEGER NOT NULL,
	PRIMARY KEY(FilmId, DirectorID)
	FOREIGN KEY(FilmID) REFERENCES Film(FilmID),
	FOREIGN KEY(DirectorID) REFERENCES Director(DirectorID)
);

CREATE TABLE Media(
	Barcode INTEGER NOT NULL AUTO_INCREMENT,
	Media VARCHAR(20) NOT NULL,
	Sound VARCHAR(20) NOt NULL,
	Region INTEGER(1) NOT NULL,
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

INSERT into Film ('1', 'The West Wing - Season 1', 01-01-1999);
INSERT into Film ('2', 'Lost In Translation', 01-01-2003);
INSERT into Film ('3', 'Finding Neverland', 01-01-2004);
INSERT into Film ('4', 'Fight Club', 01-01-1999);
INSERT into Film ('5', 'American History X', 01-01-1999);
INSERT into Film ('6', 'The Negotiator', 01-01-1998);
INSERT into Film ('7', 'Corpe Bride', 01-01-2005);


INSERT into Actor('1', 'Martin Sheen', 03-08-1940); 
INSERT into Actor('2', 'John Spencer', 20-12-1946); 
INSERT into Actor('3', 'Allison Janney', 19-11-1960); 
INSERT into Actor('4', 'Rob Lowe', 17-03-1964); 
INSERT into Actor('5', 'Richard Schiff', 27-05-1955); 
INSERT into Actor('6', 'Bradley Whitford', 10-10-1959); 

INSERT into Actor('7', 'Edward Norton', 18-08-1969);
INSERT into Actor('8', 'Edward Furlong', 02-08-1977);

INSERT into Actor('9', 'Samuel L. Jackson', 21-12-1948);
INSERT into Actor('10', 'Kevin Spacey', 26-07-1959);

INSERT into Actor('11', 'Brad Pitt', 18-12-1963);
INSERT into Actor('12', 'Helena Bonham Carter', 26-05-1966);

INSERT into Actor('13', 'Johnny Depp', 09-06-1963);
INSERT into Actor('14', 'Kate Winslet', 05-10-1975);

INSERT into Actor('15', 'Bill Murray', 21-09-1950);
INSERT into Actor('16', 'Scarlet Johanssonn', 22-11-1984);


INSERT into FilmRole('Josiah Bartlett', 1, 1);
INSERT into FilmRole('Leo McGarry', 1, 2);
INSERT into FilmRole('Claudia Jean Cregg', 1, 3);
INSERT into FilmRole('Samuel Seabourn', 1, 4);
INSERT into FilmRole('Toby Ziegler', 1, 5);
INSERT into FilmRole('Joshua Lynam', 1, 6);

INSERT into FilmRole('Derek Vinyard', 5, 7);
INSERT into FilmRole('Danny Vinyard', 5, 8);

INSERT into FilmRole('Danny Roman', 6, 9);
INSERT into FilmRole('Chris Sabien', 6, 10);
INSERT into FilmRole('Chief Al Travis', 6, 2);

INSERT into FilmRole('Narrator', 4, 7);
INSERT into FilmRole('Tyler Durden', 4, 10);
INSERT into FilmRole('Marla Singer', 4, 11);

INSERT into FilmRole('James Matthew Barrie', 3, 13);
INSERT into FilmRole('Sylvia Llewelyn Davies', 3, 14);

INSERT into FilmRole('Bob Harris', 2, 15);
INSERT into FilmRole('Charlotte', 2, 16);

INSERT into FilmRole('Victor Van Dort', 7, 13);
INSERT into FilmRole('Corpse Bride', 7, 11);


INSERT into Director('1', 'Chris Misiano', 01-01-1800); 
INSERT into Director('2', 'Tony Kaye', 01-01-1952); 
INSERT into Director('3', 'Sophia Coppola', 14-05-1971); 
INSERT into Director('4', 'Tim Burton', 25-08-1958); 
INSERT into Director('5', 'Mike Johnson', 01-01-1800); 
INSERT into Director('6', 'David Fincher', 10-05-1962); 
INSERT into Director('7', 'Marc Forster', 01-01-1969); 
INSERT into Director('8', 'F. Gary Grey', 17-07-1969); 


INSERT into Directed('1', '1');
INSERT into Directed('2', '3');
INSERT into Directed('3', '7');
INSERT into Directed('4', '6');
INSERT into Directed('5', '2');
INSERT into Directed('6', '8');
INSERT into Directed('7', '4');
INSERT into Directed('7', '5');


INSERT into Media(5017188815567, 'DVD', 'Dolby 5.1 Surround', 2, '2.35:1');
INSERT into Media(7321900223935, 'DVD', 'Dolby 2.0 Surround', 2, '4:3');
INSERT into Media(5060049145198, 'DVD', 'Dolby 5.1 Surround', 2, '16:9');
INSERT into Media(5039036003841, 'DVD', 'Dolby 5.1 Surround', 2, '16:9');
INSERT into Media(7321900167505, 'DVD', 'Dolby 5.1 Surround', 2, '2.35:1');
INSERT into Media(5017239190452, 'DVD', 'Dolby 5.1 Surround', 2, '16:9');
INSERT into Media(0000000000001, 'DVD', 'Dolby 5.1 Surround', 1, '16:9');


INSERT into MediaOptions(1, 7321900223935);
INSERT into MediaOptions(2, 5060049145198);
INSERT into MediaOptions(3, 5017188815567);
INSERT into MediaOptions(4, 5039036003841);
INSERT into MediaOptions(5, 7321900167505);
INSERT into MediaOptions(6, 7321900223935);
INSERT into MediaOptions(7, 0000000000001);


UPDATE FilmRole SET Role = "Lt Danny Roman" where Role = "Danny Roman" 
	AND FilmID = 6;  
UPDATE FilmRole SET Role = "Lt Chris Sabien" where Role = "Chris Sabien" 
	AND FilmID = 6;  
UPDATE FilmRole SET Role = "Sir James Matthew Barrie" where Role = 
	"James Matthew Barrie" 	AND FilmID = 3;  


CREATE view FilmsAvailable as SELECT FilmTitle, Media, Region from 
	Film, Media, MediaOptions where Film.FilmID = MediaOptions.FilmID AND  
	Media.Barcode = MediaOptions.Barcode;


# Relational Select

SELECT Barcode from Media where Media = "DVD" AND AspectRation = "16:9";

# Join Statement

SELECT FilmName where ActorName = "Johnny Depp" from 
	Film, ActorRole, Actor where Film.FilmID = ActorRole.FilmID AND
	Actor.ActorID = ActorRole.ActorID;
