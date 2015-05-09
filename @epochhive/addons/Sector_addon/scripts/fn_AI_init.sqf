/*																				   
	File: 		fn_AI_init.sqf
	Author: 	GBR Suppe
	Version: 	0.4.0
/* ***************************** DO NOT TOUCH BELOW ******************************** */

diag_log "***[Sector] Initialize AI spawn***";

//FillHouse  		//Fills nearest building, OR all buildings in defined range, with soldiers.  // if no houses in the area, and you dont want do place buildings there, then use the Millitarize (sec1-sec10) 
//if (house) then {
nul = [sec_AI1, 3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil, 1] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [sec_AI2, 3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil, 2] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [sec_AI3, 3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil, 3] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [sec_AI4, 3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil, 4] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [sec_AI5, 3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil, 5] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [sec_AI6, 3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil, 6] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [sec_AI7, 3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil, 7] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [sec_AI8, 3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil, 8] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [sec_AI9, 3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil, 9] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [sec_AI10,3,patrolFH,patroltype,[unitFH,unitFHr],radiusFH,aiskillFH,nil,nil,10] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
//};

/*
//Millitarize  		// Fills area with units. // if no houses in the area, and you dont want do place buildings there, then use this Millitarize
if (nohouse) then {
nul = [sec_AI1, 3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,1] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI2, 3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,2] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI3, 3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,3] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI4, 3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,4] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI5, 3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,5] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI6, 3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,6] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI7, 3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,7] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI8, 3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,8] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI9, 3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,9] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI10,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,10] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
};
*/

//Millitarize  		// Fills area with units.
nul = [sec_AI11,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,11] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI12,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,12] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI13,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,13] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI14,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,14] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI15,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,15] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI16,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,16] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI17,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,17] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [sec_AI18,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,18] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [sec_AI19,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,19] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [sec_AI20,3,radiusM,[true,false],[false,false,false],patrolM,[unitM,unitMr],[3,0],aiskillM,nil,nil,20] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";


// simpleCache  	// Makes fillHouse and militarize -units spawn when player is near, and despawn when player is further.
nul = [[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],[player],SCradius,true,true] execVM "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_simpleCache.sqf";

// Heli 			// sec_Heli
if (spawnHeli) then {
nul = [sec_Heli,3,100,[false,false],[false,false,true],false,[10,0],[1,0],0.8,nil,nil,nil] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
};

// LandVehicle 		// sec_LandVehicle
if (spawnLand) then {
nul = [sec_Land,3,500,[false,false],[true,false,false],false,[10,0],[1,0],0.6,nil,nil,nil] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
};

// Boot 			// sec_Boot // need a marker in the water near sector
if (spawnBoot) then {
nul = [sec_Boot,3,500,[false,false],[false,true,false],false,[10,0],[1,0],0.6,nil,nil,nil] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
};
