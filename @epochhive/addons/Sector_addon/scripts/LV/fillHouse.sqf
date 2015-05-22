/*
	File: 		Sector_addon fillHouse.sqf
	Author: 	SPUn / lostvar    http://forums.bistudio.com/showthread.php?165089-AI-Spawn-Script-Pack
	Edition: 	Suppe edition
*/
if (!isServer)exitWith{};
private ["_blueMenArray3","_blueMenArray2","_BLUarrays","_redMenArray2","_OPFarrays","_greenMenArray","_grpId","_customInit","_center","_skls","_skills","_a","_buildings","_rat","_milHQ","_milGroup","_menArray","_i","_newPos","_i2","_unitType","_unit","_building","_sideOption","_blueMenArray","_redMenArray","_bPoss","_patrol","_pFile","_pType"];

diag_log "***[Sector] Spawn Sector FillHouse Guards***";

_center = if (count _this > 0) then { _this select 0;};	 
_sideOption = if (count _this > 1) then { _this select 1;} else {2};	 
_patrol = if (count _this > 2) then { _this select 2;} else {true};	 
_pType = if (count _this > 3) then { _this select 3;} else {2};	 
_ratio = if (count _this > 4) then { _this select 4;} else {50};	 
_radius = if (count _this > 5) then { _this select 5;} else {1};	 
_skills = if (count _this > 6) then { _this select 6;} else {"default"};	 
_milGroup = if (count _this > 7) then { _this select 7;} else {nil}; if(!isNil("_milGroup"))then{if(_milGroup == "nil0")then{_milGroup = nil;};};
_customInit = if (count _this > 8) then { _this select 8;} else {nil}; if(!isNil("_customInit"))then{if(_customInit == "nil0")then{_customInit = nil;};};
_grpId = if (count _this > 9) then { _this select 9;} else {nil};	 

if(isNil("LV_ACskills"))then{LV_ACskills = compile preprocessFile "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_ACskills.sqf";};
if(isNil("LV_vehicleInit"))then{LV_vehicleInit = compile preprocessFile "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_vehicleInit.sqf";};
if(isNil("LV_nearestBuilding"))then{LV_nearestBuilding = compile preprocessFile "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_nearestBuilding.sqf";};

_blueMenArray = ["B_Soldier_A_F"];
_blueMenArray2 = ["B_recon_exp_F"];
_blueMenArray3 = ["B_G_Soldier_A_F"];
_BLUarrays = [_blueMenArray,_blueMenArray2,_blueMenArray3];
_redMenArray = ["O_Soldier_A_F"];
_redMenArray2 = ["O_recon_exp_F"];
_OPFarrays = [_redMenArray,_redMenArray2];
_greenMenArray = ["I_Soldier_EPOCH"];

switch (_sideOption) do { 
    case 1: {
        _milHQ = createCenter west;
		if(isNil("_milGroup"))then{_milGroup = createGroup west;}else{_milGroup = _milGroup};
        _menArray = (_BLUarrays call BIS_fnc_selectRandom);
    }; 
	case 2: {
        _milHQ = createCenter east;
        if(isNil("_milGroup"))then{_milGroup = createGroup east;}else{_milGroup = _milGroup};
        _menArray = (_OPFarrays call BIS_fnc_selectRandom);
    };	
    default {
        _milHQ = createCenter resistance;
        if(isNil("_milGroup"))then{_milGroup = createGroup resistance;}else{_milGroup = _milGroup};
        _menArray = _greenMenArray;
    }; 
};

if(_center in allMapMarkers)then{
		_center0 = getMarkerPos _center;
	}else{
		if (typeName _center == "ARRAY") then{
			_center0 = _center;
		}else{
			_center0 = getPos _center;
		};
	};

if(_radius > 1)then{
	_buildings = ["all in radius",_center,_radius] call LV_nearestBuilding;
}else{
	_buildings = ["nearest one",_center] call LV_nearestBuilding;
};
if(isNil("_buildings"))exitWith{};
if(count _buildings == 0) exitWith{};

_bPoss = [];
_a = 0;
while { _a < (count _buildings) } do {
	_building = (_buildings select _a);
	_i = 0;
	while { ((_building buildingPos _i) select 0) != 0 } do {
		_bPoss set [count (_bPoss), (_building buildingPos _i)];
		_i = _i + 1;
	};
	_a = _a + 1;
};

if(typeName _ratio == "ARRAY")then{
	_rat = (_ratio select 0) + (random (_ratio select 1));
}else{
	_rat = ceil((_ratio / 100) * (count _bPoss));
};
_i2 = 0;
while{_i2 < _rat}do{
    //if(_radius > 1)then{_newPos = _bPoss select floor(random count _bPoss);}else{_newPos = _bPoss select _i2;};
	_newPos = _bPoss select floor(random count _bPoss);
	if(_rat < count _bPoss)then{_bPoss = _bPoss - [_newPos];};
    _i2 = _i2 + 1;

    _unitType = _menArray select (floor(random(count _menArray)));
	_unit = _milGroup createUnit [_unitType, _newPos, [], 0, "NONE"];
	_unit setpos _newPos;
	
	_unit forceAddUniform SUP_uniformFH;
	_unit addVest SUP_vestFH;
	_unit addWeapon SUP_weaponFH;
	_unit addMagazines [(SUP_magazineFH), SUP_magazinesFH];
	_unit addPrimaryWeaponItem SUP_opticFH;

	_unit setCombatMode "RED";   //"BLUE";
	_unit enableAI "TARGET";
	_unit enableAI "AUTOTARGET";
	_unit enableAI "FSM";
	_unit enableAI "MOVE";
	_unit enableAI "ANIM";

	if(typeName _skills != "STRING")then{_skls = [_unit,_skills] call LV_ACskills;};

	if(_patrol)then{
        	switch (_pType) do {
            		case 1: {
                		_pFile = "\x\addons\Sector_addon\scripts\LV\patrol-vF.sqf";
            		};
            		case 2: {
                		_pFile = "\x\addons\Sector_addon\scripts\LV\patrol-vG.sqf";
            		};
        	};
			nul = [_unit] execVM format["%1",_pFile]; 
	}else{
        	doStop _unit;
    };
	if(!isNil("_customInit"))then{ 
		nul = [_unit,_customInit] spawn LV_vehicleInit;
	};
};

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
	call compile format["LVgroup%1CI = ['fillhouse',%2]",_grpId,_thisArray];
};
/* ******************************Configuration START********************************* */
/* ****************************** Configuration END ********************************* */
