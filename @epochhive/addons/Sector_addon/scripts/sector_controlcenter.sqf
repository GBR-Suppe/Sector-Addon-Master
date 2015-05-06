/*
	File: 		sector_controlcenter
	Author: 	GBR Suppe
	Update: 	06.05.2015
	Version: 	0.0.4
	Edit: 		IF YOU EDIT SOMETHING YOUR NAME HERE
	
	This is the "AI SPAWN CONTROLCENTER"
*/

diag_log "***[SECTOR] Loading sector_controlcenter***";

/* ******************************Configurate START********************************* */

// Unit amount Section
_unitFH = 3;			// unit amount FillHouse
_unitFHr= 1;			// +random unit amount FillHouse
_unitM  = 3;			// unit amount Millitarize
_unitMr = 1;			// +random unit amount Millitarize

// Vehicle Section
_spawnHeli = true;		// false to disable the Helispawn

// Radius Section
_radiusFH=300;			// In this radius the "FillHouse AI" will Patrol (radius per Group)[default is 300] [maximal 500 !!!]
_radiusM =300;			// In this radius the "Millitarize AI" will Patrol (radius per Group) [default is 300] [maximal 500 !!!]

// AI Skill Section
_aiskillFH=0.7;		// "FillHouse   AI" Skill  // INFO: from 0.01 (Bad AI) - 1.0 (Godlike AI) [default is 0.7]
_aiskillM =0.7;		// "Millitarize AI" Skill  // INFO: from 0.01 (Bad AI) - 1.0 (Godlike AI) [default is 0.7]

// AI Patrol Section
_patrolFH= true; 		// if false the "FillHouse AI" do not Patrol. [default is true]
_patrolM = false; 		// if true the "Millitarize AI" do not Patrol ! (at Millitarize is reversed !!!) [default is false]
_patroltype=2;			// if 1 the "FillHouse AI" do not Patrol outside Buildings. (Only inside the Buildings) [default is 2]

// SimpleCache radius Section
_SCradius=1200;			// Radius the FillHouse and Militarize -units spawn when player is near, and despawn when player is further. [default is 1200 Meter]

// Marker Section
_sec_marker1 = "sec1";			//markername1 // in this case is the name sec1.
_sec_marker2 = "sec2";			//markername2
_sec_marker3 = "sec3";			//markername3
_sec_marker4 = "sec4";			//markername4
_sec_marker5 = "sec5";			//markername5
_sec_marker6 = "sec6";			//markername6
_sec_marker7 = "sec7";			//markername7
_sec_marker8 = "sec8";			//markername8
_sec_marker9 = "sec9";			//markername9
_sec_marker10= "sec10";			//markername10
_sec_marker11= "sec11";			//markername11
_sec_marker12= "sec12";			//markername12
_sec_marker13= "sec13";			//markername13
_sec_marker14= "sec14";			//markername14
_sec_marker15= "sec15";			//markername15
_sec_marker16= "sec16";			//markername16
_sec_marker17= "sec17";			//markername17
_sec_marker18= "sec18";			//markername18

_sec_marker19= "sec_center";	//markername19 // Use it for the Heli and the Lootbox.


/* ****************************** Configurate  END ********************************* */




/* ******************************DO NOT TOUCH BELOW********************************* */

//FillHouse  //Fills nearest building, OR all buildings in defined range, with soldiers.  // if no houses in the area, and you dont want do place buildings there, then use the Millitarize (sec1-sec10) 
nul = [_sec_marker1, 3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil, 1] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [_sec_marker2, 3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil, 2] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [_sec_marker3, 3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil, 3] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [_sec_marker4, 3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil, 4] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [_sec_marker5, 3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil, 5] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [_sec_marker6, 3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil, 6] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [_sec_marker7, 3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil, 7] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [_sec_marker8, 3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil, 8] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [_sec_marker9, 3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil, 9] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
nul = [_sec_marker10,3,_patrolFH,_patroltype,[_unitFH,_unitFHr],_radiusFH,_aiskillFH,nil,nil,10] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";

//Millitarize  // Fills area with units. // if no houses in the area, and you dont want do place buildings there, then use this Millitarize
//nul = [_sec_marker1, 3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,1] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [_sec_marker2, 3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,2] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [_sec_marker3, 3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,3] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [_sec_marker4, 3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,4] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [_sec_marker5, 3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,5] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [_sec_marker6, 3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,6] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [_sec_marker7, 3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,7] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [_sec_marker8, 3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,8] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [_sec_marker9, 3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,9] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
//nul = [_sec_marker10,3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,10] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";

//Millitarize  // Fills area with units.
nul = [_sec_marker11,3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,11] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [_sec_marker12,3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,12] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [_sec_marker13,3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,13] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [_sec_marker14,3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,14] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [_sec_marker15,3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,15] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [_sec_marker16,3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,16] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [_sec_marker17,3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,17] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
nul = [_sec_marker18,3,_radiusM,[true,false],[false,false,false],_patrolM,[_unitM,_unitMr],[3,0],_aiskillM,nil,nil,18] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";

// simpleCache  // Makes fillHouse and militarize -units spawn when player is near, and despawn when player is further.
nul = [[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18],[player],_SCradius,true,true] execVM "\x\addons\Sector_addon\scripts\LV\LV_functions\LV_fnc_simpleCache.sqf";

// Heli // sec_marker19 is sec_center
if (_spawnHeli) then {
nul = [_sec_marker19,3,100,[false,false],[false,false,true],false,[10,0],[1,0],0.6,nil,nil,nil] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
};



