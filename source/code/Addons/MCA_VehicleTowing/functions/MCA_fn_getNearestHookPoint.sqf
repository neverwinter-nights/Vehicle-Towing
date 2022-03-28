// MCA_fn_getNearestHookPoint.sqf.

// Finds the nearest hook point between two objects.
// Object B points are vectors (relative to object B).
// Returns nil on error.

params ["_objectA", "_objectB", "_objectBPoints"];

private ["_pointsCount"];
_pointsCount = count _objectBPoints;
if (_pointsCount < 1) exitWith { nil };

private ["_minDistance", "_distance", "_nearestPoint", "_comparedPoint"];
_comparedPoint = (getPosASL _objectB) vectorAdd (_objectB vectorModelToWorld (_objectBPoints select 0));
_minDistance = (getPosASL _objectA) vectorDistance _comparedPoint;
_nearestPoint = _objectBPoints select 0;

if (_pointsCount == 1) exitWith { _nearestPoint };

{
    _comparedPoint = (getPosASL _objectB) vectorAdd (_objectB vectorModelToWorld _x);
    _distance = (getPosASL _objectA) vectorDistance _comparedPoint;

    if (_distance < _minDistance) then
    {
        _minDistance = _distance;
        _nearestPoint = _x;
    };
} forEach _objectBPoints;

_nearestPoint
