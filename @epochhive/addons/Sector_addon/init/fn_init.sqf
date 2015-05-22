/*
	File: 		Sector_addon init
	Author: 	GBR Suppe
	Version: 	0.4.3
	Edit: 		IF YOU EDIT SOMETHING YOUR NAME HERE
*/
diag_log "***[Sector] Initialize Sector_Addon***";

// load the sector_config
private ["_check","_end"];
_check = execVM "@EpochHive\addons\sector_config.sqf";
if(isNil "_check")then{
	_check = execVM "@EpochHive\sector_config.sqf";
	if(isNil "_check")then{		//Config not found
		diag_log format["***[SECTOR] Ignoring messages, default sector_config file will be loaded from sector_addon.pbo***"];
		_check = scriptNull;
		SUP_sector_config_loaded = false;
	};
};
_end = time + 3;
waitUntil{isNull _check || time > _end};
if(!SUP_sector_config_loaded)then{
	_check = execVM "x\addons\Sector_addon\sector_config.sqf";
	waitUntil{isNull _check};
	diag_log "***[SECTOR] No external config file found or file is corrupt. Loaded default sector_config from sector_addon.pbo***";
};

// load the AI spawn
call compile preprocessFileLineNumbers "\x\addons\Sector_addon\scripts\fn_AI_init.sqf";

// load the mapcontant, buildings,houses...
call compile preprocessFileLineNumbers "\x\addons\Sector_addon\mapcontant\sector.sqf";

// load the box loot
call compile preprocessFileLineNumbers "\x\addons\Sector_addon\scripts\spawncrates.sqf";






