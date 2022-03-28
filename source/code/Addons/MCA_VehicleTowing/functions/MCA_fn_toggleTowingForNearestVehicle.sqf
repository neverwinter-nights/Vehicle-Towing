// MCA_fn_toggleTowingForNearestVehicle.sqf.

params ["_callerPlayer"];

private ["_mustExit"];
_mustExit = false;

// Get the nearest vehicle.
private ["_nearestObjects"];
_nearestObjects = [_callerPlayer] call MCA_fn_getNearestVehiclesForTowing;

// If there are no vehicles nearby, exit.
if (count _nearestObjects < 1) then
{
    systemChat format ["No vehicle is nearby."];
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Nearest vehicle is found.
private ["_nearestVehicle"];
_nearestVehicle = _nearestObjects select 0;

// Find tow ropes going to secondary vehicles.
// This code searches only for ropes belonging to this vehicle.
// Other ropes are not visible here.
private ["_nearestVehicleRopes"];
_nearestVehicleRopes = ropes _nearestVehicle;

private ["_nearestVehicleDisplayName", "_towedVehicleRecorded"];
_nearestVehicleDisplayName = _nearestVehicle call MCA_fn_getObjectDisplayName;
_towedVehicleRecorded = _nearestVehicle call MCA_fn_getTowSlaveVehicle;

// I. If we have any vehicles towed with existing ropes, try to disable towing and exit.
if (count _nearestVehicleRopes > 0) then
{
    if (!isNil { _towedVehicleRecorded }) then
    {
        [_nearestVehicle, _towedVehicleRecorded] call MCA_fn_stopTowing;
    };

    {
        ropeDestroy _x;
    } forEach _nearestVehicleRopes;

    systemChat format ["Tow ropes (%1 pcs.) have been removed from %2.", count _nearestVehicleRopes, _nearestVehicleDisplayName];
    _mustExit = true;
};
if (_mustExit) exitWith {};

// II. No tow rope is found, but a towed vehicle is recorded.
// Stop towing, show a warning and exit.
if (!isNil { _towedVehicleRecorded }) then {
    [_nearestVehicle, _towedVehicleRecorded] call MCA_fn_stopTowing;

    private ["_towedVehicleDisplayName"];
    _towedVehicleDisplayName = _towedVehicleRecorded call MCA_fn_getObjectDisplayName;
    systemChat format ["Towed vehicle (%1) got lost.", _towedVehicleDisplayName];
    _mustExit = true;
};
if (_mustExit) exitWith {};

// No tow ropes are found and towed vehicle record is not set =>
// We have no towed vehicles.
// Either we are being towed or we have no ropes at all.
private ["_masterVehicleRecorded", "_masterVehicleDisplayName"];
_masterVehicleRecorded = _nearestVehicle call MCA_fn_getTowMasterVehicle;

// III. We are being towed.
if (!isNil { _masterVehicleRecorded }) then
{
    _masterVehicleDisplayName = _masterVehicleRecorded call MCA_fn_getObjectDisplayName;
    _towedVehicleRecorded = _masterVehicleRecorded call MCA_fn_getTowSlaveVehicle;

    // Data integrity check #1.
    if (isNil { _towedVehicleRecorded }) then
    {
        // If we know the master, but master does not know us, this is an error.
        systemChat format ["Master vehicle (%1) is corrupted.", _masterVehicleDisplayName];
        _mustExit = true;
    };
    if (_mustExit) exitWith {};

    // Data integrity check #2.
    if (_towedVehicleRecorded != _nearestVehicle) then
    {
        systemChat format ["Master vehicle (%1) is not found.", _masterVehicleDisplayName];
        _mustExit = true;
    };
    if (_mustExit) exitWith {};

    // Disabling towing will be very difficult because Arma engine does not
    // allow getting the list of ropes to the master vehicle ! We will
    // have to iterate through all the ropes of another vehicle ! Shame.
    {
        ropeDestroy _x;
    } forEach ropes _masterVehicleRecorded;

    // Disable towing.
    [_masterVehicleRecorded, _towedVehicleRecorded] call MCA_fn_stopTowing;
    systemChat format ["Tow ropes have been removed from %1.", _masterVehicleDisplayName];
    _mustExit = true;
};
if (_mustExit) exitWith {};

// IV. We are not being towed ! We are free to tow a vehicle.

// Get the nearest vehicle to our nearest vehicle.
private ["_secondVehs", "_secondVeh", "_secondVehDisplayName"];
_secondVehs = [_nearestVehicle] call MCA_fn_getNearestVehiclesForTowing;
if (count _secondVehs < 1) then
{
    systemChat format ["No vehicles to tow."];
    _mustExit = true;
};
if (_mustExit) exitWith {};

_secondVeh = _secondVehs select 0;
_secondVehDisplayName = _secondVeh call MCA_fn_getObjectDisplayName;

// Busy check.
private ["_secondVehMasterVeh"];
_secondVehMasterVeh = _secondVeh call MCA_fn_getTowMasterVehicle;

if (!isNil { _secondVehMasterVeh }) then
{
    systemChat format ["Vehicle (%1) is already being towed.", _secondVehDisplayName];
    _mustExit = true;
};
if (_mustExit) exitWith {};

// Begin towing.
[_nearestVehicle, _secondVeh] call MCA_fn_startTowing;

private ["_msgf"];
_msgf = "Tow rope has been attached. %1 is a tractor, %2 is a towed vehicle. Be advised that parking brakes have been disabled. Do not tow heavy vehicles down the hill.";
systemChat format [_msgf, _nearestVehicleDisplayName, _secondVehDisplayName];
