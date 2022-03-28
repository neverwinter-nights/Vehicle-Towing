// MCA_fn_initPlayer.sqf.

// If the computer is not a real player
// (e.g. if it is a dedicated server or a headless client),
// exit the script.
if (!hasInterface) exitWith {};

player addAction
[
    MCA_towingToggleActionText,
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

// To keep this action with the player after respawn, we must add this action after each respawn.
player addEventHandler
[
	"Respawn",
	{
		params ["_unit", "_corpse"];

        _unit addAction
        [
            MCA_towingToggleActionText,
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
	}
];
