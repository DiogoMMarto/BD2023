USE PFinal
GO

Select Per_ID,COUNT(Mission_ID) as Num_Missions from 
	Person as P JOIN 
	CrewHasAstronaut as CA ON P.Per_ID = CA.Ast_ID JOIN 
	Crew as C ON C.Crew_ID = CA.Crew_ID JOIN
	Payload as PL ON PL.Crew_ID = C.Crew_ID
	GROUP BY Per_ID
	ORDER BY Per_ID
GO

SELECT Per_ID, dbo.getNumMissions(Per_ID) AS Num_Missions
FROM Person
GO


/*
EXEC addCompany 'Test' ,'Ireland', 'T', 'Public' , 'The mighty goverment of ireland' ;

select * from getSpaceAgency(1,1,default,default)
GO*/