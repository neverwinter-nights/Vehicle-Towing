// MCA_fn_getTowedVehicleByRope.sqf

params ["_rope"];

private ["_ropeEndPos", "_ropeEndPosVeh"];
_ropeEndPos = (ropeEndPosition _rope) select 1; // [Tractor = 0; Towed Vehicle = 1].
_ropeEndPosVeh = (nearestObjects [_ropeEndPos, MCA_vehClassNamesToFind, MCA_vehSearchRadius]) select 0;

if (isNil { _ropeEndPosVeh }) then
{
    nil
}
else
{
    _ropeEndPosVeh
};
