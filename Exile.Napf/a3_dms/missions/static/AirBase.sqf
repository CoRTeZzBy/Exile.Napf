/*
	"TKO AirBase" v 1 static mission for Australia.
*/

private ["_AICount", "_AIMaxReinforcements", "_AItrigger", "_AIwave", "_AIdelay", "_staticguns", "_missionObjs", "_crate0", "_cash0", "_crate_loot_values0", "_crate_weapons0", "_crate_items0", "_difficultyM", "_difficulty", "_PossibleDifficulty", "_msgWIN", "_vehicle", "_pinCode", "_VehicleChance"];

// For logging purposes
_num = DMS_MissionCount;

// Set mission side (only "bandit" is supported for now)
_side = "bandit";

_pos = [14321.9,16940.5,0]; //insert the centre here

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
_cash0 = (30000 + round (random (15000)));				//Tabs for crate0
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
_cash0 = (40000 + round (random (15000)));				//Tabs for crate0
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
_cash0 = (50000 + round (random (15000)));				//Tabs for crate0
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
_cash0 = (60000 + round (random (15000)));				//Tabs for crate0
	};
};

// Define spawn locations for AI Soldiers. These will be used for the initial spawning of AI as well as reinforcements.
// The center spawn location is added 3 times so at least 3 AI will spawn initially at the center location, and so that future reinforcements are more likely to spawn at the center.
_AISoldierSpawnLocations =
[
	//AI
	[14356.4,16908.2,0],
	[14350.9,16904.5,0],
	[14336.2,16893.4,0],
	[14311.8,16900,0],
	[14298.3,16914.3,0],
	[14285.2,16929.1,0],
	[14281.5,16959.1,0],
	[14335.2,16943.9,0],
	[14307.1,16976,0],
	[14259.9,17000.9,0],
	[14247.9,16973.2,0],
	[14269.9,17008.2,0],
	[14274.5,16998.9,0],
	[14330.1,16950.4,0]
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
	[14370.9,16914.5,17.914],
	[14366.6,16907.2,17.864],
	[14331.8,16879.2,17.954],
	[14326.9,16885.5,17.877],
	[14237.2,16981.7,17.988],
	[14241,16989,17.947],
	[14278.4,17011.5,17.889],
	[14279.2,17021.7,17.889],
	[14275.5,16942.8,3.050],
	[14276,16951.3,3.157],
	[14269.4,16965.2,3.145],
	[14270,16958.3,3.097],
	[14262.1,16960.2,3.145],
	[14307.7,16994.5,8.897],
	[14294.2,16997,9.049],
	[14348.2,16895.8,5.852],
	[14319.5,16897.2,0.173],
	[14298.7,16923.2,0.166],
	//Neu
	[14360.9,16913.7,17.867],
	[14367.6,16915.3,4.658],
	[14279.9,17019.8,4.641],
	//HMG Boden
	[14360.5,16904.4,0],
	[14348,16896.4,0],
	[14324,16878.4,0],
	[14239.1,16982,0],
	[14281.2,17020.3,0],
	[14283.9,17008.6,0],
	[14306.9,16987.2,0],
	[14330.3,16957.7,0],
	[14345.2,16934.9,0],
	[14355.7,16923.1,0],
	[14369.2,16914.6,0],
	[14320.2,16906.7,0],
	[14313.8,16933.7,0],
	[14291.1,16946.3,0],
	[14264.7,16980.4,0],
	[14288.2,16997,0],
	//Neu
	[14316.5,16975.6,0]
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
	[14370.9,16914.5,17.914],
	[14366.6,16907.2,17.864],
	[14331.8,16879.2,17.954],
	[14326.9,16885.5,17.877],
	[14237.2,16981.7,17.988],
	[14241,16989,17.947],
	[14278.4,17011.5,17.889],
	[14279.2,17021.7,17.889],
	[14275.5,16942.8,3.050],
	[14276,16951.3,3.157],
	[14269.4,16965.2,3.145],
	[14270,16958.3,3.097],
	[14262.1,16960.2,3.145],
	[14307.7,16994.5,8.897],
	[14294.2,16997,9.049],
	[14348.2,16895.8,5.852],
	[14319.5,16897.2,0.173],
	[14298.7,16923.2,0.166],
	//Neu
	[14360.9,16913.7,17.867],
	[14367.6,16915.3,4.658],
	[14279.9,17019.8,4.641],
	//HMG Boden
	[14360.5,16904.4,0],
	[14348,16896.4,0],
	[14324,16878.4,0],
	[14239.1,16982,0],
	[14281.2,17020.3,0],
	[14283.9,17008.6,0],
	[14306.9,16987.2,0],
	[14330.3,16957.7,0],
	[14345.2,16934.9,0],
	[14355.7,16923.1,0],
	[14369.2,16914.6,0],
	[14320.2,16906.7,0],
	[14313.8,16933.7,0],
	[14291.1,16946.3,0],
	[14264.7,16980.4,0],
	[14288.2,16997,0],
	//Neu
	[14316.5,16975.6,0]
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
	//[[23186.5,19779.8,0.0],"I_CargoNet_01_ammo_F"],
	//[[23084.9,19778.4,0.0],"I_CargoNet_01_ammo_F"],
	//[[23148.9,19707.6,0.0],"I_CargoNet_01_ammo_F"],
	//[[23096.8,19664.5,0.0],"I_CargoNet_01_ammo_F"],
	//[[23128,19658.4,0.0],"I_CargoNet_01_ammo_F"],
	//[[23162.2,19682.3,0.0],"I_CargoNet_01_ammo_F"],
	[[14349,16927.4,0],"I_CargoNet_01_ammo_F"]
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

// is %chance greater than random number O_APC_Tracked_02_cannon_F   O_T_APC_Wheeled_02_rcws_ghex_F  B_APC_Tracked_01_rcws_F   gorgon I_APC_Wheeled_03_cannon_F ["O_T_APC_Tracked_02_cannon_ghex_F",[14321.9,16940.5,0],
if (_VehicleChance >= (random 100)) then {
											_pinCode = (1000 +(round (random 8999)));
											_vehicle = ["MrShounka_mp4_Rework_p_noir_f",[14321.9,16940.5,0],_pinCode] call DMS_fnc_SpawnPersistentVehicle;
											_msgWIN = ['#0080ff',format ["Ihr habt die AirBase gesichert, code ist %1...",_pinCode]];
											} else
											{
											_vehicle = ["MrShounka_mp4_Rework_p_verte_f",[14321.9,16940.5,0]] call DMS_fnc_SpawnNonPersistentVehicle;
											_msgWIN = ['#0080ff',"Ihr habt die AirBase gesichert"];
											};

// Define mission-spawned objects and loot values with vehicle
_missionObjs =
[
	_staticGuns,			// static gun(s). Note, we don't add the base itself because it already spawns on server start.
	[_vehicle],				// vehicle prize
	[[_crate0,_crate_loot_values0]]
];	
											
// Define Mission Start message
_msgStart = ['#FFFF00',format["In der AirBase werden Waffen von %1 Söldner verladen",_difficultyM]];

// Define Mission Win message defined in vehicle choice

// Define Mission Lose message
_msgLOSE = ['#FF0000',"Truppen haben den Waffen gesichert."];

// Define mission name (for map marker and logging)
_missionName = "AirBase";

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