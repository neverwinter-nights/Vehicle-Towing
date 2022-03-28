// MCA_fn_initVehicleTowing.sqf.

// This funcion is started automatically while it is described as a library
// function in "config.cpp" file. While it is started as "postInit", passed
// arguments are [String:"postInit", Boolean:didJIP].

// Constants.
MCA_vehKind_Aircraft = "Air";
MCA_vehKind_Helicopter = "Helicopter";
MCA_vehClassNamesToFind = ["LandVehicle", "Ship", "Air", "Helicopter"];
MCA_vehSearchRadius = 25;
MCA_vehVariableName_towMasterVeh = "mca_towMasterVeh";
MCA_vehVariableName_towSlaveVeh = "mca_towSlaveVeh";
MCA_towingToggleActionText = "Towing Toggle (On/Off)";

// Functions.
MCA_fn_getObjectDisplayName = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_getObjectDisplayName.sqf";
MCA_fn_getTowedVehicleByRope = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_getTowedVehicleByRope.sqf";
MCA_fn_getTowMasterVehicle = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_getTowMasterVehicle.sqf";
MCA_fn_setTowMasterVehicle = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_setTowMasterVehicle.sqf";
MCA_fn_getTowSlaveVehicle = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_getTowSlaveVehicle.sqf";
MCA_fn_setTowSlaveVehicle = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_setTowSlaveVehicle.sqf";
MCA_fn_getNearestVehiclesForTowing = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_getNearestVehiclesForTowing.sqf";
MCA_fn_getNearestHookPoint = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_getNearestHookPoint.sqf";
MCA_fn_getCornerPoints = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_getCornerPoints.sqf";
MCA_fn_getHookPoints = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_getHookPoints.sqf";
MCA_fn_initPlayer = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_initPlayer.sqf";
MCA_fn_toggleTowingForNearestVehicle = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_toggleTowingForNearestVehicle.sqf";
MCA_fn_startTowing = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_startTowing.sqf";
MCA_fn_stopTowing = compile preprocessFileLineNumbers "MCA_VehicleTowing\functions\MCA_fn_stopTowing.sqf";

// Work.
call MCA_fn_initPlayer;
