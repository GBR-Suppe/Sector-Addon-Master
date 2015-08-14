/*
	a3_epoch_sector
	by Suppe
*/

/* ***************************** DO NOT TOUCH BELOW ******************************** */

SUP_spawn_AI = {

//	private ["_position","_types","_groupAI","_groupArray","_type","_unit"];
	
	_groupcount = SUP_groupcount;
	_position  = _this select 0;
	_types = if(count _this > 2)then{_this select 2}else{["I_Soldier_EPOCH"]};

	_groupAI = createGroup RESISTANCE;
	_groupAI setBehaviour  "AWARE";	// SAFE // AWARE
	_groupAI setCombatMode "RED";	// BLUE // RED

	for "_i" from 1 to _groupcount do {
		_type = _types call BIS_fnc_selectRandom;
		_unit = _groupAI createUnit [_type,[_position select 0,_position select 1,0],[],10,"FORM"];
		[_unit] joinsilent _groupAI;
		[_unit] call SUP_AI_settings;
		[_unit] execVM '\x\addons\a3_epoch_sector\scripts\fnc_AI_patrol.sqf';
//		[_unit] execVM '\x\addons\a3_epoch_sector\scripts\fnc\fnc_sC.sqf';
		_unit addEventHandler ['Killed',{_this call HS_unit_killed}];
	};
	
	_groupAI allowFleeing 0;
	_groupAI selectLeader (units _groupAI select 0);

//	diag_log format["***[Sector] Spawn AI at %1",_position]; 
};

SUP_spawn_Heli = {

//	private ["_position","_helityp","_groupAI","_heli","_vCrew","_crew","_driver"];
	
	_position  = _this select 0;
	_helityp = SUP_helityp;
	_types = if(count _this > 2)then{_this select 2}else{["I_Soldier_EPOCH"]};
	_type = _types call BIS_fnc_selectRandom;
	
	_groupAI = createGroup RESISTANCE;
	_groupAI setBehaviour "AWARE";
	_groupAI setCombatMode "RED";

	_heli = createVehicle [_helityp, _position, [], 0, "FLY"];
	_heli setVariable ["BIS_enableRandomization", false];
	[_heli] joinsilent _groupAI;
	_heli call EPOCH_server_setVToken;
	_heli call EPOCH_server_vehicleInit;

	_crew = _groupAI createUnit [_type, _position, [], 0, "FORM"];
	[_crew] call SUP_AI_settings;
	_crew moveInDriver _heli;
	_crew assignAsDriver _heli;
	
	_crew = _groupAI createUnit [_type, _position, [], 0, "FORM"];
	[_crew] call SUP_AI_settings;
	_crew moveInGunner _heli;
	_crew assignAsGunner _heli;
	
	_crew addEventHandler ['Killed',{_this call HS_unit_killed}];

	clearItemCargoGlobal _heli; clearWeaponCargoGlobal _heli; clearMagazineCargoGlobal _heli; clearBackPackCargoGlobal _heli;
	
	{_heli enableAI _x;}count ["TARGET","AUTOTARGET","MOVE","ANIM","FSM"];
	_heli setRank "Private"; _heli setskill SUP_AI_skill;
	_heli lock 2;

	[_heli] execVM '\x\addons\a3_epoch_sector\scripts\fnc_vehicle_patrol.sqf';

};

SUP_spawn_LandVehicle = {

//	private ["_position","_vehicletyp","_groupAI","_landvehicle","_vCrew","_crew","_driver"];
	
	_position  = _this select 0;
	_vehicletyp = SUP_LandVehicle;
	_types = if(count _this > 2)then{_this select 2}else{["I_Soldier_EPOCH"]};
	_type = _types call BIS_fnc_selectRandom;
	
	_groupAI = createGroup RESISTANCE;
	_groupAI setBehaviour "AWARE";
	_groupAI setCombatMode "RED";

	_landvehicle = createVehicle [_vehicletyp, _position, [], 0, "FORM"];
	_landvehicle setVariable ["BIS_enableRandomization", false];
	[_landvehicle] joinsilent _groupAI;
	_landvehicle call EPOCH_server_setVToken;
	_landvehicle call EPOCH_server_vehicleInit;
	
	_crew = _groupAI createUnit [_type, _position, [], 0, "FORM"];
	[_crew] call SUP_AI_settings;
	_crew moveInDriver _landvehicle;
	_crew assignAsDriver _landvehicle;
	
	_crew = _groupAI createUnit [_type, _position, [], 0, "FORM"];
	[_crew] call SUP_AI_settings;
	_crew moveInGunner _landvehicle;
	_crew assignAsGunner _landvehicle;
	
	_crew addEventHandler ['Killed',{_this call HS_unit_killed}];

	clearItemCargoGlobal _landvehicle; clearWeaponCargoGlobal _landvehicle; clearMagazineCargoGlobal _landvehicle; clearBackPackCargoGlobal _landvehicle;
	
	{_landvehicle enableAI _x;}count ["TARGET","AUTOTARGET","MOVE","ANIM","FSM"];
	_landvehicle setRank "Private"; _landvehicle setskill SUP_AI_skill;
	_landvehicle lock 2;

	[_landvehicle] execVM '\x\addons\a3_epoch_sector\scripts\fnc_vehicle_patrol.sqf';
	
};

SUP_spawn_StaticAI = {

	private ["_position","_types","_groupAI","_groupArray","_type","_unitstatic"];

	_position  = _this select 0;
	_types = if(count _this > 2)then{_this select 2}else{["I_Soldier_EPOCH"]};

	_groupAI = createGroup RESISTANCE;
	_groupAI setBehaviour  "AWARE";
	_groupAI setCombatMode "RED";

	_type = _types call BIS_fnc_selectRandom;
	_unitstatic = _groupAI createUnit [_type,[_position select 0,_position select 1,0],[],10,"FORM"];
	[_unitstatic] joinsilent _groupAI;

	removeUniform _unitstatic; removeHeadgear _unitstatic; removeBackpack _unitstatic; removeAllItems _unitstatic; removeAllWeapons	_unitstatic; removeBackpack _unitstatic; removeHeadGear	_unitstatic; removeVest	_unitstatic; {_unitstatic removeMagazine _x;} foreach (magazines _unitstatic);

	_unitstatic forceAddUniform  "U_O_GhillieSuit";
	_unitstatic addVest format["V_%1_EPOCH", ceil(random 40)];
	_unitstatic addHeadgear format["H_%1_EPOCH", ceil(random 104)];

	_unitstatic addWeapon "m107_EPOCH";
	_unitstatic addMagazines [("5Rnd_127x108_Mag"), 4];
	_unitstatic addPrimaryWeaponItem "optic_SOS";
	_unitstatic selectWeapon (primaryWeapon _unitstatic);

	{_unitstatic enableAI _x;}count ["TARGET","AUTOTARGET","ANIM","FSM"];
	_unitstatic disableAI "MOVE";
	_unitstatic setRank "Private"; _unitstatic setskill SUP_AI_skill;

//	[_unitstatic] execVM '\x\addons\a3_epoch_sector\scripts\fnc\fnc_sC.sqf';

	_unitstatic addEventHandler ['Killed',{_this call HS_unit_killed}];
	
};

SUP_spawn_StaticMG = {

//	private ["_position","_weapontyp","_groupAI","_staticMG","_vCrew","_crew","_driver"];
	
	_position  = _this select 0;
	_weapontyp = SUP_MGtyp;
	
	_groupAI = createGroup RESISTANCE;
	_groupAI setBehaviour "AWARE";
	_groupAI setCombatMode "RED";

	_staticMG = createVehicle [_weapontyp, _position, [], 0, "NONE"];
	_staticMG setVariable ["BIS_enableRandomization", false];
	[_staticMG] joinsilent _groupAI;
	_staticMG call EPOCH_server_setVToken;
	_staticMG call EPOCH_server_vehicleInit;
	
	_staticMG lock 2;
	
	_vCrew = [_staticMG, _groupAI] call BIS_fnc_spawnCrew;
	_crew = crew _staticMG;
	_driver = driver _staticMG;
	_driver
};

SUP_spawn_StaticVehicle = {

//	private ["_position","_staticvehicle","_groupAI","_staticV","_vCrew","_crew","_driver"];
	
	_position  = _this select 0;
	_staticvehicle = SUP_StaticVehicle;
	_types = if(count _this > 2)then{_this select 2}else{["I_Soldier_EPOCH"]};
	_type = _types call BIS_fnc_selectRandom;
	
	_groupAI = createGroup RESISTANCE;
	_groupAI setBehaviour "AWARE";
	_groupAI setCombatMode "RED";

	_staticV = createVehicle [_staticvehicle, _position, [], 0, "NONE"];
	_staticV setVariable ["BIS_enableRandomization", false];
	[_staticV] joinsilent _groupAI;
	_staticV call EPOCH_server_setVToken;
	_staticV call EPOCH_server_vehicleInit;
	
	clearItemCargoGlobal _staticV; clearWeaponCargoGlobal _staticV; clearMagazineCargoGlobal _staticV; clearBackPackCargoGlobal _staticV;
	{_staticV disableAI _x;}count ["MOVE"];
	
	_crew = _groupAI createUnit [_type, _position, [], 0, "FORM"];
	_crew moveInDriver _staticV;
	_crew assignAsDriver _staticV;
	[_crew] call SUP_AI_settings;
	
	_crew = _groupAI createUnit [_type, _position, [], 0, "FORM"];
	_crew moveInGunner _staticV;
	_crew assignAsGunner _staticV;
	[_crew] call SUP_AI_settings;
	
	_crew addEventHandler ['Killed',{_this call HS_unit_killed}];
	
	_staticV lock 2;
	
};

SUP_createMarker = {

//	private ["_position","_markername","_marker","_markertext"];
	
	_position  = _this select 0;
	
	_markername  = format ["SUP"];
	_marker = createMarker [_markername, _position];
	_markertext  = SUP_markertext;
	_markercolor = "ColorRed";
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_dot";
	_marker setMarkerColor _markercolor;
	_marker setMarkerText _markertext;
};