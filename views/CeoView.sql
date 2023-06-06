CREATE VIEW CeoView AS
	SELECT Person.Per_ID , Fname, Lname , Birth , Email , Phone, Nationality , Networth FROM CEO 
		JOIN Person on Person.Per_ID = CEO.Per_ID
