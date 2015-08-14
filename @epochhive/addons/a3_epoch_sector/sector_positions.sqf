	/*
	a3_epoch_sector
	by Suppe

	This is the Mainmissionframework...
	You need to fill in "Coordinates" and "Functions"...
	You can easily create your own unique Zone/Area/Sector.

	The Functions are:
	
	SUP_spawn_AI				// Spawned a AI Group... Options are in the sector_config.
	SUP_spawn_Heli				// Spawned 1 Heli... Options are in the sector_config.
	SUP_spawn_LandVehicle		// Spawned 1 LandVehicle... Options are in the sector_config.
	SUP_spawn_StaticAI			// Spawned 1 StaticAI with Snipergear... Place them on a Roof, like in good old Arma2 Origin Sector B. Options are in the sector_config.
	SUP_spawn_StaticMG			// Spawned 1 StaticMG, StaticGun... Place them on a Roof or Mountain to stop player flying around with an heli in the Area. Options are in the sector_config.
	SUP_spawn_StaticVehicle		// Spawned 1 StaticVehicle... (Vehicle dont move) Place them on a Roof or Mountain to stop player flying around with an heli in the Area. Options are in the sector_config.
	SUP_createMarker			// Create a Marker... Create Marker/s on every place you want/or if you dont want Markers then dont use SUP_createMarker. Options are in the sector_config.
	SUP_createLootbox 			// Create a Lootbox... Create 1 Lootbox on the Coordinates. Options are in the sector_config.
		
	Coordinates are in: [X, Z, Y] Check the readme if you need help to get Coordinates.

	A whole Line (Array) must look like this:
	_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;
	
	You can use the different Functions so often you want or need them. (on different positions)
	
	You can use selectrandom as well, Perfect for a bit of variety, good for the Lootbox and Static Stuff.
	Example:
	_Sector_position = [ [X1, Z1, Y1], [X2, Z2, Y2], [X3, Z3, Y3] ] call BIS_fnc_selectRandom; [_Sector_position] call SUP_FunctionYouNeed;
	
	Or you can use a % change as well, Perfect for a bit of variety...
	Example:
	if (random 1 < .20) then {
		_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;	// the 0.20 is = 20 % so, a 20 % cahnge that the Function spawn there.
	};
	
	At Line 46 start the different Maps, look at the Altis example, but the SectorAddon is normally to create your own unique Zone/Area/Sector.
	*/
	
	/* ***************************** Position options ******************************** */
	
	diag_log "***[Sector] Loading Sector_Positions***";
	
	switch(toLower worldName)do{
	
		case "altis":{	
/*_Sector_position = 	[X, Z, Y];					[_Sector_position] call SUP_FunctionYouNeed;   */
_Sector_position = [20792, 6743.42, 0]; 			[_Sector_position] call SUP_createMarker;
_Sector_position = [20794.8, 6772.2, 0]; 			[_Sector_position] call SUP_spawn_StaticVehicle;
_Sector_position = [20840.2, 6671.18, 0]; 			[_Sector_position] call SUP_spawn_Heli;
_Sector_position = [20792.8, 6750.84, 0]; 			[_Sector_position] call SUP_spawn_AI;
_Sector_position = [20843.1, 6743.28, 0]; 			[_Sector_position] call SUP_spawn_AI;
_Sector_position = [20785.2, 6675.08, 0]; 			[_Sector_position] call SUP_spawn_AI;
_Sector_position = [20791.3, 6744.36, 0]; 			[_Sector_position] call SUP_spawn_AI;
_Sector_position = [20801.7, 6670.95, 8.42146]; 	[_Sector_position] call SUP_spawn_StaticMG;
_Sector_position = [20706.8, 6728.78, 8.51238]; 	[_Sector_position] call SUP_spawn_StaticAI;
_Sector_position = [20716.8, 6583.21, 7.94939]; 	[_Sector_position] call SUP_spawn_StaticAI;

if (random 1 < .50) then {
	_Sector_position = [20797.2, 6776.87, 0]; 		[_Sector_position] call SUP_spawn_AI;	// the 0.50 is = 50 % so, a 50 % cahnge that the Function spawn there.
};

_Sector_position = [ [20767.3, 6715.75, 0], [20823.4, 6748.37, 0], [20802, 6709.29, 0] ] call BIS_fnc_selectRandom; [_Sector_position] call SUP_createLootbox;

		};	//end of altis
		
		case "tavi":{
/*	_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;   */

	_Sector_position = [0, 0, 0];
	_Sector_position = [0, 0, 0];
	
		};
		
		case "chernarus":{
/*	_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;   */

	_Sector_position = [0, 0, 0];
	_Sector_position = [0, 0, 0];
	
		};
		
		case "Chernarus_Summer":{	
/*	_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;   */

	_Sector_position = [0, 0, 0];
	_Sector_position = [0, 0, 0];
	
		}; 
		
		case "Esseker":{
/*	_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;   */

	_Sector_position = [0, 0, 0];
	_Sector_position = [0, 0, 0];
	
		};
		
		case "Australia":{
/*	_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;   */

	_Sector_position = [0, 0, 0];
	_Sector_position = [0, 0, 0];
	
		};
		
		case "bornholm":{
/*	_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;   */

	_Sector_position = [0, 0, 0];
	_Sector_position = [0, 0, 0];
	
		};
		
		case "stratis":{
/*	_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;   */

	_Sector_position = [0, 0, 0];
	_Sector_position = [0, 0, 0];
	
		};
};
//		case "CREATEMOREIFYOUNEED":{
/*	_Sector_position = [X, Z, Y];	[_Sector_position] call SUP_FunctionYouNeed;   */
//
//	_Sector_position = [0, 0, 0];
//	_Sector_position = [0, 0, 0];
//
//		};

diag_log "***[Sector] Sector_Positions loaded***";