USE p8g2;
GO

BEGIN TRANSACTION
CREATE TABLE Person(
	Per_ID int NOT NULL PRIMARY KEY identity(1,1),
	Fname varchar(32) NOT NULL,
	Lname varchar(32) NOT NULL,
	Birth date NOT NULL,
	Email varchar(100),
	Phone varchar(30),
	Nationality varchar(100) NOT NULL
);
GO

CREATE TABLE CEO (
	Per_ID INT NOT NULL FOREIGN KEY REFERENCES Person(Per_ID) ,
	Networth money,
	PRIMARY KEY (Per_ID)
)

CREATE TABLE SpaceCompany(
	 Comp_ID INT NOT NULL PRIMARY KEY identity(1,1),
	 [Name] varchar(100) NOT NULL,
	 Acronym varchar(10),
	 Country varchar(100) NOT NULL
);
GO

CREATE TABLE PrivateSpaceCompany(
	 Comp_ID INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
	 CEO INT FOREIGN KEY REFERENCES CEO(Per_ID),
	 PRIMARY KEY (Comp_ID)
);
GO

CREATE TABLE PublicSpaceCompany(
	 Comp_ID INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
	 Gov varchar(100) NOT NULL,
	 PRIMARY KEY (Comp_ID)

);
GO

CREATE TABLE Program(
	Prog_ID INT NOT NULL PRIMARY KEY identity(1,1),
	[Name] varchar(50),
	Company INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID)
);
GO

CREATE TABLE Mission(
	Mission_ID INT NOT NULL PRIMARY KEY identity(1,1),
	Budget money NOT NULL,
	[Description] varchar(400),
	Beg_Date date NOT NULL,
	Conc_Date date,
);
GO

CREATE TABLE ProgramHasMission(
	Prog_ID INT NOT NULL FOREIGN KEY REFERENCES Program(Prog_ID),
	Mission_ID INT NOT NULL FOREIGN KEY REFERENCES Mission(Mission_ID),
	PRIMARY KEY (Prog_ID,Mission_ID),
);
GO

CREATE TABLE [Event](
	Event_ID INT NOT NULL identity(1,1),
	[Name] varchar(100) NOT NULL,
	[Date] date NOT NULL,
	[Status] varchar(400) NOT NULL,
	Mission_ID INT NOT NULL FOREIGN KEY REFERENCES Mission(Mission_ID)
	PRIMARY KEY(Event_ID,Mission_ID)
);
GO

CREATE TABLE Vehicle(
	Veh_ID INT NOT NULL PRIMARY KEY identity(1,1),
	[Name] varchar(50) NOT NULL,
	[Owner] INT FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
	Size varchar(30),
	Mass INT,
	Manufacturer varchar(50),
	[Description] varchar(100),
	[Status] varchar(400),
	[Location] varchar(200)
);
GO

CREATE TABLE LaunchVehicle(
	Veh_ID INT NOT NULL FOREIGN KEY REFERENCES Vehicle(Veh_ID),
	LaunchCost money,
	DevCost money,
	Fuel varchar(30) NOT NULL,
	[Type] varchar(30),
	[Range] INT,
	[Load] varchar(100),
	PRIMARY KEY(Veh_ID)
);
GO

CREATE TABLE LaunchSite(
	LaunchS_ID INT NOT NULL PRIMARY KEY identity(1,1),
	[Location] varchar(150) NOT NULL,
	Comp_ID INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
	[Name] varchar(100)
);
GO

CREATE TABLE Launch(
	Launch_ID INT NOT NULL PRIMARY KEY identity(1,1),
	Mission_ID INT FOREIGN KEY REFERENCES Mission(Mission_ID),
	LaunchS_ID INT FOREIGN KEY REFERENCES LaunchSite(LaunchS_ID),
	LaunchV_ID INT FOREIGN KEY REFERENCES LaunchVehicle(Veh_ID)
);
GO


CREATE TABLE Astronaut(
	Per_ID INT NOT NULL FOREIGN KEY REFERENCES Person(Per_ID),
	PRIMARY KEY(Per_ID)
);
GO

CREATE TABLE Speciality(
	[Name] varchar(50) NOT NULL PRIMARY KEY,
	[Description] varchar(400) NOT NULL
);
GO

CREATE TABLE Crew(
	Crew_ID INT NOT NULL PRIMARY KEY identity(1,1),
	Supervisor INT NOT NULL FOREIGN KEY REFERENCES Astronaut(Per_ID)
);
GO

CREATE TABLE CrewHasAstronaut(
	Crew_ID INT NOT NULL FOREIGN KEY REFERENCES Crew(Crew_ID),
	Ast_ID INT NOT NULL FOREIGN KEY REFERENCES Astronaut(Per_ID),
	[Role] varchar(100) NOT NULL,
	PRIMARY KEY(Crew_ID,Ast_ID)
);
GO

CREATE TABLE PersonHasSpeciality(
	Per_ID INT NOT NULL FOREIGN KEY REFERENCES Person(Per_ID),
	Speciality varchar(50) NOT NULL FOREIGN KEY REFERENCES Speciality([Name]),
	PRIMARY KEY(Per_ID,Speciality)
);
GO

CREATE TABLE [SpaceCraft] (
	[Veh_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES Vehicle(Veh_ID),
	[Purpose] VARCHAR(64) NULL,
	[Propulsion] VARCHAR(64) NULL,
	[COSPAR_ID] VARCHAR(16) NULL,
	PRIMARY KEY([Veh_ID]),
	UNIQUE(COSPAR_ID)
);
GO

CREATE TABLE [Rover] (
	[Veh_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES Vehicle(Veh_ID),
	[Purpose] VARCHAR(64) NULL,
	[Autonomy] INTEGER NULL,
	PRIMARY KEY([Veh_ID]),
);
GO

CREATE TABLE [SpaceProbe] (
	[Craft_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES SpaceCraft(Veh_ID),
	[Comm_Type] VARCHAR(32) NULL,
	[Scope] VARCHAR(32) NULL,
	PRIMARY KEY([Craft_ID]),
);
GO

CREATE TABLE [Satelite] (
	[Craft_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES SpaceCraft(Veh_ID),
	[Norad_ID] INTEGER NULL CHECK ([Norad_ID]>0),
	[Orbit_Type] VARCHAR(8) NULL,
	[Perigee] INTEGER NULL CHECK ([Perigee]>0),
	[Apogee] INTEGER NULL CHECK ([Apogee]>0),
	[Inclination] DECIMAL(8,5) NULL CHECK ([Inclination]>=0 AND [Inclination]<=180),
	[Period] TIME NULL,
	[Latitude] DECIMAL(8,5) NULL CHECK ([Latitude]>=0 AND [Latitude]<=90),
	[Longitude] DECIMAL(8,5) NULL CHECK ([Longitude]>=0 AND [Longitude]<=180),
	[Altitude] DECIMAL(8,2) NULL CHECK ([Altitude]>0),
	[Speed] DECIMAL(16,4) NULL,
	PRIMARY KEY([Craft_ID]),
	UNIQUE(Norad_ID),
	UNIQUE([Latitude],[Longitude],[Altitude]) --This is the position if this was not unique things would be in the same location which would be very bad
);
GO

CREATE TABLE [CrewedSpaceCraft] (
	[Craft_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES SpaceCraft(Veh_ID),
	[Min_Capacity] INTEGER NOT NULL CHECK ([Min_Capacity]>0),
	[Max_Capacity] INTEGER NOT NULL,
	CHECK (Min_Capacity<=Max_Capacity),
	PRIMARY KEY([Craft_ID]),
);
GO

CREATE TABLE [SpaceStation] (
	[Craft_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES SpaceCraft(Veh_ID),
	[Min_Capacity] INTEGER NOT NULL CHECK ([Min_Capacity]>0),
	[Max_Capacity] INTEGER NOT NULL,
	[Norad_ID] INTEGER NULL CHECK ([Norad_ID]>0),
	[Orbit_Type] VARCHAR(8) NULL,
	[Perigee] INTEGER NULL CHECK ([Perigee]>0),
	[Apogee] INTEGER NULL CHECK ([Apogee]>0),
	[Inclination] DECIMAL(8,5) NULL CHECK ([Inclination]>=0 AND [Inclination]<=180),
	[Period] TIME NULL,
	[Latitude] DECIMAL(8,5) NULL CHECK ([Latitude]>=0 AND [Latitude]<=90),
	[Longitude] DECIMAL(8,5) NULL CHECK ([Longitude]>=0 AND [Longitude]<=180),
	[Altitude] DECIMAL(8,2) NULL CHECK ([Altitude]>0),
	[Speed] DECIMAL(16,4) NULL,
	CHECK (Min_Capacity<=Max_Capacity),
	PRIMARY KEY([Craft_ID]),
	UNIQUE(Norad_ID),
	UNIQUE([Latitude],[Longitude],[Altitude])
);
GO

CREATE TABLE [Module] (
    [Module_ID] INTEGER NOT NULL IDENTITY(1, 1),
    [Type] VARCHAR(16) NULL,
    [Description] VARCHAR(256) NULL,
    [Status] VARCHAR(8) NOT NULL,
    [Craft_ID] INTEGER NULL FOREIGN KEY REFERENCES SpaceStation(Craft_ID),
    PRIMARY KEY ([Module_ID])
);
GO

CREATE TABLE [LaunchHasSpacecraft] (
	[Craft_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES SpaceCraft(Veh_ID),
	[Launch_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES Launch(Launch_ID),
	PRIMARY KEY([Craft_ID],[Launch_ID]),
);
GO

CREATE TABLE [Payload] (
	[Craft_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES SpaceCraft(Veh_ID),
	[Mission_ID] INTEGER NOT NULL FOREIGN KEY REFERENCES Mission(Mission_ID),
	[Crew_ID] INTEGER NULL FOREIGN KEY REFERENCES Crew(Crew_ID),
	[Rover_ID] INTEGER NULL FOREIGN KEY REFERENCES Rover(Veh_ID),
	PRIMARY KEY([Craft_ID],[Mission_ID]),
);
GO

INSERT INTO [Person] (Fname,Lname,Birth,Email,Phone,Nationality)
VALUES
  ('Yetta','Pate','Jun 6, 1976','mauris.eu@outlook.com','1-329-800-1861','France'),
  ('Candace','Singleton','Mar 31, 1984','quisque.tincidunt@protonmail.edu','(831) 813-3294','Brazil'),
  ('Seth','Atkins','Apr 6, 1962','et.rutrum.eu@yahoo.org','1-651-553-8887','Belgium'),
  ('Cyrus','Calhoun','Mar 1, 1960','amet.nulla@google.couk','(436) 868-1645','Mexico'),
  ('Cooper','Salazar','Aug 7, 1983','feugiat.non@aol.com','1-244-533-9435','Spain'),
  ('Kane','Wooten','Mar 23, 2001','etiam.gravida@outlook.net','1-662-226-1344','Spain'),
  ('Hilary','Collier','Sep 11, 1992','non.cursus@yahoo.ca','(443) 252-4968','Pakistan'),
  ('Hilda','Harper','Jan 6, 2001','sem.elit.pharetra@hotmail.ca','1-322-254-2721','Ireland'),
  ('Xandra','Vang','Nov 13, 1970','congue.a.aliquet@icloud.edu','1-921-863-2352','Netherlands'),
  ('Cullen','Massey','Apr 9, 1988','cursus.luctus@google.com','1-465-474-1589','South Africa'),
  ('Petra','Oliver','Jul 19, 1973','nec.diam@yahoo.ca','(722) 540-4547','Italy'),
  ('Oscar','Macias','Aug 28, 1957','aliquam.rutrum@outlook.net','(782) 863-1612','United States'),
  ('Rigel','Levine','Jun 9, 1973','turpis.in.condimentum@aol.com','(647) 570-7852','Turkey'),
  ('Adrienne','Parrish','Nov 13, 1956','ante.ipsum.primis@aol.org','1-512-658-3064','Russian Federation'),
  ('Isaac','Sampson','Jul 7, 1969','ut.nec@hotmail.com','(814) 182-6247','Canada'),
  ('Steven','Pate','Jul 28, 1980','quam.vel.sapien@yahoo.net','(686) 255-3294','China'),
  ('Melodie','Zimmerman','Jan 19, 1995','quis@outlook.net','(889) 761-2428','Belgium'),
  ('Lucy','Carpenter','Jun 3, 1982','quisque.fringilla.euismod@outlook.edu','(223) 266-2337','Chile'),
  ('Shoshana','Church','May 24, 1957','netus.et.malesuada@google.ca','(245) 247-3233','Chile'),
  ('Eagan','Randall','May 15, 1968','ultrices.sit@google.couk','1-446-367-5476','Ireland'),
  ('Ashton','Dodson','Jul 21, 1996','sapien.molestie@icloud.ca','(281) 933-0221','Italy'),
  ('Quynn','Jennings','Apr 15, 1991','ridiculus@protonmail.edu','(294) 248-3541','Peru'),
  ('Alfonso','Miles','Aug 6, 1992','class.aptent.taciti@hotmail.couk','1-627-772-4539','Canada'),
  ('Reed','Pierce','Aug 15, 1955','ipsum@aol.com','1-491-493-3117','Costa Rica'),
  ('Stacy','Finley','Jan 6, 1953','urna.justo@hotmail.couk','(252) 214-4501','Brazil'),
  ('Elton','Fisher','May 15, 1975','aliquet.phasellus@yahoo.net','1-687-252-4114','Mexico'),
  ('Dane','Walton','Sep 4, 1972','justo@google.org','1-462-431-7833','Pakistan'),
  ('Hilary','Dejesus','Jul 10, 1969','molestie.orci@google.net','1-677-109-0509','South Korea'),
  ('Ashely','Duncan','Oct 28, 1979','placerat.eget@outlook.couk','1-360-395-4640','South Korea'),
  ('Holmes','Steele','Nov 18, 1968','pellentesque.a@outlook.net','1-585-522-7627','Mexico'),
  ('Keely','Lester','Sep 27, 1953','orci.adipiscing@protonmail.ca','(567) 576-8127','South Korea'),
  ('Jonah','Ballard','Dec 12, 1990','aliquam.arcu@outlook.couk','(577) 444-4781','Mexico'),
  ('Garrett','Bernard','Jan 19, 1951','ac.arcu.nunc@yahoo.couk','(126) 272-3649','Norway'),
  ('Alvin','Mcleod','Jan 21, 1997','elit@icloud.org','(936) 168-1710','Poland'),
  ('Fuller','Park','Dec 28, 1965','eu.sem@icloud.net','(518) 332-2735','New Zealand'),
  ('Jonah','Benjamin','Mar 19, 1987','diam.vel.arcu@protonmail.org','(772) 505-1513','Russian Federation'),
  ('Regan','Armstrong','Dec 31, 1994','duis.cursus@yahoo.com','(354) 458-6537','Chile'),
  ('Wanda','Tucker','Feb 19, 1961','quis.turpis@yahoo.edu','(445) 342-9743','Netherlands'),
  ('Abel','Nieves','Sep 28, 1993','euismod@icloud.com','(852) 748-3294','Colombia'),
  ('Boris','Bruce','Jun 28, 2002','mauris.rhoncus@protonmail.ca','(644) 658-1677','Chile'),
  ('Brenna','Boyd','May 13, 1976','amet.risus.donec@google.org','(177) 544-2559','Peru'),
  ('Irene','Rhodes','Dec 9, 1960','tortor.dictum@aol.com','1-283-317-8326','Mexico'),
  ('Camille','Shelton','Jul 9, 2002','suscipit.nonummy@hotmail.org','(726) 165-9717','Austria'),
  ('Lael','Francis','Mar 3, 1988','vulputate.lacus@hotmail.edu','(836) 388-1213','Belgium'),
  ('Nyssa','Schmidt','Jun 17, 1967','interdum.ligula@outlook.ca','1-431-823-5298','Germany'),
  ('Caleb','Scott','Nov 2, 1963','egestas.sed@outlook.net','(486) 833-6123','Russian Federation'),
  ('Gil','Sanford','May 4, 2002','libero.dui@icloud.com','(315) 256-9448','Chile'),
  ('Erica','Ingram','Jun 16, 1992','luctus.vulputate@aol.com','(832) 236-5414','Ireland'),
  ('Zenaida','Allen','Sep 1, 1962','felis.ullamcorper@aol.ca','(453) 557-3821','Sweden'),
  ('Jacob','Holt','Apr 22, 1989','duis.a@aol.org','(455) 442-3788','Ukraine');
GO

INSERT INTO [Person] (Fname,Lname,Birth,Email,Phone,Nationality)
VALUES
  ('Rebecca','Hammond','Oct 18, 1990','eu@google.org','1-927-364-5649','Pakistan'),
  ('Vance','Le','Jan 19, 1965','tellus.phasellus@yahoo.net','(505) 152-6655','Ukraine'),
  ('Calvin','Boyd','Jun 15, 1973','lorem.auctor@icloud.com','(585) 477-6559','Russian Federation'),
  ('Selma','Ward','Sep 26, 1956','ante.bibendum@outlook.ca','(604) 815-1984','Norway'),
  ('Yuli','Booker','May 23, 1977','fringilla.cursus@google.ca','1-313-956-1843','Indonesia'),
  ('Fleur','Norman','Mar 31, 1970','auctor.mauris@protonmail.couk','1-192-573-4265','Poland'),
  ('Miriam','Norris','Oct 6, 2001','nunc.commodo@hotmail.com','(569) 919-6689','Norway'),
  ('Melissa','Hendrix','Nov 4, 1990','in@outlook.com','(719) 685-3126','Australia'),
  ('Lucius','Landry','Oct 24, 1990','fusce@yahoo.ca','(556) 786-7095','Mexico'),
  ('Portia','Mccray','Oct 1, 1963','eu@outlook.org','(699) 424-9021','Russian Federation'),
  ('Linus','Hall','Jan 11, 1969','risus@google.edu','(774) 110-8411','Nigeria'),
  ('Harrison','Hensley','May 17, 1955','ac.urna@aol.edu','1-439-257-0742','Costa Rica'),
  ('Macon','Mejia','Apr 26, 1994','quisque.porttitor.eros@hotmail.edu','1-237-325-3227','Poland'),
  ('Cameron','Slater','Aug 20, 1970','magna.tellus@yahoo.ca','(828) 644-3162','Sweden'),
  ('Herrod','Spencer','Nov 8, 1950','odio@hotmail.couk','1-783-777-5555','Pakistan'),
  ('Emery','Burt','Feb 4, 1954','hendrerit@outlook.com','1-961-852-1414','Turkey'),
  ('Michelle','Hoffman','May 25, 1961','in@hotmail.com','(314) 613-2163','Ireland'),
  ('Dexter','Mann','Dec 29, 1983','turpis@google.edu','1-428-187-5939','Spain'),
  ('Iona','Forbes','Jan 29, 1976','vitae@hotmail.org','(958) 253-1282','Ukraine'),
  ('Amity','Quinn','Mar 20, 1959','dictum.magna@outlook.com','(979) 269-3894','Singapore'),
  ('Desirae','Erickson','Mar 5, 1993','ornare.placerat@yahoo.couk','(500) 453-5595','France'),
  ('Zachary','Moon','Mar 21, 1972','consectetuer@yahoo.net','(806) 493-1670','Peru'),
  ('Fletcher','Mccray','Mar 19, 2000','aliquam.vulputate.ullamcorper@icloud.couk','(229) 458-2256','Russian Federation'),
  ('Paki','Morin','Apr 22, 1951','massa.suspendisse@protonmail.edu','1-287-652-7856','France'),
  ('Marvin','Rivas','May 15, 1979','mattis@outlook.edu','(325) 255-2079','Peru'),
  ('Tana','Owen','Aug 1, 1994','malesuada.fames.ac@hotmail.couk','1-168-325-6667','Belgium'),
  ('Vladimir','Ray','Mar 3, 1973','malesuada.fames.ac@protonmail.couk','1-794-310-0039','Vietnam'),
  ('Garrett','Flowers','Sep 25, 1981','purus.gravida@icloud.couk','(242) 586-1346','South Korea'),
  ('Raphael','Knox','Mar 16, 1957','eu.elit@aol.com','(458) 284-3117','Canada'),
  ('Alvin','Larsen','Mar 26, 1976','ultrices.duis.volutpat@aol.net','(143) 396-3752','Austria'),
  ('Elvis','Gross','Jul 26, 1960','curabitur@icloud.ca','(664) 377-0323','France'),
  ('Ferris','Wong','Mar 6, 1984','nunc@protonmail.ca','1-522-551-5398','Peru'),
  ('Beck','Avery','Nov 9, 1971','vestibulum.accumsan.neque@outlook.ca','(310) 642-3581','Pakistan'),
  ('Morgan','Pierce','Mar 12, 1966','facilisis.non@outlook.net','1-431-256-5476','Ireland'),
  ('Chelsea','Valencia','Oct 30, 1966','ipsum.porta.elit@yahoo.ca','(301) 835-4997','United States'),
  ('Charity','Mcbride','Dec 5, 1989','nullam.vitae.diam@icloud.edu','1-786-473-4357','France'),
  ('Brennan','Mcfadden','Jul 22, 1981','ultrices@aol.net','(598) 762-6369','Ukraine'),
  ('Hayley','Harrell','Oct 13, 1963','leo.cras@outlook.org','(432) 550-6022','India'),
  ('Risa','Jacobs','Nov 13, 1995','amet@google.net','(325) 454-8579','Singapore'),
  ('Kitra','Johns','Feb 8, 1957','nibh@outlook.net','(168) 743-7280','Australia'),
  ('Idola','Washington','Jan 11, 1961','elit.a.feugiat@outlook.couk','(415) 846-8846','Italy'),
  ('Justina','Salinas','Jun 19, 1956','nullam.velit@aol.ca','1-628-520-5492','Philippines'),
  ('Genevieve','Bailey','Aug 19, 1993','luctus.curabitur.egestas@yahoo.couk','(436) 614-0285','Colombia'),
  ('Chastity','Bray','Jun 3, 1999','eget.venenatis.a@hotmail.edu','1-420-671-9378','Mexico'),
  ('Ann','Fox','Jun 1, 1975','ac.mattis@hotmail.com','(249) 377-7642','Austria'),
  ('Adele','Warren','Jan 24, 1970','et.magnis@icloud.org','(856) 202-7828','Colombia'),
  ('Mikayla','Wheeler','Aug 6, 1951','blandit@outlook.org','(211) 317-3351','New Zealand'),
  ('Felicia','Cote','Sep 1, 1987','lorem.lorem@hotmail.couk','(133) 522-8726','Australia'),
  ('Miranda','Cameron','Jan 24, 1962','euismod@protonmail.com','1-426-472-1187','United States'),
  ('Mara','Clarke','Jan 15, 1951','erat.in@protonmail.edu','1-896-147-0526','Austria');
GO

INSERT INTO [CEO] (Per_ID,Networth)
VALUES
	(31,10500000),
	(32,90045400);

INSERT INTO SpaceCompany ([Name],Acronym,Country)
VALUES
	('European Space Agency','ESA','France'),
	('National Aeronautics Space Administration','NASA','EUA'),
	('Heróis do Espaço','HE','Portugal'),
	('Samsung Voyager','SV','South Korea'),
	('Outer Vladimir','Vlad','Russia');
GO

INSERT INTO PrivateSpaceCompany (Comp_ID,CEO)
VALUES
	(3,31),
	(5,32);
GO

INSERT INTO PublicSpaceCompany (Comp_ID,Gov)
VALUES
	(2,'EUA'),
	(1,'France'),
	(4,'South Korea');
GO

INSERT INTO Program( [Name], Company)
VALUES
	('Project Mercury',5),
	('The Gemini Program',4),
	('The Apollo Program',3),
	('The Gemini Program',2),
	('Skylab',1),
	('Apollo Soyuz Test Project',5),
	('Space Shuttle Era',4),
	('Space Station Era',3);
GO

INSERT INTO Mission(Budget,[Description],Beg_Date,Conc_date)
VALUES
	(109,'Discover Minerals on outer planets', 'Feb 15, 2018','Jan 2, 2022'),
	(28,'Discover Water on outer planets', 'Dec 15, 2023', NULL),
	(15,'Atmosphere Density research', 'Mar 29, 2020', NULL),
	(30,'The impact of direct sunlight on biological life', 'Jan 1, 2010','Jun 7, 2018'),
	(240,'Mechanical Performance on OuterSpace', 'Apr 25, 2016','Apr 12,2021'),
	(860,'Bending light experiments near BlackHoles', 'Feb 15, 2018',NULL),
	(289,'BlackHoles impact on atomic cohesion', 'Jan 18, 2020','Jul 3, 2021'),
	(256,'Race to the edge of the Outer Rim', 'Feb 15, 2019','Nov 15, 2022'),
	(60,'Rescue of Lucy', 'Mar 8, 2026',NULL),
	(35000,'Mars Dome Construction', 'Jun 26, 2023',NULL);
GO

INSERT INTO ProgramHasMission(Prog_ID,Mission_ID)
VALUES
	(1,1),
	(2,10),
	(3,9),
	(4,8),
	(5,7),
	(6,6),
	(7,5),
	(8,4);
GO

INSERT INTO [Event]( [Name], [Date], [Status], Mission_ID)
VALUES
	('Outbreak','Jun 27, 2021','Space Dust Disease has affected most of the crew. Extending termination date by 5 months.',8),
	('Limping','Jan 4, 2022','Main Ship presents structural problems.',3),
	('Catastrophe','Apr 2, 2020','2 Research Ships have been sucked by the BlackHole.',6),
	('Mechanical Problem','Jun 27, 2019','Main Ship Cooling System shows failure. Extending termination date by 2 weeks to solve issue.',4);
GO

SET IDENTITY_INSERT Vehicle ON

INSERT INTO Vehicle( Veh_ID, [Name], [Owner], Size, Mass, Manufacturer, [Description], [Status], [Location])
VALUES
	( 1,'Liberty', 1, 'large', 120000, 'WKS', 'Edge Outer Space exploration Environment', NULL,NULL),
	(2, 'Freedom', 2, 'large', 156000, 'WKS', 'Edge Outer Space exploration Environment', NULL,NULL),
	(3, 'Astra', 3, 'large', 113000, 'Space Lemonade', 'Edge Outer Space exploration Environment', NULL,NULL),
	(4, 'OPEL Corsa Space Edition', 2, 'small', 1450, 'OPEL', 'Fast as the wind, slick as water', NULL,NULL),
	(5,'Mark I',1,'medium', 25400, 'Webbs Development','Reliable Voyager', 'Standby',NULL),
	(6,'Mark II',3,'medium', 22800, 'Reign Development','Reliable Voyager', 'Standby',NULL),
	(7,'Mark III',4,'medium', 25400, 'Markle Projects','Reliable Voyager', 'Standby',NULL),
	(8,'Mark IV',5,'medium', 25400, 'Webbs Development','Reliable Voyager', 'Standby','Mars'),
	(9,'Mark V',1,'medium', 25400, 'Webbs Development','Reliable Voyager', 'Standby',NULL),
	(10,'Mark VI',2,'medium', 25400, 'Reign Development','Reliable Voyager', 'Standby',NULL),
	(11,'Mark VII',3,'medium', 23400, 'Webbs Development','Reliable Voyager', 'Standby',NULL),
	(12,'Mark VIII',4,'medium', 25400, 'Webbs Development','Reliable Voyager', 'Standby',NULL),
	(13,'Mark IX',5,'medium', 24400, 'Markle Projects','Reliable Voyager', 'Standby','Jupiter'),
	(14,'Syrios',1,'large', 35400, 'Webbs Development','Reliable Voyager', 'Standby',NULL),
	(1000,'BVT-746-V',1,'small',488684,'AMERICAN CHINESE','pharetra sed, hendrerit a, arcu.','Retired','MOON'),
  (1001,'WYK-035-L',4,'medium',784331,'RELIABLE VOYAGER OUTER BEST PRECISON','augue scelerisque mollis. Phasellus libero mauris, aliquam','Operation','MOON'),
  (1002,'LAV-554-V',2,'medium',327627,'CRAFT MOON EDGE','parturient montes, nascetur','Testing','MERCURY'),
  (1003,'JDX-271-P',2,'small',797727,'RELIABLE VOYAGER OUTER BEST','consequat enim diam vel arcu. Curabitur ut','Operation','SATURN'),
  (1004,'XFX-723-O',3,'small',967064,'OUTER BEST PRECISON CRAFT','Etiam vestibulum massa','Standby','MERCURY'),
  (1005,'LOU-126-V',2,'medium',223668,'MOON TUGA AMERICAN CHINESE','risus, at fringilla purus mauris a nunc. In','Repair','PHOBOS'),
  (1006,'WMK-712-M',1,'small',608838,'PRECISON CRAFT EARTH','mauris sit amet lorem','Operation','MOON'),
  (1007,'AED-087-H',2,'medium',135231,'BEST PRECISON CRAFT DREAM EDGE','ligula. Nullam enim. Sed nulla ante,','Testing','CENTAURI'),
  (1008,'XDD-818-R',4,'large',379311,'VOYAGER OUTER BEST','sit amet, risus. Donec nibh enim, gravida sit amet,','Testing','NEPTUNE'),
  (1009,'OUF-494-H',3,'medium',221559,'EDGE SPACE RELIABLE VOYAGER OUTER','mauris, aliquam eu, accumsan sed, facilisis','Repair','SATURN'),
  (1010,'BLF-124-T',3,'medium',531885,'BEST PRECISON CRAFT DREAM EDGE','lorem semper','Repair','MERCURY'),
  (1011,'NZW-781-N',4,'large',128303,'BEST PRECISON','Curabitur','Operation','MOON'),
  (1012,'GAG-500-T',2,'large',945153,'BEST PRECISON CRAFT','nec tempus scelerisque, lorem ipsum sodales purus,','Retired','NEPTUNE'),
  (1013,'DIN-146-I',3,'large',770502,'VOYAGER OUTER BEST','ultricies sem magna nec quam. Curabitur vel lectus. Cum','Testing','MERCURY'),
  (1014,'BGB-714-S',2,'medium',22375,'BEST PRECISON CRAFT','eget, volutpat ornare, facilisis','Repair','MOON'),
  (1015,'YRV-198-V',5,'small',887163,'RELIABLE VOYAGER OUTER BEST','nulla at sem molestie','Testing','VENUS'),
  (1016,'IFM-657-Z',3,'',529147,'TUGA AMERICAN CHINESE JAPAN','Quisque ornare','Testing','MOON'),
  (1017,'AND-852-K',5,'large',297924,'INFINITY EDGE SPACE','nunc interdum feugiat. Sed nec metus facilisis lorem','Testing','MARS'),
  (1018,'BOX-231-E',5,'collosal',177552,'OUTER BEST PRECISON','Aenean eget','Operation','MOON'),
  (1019,'GFA-736-C',3,'small',56285,'BEST PRECISON CRAFT MOON TUGA','sagittis semper. Nam tempor diam dictum sapien.','Retired','PLUTO'),
  (1020,'CRN-942-I',3,'small',828341,'BEST PRECISON CRAFT','Phasellus vitae mauris sit amet lorem semper','Retired','MOON'),
  (1021,'MSX-682-M',4,'small',887876,'OUTER BEST PRECISON','eget, dictum placerat, augue. Sed','Retired','EARTH'),
  (1022,'CEU-698-R',1,'small',552584,'RELIABLE VOYAGER OUTER','semper egestas, urna','Operation','JUPITER'),
  (1023,'BDP-784-P',5,'small',434355,'JAPAN EUROPEAN','Suspendisse sed','Repair','SATURN'),
  (1024,'MVI-167-Y',3,'medium',334059,'BEST PRECISON CRAFT','lacinia at,','Testing','EUROPA'),
  (1025,'DUT-169-E',3,'medium',110841,'VOYAGER OUTER BEST PRECISON','in faucibus orci luctus et ultrices posuere cubilia Curae','Testing','MOON'),
  (1026,'UCN-488-S',1,'medium',795884,'RELIABLE VOYAGER OUTER BEST PRECISON','enim, sit amet','Testing','NEPTUNE'),
  (1027,'VGW-468-I',2,'medium',792037,'CRAFT DREAM EDGE','amet risus. Donec egestas.','Testing','PHOBOS'),
  (1028,'UHH-933-L',2,'medium',595748,'DREAM EDGE','dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse','Retired','MOON'),
  (1029,'VTG-157-S',4,'medium',895846,'OUTER BEST PRECISON','Sed neque. Sed eget lacus. Mauris non','Standby','PLUTO'),
  (1030,'BET-867-D',1,'small',376421,'BEST PRECISON CRAFT','enim. Mauris quis turpis vitae purus','Operation','EARTH'),
  (1031,'YPL-534-X',3,'colossal',358698,'RELIABLE VOYAGER OUTER BEST PRECISON','Phasellus fermentum convallis ligula. Donec','Retired','NEPTUNE'),
  (1032,'YBF-188-V',4,'medium',636323,'SPACE RELIABLE','cursus a, enim. Suspendisse aliquet, sem ut','Operation','MARS'),
  (1033,'YDX-648-Z',5,'medium',415394,'RELIABLE VOYAGER OUTER BEST PRECISON','nonummy ipsum','Retired','EARTH'),
  (1034,'WIM-567-O',2,'medium',639838,'RELIABLE VOYAGER OUTER','Nunc mauris. Morbi non','Standby','MARS'),
  (1035,'DCB-805-I',3,'large',630524,'PRECISON CRAFT MOON','ullamcorper. Duis cursus, diam at','Testing','Callisto'),
  (1036,'RHP-549-H',5,'large',99181,'RELIABLE VOYAGER','lobortis tellus justo sit amet nulla.','Operation','EARTH'),
  (1037,'ZAW-276-Y',1,'large',655958,'OUTER BEST PRECISON','augue. Sed molestie. Sed id risus quis','Testing','SUN'),
  (1038,'JSO-381-P',4,'medium',129913,'SPACE RELIABLE VOYAGER','magna. Sed eu eros. Nam consequat dolor','Testing','NEPTUNE'),
  (1039,'VXE-726-T',5,'medium',338966,'PRECISON CRAFT EARTH EDGE','ac, feugiat','Testing','MOON'),
  (1040,'SKX-259-R',4,'medium',432712,'VOYAGER OUTER BEST PRECISON CRAFT','ornare. In','Operation','MARS'),
  (1041,'VXB-177-E',3,'large',42322,'AMERICAN CHINESE JAPAN EUROPEAN','magna a neque. Nullam','Operation','PLUTO'),
  (1042,'JKB-414-W',4,'small',489779,'BEST PRECISON CRAFT','augue malesuada malesuada. Integer id magna et ipsum','Retired','DEIMOS'),
  (1043,'YGR-162-V',3,'small',410136,'SPACE RELIABLE VOYAGER OUTER','ultrices, mauris ipsum porta elit, a','Testing','PLUTO'),
  (1044,'IAQ-750-W',2,'medium',37687,'RELIABLE VOYAGER','Donec fringilla. Donec feugiat metus sit amet','Operation','DEIMOS'),
  (1045,'MTQ-523-R',4,'small',779240,'RELIABLE VOYAGER OUTER BEST PRECISON','vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie','Retired','PHOBOS'),
  (1046,'PFO-019-W',4,'small',296726,'CRAFT DREAM EDGE','commodo hendrerit.','Retired','URANUS'),
  (1047,'FYS-862-Z',5,'large',309139,'RELIABLE VOYAGER OUTER','eu dui. Cum sociis natoque penatibus et magnis dis','Repair','MARS'),
  (1048,'UVG-668-J',2,'medium',446242,'VOYAGER OUTER BEST PRECISON CRAFT','arcu. Morbi sit amet massa. Quisque porttitor eros nec','Testing','CENTAURI'),
  (1049,'GKJ-407-N',2,'large',117613,'SPACE RELIABLE VOYAGER OUTER','dictum. Phasellus','Retired','URANUS'),
  (1050,'WPP-822-K',5,'small',420059,'PRECISON CRAFT INFINITY EDGE','nisl sem, consequat nec, mollis vitae, posuere at, velit.','Standby','URANUS'),
  (1051,'ZYX-788-O',4,'medium',823074,'INFINITY EDGE SPACE RELIABLE VOYAGER','vehicula et,','Testing','EUROPA'),
  (1052,'RCC-241-L',2,'large',999608,'OUTER BEST PRECISON','Proin non massa non ante','Standby','MARS'),
  (1053,'FWN-184-R',2,'small',568098,'PRECISON CRAFT','Nam porttitor scelerisque neque. Nullam','Operation','VENUS'),
  (1054,'OST-479-H',4,'small',143164,'BEST PRECISON CRAFT INFINITY','sed dictum eleifend, nunc risus varius orci, in consequat','Testing','PHOBOS'),
  (1055,'HCT-175-J',2,'medium',597944,'RELIABLE VOYAGER OUTER BEST PRECISON','Aliquam gravida mauris ut mi. Duis risus odio,','Testing','EARTH'),
  (1056,'NFH-673-S',3,'small',683824,'CRAFT DREAM','aliquam eu, accumsan sed, facilisis vitae,','Retired','EARTH'),
  (1057,'ECX-279-O',3,'small',147847,'VOYAGER OUTER BEST','gravida. Praesent eu','Standby','MOON'),
  (1058,'USF-877-B',2,'large',603086,'CHINESE JAPAN EUROPEAN ','ante dictum mi, ac mattis velit justo','Operation','EARTH'),
  (1059,'BLU-133-U',4,'small',194455,'EDGE SPACE RELIABLE VOYAGER','volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh.','Retired','SUN'),
  (1060,'JAJ-426-F',5,'large',536128,'CHINESE JAPAN','egestas. Fusce aliquet magna a neque. Nullam ut','Operation','PLUTO'),
  (1061,'PYC-030-P',2,'medium',834113,'VOYAGER OUTER BEST','justo. Proin non massa non ante bibendum ullamcorper.','Operation','PLUTO'),
  (1062,'CFS-446-T',2,'small',556418,'OUTER BEST PRECISON CRAFT','eu, ultrices sit amet,','Operation','EUROPA'),
  (1063,'HTS-856-Y',3,'large',525380,'VOYAGER OUTER BEST','Aenean egestas hendrerit neque. In ornare sagittis felis. Donec','Operation','Callisto'),
  (1064,'ARM-275-I',1,'medium',193310,'RELIABLE VOYAGER OUTER BEST PRECISON','ornare sagittis','Testing','PLUTO'),
  (1065,'RFP-211-U',2,'small',60158,'SPACE RELIABLE VOYAGER','fermentum vel, mauris.','Retired','ALPHA'),
  (1066,'LUX-860-S',4,'medium',17639,'MOON EDGE','semper. Nam tempor diam dictum sapien. Aenean massa.','Operation','PHOBOS'),
  (1067,'XLA-772-L',1,'small',290193,'PRECISON CRAFT MOON TUGA','Donec sollicitudin adipiscing ligula. Aenean gravida','Operation','NEPTUNE'),
  (1068,'PQK-415-F',1,'medium',267477,'VOYAGER OUTER BEST','varius et, euismod et, commodo at, libero. Morbi accumsan laoreet','Testing','MOON'),
  (1069,'IEX-380-F',4,'collosal',510368,'CRAFT DREAM EDGE','Duis elementum, dui quis accumsan convallis, ante','Testing','ALPHA'),
  (1070,'WHR-959-W',2,'small',590657,'BEST PRECISON','fermentum','Operation','MARS'),
  (1071,'EIK-778-Y',3,'large',542583,'BEST PRECISON CRAFT EARTH','iaculis enim, sit amet ornare','Repair','EUROPA'),
  (1072,'DIP-381-D',2,'large',963399,'PRECISON CRAFT MOON EDGE','non sapien molestie orci','Standby','MOON'),
  (1073,'NHW-422-X',1,'small',990557,'VOYAGER OUTER','nulla. Integer vulputate, risus a ultricies adipiscing, enim','Standby','EUROPA'),
  (1074,'FEQ-762-E',3,'large',852093,'OUTER BEST PRECISON','porttitor tellus non magna. Nam ligula elit,','Standby','MARS'),
  (1075,'CLD-126-T',5,'small',532457,'CRAFT MOON TUGA','velit in aliquet lobortis, nisi nibh','Operation','MOON'),
  (1076,'UFS-308-X',2,'medium',532571,'MOON EDGE','Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus','Testing','PHOBOS'),
  (1077,'GBF-763-F',2,'medium',234608,'CRAFT DREAM EDGE','gravida. Praesent eu nulla at','Standby','NEPTUNE'),
  (1078,'CHY-428-G',2,'large',477139,'BEST PRECISON CRAFT INFINITY EDGE','lectus ante dictum mi, ac mattis velit justo nec','Retired','DEIMOS'),
  (1079,'MTG-384-N',1,'large',356469,'OUTER BEST PRECISON CRAFT','nulla','Testing','JUPITER'),
  (1080,'PIS-528-Q',4,'medium',677002,'RELIABLE VOYAGER OUTER BEST','Quisque ornare tortor at','Operation','EUROPA'),
  (1081,'TLL-251-O',3,'medium',725020,'CRAFT MOON EDGE SPACE','viverra. Maecenas iaculis aliquet','Retired','MOON'),
  (1082,'YHR-412-W',4,'medium',779967,'VOYAGER OUTER BEST PRECISON CRAFT','magnis','Retired','EARTH'),
  (1083,'CYI-311-P',3,'small',335876,'TUGA AMERICAN CHINESE','lorem, sit amet ultricies sem magna nec quam.','Operation','ALPHA'),
  (1084,'SSW-104-N',5,'small',256765,'VOYAGER OUTER BEST PRECISON','dui quis accumsan convallis,','Testing','Callisto'),
  (1085,'GLI-248-S',2,'medium',595707,'PRECISON CRAFT DREAM EDGE','ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor','Standby','EARTH'),
  (1086,'OEQ-130-J',4,'small',352739,'BEST PRECISON CRAFT MOON','volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam','Standby','JUPITER'),
  (1087,'RTG-004-F',5,'large',845961,'BEST PRECISON CRAFT','Ut tincidunt orci quis lectus.','Repair','VENUS'),
  (1088,'RXM-187-M',4,'small',795728,'CRAFT MOON EDGE','augue ut lacus. Nulla','Retired','EARTH'),
  (1089,'BWU-544-J',3,'large',651014,'EDGE SPACE RELIABLE VOYAGER','at sem molestie','Operation','Callisto'),
  (1090,'GFR-388-W',3,'large',362274,'OUTER BEST PRECISON CRAFT DREAM','lorem fringilla ornare placerat, orci lacus vestibulum lorem,','Operation','Callisto'),
  (1091,'JTR-867-J',3,'large',27272,'MOON TUGA AMERICAN CHINESE','commodo at, libero. Morbi accumsan laoreet ipsum.','Operation','CENTAURI'),
  (1092,'YTO-357-V',1,'large',917143,'EDGE SPACE RELIABLE VOYAGER OUTER','interdum ligula','Testing','EARTH'),
  (1093,'IVT-084-Y',3,'small',792384,'PRECISON CRAFT EARTH EDGE','a mi fringilla mi lacinia mattis. Integer','Testing','ALPHA'),
  (1094,'GLP-703-L',5,'medium',990313,'INFINITY EDGE SPACE RELIABLE','amet ornare lectus justo eu arcu. Morbi sit','Testing','EUROPA'),
  (1095,'OAC-971-F',5,'medium',922619,'PRECISON CRAFT','consequat dolor vitae dolor. Donec fringilla.','Operation','ALPHA'),
  (1096,'YPN-863-F',4,'medium',580198,'OUTER BEST','placerat, augue.','Testing','PHOBOS'),
  (1097,'YYF-752-F',2,'small',794474,'AMERICAN CHINESE','interdum. Curabitur dictum. Phasellus in felis.','Retired','EARTH'),
  (1098,'JJE-083-I',3,'medium',922293,'INFINITY EDGE SPACE RELIABLE VOYAGER','eleifend vitae, erat. Vivamus nisi. Mauris nulla.','Retired','ALPHA'),
  (1099,'KLR-581-L',4,'large',340320,'VOYAGER OUTER BEST PRECISON CRAFT','sed turpis nec','Repair','VENUS');
GO

SET IDENTITY_INSERT Vehicle OFF


INSERT INTO LaunchVehicle(Veh_ID, LaunchCost, DevCost,Fuel,[Type],[Range],[Load])
VALUES
	(6,15,600,'B3','Outer Atmosphere Propeller', 2500,NULL),
	(7,15,600,'A3','Outer Atmosphere Propeller', 1800,NULL),
	(8,90,800,'B3','Inner Atmosphere Propeller', 2500,'2 cows'),
	(9,162,600,'B3','Outer Atmosphere Propeller', 1800,NULL),
	(10,59,960,'B3','Outer Atmosphere Propeller', 2500,NULL),
	(11,120,600,'D5','Inner Atmosphere Propeller', 1800,'3 horses'),
	(12,90,380,'C3','Outer Atmosphere Propeller', 2500,NULL),
	(13,110,600,'B3','Inner Atmosphere Propeller', 3000,NULL),
	(14,200,2500,'A1','Outer Atmosphere Propeller', 5000,NULL);
GO

INSERT INTO LaunchSite([Location], Comp_ID, [Name])
VALUES
	('Portugal',1,'Aveiro Propelling Station'),
	('Norway',2,'SHSA'),
	('Canada',3,'AJAMKI'),
	('EUA',4,'LAIISHAN'),
	('EUA',5,'KOLTRON'),
	('RUS',1,'PROPELLED'),
	('RUS',2,'International Inter Propelling Station'),
	('China',3,'Grounding Propelling'),
	('France',3,'Nasdar'),
	('Germany',4,'KASJHS');
GO

INSERT INTO Launch( Mission_ID, LaunchS_ID, LaunchV_ID)
VALUES
	(2,3,6), --1
	(1,2,7), --2
	(3,1,8), --3
	(4,4,9); --4
GO

INSERT INTO Astronaut(Per_ID)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20),
	(21),
	(22),
	(23),
	(24),
	(25),
	(26),
	(27),
	(28),
	(29),
	(30);
GO

INSERT INTO Speciality([Name],[Description])
VALUES
	('EVA Specialist', 'EVA specialists are trained for spacewalks and perform tasks outside the spacecraft, such as repairing equipment, conducting experiments, or assembling structures. They possess advanced skills in maneuvering in a spacesuit'),
	('Robotics Specialist','These specialists are proficient in operating and maintaining robotic systems used for tasks like satellite deployment, repairs, or exploration. They have a background in robotics and can troubleshoot complex systems'),
	('Communication Specialist','Communication specialists handle spacecraft communication systems, maintaining contact with mission control and coordinating data transmission. They have expertise in radio communication and data protocols'),
	('Psychologist','A psychologist supports the mental well-being of the crew during long-duration missions. They provide counseling, monitor psychological health, and develop strategies to cope with the psychological challenges of space travel'),
	('Mechanical Engineer','Mechanical Engineers play a crucial role in maintaining and troubleshooting the spacecrafts systems, such as life support, power, propulsion, and communication. They possess knowledge in mechanical, electrical, and aerospace engineering'),
	('Software Engineer','Useless Engineer who loves to go on missions so he can look at the stars');
GO

INSERT INTO Crew( Supervisor)
VALUES
	(3),
	(7),
	(8),
	(15),
	(26),
	(30),
	(29);
GO

INSERT INTO CrewHasAstronaut(Crew_ID, Ast_ID,[Role])
VALUES
	(1,4,'Pilot'),
	(1,6,'Medic'),
	(1,7,'Commander'),
	(1,3,'Comms'),
	(2,25,'Pilot'),
	(2,26,'Medic'),
	(2,17,'Commander'),
	(2,13,'Researcher'),
	(2,23,'Researcher'),
	(2,3,'Comms'),
	(3,24,'Pilot'),
	(3,16,'Medic'),
	(3,7,'Commander'),
	(3,4,'Researcher'),
	(3,25,'Researcher'),
	(3,1,'Comms'),
	(4,12,'Pilot'),
	(4,15,'Medic'),
	(4,17,'Commander'),
	(4,7,'Researcher'),
	(4,9,'Researcher'),
	(4,8,'Comms'),
	(5,22,'Pilot'),
	(5,21,'Medic'),
	(5,16,'Commander'),
	(5,18,'Researcher'),
	(5,19,'Researcher'),
	(6,20,'Pilot'),
	(6,21,'Medic'),
	(6,22,'Commander'),
	(6,3,'Researcher'),
	(6,24,'Researcher'),
	(7,1,'Pilot'),
	(7,2,'Medic'),
	(7,4,'Commander'),
	(7,7,'Researcher'),
	(7,14,'Researcher'),
	(7,19,'Comms');
GO

INSERT INTO PersonHasSpeciality(Per_ID, Speciality)
VALUES 
	(1,'EVA Specialist'),
	(2,'Robotics Specialist'),
	(3,'Communication Specialist'),
	(4,'Psychologist'),
	(5,'Mechanical Engineer'),
	(6,'Software Engineer'),
	(7,'EVA Specialist'),
  (8,'Robotics Specialist'),
  (9,'Communication Specialist'),
  (10,'EVA Specialist'),
  (11,'Psychologist'),
  (12,'EVA Specialist'),
  (13,'Mechanical Engineer'),
  (14,'EVA Specialist'),
  (15,'Robotics Specialist'),
  (16,'Communication Specialist'),
  (17,'Robotics Specialist'),
  (18,'EVA Specialist'),
  (19,'Mechanical Engineer'),
  (20,'Mechanical Engineer'),
  (21,'Robotics Specialist'),
  (22,'EVA Specialist'),
  (23,'EVA Specialist'),
  (24,'EVA Specialist'),
  (25,'Communication Specialist'),
  (26,'EVA Specialist'),
  (27,'Mechanical Engineer'),
  (28,'Robotics Specialist'),
  (29,'EVA Specialist'),
  (30,'Psychologist'),
  (31,'Robotics Specialist'),
  (32,'EVA Specialist'),
  (33,'Mechanical Engineer'),
  (34,'Robotics Specialist'),
  (35,'EVA Specialist'),
  (1,'Communication Specialist'),
  (1,'Robotics Specialist'),
  (3,'EVA Specialist'),
  (4,'Software Engineer'),
  (25,'EVA Specialist'),
  (45,'Software Engineer'),
  (81,'Psychologist'),
  (61,'EVA Specialist'),
  (34,'Psychologist'),
  (69,'Software Engineer'),
  (9,'EVA Specialist');
GO


INSERT INTO SpaceCraft(Veh_ID,Purpose,Propulsion,COSPAR_ID)
VALUES
	(1,'Research','Ion-thruster','2020-1A'),
	(2,'Cool partying spot','Imagination','2019-1B'),
	(3,'Research','None','2000-23A'),
  (1000,'EXPERIMENT INTER-PLANETARY INTERSTELLAR','Nuclear–thermal','1885-682W'),
  (1001,'INTERSTELLAR GALACTIC RECORD','Nuclear–thermal','2365-252O'),
  (1002,'DATA-COLLECTION EXPERIMENT INTER-PLANETARY','Liquid-fuel','6722-089T'),
  (1003,'RECORD TRANSPORT SPACEWAR','Monopropellant','7858-826L'),
  (1004,'REPAIR DATA-COLLECTION','Pulsed-plasma-thruster','7683-466S'),
  (1005,'DATA-COLLECTION EXPERIMENT INTER-PLANETARY','Liquid-fuel','8351-128D'),
  (1006,'GALACTIC','Magnetic-field','0818-068X'),
  (1007,'EXPERIMENT INTER-PLANETARY','Magnetic-field','6762-125O'),
  (1008,'INTERSTELLAR GALACTIC','Liquid-fuel','2178-722E'),
  (1009,'EXPLORATION REPAIR','Dual-mode','1445-326L'),
  (1010,'GALACTIC RECORD','Arcjet','6770-927K'),
  (1011,'DATA-COLLECTION','Liquid-air-cycle','9729-383Y'),
  (1012,'INTERSTELLAR GALACTIC','Dual-mode','3676-264T'),
  (1013,'INTERSTELLAR','Solid-fuel','5830-657P'),
  (1014,'INTERSTELLAR GALACTIC RECORD','Nuclear–thermal','6155-922I'),
  (1015,'INTERSTELLAR GALACTIC RECORD','Arcjet','6209-169N'),
  (1016,'EXPERIMENT INTER-PLANETARY','Bussard-ramjet','0822-657N'),
  (1017,'GALACTIC RECORD','Hall-effect-thruster','4258-245Q'),
  (1018,'INTERSTELLAR GALACTIC','Variable-specific-impulse-magnetoplasma','3185-672F'),
  (1019,'TRANSPORT','Pulsed-inductive-thruster','3175-824L'),
  (1020,'RECORD TRANSPORT SPACEWAR','Magnetoplasmadynamic-thruster','1525-645P'),
  (1021,'GALACTIC','Arcjet','3812-433A'),
  (1022,'DATA-COLLECTION EXPERIMENT','Magnetic-field','5834-645O'),
  (1023,'INTERSTELLAR GALACTIC RECORD','Arcjet','7614-137J'),
  (1024,'INTER-PLANETARY INTERSTELLAR','Magnetoplasmadynamic-thruster','8457-657K'),
  (1025,'GALACTIC','Liquid-fuel','5141-133I'),
  (1026,'INTERSTELLAR GALACTIC','Electrostatic-ion-thruster','5857-262I'),
  (1027,'GALACTIC RECORD','Antimatter','6867-522I'),
  (1028,'INTER-PLANETARY INTERSTELLAR','Propulsive-mass-drivers','1638-212B'),
  (1029,'DATA-COLLECTION','Magnetoplasmadynamic-thruster','5822-656H'),
  (1030,'REPAIR DATA-COLLECTION EXPERIMENT','Dual-mode','5352-473I'),
  (1031,'INTERSTELLAR GALACTIC','Magnetic-field','8516-775P'),
  (1032,'SPACEWAR','Space-elevator','6278-934B'),
  (1033,'REPAIR DATA-COLLECTION EXPERIMENT','Liquid-fuel','3413-686G'),
  (1034,'GALACTIC','Electrostatic-ion-thruster','2963-584J'),
  (1035,'EXPERIMENT','oscillating-amplified-thruster','7364-760A'),
  (1036,'INTERSTELLAR GALACTIC RECORD','Liquid-fuel','3936-632T'),
  (1037,'EXPERIMENT INTER-PLANETARY','Arcjet','0278-577D'),
  (1038,'GALACTIC RECORD','Pulsed-inductive-thruster','4727-051G'),
  (1039,'DATA-COLLECTION EXPERIMENT INTER-PLANETARY','Electrostatic-ion-thruster','0687-706W'),
  (1040,'INTERSTELLAR GALACTIC RECORD','Magnetoplasmadynamic-thruster','1291-792S'),
  (1041,'GALACTIC RECORD TRANSPORT','Nuclear–thermal','8689-711J'),
  (1042,'INTERSTELLAR GALACTIC RECORD','Radioisotope','6246-453P'),
  (1043,'GALACTIC RECORD','Antimatter','1723-543Z'),
  (1044,'DATA-COLLECTION EXPERIMENT','Hybrid','8721-053J'),
  (1045,'REPAIR DATA-COLLECTION','Antimatter','7460-876P'),
  (1046,'RECORD TRANSPORT','Tripropellant','9617-557B'),
  (1047,'TRANSPORT','Nuclear–electric','5838-429X'),
  (1048,'RECORD','Solar–thermal','7846-580Q'),
  (1049,'EXPERIMENT INTER-PLANETARY INTERSTELLAR','Space-elevator','7429-748B'),
  (1050,'GALACTIC RECORD','Solar-sails','7436-623U'),
  (1051,'REPAIR DATA-COLLECTION','Resistojet','1286-451T'),
  (1052,'EXPERIMENT','Hall-effect-thruster','5852-916J'),
  (1053,'EXPERIMENT INTER-PLANETARY','Arcjet','8829-681X'),
  (1054,'DATA-COLLECTION EXPERIMENT','Variable-specific-impulse-magnetoplasma','7848-612Q'),
  (1055,'GALACTIC RECORD TRANSPORT','Resistojet','6933-667I'),
  (1056,'GALACTIC RECORD TRANSPORT','Dual-mode','1332-545F'),
  (1057,'REPAIR DATA-COLLECTION EXPERIMENT','Pulsed-plasma-thruster','2546-716Z'),
  (1058,'INTER-PLANETARY INTERSTELLAR','Solar-sails','3638-365E'),
  (1059,'REPAIR DATA-COLLECTION','Resistojet','1630-124J'),
  (1060,'EXPERIMENT INTER-PLANETARY','Antimatter','3562-240B'),
  (1061,'INTER-PLANETARY','Liquid-fuel','2893-342M'),
  (1062,'EXPERIMENT INTER-PLANETARY INTERSTELLAR','Propulsive-mass-drivers','8111-668I'),
  (1063,'INTER-PLANETARY INTERSTELLAR GALACTIC','Pulsed-inductive-thruster','0787-988C'),
  (1064,'RECORD','Monopropellant','4805-703D'),
  (1065,'REPAIR DATA-COLLECTION EXPERIMENT','Pulsed-inductive-thruster','5354-561W'),
  (1066,'DATA-COLLECTION EXPERIMENT','Variable-specific-impulse-magnetoplasma','5037-842M'),
  (1067,'DATA-COLLECTION EXPERIMENT INTER-PLANETARY','Electrostatic-ion-thruster','2095-729L'),
  (1068,'INTER-PLANETARY INTERSTELLAR GALACTIC','Antimatter','8230-569G'),
  (1069,'EXPERIMENT','Liquid-fuel','3655-635U'),
  (1070,'GALACTIC RECORD','Arcjet','2875-598H'),
  (1071,'GALACTIC RECORD TRANSPORT','Monopropellant','1248-452X'),
  (1072,'INTER-PLANETARY','Variable-specific-impulse-magnetoplasma','4526-332F'),
  (1073,'REPAIR DATA-COLLECTION','Solid-fuel','7876-461G'),
  (1074,'GALACTIC RECORD','Pulsed-plasma-thruster','3195-613F'),
  (1075,'INTER-PLANETARY','Antimatter','1853-466S'),
  (1076,'INTERSTELLAR GALACTIC','Nuclear–electric','6356-825O'),
  (1077,'INTER-PLANETARY INTERSTELLAR','Liquid-air-cycle','1265-517D'),
  (1078,'EXPERIMENT INTER-PLANETARY','Tripropellant','2334-234V'),
  (1079,'INTER-PLANETARY INTERSTELLAR GALACTIC','Resistojet','1383-542D'),
  (1080,'GALACTIC RECORD','Air-augmented','1918-644G'),
  (1081,'REPAIR DATA-COLLECTION','Field-emission-electric-propulsion','7841-174I'),
  (1082,'INTER-PLANETARY INTERSTELLAR GALACTIC','Liquid-air-cycle','5072-372B'),
  (1083,'GALACTIC RECORD','Monopropellant','2918-888I'),
  (1084,'INTERSTELLAR','Liquid-air-cycle','6217-423L'),
  (1085,'GALACTIC RECORD TRANSPORT','Bussard-ramjet','4582-036V'),
  (1086,'EXPERIMENT','Space-elevator','8212-547Z'),
  (1087,'TRANSPORT SPACEWAR','Magnetic-field','1401-138I'),
  (1088,'INTERSTELLAR','Arcjet','7130-843T'),
  (1089,'INTER-PLANETARY INTERSTELLAR','Hybrid','2631-882T'),
  (1090,'RECORD TRANSPORT','Field-emission-electric-propulsion','8185-527K'),
  (1091,'INTERSTELLAR GALACTIC','Liquid-fuel','4422-544F'),
  (1092,'GALACTIC RECORD TRANSPORT','Hall-effect-thruster','4588-584B'),
  (1093,'INTERSTELLAR','Resistojet','8946-784A'),
  (1094,'TRANSPORT','Dual-mode','1635-287O'),
  (1095,'INTER-PLANETARY INTERSTELLAR GALACTIC','Pulsed-inductive-thruster','3587-728T'),
  (1096,'RECORD','Antimatter','8135-659H'),
  (1097,'RECORD TRANSPORT SPACEWAR','Field-emission-electric-propulsion','2702-841F'),
  (1098,'EXPERIMENT INTER-PLANETARY INTERSTELLAR','Solar–thermal','4522-276W'),
  (1099,'REPAIR DATA-COLLECTION','Liquid-fuel','4335-269N');
GO

INSERT INTO [Rover] ( [Veh_ID] , [Purpose] , [Autonomy])
VALUES 
	(4,'To have one rover in the database',42069);
GO

INSERT INTO [SpaceStation] ([Craft_ID],[Min_Capacity],[Max_Capacity],[Norad_ID],[Orbit_Type],[Perigee],[Apogee],[Inclination],[Period],[Latitude],[Longitude],[Altitude],[Speed])
VALUES
	(1,1,10,1,'LOW',150,250,55.22,'8:00:00.00',60,60,200,400),
	(2,2,5,2,'LOW',200,300,60.60,'17:00:00.00',60,120,250,300),
	(3,1,5,3,'LOW',250,350,10.255,'23:00:00.00',20,20,400,250);
GO

INSERT INTO [Module] ([Type],[Description],[Status],Craft_ID)
VALUES
  ('SUPPORT','dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus','FAILURE',3),
  ('QoL','sed, est. Nunc laoreet lectus','FAILURE',3),
  ('QoL','ac, eleifend vitae, erat.','FAULT',3),
  ('RESEARCH','non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit','OK',3),
  ('RESEARCH','vitae erat vel pede blandit congue.','OK',3),
  ('SUPPORT','augue malesuada malesuada. Integer','FAILURE',3),
  ('UTLITY','justo nec ante. Maecenas mi','FAILURE',2),
  ('RESEARCH','Nunc ut erat. Sed nunc est, mollis non, cursus','FAULT',2),
  ('QoL','dictum. Phasellus in','FAULT',3),
  ('SUPPORT','vitae dolor. Donec fringilla. Donec','OK',1),
  ('RESEARCH','Fusce mollis. Duis sit amet diam','FAULT',1),
  ('RESEARCH','rutrum magna.','FAULT',1),
  ('RESEARCH','bibendum ullamcorper. Duis cursus, diam','FAULT',3),
  ('RESEARCH','magna et ipsum cursus','FAILURE',1),
  ('SUPPORT','rutrum urna, nec luctus felis purus ac tellus. Suspendisse','FAILURE',3),
  ('UTLITY','natoque penatibus','OK',2);
GO

INSERT INTO [SpaceProbe] (Craft_ID,Comm_Type,Scope)
VALUES
  (1000,'RADIO-WAVES','Interstellar'),
  (1001,'LASER','Orbital'),
  (1002,'LASER','Intergalactic'),
  (1003,'LASER','Orbital'),
  (1004,'RADIO-WAVES','Interplanetary'),
  (1005,'RADIO-WAVES','Interstellar'),
  (1006,'RADIO-WAVES','Interplanetary'),
  (1007,'LASER','Interplanetary'),
  (1008,'RADIO-WAVES','Interplanetary'),
  (1009,'LASER','Interplanetary'),
  (1010,'Teleporting-mail','Interplanetary'),
  (1011,'LASER','Interplanetary'),
  (1012,'LASER','Orbital'),
  (1013,'LASER','Interplanetary'),
  (1014,'LASER','Orbital'),
  (1015,'LASER','Interplanetary'),
  (1016,'RADIO-WAVES','Interplanetary'),
  (1017,'LASER','Interplanetary'),
  (1018,'','Interstellar'),
  (1019,'RADIO-WAVES','Orbital'),
  (1020,'RADIO-WAVES','Interplanetary'),
  (1021,'RADIO-WAVES','Interstellar'),
  (1022,'RADIO-WAVES','Interplanetary'),
  (1023,'LASER','Interplanetary'),
  (1024,'LASER','Interplanetary');

INSERT INTO [Satelite] (Craft_ID,Norad_ID,Orbit_Type,Perigee,Apogee,Inclination,Period,Latitude,Longitude,Altitude,Speed)
VALUES
  (1025,91,'HIGH',744,7267,57,'6:08:36',47,112,1947,916),
  (1026,21,'LOW',6279,7860,77,'22:07:53',56,5,7032,820),
  (1027,33,'HIGH',2599,6696,24,'1:04:31',3,169,1779,853),
  (1028,11,'HIGH',2718,8833,131,'23:21:39',72,31,1317,456),
  (1029,62,'',2995,5334,179,'18:54:44',52,30,883,917),
  (1030,73,'',2292,600,10,'12:56:38',39,58,7964,539),
  (1031,34,'HIGH',876,5293,180,'20:30:26',18,4,7458,822),
  (1032,54,'LOW',6881,7027,90,'17:01:34',74,4,7719,664),
  (1033,22,'HIGH',4150,1998,38,'12:04:27',22,1,9580,903),
  (1034,732,'HIGH',7765,7757,176,'10:17:06',57,63,9752,402),
  (1035,5,'LOW',2611,2988,81,'17:46:12',46,34,8403,864),
  (1036,8,'LOW',1211,8599,77,'16:53:00',9,85,1884,370),
  (1037,10,'HIGH',2228,7708,177,'10:07:53',13,32,7985,990),
  (1038,24,'',211,4268,98,'12:51:57',31,73,2900,379),
  (1039,35,'LOW',6361,2321,9,'1:22:17',28,173,2237,511),
  (1040,103,'',2958,5362,0,'8:36:00',83,135,2040,884),
  (1041,45,'LOW',1162,6410,84,'7:11:49',16,37,8772,898),
  (1042,9,'LOW',8493,4275,174,'0:16:55',30,52,1323,886),
  (1043,44,'HIGH',1347,6702,126,'8:39:13',77,137,2945,621),
  (1044,234,'HIGH',4784,5041,1,'12:57:26',8,57,9262,793),
  (1045,667,'HIGH',9638,9739,16,'22:00:48',68,32,4878,800),
  (1046,88,'HIGH',8660,6206,57,'7:09:23',5,62,528,750),
  (1047,55,'HIGH',5706,3190,166,'11:04:16',44,121,417,692),
  (1048,66,'HIGH',8150,3463,154,'9:49:56',75,72,9330,546),
  (1049,75,'',7082,4384,126,'18:12:13',21,159,7555,320);

INSERT INTO [CrewedSpaceCraft] (Craft_ID,Min_Capacity,Max_Capacity)
VALUES
  (1050,6,10),
  (1051,1,9),
  (1052,7,7),
  (1053,10,10),
  (1054,3,4),
  (1055,5,7),
  (1056,1,2),
  (1057,4,8),
  (1058,7,7),
  (1059,4,4),
  (1060,9,10),
  (1061,4,5),
  (1062,4,6),
  (1063,6,6),
  (1064,1,5),
  (1065,9,12),
  (1066,1,10),
  (1067,9,9),
  (1068,7,8),
  (1069,5,6),
  (1070,9,10),
  (1071,7,8),
  (1072,1,4),
  (1073,5,10),
  (1074,4,7),
  (1075,7,7),
  (1076,9,10),
  (1077,2,10),
  (1078,1,1),
  (1079,2,8),
  (1080,8,9),
  (1081,1,2),
  (1082,9,10),
  (1083,2,3),
  (1084,7,9),
  (1085,4,6),
  (1086,3,6),
  (1087,7,10),
  (1088,2,9),
  (1089,6,6),
  (1090,3,5),
  (1091,6,8),
  (1092,2,6),
  (1093,2,9),
  (1094,2,5),
  (1095,3,5),
  (1096,5,7),
  (1097,5,7),
  (1098,9,12),
  (1099,1,3);

INSERT INTO LaunchHasSpacecraft(Craft_ID,Launch_ID)
VALUES
	(1,1),
	(1099,2),
	(1099,3),
	(1000,3),
	(1025,4),
	(1026,4),
	(1027,4),
	(1028,4);

INSERT INTO Payload(Craft_ID,Mission_ID,Crew_ID,Rover_ID)
VALUES
	(1099,10,7,4),
	(1025,9,NULL,NULL),
	(1026,9,NULL,NULL),
	(1027,9,NULL,NULL),
	(1028,9,NULL,NULL),
	(1099,8,6,NULL),
	(1,2,NULL,NULL),
	(1099,1,NULL,NULL),
	(1099,3,NULL,NULL),
	(1000,3,NULL,NULL),
	(1025,4,NULL,NULL),
	(1026,4,NULL,NULL),
	(1027,4,NULL,NULL),
	(1028,4,NULL,NULL);

GO
CREATE TRIGGER NoradNullPositionNullS ON [Satelite]
INSTEAD OF INSERT,UPDATE
AS
BEGIN
	IF (SELECT count(*) FROM inserted) = 1
		BEGIN
			DECLARE @norad as INTEGER;
			DECLARE	@Orbit_Type as VARCHAR(8);
			DECLARE @Perigee as INTEGER;
			DECLARE @Apogee as INTEGER;
			DECLARE @Inclination as DECIMAL(8,5);
			DECLARE @Period as TIME;
			DECLARE @Latitude as DECIMAL(8,5);
			DECLARE @Longitude as DECIMAL(8,5);
			DECLARE @Altitude as DECIMAL(8,2);
			DECLARE @Speed as DECIMAL(16,4);

			SELECT @norad=Norad_ID, @Orbit_Type=Orbit_Type,@Perigee=Perigee,@Apogee=Apogee,@Inclination=Inclination,@Period=[Period],
				@Latitude=Latitude,@Longitude=Longitude,@Altitude=Altitude,@Speed=Speed FROM inserted;

			IF (@norad) is null
				IF (@Orbit_Type) is not null or (@Perigee) is not null or (@Apogee) is not null or (@Inclination) is not null or (@Period) is not null or (@Latitude) is not null or (@Longitude) is not null or (@Altitude) is not null or (@Speed) is not null
					RAISERROR('Not allowed to have null norad id and non null value for any of the fields that define the position of the satelite.',16,1)
				ELSE
					INSERT INTO [Satelite] SELECT * FROM inserted;
			ELSE
				IF (@Orbit_Type) is null or (@Perigee) is null or (@Apogee) is null or (@Inclination) is null or (@Period) is null or (@Latitude) is null or (@Longitude) is null or (@Altitude) is null or (@Speed) is null
					RAISERROR('Not allowed to have non null norad id and null value for any of the fields that define the position of the satelite.',16,1)
				ELSE
					INSERT INTO [Satelite] SELECT * FROM inserted;
		END
	END
GO

CREATE TRIGGER NoradNullPositionNullSS ON [SpaceStation]
INSTEAD OF INSERT,UPDATE
AS
BEGIN
	IF (SELECT count(*) FROM inserted) = 1
		BEGIN
			DECLARE @norad as INTEGER;
			DECLARE	@Orbit_Type as VARCHAR(8);
			DECLARE @Perigee as INTEGER;
			DECLARE @Apogee as INTEGER;
			DECLARE @Inclination as DECIMAL(8,5);
			DECLARE @Period as TIME;
			DECLARE @Latitude as DECIMAL(8,5);
			DECLARE @Longitude as DECIMAL(8,5);
			DECLARE @Altitude as DECIMAL(8,2);
			DECLARE @Speed as DECIMAL(16,4);

			SELECT @norad=Norad_ID, @Orbit_Type=Orbit_Type,@Perigee=Perigee,@Apogee=Apogee,@Inclination=Inclination,@Period=[Period],
				@Latitude=Latitude,@Longitude=Longitude,@Altitude=Altitude,@Speed=Speed FROM inserted;

			IF (@norad) is null
				IF (@Orbit_Type) is not null or (@Perigee) is not null or (@Apogee) is not null or (@Inclination) is not null or (@Period) is not null or (@Latitude) is not null or (@Longitude) is not null or (@Altitude) is not null or (@Speed) is not null
					RAISERROR('Not allowed to have null norad id and non null value for any of the fields that define the position of the satelite.',16,1)
				ELSE
					INSERT INTO [SpaceStation] SELECT * FROM inserted;
			ELSE
				IF (@Orbit_Type) is null or (@Perigee) is null or (@Apogee) is null or (@Inclination) is null or (@Period) is null or (@Latitude) is null or (@Longitude) is null or (@Altitude) is null or (@Speed) is null
					RAISERROR('Not allowed to have non null norad id and null value for any of the fields that define the position of the satelite.',16,1)
				ELSE
					INSERT INTO [SpaceStation] SELECT * FROM inserted;
	END
END
GO

CREATE TRIGGER EmailOrPhone ON [Person]
INSTEAD OF INSERT,UPDATE
AS
BEGIN
	IF (SELECT count(*) FROM inserted) = 1
		BEGIN
			DECLARE @email as varchar(100);
			DECLARE @phone as INTEGER;

			SELECT @email = Email , @phone = Phone FROM inserted;

			IF (@email) is null and (@phone) is null
				RAISERROR('Person needs to have at least a phone number or an email.',16,1)
			ELSE
				BEGIN
					INSERT INTO [Person] (Per_ID, Fname, Lname, Birth, Email, Phone, Nationality)
					SELECT Per_ID, Fname, Lname, Birth, Email, Phone, Nationality
					FROM inserted;
				END
		END
END
GO

create index VehicleOwner ON Vehicle ( [Owner] )

create index LaunchLaunchSite ON Launch ( [LaunchS_ID] )

create unique index SateliteNorad ON Satelite ( [NORAD_ID] )

GO

CREATE FUNCTION getNumMissions (@ID INT)
RETURNS INT
AS
BEGIN
    DECLARE @NumMissions INT;
    
    SELECT @NumMissions = COUNT(PL.Mission_ID)
    FROM Person AS P
    JOIN CrewHasAstronaut AS CA ON P.Per_ID = CA.Ast_ID
    JOIN Crew AS C ON C.Crew_ID = CA.Crew_ID
    JOIN Payload AS PL ON PL.Crew_ID = C.Crew_ID
    WHERE P.Per_ID = @ID;
    
    RETURN @NumMissions;
END
GO

ALTER TABLE Astronaut ADD Num_Mission AS dbo.getNumMissions(Per_ID);

go

CREATE VIEW AstronautView AS
	SELECT Person.Per_ID , Fname, Lname , Birth , Email , Phone, Nationality , Num_Mission FROM Astronaut 
		JOIN Person on Person.Per_ID = Astronaut.Per_ID

GO
CREATE VIEW CeoView AS
	SELECT Person.Per_ID , Fname, Lname , Birth , Email , Phone, Nationality , Networth FROM CEO 
		JOIN Person on Person.Per_ID = CEO.Per_ID

GO

CREATE VIEW SpaceCraftView AS
	SELECT V.[Name] , V.[Owner] , V.[Status] , SC.Propulsion , LVV.[Name] as LaunchVehicleName , LS.[Name] as LaunchLocationName from SpaceCraft as SC JOIN 
	Vehicle as V ON V.Veh_ID = SC.Veh_ID JOIN 
	LaunchHasSpacecraft as LHS ON LHS.Craft_ID = SC.Veh_ID JOIN 
	Launch as L ON L.Launch_ID = LHS.Launch_ID JOIN
	LaunchVehicle as LV ON LV.Veh_ID = L.LaunchV_ID JOIN
	Vehicle as LVV ON LV.Veh_ID = LVV.Veh_ID JOIN
	LaunchSite as LS ON LS.LaunchS_ID = L.LaunchS_ID
GO

CREATE FUNCTION getAustronautsFromCrew
(	
	@CrewID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * from AstronautView as AV JOIN CrewHasAstronaut as CHA ON AV.Per_ID = CHA.Ast_ID WHERE CHA.Crew_ID = @CrewID
)
GO

CREATE FUNCTION getCompanyNumMissions (@ID INT)
RETURNS INT
AS
BEGIN
    DECLARE @NumMissions INT;
    
    SELECT @NumMissions = COUNT(*)
    FROM Program as PR JOIN 
	ProgramHasMission as PRM ON PRM.Prog_ID=PR.Prog_ID  
    WHERE Company = @ID;
    
    RETURN @NumMissions;
END
GO

CREATE FUNCTION getEmployeesFromSpaceCompany
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Company as Comp_ID ,P.Per_ID as Per_ID, Fname,Lname,Birth,Email,Phone,Nationality, 'Astronaut' as [Role] FROM 
	Program as PR JOIN 
	ProgramHasMission as PRM ON PRM.Prog_ID=PR.Prog_ID JOIN 
	Mission as M ON M.Mission_ID=PRM.Mission_ID JOIN
	Payload as PL ON PL.Mission_ID=M.Mission_ID JOIN
	Crew as C ON C.Crew_ID=PL.Crew_ID JOIN
	CrewHasAstronaut as CA ON CA.Crew_ID=C.Crew_ID JOIN
	Astronaut as A ON A.Per_ID=CA.Ast_ID JOIN
	Person as P ON P.Per_ID = A.Per_ID
	WHERE Company = @SpaceCompanyID
	GROUP BY Company,P.Per_ID , Fname,Lname,Birth,Email,Phone,Nationality
UNION
SELECT SC.Comp_ID , P.Per_ID as Per_ID, Fname,Lname,Birth,Email,Phone,Nationality, 'CEO' as [Role]  FROM
	SpaceCompany as SC JOIN
	PrivateSpaceCompany as PSC ON PSC.Comp_ID = SC.Comp_ID JOIN
	CEO ON CEO.Per_ID=PSC.CEO JOIN
	Person as P ON P.Per_ID=CEO.Per_ID
	WHERE SC.Comp_ID= @SpaceCompanyID
)
GO

CREATE FUNCTION getMissionsFromSpaceCompany
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Company as Comp_ID , M.Mission_ID , Budget , [Description] , Beg_Date, Conc_Date FROM 
	Program as PR JOIN 
	ProgramHasMission as PRM ON PRM.Prog_ID=PR.Prog_ID JOIN 
	Mission as M ON M.Mission_ID=PRM.Mission_ID 
	WHERE PR.Company=@SpaceCompanyID
)
GO

CREATE FUNCTION getPerson
(	
	@id INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM Person WHERE Per_ID=@id
)
GO


CREATE FUNCTION getProgramsOfCompany
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM Program 
	WHERE Company=@SpaceCompanyID
)
GO

CREATE FUNCTION getRoverFromSpaceCompany 
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT SP.Comp_ID,V.Veh_ID,V.[Name],[Size],[Manufacturer],[Description],[Status],[Location],R.Autonomy,R.Purpose from 
	SpaceCompany as SP JOIN
	Vehicle as V ON V.[Owner]=SP.Comp_ID JOIN
	ROVER as R ON R.Veh_ID = V.Veh_ID
	WHERE SP.Comp_ID = @SpaceCompanyID
)
GO

CREATE FUNCTION getSpaceAgency(
	@Private BIT = 1 , 
	@Public BIT = 1,
	@Country varchar(100) = '%',
	@Name varchar(100) = '%')
RETURNS TABLE 
AS
RETURN 
(
	SELECT C.Name , C.Comp_ID, C.Acronym , C.Country , P.Gov as [Owner] , 'Public' as Type from	
		SpaceCompany as C JOIN PublicSpaceCompany as P ON P.Comp_ID=C.Comp_ID
			where C.Country like @Country and C.Name like @Name and @Public*C.Comp_ID > 0
	UNION
	SELECT C.Name , C.Comp_ID, C.Acronym , C.Country , concat(Person.Fname,' ',Person.Lname) as [Owner] , 'Private' as Type from	
		SpaceCompany as C JOIN 
		PrivateSpaceCompany as P ON P.Comp_ID=C.Comp_ID JOIN
		CEO ON CEO.Per_ID = P.CEO JOIN
		Person ON CEO.Per_ID = Person.Per_ID
			where C.Country like @Country and C.Name like @Name and @Private*C.Comp_ID > 0
)
GO

CREATE FUNCTION getSpacecraftFromSpaceCompany
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT SP.Comp_ID,V.Veh_ID,V.[Name],[Size],[Manufacturer],[Description],[Status],[Location],S.Propulsion,S.Purpose from 
	SpaceCompany as SP JOIN
	Vehicle as V ON V.[Owner]=SP.Comp_ID JOIN
	SpaceCraft as S ON S.Veh_ID = V.Veh_ID
	WHERE SP.Comp_ID = @SpaceCompanyID
)
GO

CREATE FUNCTION getSpacecraftInvolmentsInMission
(	
	@MissionID INTEGER,
	@CraftID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT v.Veh_ID as SpacecraftID, v.[Name] as SpacecraftName , 
		pl.Mission_ID as MissionID , pl.Crew_ID as CrewID , pl.Rover_ID as RoverID , R.[Name] , L.LaunchID as LaunchID, 
		L.LaunchVehicleID as LaunchVehicleID , L.LaunchVehicleName as LaunchVehicleName , 
		L.LaunchSiteName as LaunchSiteName , L.LaunchSiteLocation as LaunchSiteLocation  from
			SpaceCraft as sc JOIN
			Payload as pl ON sc.Veh_ID = pl.Craft_ID LEFT OUTER JOIN
			Vehicle as R ON R.Veh_ID = pl.Rover_ID JOIN
			Vehicle as v ON v.Veh_ID = sc.Veh_ID LEFT OUTER JOIN
			( SELECT l.Launch_ID as LaunchID, l.Mission_ID as Mission_ID,
					v2.Veh_ID as LaunchVehicleID , v2.[Name] as LaunchVehicleName , 
					ls.[Name] as LaunchSiteName , ls.[Location] as LaunchSiteLocation from Launch as l JOIN
					LaunchVehicle as lv ON lv.Veh_ID = l.LaunchV_ID JOIN
					Vehicle as v2 ON v2.Veh_ID = lv.Veh_ID JOIN
					LaunchSite as ls ON ls.LaunchS_ID = l.LaunchS_ID 
			) as L ON L.Mission_ID = pl.Mission_ID
				WHERE pl.Mission_ID = @MissionID and ( pl.Craft_ID = @CraftID or @CraftID = -1 )
)
GO

CREATE FUNCTION getSpacecraftsOfMission 
(	
	@MissionID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT v.Veh_ID , v.Name , pl.Mission_ID from
		SpaceCraft as sc JOIN
		Payload as pl ON sc.Veh_ID = pl.Craft_ID JOIN
		Vehicle as v ON v.Veh_ID = sc.Veh_ID
		WHERE pl.Mission_ID = @MissionID
)
GO

CREATE FUNCTION getVehiclesFromSpaceCompany 
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT SP.Comp_ID,V.Veh_ID,V.[Name],[Size],[Manufacturer],[Description],[Status],[Location] from 
	SpaceCompany as SP JOIN
	Vehicle as V ON V.[Owner]=SP.Comp_ID
	WHERE SP.Comp_ID = @SpaceCompanyID
)
GO

GO
CREATE PROCEDURE addAustronaut
	@Per_ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Astronaut( [Per_ID] )
	VALUES ( @Per_ID) 

END
GO

CREATE PROCEDURE addCrew
	@SupervisorID INTEGER,
	@id INTEGER output

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO Crew(Supervisor)
			VALUES
				(@SupervisorID)
			SET @id=SCOPE_IDENTITY()
		COMMIT
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE addCrewedSpaceCraft
	@Veh_ID INTEGER ,
	@Min_Capacity INTEGER ,
	@Max_Capacity INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO CrewedSpaceCraft ( Craft_ID , Max_Capacity , Min_Capacity )
	VALUES
		(@Veh_ID, @Max_Capacity , @Min_Capacity)

END
GO

CREATE PROCEDURE addEvent
	@Mission_ID INT,
	@Name varchar(100),
	@Date date,
	@Status varchar(400)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [Event]( [Name], [Date], [Status], Mission_ID)
		VALUES (@Name,@Date,@Status,@Mission_ID)

END
GO

CREATE PROCEDURE addLaunch
	@Mission_ID INT ,
	@LaunchS_ID INT ,
	@LaunchV_ID INT ,
	@id INT output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Launch( Mission_ID , LaunchS_ID , LaunchV_ID )
		VALUES ( @Mission_ID , @LaunchS_ID , @LaunchV_ID )

	SET @id=SCOPE_IDENTITY()
END
GO

CREATE PROCEDURE addLaunchSite
	@Location varchar(150),
	@Comp_ID INT,
	@Name varchar(100),
	@id INTEGER output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO LaunchSite( [Location] , [Comp_ID] ,[Name] )
		VALUES ( @Location , @Comp_ID , @Name)

	SET @id=SCOPE_IDENTITY()
END
GO


CREATE PROCEDURE addLaunchToSpacecraft 
	@Veh_ID INTEGER,
	@Launch_ID INTEGER	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			INSERT INTO LaunchHasSpacecraft( Craft_ID , Launch_ID)
					VALUES
						(@Veh_ID , @Launch_ID)
			
			DECLARE @Mission_ID INTEGER;
			Select @Mission_ID = Mission_ID from Launch 

			IF NOT EXISTS ( SELECT * FROM Payload where Craft_ID=@Veh_ID and Mission_ID = @Mission_ID)
			BEGIN
				INSERT INTO Payload ( Mission_ID , Craft_ID )
					VALUES ( @Mission_ID , @Veh_ID)
			END
		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE addLaunchVehicle
	@LaunchCost money,
	@DevCost money,
	@Fuel varchar(30),
	@Type varchar(30),
	@Range INT,
	@Load varchar(100),
	@Veh_ID INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO LaunchVehicle( Veh_ID , LaunchCost , DevCost , Fuel , [Type] , [Range] , [Load] )
		VALUES ( @Veh_ID , @LaunchCost , @DevCost , @Fuel ,@Type , @Range , @Load )

END
GO

CREATE PROCEDURE addMission
	@Budget money,
	@Description varchar(400),
	@beg_date date,
	@Conc_date date=NULL,
	@id INTEGER output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO Mission(Budget,[Description],Beg_Date,Conc_date)
			VALUES
				(@Budget,@Description,@beg_date,@Conc_date)
			SET @id=SCOPE_IDENTITY()
		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE addMissionToProgram
	@Program INTEGER,
	@MissionID INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO ProgramHasMission(Prog_ID,Mission_ID)
		VALUES (@Program,@MissionID)
END
GO


CREATE PROCEDURE addModule
    @Type VARCHAR(16),
    @Description VARCHAR(256) ,
    @Status VARCHAR(8),
    @Craft_ID INTEGER,
	@id INTEGER output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Module( [Type] , [Description] , [Status] , Craft_ID )
	VALUES
		(@Type, @Description , @Status ,@Craft_ID)
	SET @id=SCOPE_IDENTITY()
END
GO

CREATE PROCEDURE addPayload
	@CraftID INTEGER,
	@MissionID INTEGER,
	@CrewID INTEGER=-1,
	@RoverID INTEGER=-1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 

		IF (@CrewID!=-1 AND @RoverID!=-1)
				INSERT INTO Payload(Craft_ID,Mission_ID,Crew_ID,Rover_ID)
				VALUES
					(@CraftID,@MissionID,@CrewID,@RoverID)
		IF (@CrewID!=-1 AND @RoverID=-1)
				INSERT INTO Payload(Craft_ID,Mission_ID,Crew_ID)
				VALUES
					(@CraftID,@MissionID,@CrewID)
			COMMIT 
		IF (@CrewID=-1 AND @RoverID!=-1)
				INSERT INTO Payload(Craft_ID,Mission_ID,Rover_ID)
				VALUES
					(@CraftID,@MissionID,@RoverID)
		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE addPerson
	@Type varchar(16) ,
	@Fname varchar(100) ,
	@Lname varchar(10) ,
	@Birth varchar(16) ,
	@Email varchar(100) ,
	@Phone varchar(30),
	@Nationality varchar(100),
	@Networth money = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			INSERT INTO [Person] (Fname,Lname,Birth,Email,Phone,Nationality)
			VALUES
				(@Fname,@Lname,@Birth,@Email,@Phone,@Nationality)

			DECLARE @ID INT =  SCOPE_IDENTITY() 

			IF @Type = 'CEO'
			INSERT INTO CEO (Per_ID,Networth)
			VALUES
				(@ID,@Networth)
			ELSE IF @Type = 'Austronaut'
			INSERT INTO Astronaut(Per_ID)
			VALUES
				(@ID)
			ELSE IF @Type != 'None'
				RAISERROR('Not a valid Person type.', 16, 1);
		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE addProgram
	@Name varchar(50),
	@Company INT,
	@id INT output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Program ( [Name] , Company )
	VALUES ( @Name , @Company) 

	SET @id=SCOPE_IDENTITY()
END
GO

CREATE PROCEDURE addRover
	@Veh_ID INT,
	@Purpose VARCHAR(64),
	@Autonomy INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Rover ( Veh_ID,Purpose,Autonomy )
	VALUES ( @Veh_ID,@Purpose,@Autonomy)  

END
GO

CREATE PROCEDURE addSatelite
	@Veh_ID INTEGER ,
	@Norad_ID INTEGER=null ,
	@Orbit_Type VARCHAR(8) =null,
	@Perigee INTEGER=null ,
	@Apogee INTEGER=null,
	@Inclination DECIMAL(8,5)=null,
	@Period TIME=null,
	@Latitude DECIMAL(8,5)=null,
	@Longitude DECIMAL(8,5)=null,
	@Altitude DECIMAL(8,2)=null,
	@Speed DECIMAL(16,4)=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Satelite( Craft_ID , Norad_ID , Orbit_Type , Perigee , Apogee , Inclination , [Period] , Latitude , Longitude , Altitude ,Speed )
	VALUES
		(@Veh_ID, @Norad_ID , @Orbit_Type , @Perigee,@Apogee,@Inclination,@Period,@Latitude,@Longitude,@Altitude,@Speed)

END
GO

CREATE PROCEDURE addCompany 
	@Name varchar(100) ,
	@Country varchar(100) ,
	@Acronym varchar(10) ,
	@Type varchar(16) ,
	@Owner varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			INSERT INTO SpaceCompany ([Name],Acronym,Country)
					VALUES
						(@Name,@Acronym,@Country)

			DECLARE @ID INT =  SCOPE_IDENTITY() 

			IF @Type like 'Public'
				BEGIN

					INSERT INTO PublicSpaceCompany( Comp_ID ,Gov )
					VALUES
						(@ID,@Owner)
				END
			ELSE IF @Type like 'Private'
				BEGIN
					IF EXISTS ( SELECT * from CEO where Per_ID = @Owner )
					INSERT INTO PrivateSpaceCompany( Comp_ID ,CEO )
					VALUES
						(@ID,@Owner);
					ELSE
						RAISERROR('No such ceo',16,1);
				END
			ELSE
				RAISERROR('Not a valid Agency type.', 16, 1);
		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE addSpacecraft
	@Veh_ID INT,
	@Purpose varchar(32),
	@Propulsion varchar(64),
	@COSPAR_ID varchar(16) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO SpaceCraft ( Veh_ID , Purpose ,Propulsion, COSPAR_ID )
		VALUES ( @Veh_ID , @Purpose , @Propulsion,@COSPAR_ID)

END
GO

CREATE PROCEDURE addSpaceProbe
	@Veh_ID INTEGER ,
	@Comm_Type VARCHAR(32) ,
	@Scope VARCHAR(16)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO SpaceProbe( Craft_ID , Comm_Type , Scope )
	VALUES
		(@Veh_ID, @Comm_Type , @Scope)

END
GO

CREATE PROCEDURE addSpaceStation
	@Veh_ID INTEGER =null,
	@Norad_ID INTEGER =null,
	@Orbit_Type VARCHAR(8) =null ,
	@Perigee INTEGER =null ,
	@Apogee INTEGER =null,
	@Inclination DECIMAL(8,5) =null,
	@Period TIME =null,
	@Latitude DECIMAL(8,5) =null,
	@Longitude DECIMAL(8,5) =null,
	@Altitude DECIMAL(8,2) =null,
	@Speed DECIMAL(16,4) =null ,
	@Max_Capacity INTEGER =null,
	@Min_Capacity INTEGER =null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO SpaceStation( Craft_ID , Norad_ID , Orbit_Type , Perigee , Apogee , Inclination , [Period] , Latitude , Longitude , Altitude ,Speed , Max_Capacity, Min_Capacity  )
	VALUES
		(@Veh_ID, @Norad_ID , @Orbit_Type , @Perigee,@Apogee,@Inclination,@Period,@Latitude,@Longitude,@Altitude,@Speed,@Max_Capacity,@Min_Capacity)

END
GO

CREATE PROCEDURE addToCrew
	@CrewID INTEGER,
	@Ast_ID INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO CrewHasAstronaut(Crew_ID,Ast_ID,[Role])
		VALUES (@CrewID,@Ast_ID,'')

END
GO

CREATE PROCEDURE addVehicle
	@Name varchar(50),
	@Owner INT,
	@Size varchar(30),
	@Mass INT,
	@Manufacturer varchar(50),
	@Description varchar(100),
	@Status varchar(50),
	@Location varchar(200),
	@id INTEGER output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Vehicle( [Name], [Owner], Size, Mass, Manufacturer, [Description], [Status], [Location])
		VALUES ( @Name, @Owner, @Size, @Mass, @Manufacturer, @Description, @Status, @Location)

	SET @id=SCOPE_IDENTITY()
END
GO

CREATE PROCEDURE deleteMission
	@id INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			if(not exists(select * from Mission where Mission_ID = @id))
				RAISERROR('No such company.', 16, 1);

			delete from Payload where Mission_ID = @id

			delete from ProgramHasMission where Mission_ID = @id

			delete from [Event] where Mission_ID = @id

			UPDATE Launch
			SET Mission_ID = null
			where Mission_ID = @id

			delete from Mission where Mission_ID = @id

		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE deletePerson
	@id INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			if(not exists(select * from Person where Per_ID = @id))
				RAISERROR('No such Person.', 16, 1);

			delete from PrivateSpaceCompany where CEO = @id

			delete from Astronaut where Per_ID = @id

			delete from CEO where Per_ID = @id

			delete from Person where Per_ID=@id

		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO


CREATE PROCEDURE deleteProgram
	@id INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			if(not exists(select * from Program where Prog_ID = @id))
				RAISERROR('No such program.', 16, 1);

			delete from ProgramHasMission where Prog_ID = @id

			delete from Program where Prog_ID = @id

		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE deleteSpaceCompany
	@id INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			if(not exists(select * from SpaceCompany where Comp_ID = @id))
				RAISERROR('No such company.', 16, 1);

			delete from PrivateSpaceCompany where Comp_ID = @id

			delete from PrivateSpaceCompany where Comp_ID = @id

			UPDATE Vehicle
			SET [Owner] = null
			where [Owner] = @id

			DECLARE @pid as int , @comp as int;

			DECLARE C CURSOR FAST_FORWARD
			FOR select Prog_ID,Company from Program

			OPEN C

			FETCH C into @pid , @comp

			WHILE @@FETCH_STATUS = 0
			BEGIN
				if @comp = @id
					EXEC deleteProgram @pid;
				FETCH C into @pid , @comp;
			END

			CLOSE C;
			DEALLOCATE C;	

			delete from SpaceCompany where Comp_ID = @id

		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE deleteVehicle
	@id INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			if(not exists(select * from Vehicle where Veh_ID = @id))
				RAISERROR('No such Vehicle.', 16, 1);

			delete from Vehicle where Veh_ID = @id

			delete from Rover where Veh_ID = @id

			delete from LaunchVehicle where Veh_ID = @id

			delete from SpaceCraft where Veh_ID = @id

			delete from SpaceProbe where Craft_ID = @id

			delete from CrewedSpaceCraft where Craft_ID = @id

			delete from Satelite where Craft_ID = @id

			delete from SpaceStation where Craft_ID = @id

			delete from Payload where Craft_ID = @id

			delete from LaunchHasSpacecraft where Craft_ID = @id

			UPDATE Payload
			SET Rover_ID = null
			where Rover_ID = @id 

			UPDATE Module
			SET Craft_ID = null
			where Craft_ID = @id

			UPDATE Launch
			SET LaunchV_ID = null
			where LaunchV_ID = @id

		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE updateCompany 
	@ID INTEGER,
	@Name varchar(100) ,
	@Country varchar(100) ,
	@Acronym varchar(10) ,
	@Type varchar(16) ,
	@Owner varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			UPDATE SpaceCompany 
			SET [Name] = @Name , [Country] = @Country , Acronym = @Acronym
			WHERE Comp_ID = @ID


			IF @Type like 'Public'
				BEGIN
					IF NOT EXISTS ( Select * from PublicSpaceCompany where Comp_ID = @ID)
					BEGIN
					INSERT INTO PublicSpaceCompany( Comp_ID ,Gov )
					VALUES
						(@ID,@Owner)
					DELETE from PrivateSpaceCompany where Comp_ID = @ID
					END
				END
			ELSE IF @Type like 'Private'
				BEGIN
					IF NOT EXISTS (select * from PrivateSpaceCompany where Comp_ID = @ID)
					BEGIN
						IF EXISTS ( SELECT * from CEO where Per_ID = @Owner )
							INSERT INTO PrivateSpaceCompany( Comp_ID ,CEO )
								VALUES
									(@ID,@Owner);
						ELSE
							RAISERROR('No such ceo',16,1);
						DELETE from PublicSpaceCompany where Comp_ID = @ID
					END
				END
			ELSE
				RAISERROR('Not a valid Agency type.', 16, 1);
		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO

CREATE PROCEDURE updateModule
	@Module_ID INTEGER,
    @Type VARCHAR(16),
    @Description VARCHAR(256) ,
    @Status VARCHAR(8),
    @Craft_ID INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Module SET [Type] = @Type , [Description] = @Description , [Status] = @Status , Craft_ID = @Craft_ID
	WHERE [Module_ID] = @Module_ID

END
GO

CREATE PROCEDURE updateVehicle
	@Veh_ID INT,
	@Name varchar(50),
	@Owner INT,
	@Size varchar(30),
	@Mass INT,
	@Manufacturer varchar(50),
	@Description varchar(100),
	@Status varchar(50),
	@Location varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Vehicle 
	SET [Name] = @Name, [Owner] =  @Owner, [Size] =  @Size, Mass =  @Mass, Manufacturer= @Manufacturer,[Description] =  @Description,[Status] =  @Status, [Location] =  @Location
	where [Veh_ID] = @Veh_ID
END
GO

CREATE PROCEDURE updateMission
    @MissionID INT,
    @Budget MONEY,
    @Description VARCHAR(400),
    @BegDate DATE,
    @ConcDate DATE
AS
BEGIN
    UPDATE Mission
    SET
        Budget = @Budget,
        [Description] = @Description,
        Beg_Date = @BegDate,
        Conc_Date = @ConcDate
    WHERE
        Mission_ID = @MissionID;
END;
GO

CREATE PROCEDURE updateProgram
    @ProgramID INT,
    @Name VARCHAR(50),
    @CompanyID INT
AS
BEGIN
    UPDATE Program
    SET
        [Name] = @Name,
        Company = @CompanyID
    WHERE
        Prog_ID = @ProgramID;
END;
GO

CREATE PROCEDURE updatePerson
    @PersonID INT,
    @FirstName VARCHAR(32),
    @LastName VARCHAR(32),
    @BirthDate DATE,
    @Email VARCHAR(100),
    @Phone VARCHAR(30),
    @Nationality VARCHAR(100)
AS
BEGIN
    UPDATE Person
    SET
        Fname = @FirstName,
        Lname = @LastName,
        Birth = @BirthDate,
        Email = @Email,
        Phone = @Phone,
        Nationality = @Nationality
    WHERE
        Per_ID = @PersonID;
END;
GO
COMMIT