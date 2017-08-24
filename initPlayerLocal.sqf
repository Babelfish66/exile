///////////////////////////////////////////////////////////////////////////////
// Static Objects
///////////////////////////////////////////////////////////////////////////////

if (!hasInterface || isServer) exitWith {};

////////////////////////////////////////////////
//Dupe fixe
////////////////////////////////////////////////
[30, 		// Delay, in seconds
{
private _fnc_isValid =
{
	private _linkedItems = configFile >> "CfgWeapons" >> _this >> "LinkedItems";

	private _isValid = true;
	{
		if !((getText (_linkedItems >> _x >> "item")) isEqualTo "") exitWith {_isValid = false};
	} forEach ["LinkedItemsOptic","LinkedItemsAcc","LinkedItemsMuzzle","LinkedItemsUnder"];

	_isValid
};
private _fnc_getLoadedMags =
{
	private _loadedMags = [];
	{
		if ((_x select 3) isEqualTo _this) then
		{
			_loadedMags pushBack [_x select 0,_x select 1];
		};
	} forEach (magazinesAmmoFull player);
	_loadedMags
};

private _primary = primaryWeapon player;
if (!(_primary isEqualTo "") && {!(_primary call _fnc_isValid)}) then
{
	private _replacement = "";

	{
		if ((configName _x) call _fnc_isValid) exitWith {_replacement = configName _x;};
	} forEach ((configFile >> "CfgWeapons" >> _primary) call BIS_fnc_returnParents);


	if (isText (configFile >> "CfgWeapons" >> _replacement >> "displayName")) then		// This bit ensures that the replacement weapon is an actual weapon, and not just a base class.
	{
		private _currentWeaponItems = primaryWeaponItems player;
		private _loadedMags_Original = 1 call _fnc_getLoadedMags;

		private _currentWeapon = currentWeapon player;

		player removeWeapon _primary;
		player addWeapon _replacement;

		private _loadedMags_Replacement = 1 call _fnc_getLoadedMags;

		if (_currentWeapon isEqualTo _primary) then
		{
			player selectWeapon _replacement;
		};

		{
			if !(_x isEqualTo "") then
			{
				player addPrimaryWeaponItem _x;
			};
		} forEach _currentWeaponItems;

		{
			player addWeaponItem [_replacement, _x];
		} forEach _loadedMags_Original;

		{player addMagazine _x} forEach _loadedMags_Replacement;
	};
};

private _handgun = handgunWeapon player;
if (!(_handgun isEqualTo "") && {!(_handgun call _fnc_isValid)}) then
{
	private _replacement = "";

	{
		if ((configName _x) call _fnc_isValid) exitWith {_replacement = configName _x;};
	} forEach ((configFile >> "CfgWeapons" >> _handgun) call BIS_fnc_returnParents);


	if (isText (configFile >> "CfgWeapons" >> _replacement >> "displayName")) then
	{
		private _currentWeaponItems = handgunItems player;
		private _loadedMags_Original = 2 call _fnc_getLoadedMags;

		private _currentWeapon = currentWeapon player;

		player removeWeapon _handgun;
		player addWeapon _replacement;

		private _loadedMags_Replacement = 2 call _fnc_getLoadedMags;

		if (_currentWeapon isEqualTo _handgun) then
		{
			player selectWeapon _replacement;
		};

		{
			if !(_x isEqualTo "") then
			{
				player addHandgunItem _x;
			};
		} forEach _currentWeaponItems;

		{
			player addWeaponItem [_replacement, _x];
		} forEach _loadedMags_Original;

		{player addMagazine _x} forEach _loadedMags_Replacement;
	};
};
},[],true] call ExileClient_system_thread_addTask;

////////////////////////////////////////////
//Dupe fix end
///////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
// Vybor Traders
///////////////////////////////////////////////////////////////////////////
#include "traderrussianr.sqf"
///////////////////////////////////////////////////////////////////////////
// Vybor Vehicle Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Vehicle",
	"Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3780.82,14080.52,0.101166],
    157.522
]
call ExileClient_object_trader_create;
  
///////////////////////////////////////////////////////////////////////////
// Vybor Hardware Trader
///////////////////////////////////////////////////////////////////////////

_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 204.239;
_workBench setPosATL [3816.36,14074.08,0.0464783];

_trader = 
[
    "Exile_Trader_Hardware",
	"Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    _workBench
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Armory Trader
///////////////////////////////////////////////////////////////////////////
_chair = "Land_CampingChair_V2_F" createVehicleLocal [0,0,0];
_chair setDir 307.332;    
_chair setPosATL [3802.79,14068.49,0.0621948];

_trader =
[
    "Exile_Trader_Armory",
	"Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["InBaseMoves_SittingRifle1"],
    [0, -0.15, -0.45],
    180,
    _chair
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_SpecialOperations",
	"Exile_Trader_SpecialOperations",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3815.71,14057.93,0.0636292],
    33.4256
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Vehicle Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_VehicleCustoms",
	"Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [3798.62,14074.57,0.00149536],
    306.098
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Food Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Food",
	"Exile_Trader_Food",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3813.74,14068.08,0.0636902],
    187.627
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Equipment",
	"Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3819.96,14065.24,0.0636292],
    202.523
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Mafia Trader Office
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Office",
	"Exile_Trader_Office",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3803.36,14075.37,0.0636902],
    72.2944
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Waste Dump Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_WasteDump",
	"Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [3804,14084.08,0.00137329],
    110.134
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Guard 01
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Guard_01",
	"",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [3819.38,14057.03,4.75092],
    141.103
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Guard 02
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Guard_02",
	"",
    "WhiteHead_03",
    ["InBaseMoves_patrolling2"],
    [3827.68,14064.11,0.00143433],
    150.082
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vybor Guard 03
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Guard_03",
	"",
    "AfricanHead_03",
    ["InBaseMoves_patrolling1"],
    [3800.61,14070,4.74426],
    277.653
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Vysona
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
// Vysota Vehicle Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Vehicle",
	"Exile_Trader_Vehicle",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [6945.19,8313.36,0.00144529],
    147.799
]
call ExileClient_object_trader_create;
////////////////////////////////////////////////////////////////////////////
//Vysota Vehicle Custom Traders
/////////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_VehicleCustoms",
	"Exile_Trader_VehicleCustoms",
    "WhiteHead_11",
    ["AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"],
    [6939.83,8315.33,0.305107],
    56.0869
]
call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////
// Vysota Food Trader
//////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Food",
	"Exile_Trader_Food",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [6918.62,8330.57,0.00144053],
    109.597
]

call ExileClient_object_trader_create;
/////////////////////////////////////////////////////////////
//Vysota Hardware Trader
/////////////////////////////////////////////////////////////
_workBench = "Land_Workbench_01_F" createVehicleLocal [0,0,0];
_workBench setDir 11.123;
_workBench setPosATL [6936.23,8343.65,0.00142241];

_trader = 
[
    "Exile_Trader_Hardware",
	"Exile_Trader_Hardware",
    "WhiteHead_17",
    ["InBaseMoves_sitHighUp1"],
    [0, 0, -0.5],
    170,
    _workBench
]
call ExileClient_object_trader_create;
/////////////////////////////////////////////////////////
// Vysota Waste dump Trader
////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_WasteDump",
	"Exile_Trader_WasteDump",
    "GreekHead_A3_01",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [6956.36,8347.81,0.00145006],
    210.968
]
call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////////////
// Vysota Equipment Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Equipment",
	"Exile_Trader_Equipment",
    "WhiteHead_19",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [6969.36,8335.58,0.00143623],
    199.693
]

call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////////////
// Vysota Armory Trader
///////////////////////////////////////////////////////////////////////////
_chair = "Land_CampingChair_V2_F" createVehicleLocal [0,0,0];
_chair setDir 112.977;    
_chair setPosATL [6972.88,8329.19,0.00143862];

_trader =
[
    "Exile_Trader_Armory",
	"Exile_Trader_Armory",
    "PersianHead_A3_02",
    ["InBaseMoves_SittingRifle1"],
    [0, -0.15, -0.45],
    180,
    _chair
]
call ExileClient_object_trader_create;              
///////////////////////////////////////////////////////////////////////////
// Vysota Mafia Trader Office
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Office",
	"Exile_Trader_Office",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [6925.4,8340.4,0.0585246],
    106.96
]
call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////////////
// Vysota Specops Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_SpecialOperations",
	"Exile_Trader_SpecialOperations",
    "WhiteHead_11",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [6923.24,8322.92,0.533625],
    142.635
]
call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////////////
// Vysota Guard 01
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_01",
	"",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [6949.91,8307.54,0.00143862],
    90.8003
]

call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////////////
// Vysota Guard 02
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_02",
	"",
    "WhiteHead_03",
    ["InBaseMoves_patrolling2"],
    [6964.51,8351.73,0.0014081],
    103.56
]

call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Krasnostav Aircraft Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_Aircraft",
	"Exile_Trader_Aircraft",
    "WhiteHead_17",
    ["LHD_krajPaluby"],
    [12191.7,17721.1,9.419],
    145.82
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////////
// Krasnostav Aircraft Customs Trader
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Trader_AircraftCustoms",
	"Exile_Trader_AircraftCustoms",
    "GreekHead_A3_07",
    ["HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"],
    [12161,17729.5,0.00140381],
    337.472
]
call ExileClient_object_trader_create;


///////////////////////////////////////////////////////////////////////////
// Krasnostav Guard 01
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_01",
	"",
    "WhiteHead_17",
    ["InBaseMoves_patrolling1"],
    [12189.7,17717.7,13.276],
    291
]

call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////////////
// Krasnostav Guard 02
///////////////////////////////////////////////////////////////////////////
_trader = 
[
    "Exile_Guard_02",
	"",
    "WhiteHead_03",
    ["InBaseMoves_patrolling2"],
    [12138.4,17722.6,0.00138855],
    194.892
]

call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////////////
// Kamenka Boat Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Boat",
	"Exile_Trader_Boat",
    "GreekHead_A3_06",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [1759.53,7123.86,2.3835],
    354.377
]
call ExileClient_object_trader_create;
///////////////////////////////////////////////////////////////////////////
// Solnichny Boat Trader
///////////////////////////////////////////////////////////////////////////
_trader =
[
    "Exile_Trader_Boat",
	"Exile_Trader_Boat",
    "WhiteHead_20",
    ["HubStandingUA_move1", "HubStandingUA_move2", "HubStandingUA_idle1", "HubStandingUA_idle2", "HubStandingUA_idle3"],
    [13549,11375.5,5.83101],
    266.433
]
call ExileClient_object_trader_create;

///////////////////////////////////////////////////////////////////////
//Kamenka Dive Trader
////////////////////////////////////////////////////////////////////////
_trader =
[
	"Exile_Trader_Diving", 
	"Exile_Trader_Diving",
	"WhiteHead_15",
	["AmovPsitMstpSrasWrflDnon_WeaponCheck1","AmovPsitMstpSrasWrflDnon_WeaponCheck2"], 
	["arifle_SDAR_F","20Rnd_556x45_UW_mag","Exile_Uniform_Wetsuit_CSAT","V_RebreatherIR","Exile_Glasses_Diving_CSAT"],
    [1759.39,7139.15,0.00138879],
    348.496
[
call ExileClient_object_trader_create;