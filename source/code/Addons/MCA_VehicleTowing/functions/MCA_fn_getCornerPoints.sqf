// MCA_fn_getCornerPoints.sqf.

params ["_vehicle"];

// Width and length factors for air vehicles.
private ["_widthFactor"];
_widthFactor = 0.75;
if(_vehicle isKindOf MCA_vehKind_Aircraft) then {
	_widthFactor = 0.3;
};

private ["_lengthFactor"];
_lengthFactor = 0.75;
if(_vehicle isKindOf MCA_vehKind_Helicopter) then {
	_widthFactor = 0.2;
	_lengthFactor = 0.45;
};

private ["_centerOfMass"];
_centerOfMass = getCenterOfMass _vehicle;

private ["_bbr", "_bbr_p1", "_bbr_p2"];
_bbr = boundingBoxReal _vehicle;
_bbr_p1 = _bbr select 0;
_bbr_p2 = _bbr select 1;

private ["_maxWidth", "_widthOffset"];
_maxWidth = abs ((_bbr_p2 select 0) - (_bbr_p1 select 0));
_widthOffset = ((_maxWidth / 2) - abs ( _centerOfMass select 0 )) * _widthFactor;

private ["_maxLength", "_lengthOffset"];
_maxLength = abs ((_bbr_p2 select 1) - (_bbr_p1 select 1));
_lengthOffset = ((_maxLength / 2) - abs (_centerOfMass select 1 )) * _lengthFactor;

private ["_frontCorner1", "_frontCorner2"];
_frontCorner1 = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) + _lengthOffset, _centerOfMass select 2];
_frontCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) + _lengthOffset, _centerOfMass select 2];

private ["_rearCorner1", "_rearCorner2"];
_rearCorner1 = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) - _lengthOffset, _centerOfMass select 2];
_rearCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) - _lengthOffset, _centerOfMass select 2];

[_rearCorner1, _rearCorner2, _frontCorner1, _frontCorner2]; // Return.
