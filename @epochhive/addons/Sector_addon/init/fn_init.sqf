/*
	File: 		Sector_addon init
	Author: 	GBR Suppe
	Update: 	06.05.2015
	Version: 	0.0.4
	Edit: 		IF YOU EDIT SOMETHING YOUR NAME HERE
*/
diag_log "***[SECTOR] Initialize Sector_Addon***";


// load the mapcontant, buildings or so.....
call compile preprocessFileLineNumbers "\x\addons\Sector_addon\mapcontant\sector.sqf";

// load the box or boxes with loot.... // open \Sector_addon\scripts\spawncrates.sqf" to configurate the loot and the coords !
call compile preprocessFileLineNumbers "\x\addons\Sector_addon\scripts\spawncrates.sqf";

// load the sector_config ("sector Controlcenter")
call compile preprocessFileLineNumbers "\x\addons\Sector_addon\scripts\sector_controlcenter.sqf";




