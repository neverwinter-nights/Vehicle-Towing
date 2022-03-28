// MCA_fn_setTowSlaveVehicle.sqf.

params ["_vehicle", "_towSlaveVeh"];

if (isNil { _towSlaveVeh }) then
{
    _vehicle setVariable [MCA_vehVariableName_towSlaveVeh, nil, true];
}
else
{
    _vehicle setVariable [MCA_vehVariableName_towSlaveVeh, _towSlaveVeh, true];
};
