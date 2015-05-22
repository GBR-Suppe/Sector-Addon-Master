/*
	File: 		Sector_addon militarize.sqf
	Author: 	SPUn / lostvar    http://forums.bistudio.com/showthread.php?165089-AI-Spawn-Script-Pack
	Edition: 	Suppe edition
*/
if (!isServer)exitWith{};
private ["_greenMenArray","_grpId","_customInit","_cPos","_skls","_skills","_dir","_range","_unitType","_unit","_radius","_men","_vehicles","_still","_centerPos","_menAmount","_vehAmount","_milHQ","_milGroup","_menArray","_blueMenArray","_redMenArray","_yellowMenArray","_side","_pos","_yellowCarArray","_allUnitsArray","_menRatio","_vehRatio","_diveArray","_validPos","_side","_driver","_whichOne","_vehicle","_crew","_thisArray","_smokesAndChems","_doorHandling","_BLUdivers","_OPFdivers","_INDdivers"];

//Extra options:
_smokesAndChems = true;
_doorHandling = true;
//
diag_log "***[Sector] Spawn Sector Militarize Guards***";

_cPos = if(count _this > 0)then{_this select 0;};
_side = if (count _this > 1) then { _this select 1; }else{2;};
_radius = if (count _this > 2) then { _this select 2; }else{150;};
_men = if (count _this > 3) then { _this select 3; }else{[true,false];};
_vehicles = if (count _this > 4) then { _this select 4; }else{[true,false,false];};
_still = if (count _this > 5) then { _this select 5; }else{false;};
_menRatio = if (count _this > 6) then { _this select 6; }else{0.3;};
_vehRatio = if (count _this > 7) then { _this select 7; }else{0.02;};
_skills = if (count _this > 8) then { _this select 8; }else{"default";};
_milGroup = if (count _this > 9) then { _this select 9; }else{nil;}; if(!isNil("_milGroup"))then{if(_milGroup == "nil0")then{_milGroup = nil;};};
_customInit = if (count _this > 10) then { _this select 10; }else{nil;}; if(!isNil("_customInit"))then{if(_customInit == "nil0")then{_customInit = nil;};};
_grpId = if (count _this > 11) then { _this select 11; }else{nil;}; 

if(_cPos in allMapMarkers)then{
	_centerPos = getMarkerPos _cPos;
}else{
	if (typeName _cPos == "ARRAY") then{
		_centerPos = _cPos;
	}else{
		_centerPos = getPos _cPos;
	};
};

if(isNil("LV_ACskills"))then{LV_ACskills = compile preprocessFile "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_ACskills.sqf";};
if(isNil("LV_vehicleInit"))then{LV_vehicleInit = compile preprocessFile "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_vehicleInit.sqf";};

if(isNil("LV_fullLandVehicle"))then{LV_fullLandVehicle = compile preprocessFile "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_fullLandVehicle.sqf";};
if(isNil("LV_fullAirVehicle"))then{LV_fullAirVehicle = compile preprocessFile "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_fullAirVehicle.sqf";};
if(isNil("LV_fullWaterVehicle"))then{LV_fullWaterVehicle = compile preprocessFile "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_fullWaterVehicle.sqf";};

if(typeName _menRatio == "ARRAY")then{	
	_menAmount = (_menRatio select 0) + (random (_menRatio select 1));
}else{
	_menAmount = round (_radius * _menRatio);
};
if(typeName _vehRatio == "ARRAY")then{	
	_vehAmount = (_vehRatio select 0) + (random (_vehRatio select 1));
}else{
	_vehAmount = round (_radius * _vehRatio);
};
_allUnitsArray = [];

_blueMenArray = ["B_Soldier_A_F"];
_redMenArray = ["O_Soldier_A_F"];
_greenMenArray = ["I_Soldier_EPOCH"];

_yellowMenArray = ["I_Soldier_02_F"];

_BLUdivers = ["I_Soldier_EPOCH"];
_OPFdivers = ["I_Soldier_EPOCH"];
_INDdivers = ["I_Soldier_EPOCH"];

_yellowCarArray = ["C_Quadbike_01_F"];

switch (_side) do { 
    case 1: {
        _milHQ = createCenter west;
		if(isNil("_milGroup"))then{_milGroup = createGroup west;}else{_milGroup = _milGroup;};
        _menArray = _blueMenArray;
		_diveArray = _BLUdivers;
    }; 
    case 2: {
        _milHQ = createCenter east;
        if(isNil("_milGroup"))then{_milGroup = createGroup east;}else{_milGroup = _milGroup;};
        _menArray = _redMenArray;
		_diveArray = _OPFdivers;
    }; 
	case 3: {
        _milHQ = createCenter resistance;
        if(isNil("_milGroup"))then{_milGroup = createGroup resistance;}else{_milGroup = _milGroup;};
        _menArray = _greenMenArray;
		_diveArray = _INDdivers;
    }; 
    default {
        _milHQ = createCenter civilian;
        if(isNil("_milGroup"))then{_milGroup = createGroup civilian;}else{_milGroup = _milGroup;};
        _menArray = _yellowMenArray;
    }; 
};


if((_men select 0)||(_men select 1))then{
	for "_i" from 1 to _menAmount do{
		_validPos = false;
		while{!_validPos}do{
			_dir = random 360;
			_range = random _radius;
			_pos = [(_centerPos select 0) + (sin _dir) * _range, (_centerPos select 1) + (cos _dir) * _range, 0];
			
			if(_side > 0)then{
				if(surfaceIsWater _pos)then{
					if(_men select 1)then{
						_unitType = _diveArray select (floor(random(count _diveArray)));
						_validPos = true;
					};
				}else{
					if(_men select 0)then{
						_unitType = _menArray select (floor(random(count _menArray)));
						_validPos = true;
					};
				};
			}else{
				if(!surfaceIsWater _pos)then{
					_unitType = _menArray select (floor(random(count _menArray)));
					_validPos = true;
				};
			};
		};
		
		_unit = _milGroup createUnit [_unitType, _pos, [], 0, "NONE"];
		_unit setPos _pos;

		_unit forceAddUniform SUP_uniformM;
		_unit addVest SUP_vestM;
		_unit addWeapon SUP_weaponM;
		_unit addMagazines [(SUP_magazineM), SUP_magazinesM];
		_unit addPrimaryWeaponItem SUP_opticM;

		_unit setCombatMode "RED";   		//"BLUE";
		_unit enableAI "TARGET";
		_unit enableAI "AUTOTARGET";
		_unit enableAI "FSM";
		_unit enableAI "MOVE";
		_unit enableAI "ANIM";

		if(!_still)then{
			if(_unitType in _menArray)then{
				nul = [_unit,_cPos,_radius,_doorHandling] execVM "\x\addons\Sector_addon\scripts\LV\patrol-vD.sqf";
			}else{
				nul = [_unit,_pos] execVM '\x\addons\Sector_addon\scripts\LV\patrol-vH.sqf';
			};
		};
		_unit allowDamage false;
		_allUnitsArray set [(count _allUnitsArray), _unit];
			
		_unit addMagazine "SmokeShellGreen";
		_unit addMagazine ["Chemlight_green","Chemlight_blue","Chemlight_red","Chemlight_green"] call BIS_fnc_selectRandom;
	};
};

_milGroup setBehaviour "SAFE";

if((_vehicles select 0)||(_vehicles select 1)||(_vehicles select 2))then{
    for "_i" from 1 to _vehAmount do{
        	
		_validPos = false;
		while{!_validPos}do{
		
			_dir = random 360;
			_range = random _radius;
			_pos = [(_centerPos select 0) + (sin _dir) * _range, (_centerPos select 1) + (cos _dir) * _range, 0];
			
			if(_side > 0)then{
				if(surfaceIsWater _pos)then{
					if(_vehicles select 1)then{
						_driver = [_pos, (_side - 1)] call LV_fullWaterVehicle;
						if(!_still)then{nul = [vehicle _driver,_pos] execVM '\x\addons\Sector_addon\scripts\LV\patrol-vH.sqf';};
						_validPos = true;
					};
				}else{
					if((_vehicles select 0)&&(_vehicles select 2))then{
						_whichOne = floor(random 10);
						if(_whichOne < 3)then{
							_driver = [_pos, (_side - 1)] call LV_fullAirVehicle;
							if(!_still)then{nul = [_driver,_pos,[200,200]] execVM '\x\addons\Sector_addon\scripts\LV\patrol-vE.sqf';};
							vehicle _driver flyInHeight 10;
							_validPos = true;
						}else{
							_driver = [_pos, (_side - 1)] call LV_fullLandVehicle;
							if(!_still)then{nul = [vehicle _driver,_pos] execVM '\x\addons\Sector_addon\scripts\LV\patrol-vE.sqf';};
							_validPos = true;
						};
					}else{
						if(_vehicles select 0)then{
							_driver = [_pos, (_side - 1)] call LV_fullLandVehicle;
							if(!_still)then{nul = [vehicle _driver,_pos] execVM '\x\addons\Sector_addon\scripts\LV\patrol-vE.sqf';};
							_validPos = true;
						}else{
							if(_vehicles select 2)then{
								_driver = [_pos, (_side - 1)] call LV_fullAirVehicle;
								if(!_still)then{nul = [_driver,_pos,[200,200]] execVM '\x\addons\Sector_addon\scripts\LV\patrol-vE.sqf';};
								vehicle _driver flyInHeight 10;
								_validPos = true;
							};
						};
					};
				};
			}else{
				if(!surfaceIsWater _pos)then{
					_unitType = _yellowCarArray select (floor(random(count _yellowCarArray)));
					_vehicle = createVehicle [_unitType, _pos, [], 0, "NONE"]; 
					_crew = [_vehicle, _milGroup] call BIS_fnc_spawnCrew;
					_driver = driver _vehicle;
					if(!_still)then{nul = [_driver,_pos] execVM '\x\addons\Sector_addon\scripts\LV\patrol-vE.sqf';};
					_validPos = true;
				};
			};
		
		};
		 
		_vehicle = vehicle _driver;
        _vehicle allowDamage false;
        
        _allUnitsArray set [(count _allUnitsArray), _vehicle];
        
		(units(group _driver)) joinSilent _milGroup; 
    };
};

	{ 
		if((typeName _skills != "STRING")&&((side _x) != civilian))then{ _skls = [_x,_skills] call LV_ACskills; }; 
		if(!isNil("_customInit"))then{ 
			[_x,_customInit] spawn LV_vehicleInit;
		};
	} forEach units _milGroup;


sleep 3;
{
    _x allowDamage true;
}forEach _allUnitsArray;

if(!isNil("_grpId"))then{
	call compile format ["LVgroup%1 = _milGroup",_grpId];
	call compile format["LVgroup%1spawned = true;", _grpId];
	_thisArray = [];
	{ 
		if(isNil("_x"))then{
			_thisArray set[(count _thisArray),"nil0"];
		}else{
			_thisArray set[(count _thisArray),_x];
		};
	}forEach _this;
	call compile format["LVgroup%1CI = ['militarize',%2]",_grpId,_thisArray];
};

if(_smokesAndChems)then{
[_milGroup] spawn {
	private ["_grp","_chance"];
	_grp = _this select 0;
	while{(count units _grp) > 0}do{
			{
				if((behaviour _x) == "COMBAT")then{
					if(daytime > 23 || daytime < 5)then{
						_chance = floor(random 100);
						if(_chance < 3)exitWith{
							if("Chemlight_green" in (magazines _x))exitWith{
								_x fire ["Chemlight_green","Chemlight_green","Chemlight_green"];
							};
							if("Chemlight_red" in (magazines _x))exitWith{
								_x fire ["Chemlight_red","Chemlight_red","Chemlight_red"];
							};
							if("Chemlight_yellow" in (magazines _x))exitWith{
								_x fire ["Chemlight_yellow","Chemlight_yellow","Chemlight_yellow"];
							};
							if("Chemlight_blue" in (magazines _x))exitWith{
								_x fire ["Chemlight_blue","Chemlight_blue","Chemlight_blue"];
							};
						};
					};
					if("SmokeShellGreen" in (magazines _x))exitWith{ 
						_chance = floor(random 100);
						if(_chance < 3)exitWith{
							_x fire ["SmokeShellGreen","SmokeShellGreen","SmokeShellGreen"];
						};
					};
				};
			}forEach units _grp;
		sleep 10;
	};
};
};
/* ******************************Configurate START********************************* */
/* ****************************** Configurate END ********************************* */