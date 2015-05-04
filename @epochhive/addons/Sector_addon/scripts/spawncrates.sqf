/*
	File: spawncrates.sqf
	Author: NedFox [TZW]
	Description: Custom Crates, randomly placed around a marker.
	Edit: GBR Suppe edition	
*/
if (isServer) then {

// configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // 

_numberofcrates = 3;								// this is the number of crates that you want to spawn							
//_spawnCenter = [16529.719,18420.574,34.364796]; 	// Example : This is the center around which the crates will spawn, Sector B island on Tavi. //Coords Sector Center
_spawnCenter = getmarkerpos "sec_center"; 			// Use this if you want the global center of the map, it's declared in mission.sqm, island specific
_min = 1; 											// minimum distance from the center position (Number) in meters
_max = 50; 											// Example : maximum range of spawned crates, to keep them INSIDE the sector B compound

_mindist = 2; 		// minimum distance from the nearest object (Number) in meters, ie. spawn at least this distance away from anything within x meters..
_water = 0;			// water mode (Number)	0: cannot be in water , 1: can either be in water or not , 2: must be in water
_shoremode = 0; 	// 0: does not have to be at a shore , 1: must be at a shore
_marker = false; 	// Draw a green circle in which the crate will be spawned randomly
_markersize = 5; 	// Radius of the marker in meters

// configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // 


diag_log format['***[Sector] Starting Spawncrates.sqf***'];

for "_i" from 1 to _numberofcrates do
  {
	_pos = [_spawnCenter,_min,_max,_mindist,_water,2000,_shoremode] call BIS_fnc_findSafePos; 		// find a random location within range

	if (_marker) then {
	    _event_marker = createMarker [ format ["loot_marker_%1", _i], _pos];
		_event_marker setMarkerShape "ELLIPSE";
		_event_marker setMarkerColor "ColorGreen";
		_event_marker setMarkerAlpha 0.75;
		_event_marker setMarkerSize [(_markersize+15), (_markersize+15)]; 							//green circle slightly bigger , box can spawn just outside if not increased
		_pos = [_pos,0,_markersize,0,_water,2000,_shoremode] call BIS_fnc_findSafePos; 	 			//find a random spot INSIDE the marker area
		_pos = [_pos select 0, _pos select 1, 0];
	};	

	diag_log format['***[Sector] Spawncrate %1 : Location %2***',_i,_pos];

	_box = "CargoNet_01_box_F" createvehicle _pos;  				//create the crate  .. These ARE liftable with chopper like the CH-67 , but will not stay after restarts !
	
	clearMagazineCargoGlobal _box;
	clearWeaponCargoGlobal _box;
    clearItemCargoGlobal _box;
	_box setVariable ["permaLoot",true];							//stay until reset
	_box allowDamage false;											// Prevent boxes to explode when spawning
	
// configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // 
	
	_box addWeaponCargoGlobal ["m107Tan_EPOCH",  				(random 1)];
	_box addWeaponCargoGlobal ["AKM_EPOCH", 					(random 1)];
	_box addWeaponCargoGlobal ["MultiGun", 						(random 1)];

	_box addMagazineCargoGlobal ["5Rnd_127x108_Mag", 			(random 1)];
	_box addMagazineCargoGlobal ["30Rnd_762x39_Mag", 			(random 1)];
	_box addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 	(random 1)];
	_box addMagazineCargoGlobal ["HandGrenade", 				(random 1)];

	_box addItemCargoGlobal ["optic_LRPS", 						(random 1)];
	_box addItemCargoGlobal ["optic_tws", 						(random 1)];
	_box addItemCargoGlobal ["NVG_EPOCH", 						(random 1)];
	_box addItemCargoGlobal ["Rangefinder", 					(random 1)];
	_box addItemCargoGlobal ["WhiskeyNoodle", 					(random 1)];
	_box addItemCargoGlobal ["ItemGoldBar10oz", 				(random 1)];
	_box addItemCargoGlobal ["ItemTopaz", 						(random 1)];
	_box addItemCargoGlobal ["FAK", 							(random 1)];
	_box addItemCargoGlobal ["EnergyPack", 						(random 1)];
	_box addItemCargoGlobal ["EnergyPackLg", 					(random 1)];
	_box addItemCargoGlobal ["Heal_EPOCH", 						(random 1)];
	_box addItemCargoGlobal ["Defib_EPOCH", 					(random 1)];
	_box addItemCargoGlobal ["Repair_EPOCH", 					(random 1)];
	_box addItemCargoGlobal ["ItemCorrugated", 					(random 1)];
	_box addItemCargoGlobal ["ItemCorrugatedLg", 				(random 1)];
	_box addItemCargoGlobal ["ItemLockbox", 					(random 1)];
	_box addItemCargoGlobal ["KitShelf", 						(random 1)];
	_box addItemCargoGlobal ["KitCinderWall", 					(random 1)];
	_box addItemCargoGlobal ["KitPlotPole", 					(random 1)];
	_box addItemCargoGlobal ["V_40_EPOCH", 						(random 1)];
	_box addItemCargoGlobal ["wolf_mask_epoch", 				(random 1)];
	_box addItemCargoGlobal ["pkin_mask_epoch", 				(random 1)];

	_box addBackpackCargoGlobal ["B_Carryall_cbr", 				(random 1)];
	_box addBackpackCargoGlobal ["B_Parachute", 				(random 1)];
	_box addBackpackCargoGlobal ["B_Carryall_ocamo",  			(random 1)];

// EXAMPLES:
// with a not random number:
// _box addBackpackCargoGlobal ["B_Carryall_ocamo",  	1 +		(random 1)];
// without random: 
// _box addBackpackCargoGlobal ["B_Carryall_ocamo",  	1 				  ];
	
// configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // configurate ! // 
  }
};
