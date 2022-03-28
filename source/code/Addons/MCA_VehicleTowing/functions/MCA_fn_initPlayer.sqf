// MCA_fn_initPlayer.sqf.

// If the computer is not a real player
// (e.g. if it is a dedicated server or a headless client),
// exit the script.
if (!hasInterface) exitWith {};

player addAction
[
    "Towing Toggle (On/Off)",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_caller] call MCA_fn_toggleTowingForNearestVehicle;
    },      // Script.
    nil,    // Arguments.
    0,      // Priority: bigger = higher.
    false,  // ShowWindow.
    false,  // HideOnUse.
    "",     // Shortcut.
    "true", // Condition.
    1,      // Radius, meters.
    false,  // Unconscious.
    "",     // Selection.
    ""      // MemoryPoint.
];
