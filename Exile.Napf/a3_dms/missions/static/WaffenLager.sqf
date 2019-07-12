/*
	"WaffenLager." v1 static mission for Australia.
	Created by Thomas TKO
	O_T_LSV_02_armed_viper_F increases persistent chance with difficulty
	tko-gameserver.de
*/

private ["_AICount", "_AIMaxReinforcements", "_AItrigger", "_AIwave", "_AIdelay", "_staticguns", "_missionObjs", "_crate0", "_cash0", "_crate_loot_values0", "_crate_weapons0", "_crate_items0", "_difficultyM", "_difficulty", "_PossibleDifficulty", "_msgWIN", "_vehicle", "_pinCode", "_VehicleChance"];

// For logging purposes
_num = DMS_MissionCount;

// Set mission side (only "bandit" is supported for now)
_side = "bandit";

_pos = [16413.8,18429.1,0]; //insert the centre here

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
_AICount = (20 + (round (random 2)));					//AI starting numbers
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
_AICount = (20 + (round (random 5)));
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 50;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (50 + (round (random 5)));
_crate_items0 		= (30 + (round (random 5)));
_cash0 = (60000 + round (random (15000)));				//Tabs for crate0
	};
	case "difficult":
	{
_difficulty = "difficult";
_AICount = (22 + (round (random 5)));
_AIMaxReinforcements = (1 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 80;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (60 + (round (random 5)));
_crate_items0 		= (40 + (round (random 5)));
_cash0 = (70000 + round (random (15000)));				//Tabs for crate0
	};
	//case "hardcore":
	default
	{
_difficulty = "hardcore";
_AICount = (25 + (round (random 5)));
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
	[16422.6,18438.1,0],
	[16404.1,18455.4,0],
	[16363.9,18484.4,0],
	[16333.3,18439.9,0],
	[16377.1,18421.8,0],
	[16346.7,18470.8,0],
	[16333.4,18385.4,0],
	[16349.6,18371.8,0],
	[16367.4,18360.4,0],
	[16390.3,18342.4,0],
	[16425.9,18314.8,0],
	[16470.5,18371.7,0],
	[16463.9,18340,0],
	[16542.2,18292.1,0],
	[16505,18262.4,0],
	[16575.7,18301.7,0],
	[16632.2,18243.8,0],
	[16590.1,18262.5,0],
	[16565.5,18230.5,0],
	[16505.7,18205.8,0],
	[16536.2,18259.3,0],
	[16585.7,18153.8,0],
	[16582.9,18191.1,0],
	[16591.9,18228.1,0],
	[16580.6,18209.3,0],
	[16622.7,18267.7,0],
	[16524.9,18229.4,0],
	[16425.4,18493.7,0],
	[16423.2,18391.2,0]
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
	[16258.4,18418.4,7.786],
	[16282.8,18449,20.382],
	[16298.4,18443.6,5.866],
	[16301.8,18383,20.408],
	[16301.3,18385.6,20.366],
	[16385,18325.9,20.382],
	[16479.8,18473.5,7.764],
	[16475.1,18356.2,6.137],
	[16421.1,18287.7,7.706],
	[16538.5,18285.7,5.866],
	[16503.5,18238.5,20.382],
	[16480.2,18207.9,7.805],
	[16588,18119,7.706],
	[16656.6,18209.3,7.706],
	[16618.5,18277.5,5.788],
	[16605.4,18282.9,20.345],
	[16607.1,18281.6,20.316],
	[16562.3,18318.5,7.740],
	[16511.1,18250.5,5.866],
	//HMG Boden
	[16323.9,18437.8,0],
	[16318.3,18414.2,0],
	[16331,18378.3,0],
	[16338.1,18375.5,0],
	[16365.6,18351.6,0],
	[16398.1,18363.9,0],
	[16406.9,18389.1,0],
	[16355.8,18428.3,0],
	[16347,18431.9,0],
	[16341.4,18478.1,0],
	[16352.7,18501.9,0],
	[16384.7,18550.9,0],
	[16406.3,18484.2,0],
	[16454.7,18496.8,0],
	[16462.9,18444.2,0],
	[16393.8,18406.9,0],
	[16401.1,18401.6,0],
	[16455.7,18401.7,0],
	[16484.1,18388.1,0],
	[16410.7,18342,0],
	[16409.5,18308.5,0],
	[16518.6,18262,0],
	[16624.5,18276.4,0],
	[16626.8,18263.5,0],
	[16603.1,18227.9,0],
	[16556,18221,0]
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
	[16258.4,18418.4,7.786],
	[16282.8,18449,20.382],
	[16298.4,18443.6,5.866],
	[16301.8,18383,20.408],
	[16301.3,18385.6,20.366],
	[16385,18325.9,20.382],
	[16479.8,18473.5,7.764],
	[16475.1,18356.2,6.137],
	[16421.1,18287.7,7.706],
	[16538.5,18285.7,5.866],
	[16503.5,18238.5,20.382],
	[16480.2,18207.9,7.805],
	[16588,18119,7.706],
	[16656.6,18209.3,7.706],
	[16618.5,18277.5,5.788],
	[16605.4,18282.9,20.345],
	[16607.1,18281.6,20.316],
	[16562.3,18318.5,7.740],
	[16511.1,18250.5,5.866],
	//HMG Boden
	[16323.9,18437.8,0],
	[16318.3,18414.2,0],
	[16331,18378.3,0],
	[16338.1,18375.5,0],
	[16365.6,18351.6,0],
	[16398.1,18363.9,0],
	[16406.9,18389.1,0],
	[16355.8,18428.3,0],
	[16347,18431.9,0],
	[16341.4,18478.1,0],
	[16352.7,18501.9,0],
	[16384.7,18550.9,0],
	[16406.3,18484.2,0],
	[16454.7,18496.8,0],
	[16462.9,18444.2,0],
	[16393.8,18406.9,0],
	[16401.1,18401.6,0],
	[16455.7,18401.7,0],
	[16484.1,18388.1,0],
	[16410.7,18342,0],
	[16409.5,18308.5,0],
	[16518.6,18262,0],
	[16624.5,18276.4,0],
	[16626.8,18263.5,0],
	[16603.1,18227.9,0],
	[16556,18221,0]
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
	[[16391,18450.4,0],"I_CargoNet_01_ammo_F"]
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
											_vehicle = ["B_CTRG_Heli_Transport_01_tropic_F",[16413.8,18429.1,0],_pinCode] call DMS_fnc_SpawnPersistentVehicle;
											_msgWIN = ['#0080ff',format ["Haste schoen gemacht der code ist %1...",_pinCode]];
											} else
											{
											_vehicle = ["B_CTRG_Heli_Transport_01_tropic_F",[16413.8,18429.1,0]] call DMS_fnc_SpawnNonPersistentVehicle;
											_msgWIN = ['#0080ff',"Haste schoen gemacht code gibt es nicht"];
											};

// Define mission-spawned objects and loot values with vehicle
_missionObjs =
[
	_staticGuns,			// static gun(s). Note, we don't add the base itself because it already spawns on server start.
	[_vehicle],				// vehicle prize
	[[_crate0,_crate_loot_values0]]
];	
											
// Define Mission Start message
_msgStart = ['#FFFF00',format["Party am WaffenLager mit %1 Truppen",_difficultyM]];

// Define Mission Win message defined in vehicle choice

// Define Mission Lose message
_msgLOSE = ['#FF0000',"Kein wunder mit der Knifte"];

// Define mission name (for map marker and logging)
_missionName = "WaffenLager";

// Create Markers
_markers =
[
	_pos,
	_missionName,
	_difficultyM
] call DMS_fnc_CreateMarker;

_circle = _markers select 1;
_circle setMarkerDir 0;
_circle setMarkerSize [600,600];

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