/*
	File: spawncrates.sqf
	Author: NedFox [TZW]
	Description: Custom Crates, randomly placed around a marker.
	Edit: Suppe edition	
	
	Configurate the Loot in LINE 52 !
*/
if (isServer) then {

diag_log format['***[Sector] Spawn crates***'];

// Box spawn on Coordiantes: (not aktiv)								
// Example : This is the center around which the crates will spawn, Sector B island on Tavi. //Coords Sector Center
//_spawnCenter = [16529.719,18420.574,34.364796];

// Box spawn on Marker: (aktiv)
_spawnCenter = getmarkerpos SUP_boxspawnposi;
_numberofcrates = SUP_noc;
_min = SUP_mini;
_max = SUP_maxi;
_water = SUP_watermode;	
_marker = SUP_marker;
_markersize = SUP_markers;

_shoremode = 0; 				// 0: does not have to be at a shore , 1: must be at a shore
_mindist = 2; 					// minimum distance from the nearest object (Number) in meters, ie. spawn at least this distance away from anything within x meters..

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
	
/* ******************************Configuration START********************************* */
	
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
	
/* ****************************** Configuration END ********************************* */
  }
};
