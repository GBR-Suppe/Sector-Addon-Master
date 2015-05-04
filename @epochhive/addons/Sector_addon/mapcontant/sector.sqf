private ["_objs"];
_objs = [
//	["PlotPole_EPOCH",[16698.4,17449.7,0],277.727,[[-0.990919,0.134458,0],[0,0,1]],false],
//	["PlotPole_EPOCH",[16277.2,17661.3,0],277.727,[[-0.990919,0.134458,0],[0,0,1]],false]
];

{
	private ["_obj"];
	_obj = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
	if (_x select 4) then {
		_obj setDir (_x select 2);
		_obj setPos (_x select 1);
	} else {
		_obj setPosATL (_x select 1);
		_obj setVectorDirAndUp (_x select 3);
	};
} foreach _objs;