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