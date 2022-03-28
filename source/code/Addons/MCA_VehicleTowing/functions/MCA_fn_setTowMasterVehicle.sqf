// MCA_fn_setTowMasterVehicle.sqf.

params ["_vehicle", "_towMasterVeh"];

if (isNil { _towMasterVeh }) then
{
    _vehicle setVariable [MCA_vehVariableName_towMasterVeh, nil, true];
}
else
{
    _vehicle setVariable [MCA_vehVariableName_towMasterVeh, _towMasterVeh, true];
};
