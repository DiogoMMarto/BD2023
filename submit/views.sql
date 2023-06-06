CREATE VIEW AstronautView AS
	SELECT Person.Per_ID , Fname, Lname , Birth , Email , Phone, Nationality , Num_Mission FROM Astronaut 
		JOIN Person on Person.Per_ID = Astronaut.Per_ID

CREATE VIEW CeoView AS
	SELECT Person.Per_ID , Fname, Lname , Birth , Email , Phone, Nationality , Networth FROM CEO 
		JOIN Person on Person.Per_ID = CEO.Per_ID
