/*
	"TKO Straßensperre" v 1 static mission for Australia.
*/

private ["_AICount", "_AIMaxReinforcements", "_AItrigger", "_AIwave", "_AIdelay", "_staticguns", "_missionObjs", "_crate0", "_cash0", "_crate_loot_values0", "_crate_weapons0", "_crate_items0", "_difficultyM", "_difficulty", "_PossibleDifficulty", "_msgWIN", "_vehicle", "_pinCode", "_VehicleChance"];

// For logging purposes
_num = DMS_MissionCount;

// Set mission side (only "bandit" is supported for now)
_side = "bandit";

_pos = [4456.78,8133.51,0]; //insert the centre here

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
_AICount = (22 + (round (random 2)));					//AI starting numbers
_AIMaxReinforcements = (4 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (1 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 90;									//10% SpawnPersistentVehicle chance
_crate_weapons0 	= (40 + (round (random 5)));		//Crate 0 weapons number
_crate_items0 		= (30 + (round (random 5)));		//Crate 0 items number
_cash0 = (30000 + round (random (15000)));				//Tabs for crate0
	};
	case "moderate":
	{
_difficulty = "moderate";
_AICount = (24 + (round (random 2)));
_AIMaxReinforcements = (6 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (2 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 90;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (50 + (round (random 5)));
_crate_items0 		= (30 + (round (random 5)));
_cash0 = (40000 + round (random (15000)));				//Tabs for crate0
	};
	case "difficult":
	{
_difficulty = "difficult";
_AICount = (24 + (round (random 5)));
_AIMaxReinforcements = (10 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (3 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 90;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (60 + (round (random 5)));
_crate_items0 		= (40 + (round (random 5)));
_cash0 = (40000 + round (random (15000)));				//Tabs for crate0
	};
	//case "hardcore":
	default
	{
_difficulty = "hardcore";
_AICount = (25 + (round (random 5)));
_AIMaxReinforcements = (12 + (round (random 1)));		//AI reinforcement cap , AI Verstärkungskappe
_AItrigger = (6 + (round (random 2)));					//If AI numbers fall below this number then reinforce if any left from AIMax , Maximaler AI-Wert in Verstärkungswellen
_AIwave = (3 + (round (random 1)));						//Max amount of AI in reinforcement wave
_AIdelay = (1 + (round (random 1)));					//The delay between reinforcements ,Die Verzögerung zwischen Verstärkungen
_VehicleChance = 90;									//20% SpawnPersistentVehicle chance
_crate_weapons0 	= (60 + (round (random 5)));
_crate_items0 		= (50 + (round (random 5)));
_cash0 = (50000 + round (random (15000)));				//Tabs for crate0
	};
};

// Define spawn locations for AI Soldiers. These will be used for the initial spawning of AI as well as reinforcements.
// The center spawn location is added 3 times so at least 3 AI will spawn initially at the center location, and so that future reinforcements are more likely to spawn at the center.
_AISoldierSpawnLocations =
[
	//AI
	[4466.65,8123.03,0],
	[4461.68,8138.22,0],
	[4437.14,8151.93,0],
	[4442,8174.43,0],
	[4451.68,8177.94,0],
	[4456.66,8158.73,0],
	[4447.47,8158.64,0],
	[4442.98,8133.31,0],
	[4454.61,8122.08,0],
	[4439.83,8123.55,0],
	[4424.88,8128.69,0],
	[4425.13,8115.6,0],
	[4466.04,8090.14,0],
	[4481.09,8100.32,0],
	[4488.78,8121.5,0],
	[4480.68,8142.24,0]
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
    //Hoch
	[4481.5,8112.75,17.746],
	[4473.29,8118.17,17.983],
	[4473.63,8109.65,17.987],
	[4479.56,8115.14,4.560],
	[4473.37,8116.04,8.680],
	[4448.19,8100.39,3.247],
	[4443.82,8103.41,3.253],
	[4447.79,8110.83,3.101],
	[4433.44,8131.45,4.384],
	[4459.2,8175.32,4.306],
	//Boden
	[4480.77,8123.69,0],
	[4478.35,8130.97,0],
	[4478.43,8136.52,0],
	[4474.29,8134.65,0],
	[4431.52,8111.93,0],
	[4434.73,8111.78,0],
	[4431.39,8116.89,0],
	[4434.31,8123.38,0],
	[4432.23,8178.85,0],
	[4457.43,8188.47,0],
	[4461.84,8183.95,0],
	[4432.16,8170.59,0],
	[4440.76,8167.33,0],
	[4447.67,8150.07,0],
	[4467.79,8144.34,0],
	[4447.8,8135.87,0],
	[4471.34,8107.48,0],
	[4432.59,8133.9,0],
	[4458.95,8098.06,0],
	[4461.92,8129.83,0],
	[4449.58,8118.95,0]
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
    //Hoch
	[4481.5,8112.75,17.746],
	[4473.29,8118.17,17.983],
	[4473.63,8109.65,17.987],
	[4479.56,8115.14,4.560],
	[4473.37,8116.04,8.680],
	[4448.19,8100.39,3.247],
	[4443.82,8103.41,3.253],
	[4447.79,8110.83,3.101],
	[4433.44,8131.45,4.384],
	[4459.2,8175.32,4.306],
	//Boden
	[4480.77,8123.69,0],
	[4478.35,8130.97,0],
	[4478.43,8136.52,0],
	[4474.29,8134.65,0],
	[4431.52,8111.93,0],
	[4434.73,8111.78,0],
	[4431.39,8116.89,0],
	[4434.31,8123.38,0],
	[4432.23,8178.85,0],
	[4457.43,8188.47,0],
	[4461.84,8183.95,0],
	[4432.16,8170.59,0],
	[4440.76,8167.33,0],
	[4447.67,8150.07,0],
	[4467.79,8144.34,0],
	[4447.8,8135.87,0],
	[4471.34,8107.48,0],
	[4432.59,8133.9,0],
	[4458.95,8098.06,0],
	[4461.92,8129.83,0],
	[4449.58,8118.95,0]
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
	[[4456.78,8133.51,0],"I_CargoNet_01_ammo_F"]
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

// is %chance greater than random number O_APC_Tracked_02_cannon_F   O_T_APC_Wheeled_02_rcws_ghex_F  B_APC_Tracked_01_rcws_F   gorgon I_APC_Wheeled_03_cannon_F
if (_VehicleChance >= (random 100)) then {
											_pinCode = (1000 +(round (random 8999)));
											_vehicle = ["MrShounka_porsche911_Rework_noir_f",[4478.91,8158.18,0],_pinCode] call DMS_fnc_SpawnPersistentVehicle;
											_msgWIN = ['#0080ff',format ["Ihr seid aus der Sperre entkommen und bekommt den preis, code ist %1...",_pinCode]];
											} else
											{
											_vehicle = ["MrShounka_porsche911_Rework_noir_f",[4478.91,8158.18,0]] call DMS_fnc_SpawnNonPersistentVehicle;
											_msgWIN = ['#0080ff',"Ihr seid aus der Sperre entkommen"];
											};

// Define mission-spawned objects and loot values with vehicle
_missionObjs =
[
	_staticGuns,			// static gun(s). Note, we don't add the base itself because it already spawns on server start.
	[_vehicle],				// vehicle prize
	[[_crate0,_crate_loot_values0]]
];	
											
// Define Mission Start message
_msgStart = ['#FFFF00',format["Im Schlachthaus wird Bier umgeladen von %1 terrorists",_difficultyM]];

// Define Mission Win message defined in vehicle choice

// Define Mission Lose message
_msgLOSE = ['#FF0000',"Das Bier ist futsch."];

// Define mission name (for map marker and logging)
_missionName = "Straßensperre";

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