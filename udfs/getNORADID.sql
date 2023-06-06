use PFinal
go

CREATE function getNORADID()
RETURNS INT
AS
BEGIN
	DECLARE @i INT
	select @i=MAX(M) from ( select MAX(Norad_ID) AS M from Satelite 
							UNION
							select MAX(Norad_ID) AS M from SpaceStation ) AS A
	SET @i = @i +1
	RETURN @i
END

