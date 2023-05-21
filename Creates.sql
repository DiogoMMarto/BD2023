USE [SPACE];
GO

CREATE TABLE Person(
	Per_ID INT NOT NULL PRIMARY KEY,
	Fname varchar(32) NOT NULL,
	Lname varchar(32) NOT NULL,
	Birth date NOT NULL,
	Email varchar(100),
	Phone INT,
	Nationality varchar(100) NOT NULL
);
GO

CREATE TABLE SpaceCompany(
	 Comp_ID INT NOT NULL PRIMARY KEY,
	 [Name] varchar(100) NOT NULL,
	 Acronym varchar,
	 Country varchar(100) NOT NULL
);
GO

CREATE TABLE PrivateSpaceCompany(
	 Comp_ID INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
	 CEO INT NOT NULL FOREIGN KEY REFERENCES Person(Per_ID),
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
	Prog_ID INT NOT NULL PRIMARY KEY,
	[Name] varchar(50),
	Company INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID)
);
GO

CREATE TABLE Mission(
	Mission_ID INT NOT NULL PRIMARY KEY,
	Budget money NOT NULL,
	[Description] varchar(400),
	Beg_Date date NOT NULL,
	Conc_Date date,
);
GO

CREATE TABLE ProgramHasMission(
	Prog_ID INT NOT NULL FOREIGN KEY REFERENCES Program(Prog_ID),
	Mission_ID INT NOT NULL FOREIGN KEY REFERENCES Mission(Mission_ID)
	PRIMARY KEY (Prog_ID,Mission_ID)
);
GO

CREATE TABLE [Event](
	Event_ID INT NOT NULL PRIMARY KEY,
	[Name] varchar(100) NOT NULL,
	[Date] date NOT NULL,
	[Status] varchar(400) NOT NULL,
	Mission_ID INT NOT NULL FOREIGN KEY REFERENCES Mission(Mission_ID)
);
GO

CREATE TABLE Vehicle(
	Veh_ID INT NOT NULL PRIMARY KEY,
	[Name] varchar(50) NOT NULL,
	[Owner] INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
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
	LaunchS_ID INT NOT NULL PRIMARY KEY,
	[Location] varchar(150) NOT NULL,
	Comp_ID INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
	[Name] varchar(100)
);
GO

CREATE TABLE Launch(
	Launch_ID INT NOT NULL PRIMARY KEY,
	Mission_ID INT NOT NULL FOREIGN KEY REFERENCES Mission(Mission_ID),
	LaunchS_ID INT NOT NULL FOREIGN KEY REFERENCES LaunchSite(LaunchS_ID),
	LaunchV_ID INT NOT NULL FOREIGN KEY REFERENCES LaunchVehicle(Veh_ID)
);
GO


CREATE TABLE Astronaut(
	Per_ID INT NOT NULL FOREIGN KEY REFERENCES Person(Per_ID),
	Num_Missions INT,
	PRIMARY KEY(Per_ID)
);
GO

CREATE TABLE Speciality(
	[Name] varchar(50) NOT NULL PRIMARY KEY,
	[Description] varchar(400) NOT NULL
);
GO

CREATE TABLE Crew(
	Crew_ID INT NOT NULL PRIMARY KEY,
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
	[Purpulsion] VARCHAR(32) NULL,
	[COSPAR_ID] INTEGER NOT NULL,
	PRIMARY KEY([Veh_ID]),
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
	UNIQUE([Latitude],[Longitude],[Altitude]) --This is the position if this was not unique things would be in the location which would be very bad
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
	[Crew_ID] INTEGER NULL,
	[Rover_ID] INTEGER NULL,
	PRIMARY KEY([Craft_ID],[Mission_ID]),
);
GO

