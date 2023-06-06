CREATE VIEW AstronautView AS
	SELECT Person.Per_ID , Fname, Lname , Birth , Email , Phone, Nationality , Num_Mission FROM Astronaut 
		JOIN Person on Person.Per_ID = Astronaut.Per_ID
