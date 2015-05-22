/*		ARMA3Alpha function LV_fnc_fullVehicle v1.1 - by SPUn / lostvar
		Spawns random vehicle full of random units and returns driver 

	File: 		Sector_addon fullWaterVehicle
	Author: 	SPUn / lostvar    http://forums.bistudio.com/showthread.php?165089-AI-Spawn-Script-Pack
	Edition:	GBR Suppe edition
*/
private ["_BLUhq","_BLUgrp","_veh","_grp","_OPFhq","_OPFgrp","_man1","_man","_i","_pos","_side","_BLUveh","_OPFveh","_INDveh","_men","_veh1","_vehSpots","_pos1","_vehicle","_vCrew","_allUnitsArray","_crew","_driver"];
_pos = _this select 0;
_side = _this select 1;

diag_log "***[Sector] Spawn the WaterVehicle***";

_BLUveh = ["B_Boat_Transport_01_F"];
_OPFveh = ["O_Lifeboat"];
_INDveh = [SUP_Boot];

_men = [];
_veh = [];

switch(_side)do{
	case 0:{
		_BLUhq = createCenter west;
		_BLUgrp = createGroup west;
		_veh = _BLUveh;
		_grp = _BLUgrp;
	};
	case 1:{
		_OPFhq = createCenter east;
		_OPFgrp = createGroup east;
		_veh = _OPFveh;
		_grp = _OPFgrp;
	};
	case 2:{
		_OPFhq = createCenter east;
		_OPFgrp = createGroup east;
		_veh = _OPFveh;
		_grp = _OPFgrp;
	};
	
};


_veh1 = _veh select (floor(random(count _veh)));
_vehSpots = getNumber (configFile >> "CfgVehicles" >> _veh1 >> "transportSoldier");

_pos1 = _pos; 

_vehicle = createVehicle [_veh1, _pos1, [], 0, "NONE"];
_vehicle setVariable ["BIS_enableRandomization", false];
_vehicle call EPOCH_server_setVToken;
_vehicle call EPOCH_server_vehicleInit;
_vehicle setPos _pos1;

_vCrew = [_vehicle, _grp] call BIS_fnc_spawnCrew;
//_allUnitsArray set [(count _allUnitsArray), _vehicle];
_crew = crew _vehicle;
				
if(_vehSpots > 0)then{
	_i = 1; 
	for "_i" from 1 to _vehSpots do {
		_man1 = getText (configFile >> "CfgVehicles" >> _veh1 >> "crew");
		_man = _grp createUnit [_man1, _pos1, [], 0, "NONE"];
		_man moveInCargo _vehicle;
		sleep 0.3 ;
	};
};

_driver = driver _vehicle;
_driver
