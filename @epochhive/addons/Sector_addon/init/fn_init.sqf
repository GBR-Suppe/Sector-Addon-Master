/*
	File: 		Sector_addon init
	Author: 	GBR Suppe
	Update: 	04.05.2015
	Version: 	0.0.1c
	Edit: 		IF YOU EDIT SOMETHING YOUR NAME HERE
*/

diag_log "***[SECTOR] Starting Sector_Addon***";

// load the mapcontant, buildings or so.....                  // !!! remove the // from the start of the next Line if you added contant in the sector.sqf !!!
//call compile preprocessFileLineNumbers "\x\addons\Sector_addon\mapcontant\sector.sqf";

// load the box or boxes with loot.... // open \Sector_addon\scripts\spawncrates.sqf" to configurate the loot and the coords !
call compile preprocessFileLineNumbers "\x\addons\Sector_addon\scripts\spawncrates.sqf";


// AI spawn start here // AI spawn start here // AI spawn start here // AI spawn start here // AI spawn start here // AI spawn start here // AI spawn start here //

//heli  // spawned a heli, but its not ready !
//nul = ["sec_center",3,500,[false,false],[false,false,true],false,[10,0],[1,0],"default",nil,nil,99] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";

//FillHouse  //Fills nearest building, OR all buildings in defined range, with soldiers.  // if no houses in the area, and you dont want do place buildings there, then use the Millitarize (sec1-sec10) 
nul = ["sec1",3,true,2,[4,1],300,"default",nil,nil,1] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = ["sec2",3,true,2,[4,1],300,"default",nil,nil,2] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = ["sec3",3,true,2,[4,1],300,"default",nil,nil,3] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = ["sec4",3,true,2,[4,1],300,"default",nil,nil,4] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = ["sec5",3,true,2,[4,1],300,"default",nil,nil,5] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = ["sec6",3,true,2,[4,1],300,"default",nil,nil,6] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = ["sec7",3,true,2,[4,1],300,"default",nil,nil,7] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = ["sec8",3,true,2,[4,1],300,"default",nil,nil,8] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = ["sec9",3,true,2,[4,1],300,"default",nil,nil,9] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = ["sec10",3,true,2,[4,1],300,"default",nil,nil,10] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";

//Millitarize  // Fills area with units.
nul = ["sec11",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,11] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = ["sec12",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,12] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = ["sec13",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,13] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = ["sec14",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,14] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = ["sec15",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,15] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = ["sec16",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,16] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = ["sec17",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,17] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = ["sec18",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,18] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";

//Millitarize  // Fills area with units. // if no houses in the area, and you dont want do place buildings there, then use this Millitarize
//nul = ["sec1",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,1] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = ["sec2",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,2] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = ["sec3",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,3] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = ["sec4",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,4] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = ["sec5",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,5] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = ["sec6",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,6] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = ["sec7",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,7] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = ["sec8",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,8] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = ["sec9",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,9] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = ["sec10",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,10] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";

// AI spawn end here // AI spawn end here // AI spawn end here // AI spawn end here // AI spawn end here // AI spawn end here // AI spawn end here // AI spawn end here // 



//fillhouse simpleCache  // Makes fillHouse and militarize -units spawn when player is near, and despawn when player is further.
nul = [[  1,2,3,4,5,6,7,8,9,10 ],[player],1200,true,true] execVM "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_simpleCache.sqf";

//millitarize simpleCache // Makes fillHouse and militarize -units spawn when player is near, and despawn when player is further.
nul = [[11,12,13,14,15,16,17,18],[player],1200,true,true] execVM "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_simpleCache.sqf";
//nul = [[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18],[player],1200,true,true] execVM "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_simpleCache.sqf";