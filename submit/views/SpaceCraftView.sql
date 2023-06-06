CREATE VIEW SpaceCraftView AS
	SELECT V.[Name] , V.[Owner] , V.[Status] , SC.Propulsion , LVV.[Name] as LaunchVehicleName , LS.[Name] as LaunchLocationName from SpaceCraft as SC JOIN 
	Vehicle as V ON V.Veh_ID = SC.Veh_ID JOIN 
	LaunchHasSpacecraft as LHS ON LHS.Craft_ID = SC.Veh_ID JOIN 
	Launch as L ON L.Launch_ID = LHS.Launch_ID JOIN
	LaunchVehicle as LV ON LV.Veh_ID = L.LaunchV_ID JOIN
	Vehicle as LVV ON LV.Veh_ID = LVV.Veh_ID JOIN
	LaunchSite as LS ON LS.LaunchS_ID = L.LaunchS_ID
GO