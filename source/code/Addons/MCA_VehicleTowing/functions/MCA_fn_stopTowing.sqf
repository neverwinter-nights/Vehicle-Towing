// MCA_fn_stopTowing.sqf.

params ["_tractor", "_towedVehicle"];

_towedVehicle lock false;
_towedVehicle disableBrakes false;

[_towedVehicle, nil] call MCA_fn_setTowMasterVehicle;
[_tractor, nil] call MCA_fn_setTowSlaveVehicle;
