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
	@Norad_ID INTEGER ,
	@Orbit_Type VARCHAR(8) ,
	@Perigee INTEGER ,
	@Apogee INTEGER,
	@Inclination DECIMAL(8,5),
	@Period TIME,
	@Latitude DECIMAL(8,5),
	@Longitude DECIMAL(8,5),
	@Altitude DECIMAL(8,2),
	@Speed DECIMAL(16,4)
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
	@Veh_ID INTEGER ,
	@Norad_ID INTEGER ,
	@Orbit_Type VARCHAR(8) ,
	@Perigee INTEGER ,
	@Apogee INTEGER,
	@Inclination DECIMAL(8,5),
	@Period TIME,
	@Latitude DECIMAL(8,5),
	@Longitude DECIMAL(8,5),
	@Altitude DECIMAL(8,2),
	@Speed DECIMAL(16,4) ,
	@Max_Capacity INTEGER,
	@Min_Capacity INTEGER
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

USE PFinal
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
