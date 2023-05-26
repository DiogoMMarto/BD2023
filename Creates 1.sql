
CREATE TABLE Person(
	Per_ID INT NOT NULL PRIMARY KEY,
	Fname varchar(32) NOT NULL,
	Lname varchar(32) NOT NULL,
	Birth date NOT NULL,
	Email varchar(100),
	Phone INT,
	Nationality varchar(100) NOT NULL
)

CREATE TABLE SpaceCompany(
	 Comp_ID INT NOT NULL PRIMARY KEY,
	 [Name] varchar(100) NOT NULL,
	 Acronym varchar,
	 Country varchar(100) NOT NULL
)

CREATE TABLE PrivateSpaceCompany(
	 Comp_ID INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
	 CEO INT NOT NULL FOREIGN KEY REFERENCES Person(Per_ID)
	 PRIMARY KEY (Comp_ID)
)

CREATE TABLE PublicSpaceCompany(
	 Comp_ID INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
	 Gov varchar(100) NOT NULL
	 PRIMARY KEY (Comp_ID)

)

CREATE TABLE Program(
	Prog_ID INT NOT NULL PRIMARY KEY,
	[Name] varchar(50),
	Company INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID)
)

CREATE TABLE Mission(
	Mission_ID INT NOT NULL PRIMARY KEY,
	Budget money NOT NULL,
	[Description] varchar(400),
	Beg_Date date NOT NULL,
	Conc_Date date,
)

CREATE TABLE ProgramHasMission(
	Prog_ID INT NOT NULL FOREIGN KEY REFERENCES Program(Prog_ID),
	Mission_ID INT NOT NULL FOREIGN KEY REFERENCES Mission(Mission_ID)
	PRIMARY KEY (Prog_ID,Mission_ID)
)

CREATE TABLE [Event](
	Event_ID INT NOT NULL PRIMARY KEY,
	[Name] varchar(100) NOT NULL,
	[Date] date NOT NULL,
	[Status] varchar(400) NOT NULL,
	Mission_ID INT NOT NULL FOREIGN KEY REFERENCES Mission(Mission_ID)
)

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
)

CREATE TABLE LaunchVehicle(
	Veh_ID INT NOT NULL FOREIGN KEY REFERENCES Vehicle(Veh_ID),
	LaunchCost money,
	DevCost money,
	Fuel varchar(30) NOT NULL,
	[Type] varchar(30),
	[Range] INT,
	[Load] varchar(100)
	PRIMARY KEY(Veh_ID)
)

CREATE TABLE LaunchSite(
	LaunchS_ID INT NOT NULL PRIMARY KEY,
	[Location] varchar(150) NOT NULL,
	Comp_ID INT NOT NULL FOREIGN KEY REFERENCES SpaceCompany(Comp_ID),
	[Name] varchar(100)
)

CREATE TABLE Launch(
	Launch_ID INT NOT NULL,
	Mission_ID INT NOT NULL FOREIGN KEY REFERENCES Mission(Mission_ID),
	LaunchS_ID INT NOT NULL FOREIGN KEY REFERENCES LaunchSite(LaunchS_ID),
	LaunchV_ID INT NOT NULL FOREIGN KEY REFERENCES LaunchVehicle(LaunchV_ID);
)


CREATE TABLE Astronaut(
	Per_ID INT NOT NULL FOREIGN KEY REFERENCES Person(Per_ID),
	Num_Missions INT,
	PRIMARY KEY(Per_ID)
)

CREATE TABLE Speciality(
	[Name] varchar(50) NOT NULL PRIMARY KEY,
	[Description] varchar(400) NOT NULL
)

CREATE TABLE Crew(
	Crew_ID INT NOT NULL PRIMARY KEY,
	Supervisor INT NOT NULL FOREIGN KEY REFERENCES Astronaut(Per_ID)
)

CREATE TABLE CrewHasAstronaut(
	Crew_ID INT NOT NULL FOREIGN KEY REFERENCES Crew(Crew_ID),
	Ast_ID INT NOT NULL FOREIGN KEY REFERENCES Astronaut(Per_ID),
	[Role] varchar(100) NOT NULL,
	PRIMARY KEY(Crew_ID,Ast_ID)
)

CREATE TABLE PersonHasSpeciality(
	Per_ID INT NOT NULL FOREIGN KEY REFERENCES Person(Per_ID),
	Speciality varchar(50) NOT NULL FOREIGN KEY REFERENCES Speciality([Name]),
	PRIMARY KEY(Per_ID,Speciality)
)
