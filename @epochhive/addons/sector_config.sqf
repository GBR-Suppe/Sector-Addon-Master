/*
	File: 		sector_addon/sector_config
	Author: 	GBR Suppe
	Version: 	0.4.3
*/

diag_log "***[Sector] Loading sector_config***";

/* ***************************** Configuration START ******************************** */

// Unit amount FillHouse options: (Units per Marker)
SUP_unitFH = 3;			// unit amount FillHouse			 	[default 3]
SUP_unitFHr= 1;			// +random unit amount FillHouse  		[default +1 random]

// Unit amount Millitarize options: (Units per Marker)
SUP_unitM  = 3;			// unit amount Millitarize				[default 3]
SUP_unitMr = 1;			// +random unit amount Millitarize   	[default +1 random]


// Millitarize Units options:
SUP_weaponM = "akm_EPOCH";				// Weapons Millitarize Units
SUP_magazineM = "30Rnd_762x39_Mag";		// Ammo Millitarize Units
SUP_magazinesM = 8;						// Magazines per Millitarize Units  
SUP_opticM = "optic_Arco";				// Optic Millitarize Units
SUP_uniformM = "U_OG_leader";			// Uniform Millitarize Units
SUP_vestM = "V_34_EPOCH";				// Vest Millitarize Units

// FillHouse Units options:
SUP_weaponFH = "akm_EPOCH";				// Weapons FillHouse Units
SUP_magazineFH = "30Rnd_762x39_Mag";	// Ammo FillHouse Units
SUP_magazinesFH = 6;					// Magazines per FillHouse Units 
SUP_opticFH = "optic_Arco";				// Optic FillHouse Units
SUP_uniformFH = "U_OG_Guerilla1_1";		// Uniform FillHouse Units
SUP_vestFH = "V_22_EPOCH";				// Vest FillHouse Units


// Vehicle options:
SUP_spawnHeli = true;						// false to disable the Helispawn, true to activate the Helispawn // INFO FOR INFISTAR: open run.sqf and at the Heli to the allowed vehicle list
SUP_Heli = "I_Heli_light_03_F";				// Helityp [default is "B_Heli_Transport_01_F" = "ghosthawk"]	Heli is to stop player landing in the zone... the heli should be a independent heli, but Unfortunately in arma are not very suitable Helis ?!?
SUP_spawnLand = false;						// false to disable the LandVehiclespawn, true to activate the LandVehiclespawn  *INFO: LandVehicle and Boot is not really tested, only true if you now what you do !
SUP_LandV = "B_MRAP_01_EPOCH";				// LandVehicletyp [default is "B_MRAP_01_EPOCH" = "hunter"]  *INFO: LandVehicle and Boot is not really tested, only true if you now what you do !
SUP_spawnBoot = false;						// false to disable the Bootspawn, true to activate the Bootspawn  *INFO: LandVehicle and Boot is not really tested, only true if you now what you do !
SUP_Boot = "C_Boat_Civil_01_rescue_EPOCH";	// Boottyp  *INFO: LandVehicle and Boot is not really tested, only true if you now what you do !


// AI Skill options:
SUP_aiskillFH=0.7;			// "FillHouse   AI" Skill  // INFO: from 0.01 (very bad AI) - 1.0 (Godlike AI) [default is 0.7]
SUP_aiskillM =0.7;			// "Millitarize AI" Skill  // INFO: from 0.01 (very bad AI) - 1.0 (Godlike AI) [default is 0.7]


// Crate / Box / Lootbox options:
SUP_boxspawnposi = "sec_center";	// This is the center around which the crates will spawn, Sector B island on Tavi. // EXAMPLE: "MARKERNAME"
SUP_noc = 			2;				// This is the number of crates that you want to spawn
SUP_mini =  		1;				// Minimum distance from the center position (Number) in meters
SUP_maxi =  		50;				// Example : maximum range of spawned crates, to keep them INSIDE the sector B compound
SUP_watermode =  	0;				// Water mode (Number)	0: cannot be in water , 1: can either be in water or not , 2: must be in water
SUP_marker =     	true;			// Draw a green circle in which the crate will be spawned randomly
SUP_markers =    	5;				// Radius of the marker in meters


// Marker options:
// The AI spawn on the Marker // Marker 1-10 are for FillHouse AI and Marker 11-20 are for the Millitarize AI // On every Marker spawn so many Units how you set on the top ()
SUP_sec_center = "sec_center";		// Coordinates for the center // also good to spawn the Lootbox, Heli or LandVehicles

SUP_sec_Heli = "sec_center";		// Heli spawn
SUP_sec_Land = "sec_center";		// LandVehicle spawn
SUP_sec_Boot = "sec_center";		// Boot spawn

SUP_sec_AI1 = "sec1";				// FillHouse AI (spawn 1)
SUP_sec_AI2 = "sec2";				// FillHouse AI (spawn 2)
SUP_sec_AI3 = "sec3";				// FillHouse AI (spawn 3)
SUP_sec_AI4 = "sec4";				// FillHouse AI (spawn 4)
SUP_sec_AI5 = "sec5";				// FillHouse AI (spawn 5)
SUP_sec_AI6 = "sec6";				// FillHouse AI (spawn 6)
SUP_sec_AI7 = "sec7";				// FillHouse AI (spawn 7)
SUP_sec_AI8 = "sec8";				// FillHouse AI (spawn 8)
SUP_sec_AI9 = "sec9";				// FillHouse AI (spawn 9)
SUP_sec_AI10= "sec10";				// FillHouse AI (spawn 10)

SUP_sec_AI11= "sec11";				// Millitarize AI (spawn 11)
SUP_sec_AI12= "sec12";				// Millitarize AI (spawn 12)
SUP_sec_AI13= "sec13";				// Millitarize AI (spawn 13)
SUP_sec_AI14= "sec14";				// Millitarize AI (spawn 14)
SUP_sec_AI15= "sec15";				// Millitarize AI (spawn 15)
SUP_sec_AI16= "sec16";				// Millitarize AI (spawn 16)
SUP_sec_AI17= "sec17";				// Millitarize AI (spawn 17)
SUP_sec_AI18= "sec18";				// Millitarize AI (spawn 18)
// sec_AI19= "sec19";				// Millitarize AI (spawn 19) // this is an example if you not want to use so many Markers, just add two // at the start of the Line
// sec_AI20= "sec20";				// Millitarize AI (spawn 20)

/* ********************** Advanced Configuration START ******************************** */

// Radius options:
SUP_radiusFH=300;		// In this radius the "FillHouse AI" will Patrol (radius per Marker/Group)		[default is 300] [maximal 500 !!!]
SUP_radiusM =300;		// In this radius the "Millitarize AI" will Patrol (radius per Marker/Group) 	[default is 300] [maximal 500 !!!]

// SimpleCache radius options:
SUP_SCradius=1200;		// Radius the FillHouse and Militarize -units spawn when player is near, and despawn when player is further. [default is 1200 Meter]

// AI Patrol options:
SUP_patrolFH= true; 		// if false the "FillHouse AI" do not Patrol. 											[default is true]
SUP_patrolM = false; 		// if true the "Millitarize AI" do not Patrol ! (at Millitarize is reversed !!!) 		[default is false]
SUP_patroltype=2;			// if 1 the "FillHouse AI" do not Patrol outside Buildings. (Only inside the Buildings) [default is 2]

/* ****************************** Configurate  END ********************************* */

/* ***************************** DO NOT TOUCH BELOW ******************************** */
// Main Unit options:
//nohouse = true;		// only true if absolutely no houses in the area !!! Then spawn only the Millitarize AI. If _nohouse is true, _house must be false !!!
//house   = false;		// If _nohouse is true, _house must be false !!!
// If the AI should spawn on markers: replace the [] with "" // with Coordiantes [x,y,z] // with marker "markername"
SUP_sector_config_loaded = true;