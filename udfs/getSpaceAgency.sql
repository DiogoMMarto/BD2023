DROP FUNCTION getSpaceAgency
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
