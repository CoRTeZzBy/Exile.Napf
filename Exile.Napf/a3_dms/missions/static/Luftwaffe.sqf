/*
	"Luftwaffe." v1 static mission for lYTHIUM.
	Created by Thomas TKO
	O_T_LSV_02_armed_viper_F increases persistent chance with difficulty
	tko-gameserver.de
*/

private ["_AICount", "_AIMaxReinforcements", "_AItrigger", "_AIwave", "_AIdelay", "_staticguns", "_missionObjs", "_crate0", "_crate1", "_cash0", "_cash1", "_crate_loot_values0", "_crate_loot_values1", "_crate_weapons0", "_crate_weapons1", "_crate_items0", "_crate_items1", "_crate_backpacks0", "_crate_backpacks1", "_difficultyM", "_difficulty", "_PossibleDifficulty", "_msgWIN", "_vehicle", "_pinCode", "_VehicleChance"];

// For logging purposes
_num = DMS_MissionCount;

// Set mission side (only "bandit" is supported for now)
_side = "bandit";

_pos = [5060.55,4582.94,0]; //insert the centre here

if ([_pos,DMS_StaticMinPlayerDistance] call DMS_fnc_IsPlayerNearby) exitWith {"delay"};

//create possible difficulty add more of one difficulty to weight it towards that
_PossibleDifficulty		= 	[	
                                "easy",
								"moderate",
								"difficult",
								"hardcore"
							];
//choose mission difficulty and set value and is also marker colour
_difficultyM = selectRandom _PossibleDifficulty;

switch (_difficultyM) do
{
	case "easy":
	{
_difficulty = "easy";									//AI difficulty
_AICount = (20 + (round (random 5)));					//AI starting numbers
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 10;									//10% SpawnPersistentVehicle chance
_crate_weapons0 	= (40 + (round (random 5)));		//Crate 0 weapons number
_crate_items0 		= (30 + (round (random 5)));		//Crate 0 items number
_cash0 = (50000 + round (random (15000)));				//Tabs for crate0
	};
	case "moderate":
	{
_difficulty = "moderate";
_AICount = (20 + (round (random 8)));
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 50;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (50 + (round (random 5)));
_crate_items0 		= (30 + (round (random 5)));
_cash0 = (50000 + round (random (15000)));				//Tabs for crate0
	};
	case "difficult":
	{
_difficulty = "difficult";
_AICount = (22 + (round (random 8)));
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 80;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (60 + (round (random 5)));
_crate_items0 		= (40 + (round (random 5)));
_cash0 = (60000 + round (random (15000)));				//Tabs for crate0
	};
	//case "hardcore":
	default
	{
_difficulty = "hardcore";
_AICount = (25 + (round (random 8)));
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 100;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (60 + (round (random 5)));
_crate_items0 		= (50 + (round (random 5)));
_cash0 = (80000 + round (random (15000)));				//Tabs for crate0
	};
};

// Define spawn locations for AI Soldiers. These will be used for the initial spawning of AI as well as reinforcements.
// The center spawn location is added 3 times so at least 3 AI will spawn initially at the center location, and so that future reinforcements are more likely to spawn at the center.
_AISoldierSpawnLocations =
[
	//AI
	[5086.34,4566.1,0],
	[5090.24,4617.37,0],
	[5120.97,4597.37,0],
	[5067.03,4616.54,0],
	[5075.63,4591.09,0],
	[5060.64,4561.96,0],
	[5031.24,4552.02,0],
	[5017.35,4581.99,0],
	[5015.1,4610.22,0],
	[5043.87,4614.41,0],
	[5054.96,4634.72,0],
	[5088.31,4641.03,0],
	[5019.37,4629.61,0],
	[5106.78,4542.42,0],
	[5065.16,4541.88,0],
	[5031.59,4530.61,0],
	[5119.1,4564.16,0],
	[5114.22,4627.78,0]
];

_group =
[
	_AISoldierSpawnLocations+[_pos,_pos,_pos],			// Pass the regular spawn locations as well as the center pos 3x
	_AICount,											// Set in difficulty select
	_difficulty,										// Set in difficulty select
	"random",
	_side
] call DMS_fnc_SpawnAIGroup_MultiPos;

//Reduce Static guns if mission is easy
if (_difficultyM isEqualTo "easy") then {
_staticGuns =
[
	[
    //HMG Hoch
	[5018.65,4540.7,17.889],
	[5014.4,4547,17.889],
	[5003.83,4604.34,17.889],
	[5009.57,4604.74,17.889],
	[5007.66,4613.18,17.889],
	[5124.82,4633.85,17.889],
	[5123.89,4639.27,17.889],
	[5116.75,4639.66,17.885],
	[5127.63,4565.69,17.792],
	[5137.33,4568.22,17.889],
	[5133.56,4559.37,17.889],
	[5073.56,4551.6,4.344],
	[5067.57,4630.37,4.344],
	[5041.74,4628.93,4.344],
	[5110.62,4611.68,3.127],
	[5105.53,4604.5,3.127],
	[5100.78,4610.12,3.127],
	[5024.6,4605.31,3.127],
	[5026.89,4609.55,3.127],
	[5033.11,4602.44,3.127],
	[5027.77,4572.76,3.127],
	[5028.57,4565.67,3.127],
	[5021.72,4564.04,3.127],
	[5105.02,4579.63,3.127],
	[5116.86,4637.61,8.584],
	[5020.06,4548.15,8.589],
	//HMG Boden
	[5125.96,4628.44,0],
	[5127.04,4562.56,0],
	[5044.77,4546.89,0],
	[5073.57,4542.81,0],
	[5054.56,4539.1,0],
	[5041.59,4636.76,0],
	[5065.72,4640.41,0],
	[5006.47,4610.26,0],
	[5015.21,4565.74,0],
	[5020.92,4611.42,0],
	[5019.97,4540.5,0],
	[5099.18,4582.81,0],
	[5097.42,4607.26,0],
	[5027.78,4560.7,0]
	],
	_group,
	"assault",
	_difficulty,
	"bandit",
	"random"
] call DMS_fnc_SpawnAIStaticMG;
										} else
										{
_staticGuns =
[
	[
    //HMG Hoch
	[5018.65,4540.7,17.889],
	[5014.4,4547,17.889],
	[5003.83,4604.34,17.889],
	[5009.57,4604.74,17.889],
	[5007.66,4613.18,17.889],
	[5124.82,4633.85,17.889],
	[5123.89,4639.27,17.889],
	[5116.75,4639.66,17.885],
	[5127.63,4565.69,17.792],
	[5137.33,4568.22,17.889],
	[5133.56,4559.37,17.889],
	[5073.56,4551.6,4.344],
	[5067.57,4630.37,4.344],
	[5041.74,4628.93,4.344],
	[5110.62,4611.68,3.127],
	[5105.53,4604.5,3.127],
	[5100.78,4610.12,3.127],
	[5024.6,4605.31,3.127],
	[5026.89,4609.55,3.127],
	[5033.11,4602.44,3.127],
	[5027.77,4572.76,3.127],
	[5028.57,4565.67,3.127],
	[5021.72,4564.04,3.127],
	[5105.02,4579.63,3.127],
	[5116.86,4637.61,8.584],
	[5020.06,4548.15,8.589],
	//HMG Boden
	[5125.96,4628.44,0],
	[5127.04,4562.56,0],
	[5044.77,4546.89,0],
	[5073.57,4542.81,0],
	[5054.56,4539.1,0],
	[5041.59,4636.76,0],
	[5065.72,4640.41,0],
	[5006.47,4610.26,0],
	[5015.21,4565.74,0],
	[5020.92,4611.42,0],
	[5019.97,4540.5,0],
	[5099.18,4582.81,0],
	[5097.42,4607.26,0],
	[5027.78,4560.7,0]
	],
	_group,
	"assault",
	_difficulty,
	"bandit",
	"random"
] call DMS_fnc_SpawnAIStaticMG;
										};

// Define the classnames and locations where the crates can spawn (at least 2, since we're spawning 2 crates)
_crateClasses_and_Positions =
[
	//[[5042.1,4581.42,0],"I_CargoNet_01_ammo_F"],
	[[5042.1,4581.42,0],"I_CargoNet_01_ammo_F"]
];

{
	deleteVehicle (nearestObject _x);		// Make sure to remove any previous crates.
} forEach _crateClasses_and_Positions;

// Shuffle the list
_crateClasses_and_Positions = _crateClasses_and_Positions call ExileClient_util_array_shuffle;


// Create Crates
_crate0 = [_crateClasses_and_Positions select 0 select 1, _crateClasses_and_Positions select 0 select 0] call DMS_fnc_SpawnCrate;

// Don't think an armed AI vehicle fit the idea behind the mission. You're welcome to uncomment this if you want.
_veh =
[
	[
		[_pos,100,random 360] call DMS_fnc_SelectOffsetPos,
		_pos
	],
	_group,
	"assault",
	_difficulty,
	_side
] call DMS_fnc_SpawnAIVehicle;

// Enable smoke on the crates due to size of area
{
	_x setVariable ["DMS_AllowSmoke", true];
} forEach [_crate0];

// Define mission-spawned AI Units
_missionAIUnits =
[
	_group 		// We only spawned the single group for this mission
];

// Define the group reinforcements
_groupReinforcementsInfo =
[
	[
		_group,			// pass the group
		[
			[
				0,		// Let's limit number of units instead...
				0
			],
			[
				_AIMaxReinforcements,	// Maximum units that can be given as reinforcements (defined in difficulty selection).
				0
			]
		],
		[
			_AIdelay,		// The delay between reinforcements. >> you can change this in difficulty settings
			diag_tickTime
		],
		_AISoldierSpawnLocations,
		"random",
		_difficulty,
		_side,
		"reinforce",
		[
			_AItrigger,		// Set in difficulty select - Reinforcements will only trigger if there's fewer than X members left
			_AIwave			// X reinforcement units per wave. >> you can change this in mission difficulty section
		]
	]
];

// setup crates with items from choices
_crate_loot_values0 =
[
	_crate_weapons0,		// Set in difficulty select - Weapons
	_crate_items0			// Set in difficulty select - Items
];

// add cash to crates
_crate0 setVariable ["ExileMoney", _cash0,true];

// is %chance greater than random number[30026.7,17458.6,5]O_T_VTOL_02_vehicle_grey_F
if (_VehicleChance >= (random 100)) then {
											_pinCode = (1000 +(round (random 8999)));
											_vehicle = ["B_Heli_Transport_01_camo_F",[5060.55,4582.94,0],_pinCode] call DMS_fnc_SpawnPersistentVehicle;
											_msgWIN = ['#0080ff',format ["Haste gut gemacht der code ist %1...",_pinCode]];
											} else
											{
											_vehicle = ["B_Heli_Transport_01_camo_F",[5060.55,4582.94,0]] call DMS_fnc_SpawnNonPersistentVehicle;
											_msgWIN = ['#0080ff',"Haste gut gemacht code gibt es nicht"];
											};

// Define mission-spawned objects and loot values with vehicle
_missionObjs =
[
	_staticGuns,			// static gun(s). Note, we don't add the base itself because it already spawns on server start.
	[_vehicle],				// vehicle prize
	[[_crate0,_crate_loot_values0]]
];	
											
// Define Mission Start message
_msgStart = ['#FFFF00',format["Luftwaffe der %1 Truppen",_difficultyM]];

// Define Mission Win message defined in vehicle choice

// Define Mission Lose message
_msgLOSE = ['#FF0000',"Kein wunder mit der Knifte"];

// Define mission name (for map marker and logging)
_missionName = "Luftwaffe";

// Create Markers
_markers =
[
	_pos,
	_missionName,
	_difficultyM
] call DMS_fnc_CreateMarker;

_circle = _markers select 1;
_circle setMarkerDir 0;
_circle setMarkerSize [400,400];

_time = diag_tickTime;

// Parse and add mission info to missions monitor
_added =
[
	_pos,
	[
		[
			"kill",
			_group
		],
		[
			"playerNear",
			[_pos,100]
		]
	],
	_groupReinforcementsInfo,
	[
		_time,
		DMS_StaticMissionTimeOut call DMS_fnc_SelectRandomVal
	],
	_missionAIUnits,
	_missionObjs,
	[_missionName,_msgWIN,_msgLOSE],
	_markers,
	_side,
	_difficultyM,
	[[],[]]
] call DMS_fnc_AddMissionToMonitor_Static;

// Check to see if it was added correctly, otherwise delete the stuff
if !(_added) exitWith
{
	diag_log format ["DMS ERROR :: Attempt to set up mission %1 with invalid parameters for DMS_fnc_AddMissionToMonitor_Static! Deleting mission objects and resetting DMS_MissionCount.",_missionName];

	_cleanup = [];
	{
		_cleanup pushBack _x;
	} forEach _missionAIUnits;

	_cleanup pushBack ((_missionObjs select 0)+(_missionObjs select 1));
	
	{
		_cleanup pushBack (_x select 0);
	} foreach (_missionObjs select 2);

	_cleanup call DMS_fnc_CleanUp;

	// Delete the markers directly
	{deleteMarker _x;} forEach _markers;

	// Reset the mission count
	DMS_MissionCount = DMS_MissionCount - 1;
};

// Notify players
[_missionName,_msgStart] call DMS_fnc_BroadcastMissionStatus;

if (DMS_DEBUG) then
{
	(format ["MISSION: (%1) :: Mission #%2 started at %3 with %4 AI units and %5 difficulty at time %6",_missionName,_num,_pos,_AICount,_difficulty,_time]) call DMS_fnc_DebugLog;
};