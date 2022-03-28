// MCA_fn_getHookPoints.sqf.

params ["_vehicle"];

private ["_cornerPoints"];
_cornerPoints = [_vehicle] call MCA_fn_getCornerPoints;

private ["_frontCorner1","_frontCorner2"];
_frontCorner1 = _cornerPoints select 2;
_frontCorner2 = _cornerPoints select 3;

private ["_rearCorner1", "_rearCorner2"];
_rearCorner1 = _cornerPoints select 0;
_rearCorner2 = _cornerPoints select 1;


private ["_frontHookPoint"];
_frontHookPoint = ((_frontCorner1 vectorDiff _frontCorner2) vectorMultiply 0.5) vectorAdd _frontCorner2;

private ["_rearHookPoint"];
_rearHookPoint = ((_rearCorner1 vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd _rearCorner2;

// Return an array of two corner points:
// middle front point and middle rear point.
[_rearHookPoint, _frontHookPoint]
