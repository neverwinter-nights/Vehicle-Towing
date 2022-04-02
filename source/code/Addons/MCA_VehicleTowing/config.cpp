// Main Properties of the Modification (Mod).
class CfgPatches
{
	class MCA_VehicleTowing
	{
			// Meta information for editor.
			name = "Vehicle Towing";
			author = "McArcher";

			// Minimum compatible version.
			requiredVersion = 2.08;

			// Required addons, used for loading order.
			requiredAddons[] =
			{
				"A3_Data_F"
			};

			// List of objects (CfgVehicles classes) contained in the Mod.
			// Important also for Zeus content (units and groups) unlocking.
			units[] = {};

			// List of weapons (CfgWeapons classes) contained in the addon.
			weapons[] = {};
	};
};

class CfgFunctions
{
	class MCA // Tag.
	{
		class VehicleTowing // Category.
		{
			// MCA_fnc_initVehicleTowing.
			class initVehicleTowing // Function name.
			{
				// Source file path will be: "<ROOT>\<file>".
				file = "MCA_VehicleTowing\functions\MCA_fn_initVehicleTowing.sqf";

				// The postInit attribute can be set to 1 to call the function
				// upon mission start, after objects are initialized. Passed
				// arguments are ["postInit", didJIP]. The function is run in
				// a scheduled environment so suspension is allowed, but any
				// long term suspension will halt the mission loading until
				// suspension is done.
				postInit = 1;
			};
		};
	};
};

class CfgVehicles
{
	class Rope;

	class HardRope : Rope
	{
	    // Looks like a rope's extensibility.
	    // The more it is, the more static the rope is.
	    // The less it is, the more dynamic the rope is.
	    // Looks like values greater than 1.0 break the game engine.
		springFactor = 1.0;

		// Looks like the multiplier for torque when rope is straight.
		// Looks like values greater than 1.0 break the game engine.
		torqueFactor = 1.0;

		// Seems like a wheel rotation compensation.
		dampingFactor[] = {0.1, 0.1, 0.1};
	};
};
