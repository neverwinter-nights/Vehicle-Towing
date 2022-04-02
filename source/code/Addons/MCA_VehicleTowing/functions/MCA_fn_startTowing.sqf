// MCA_fn_startTowing.sqf.

params ["_tractor", "_towedVehicle"];

private ["_ropeLengthFactor"];
_ropeLengthFactor = 1.2;

// Enable rope attachment.
_tractor enableRopeAttach true;
_towedVehicle enableRopeAttach true;

// Make sure that the towed vehicle is empty and locked.
{ moveOut _x; } forEach crew _towedVehicle;
_towedVehicle lock true;

// Get the nearest hook point of the tractor.
private ["_tractorHookPoints"];
_tractorHookPoints = [_tractor] call MCA_fn_getHookPoints;
private ["_tractorHookPoint"];
_tractorHookPoint = [_towedVehicle, _tractor, _tractorHookPoints] call MCA_fn_getNearestHookPoint;

// Get the nearest hook point of the towed vehicle.
private ["_towedVehicleHookPoints"];
_towedVehicleHookPoints = [_towedVehicle] call MCA_fn_getHookPoints;
private ["_towedVehicleHookPoint"];
_towedVehicleHookPoint = [_tractor, _towedVehicle, _towedVehicleHookPoints] call MCA_fn_getNearestHookPoint;

// Temporarily disable damage.
_tractor allowDamage false;
_towedVehicle allowDamage false;

// Create the rope.
private ["_ropeLength"];
_ropeLength = (_tractor distance _towedVehicle) * _ropeLengthFactor;
ropeCreate
[
    _tractor, _tractorHookPoint,
    _towedVehicle, _towedVehicleHookPoint,
    _ropeLength,
    ["", [0,0,-1]],
    ["", [0,0,-1]],
    MCA_ropeType
];

// Enable towing. Disable parking brakes.
_towedVehicle setTowParent _tractor;
_towedVehicle disableBrakes true;

// Enable damage.
_tractor allowDamage true;
_towedVehicle allowDamage true;

[_tractor, _towedVehicle] call MCA_fn_setTowSlaveVehicle;
[_towedVehicle, _tractor] call MCA_fn_setTowMasterVehicle;
