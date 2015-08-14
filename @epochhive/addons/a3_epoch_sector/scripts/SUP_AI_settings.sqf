/*
	a3_epoch_sector
	by Suppe
*/

	diag_log "***[Sector] Loading AI_settings***";
	
SUP_AI_settings = {

//	private ["_AI","_uniform","_vest","_gun","_pistol","_attachment","_hAmmo","_ammo","_pAmmo","_ammob","_backpacks","_launcher","_ammoc","_ammod","_item","_groupArray","_groupAI"];

	_AI = _this select 0;
	_groupArray = [];
	
	_uniform = SUP_uniformpool call BIS_fnc_selectRandom;
	_vest = SUP_vestpool call BIS_fnc_selectRandom;
	_gun = SUP_gunpool call BIS_fnc_selectRandom;
	_pistol = SUP_pistolpool call BIS_fnc_selectRandom;

	_attachment = ((getArray (configFile >> "cfgLootTable" >> "Scopes" >> "items")) call BIS_fnc_selectRandom);
	
	_hAmmo = [] + getArray (configFile >> "cfgWeapons" >> _pistol >> "magazines");
	_ammo = _hAmmo select 0;
	_pAmmo = [] + getArray (configFile >> "cfgWeapons" >> _gun >> "magazines");
	_ammob = _pAmmo select 0;
	
	_backpacks = ["B_Carryall_cbr","B_Carryall_khk","B_Carryall_mcamo","B_Carryall_ocamo","B_Carryall_oli","B_Carryall_oucamo"]call BIS_fnc_selectRandom;
	
	_launcher = ["launch_NLAW_F","launch_RPG32_F"] call BIS_fnc_selectRandom;
	_ammoc = [] + getArray (configFile >> "cfgWeapons" >> _launcher >> "magazines");
	_ammod = _ammoc select 0;

	_item = ((getArray (configFile >> "CfgLootTable" >> "Food" >> "items"))call BIS_fnc_selectRandom);
	if((_item select 0)select 1 == "CfgLootTable")then{
		_item = ((getArray (configFile >> "CfgLootTable" >> ((_item select 0)select 0) >> "items"))call BIS_fnc_selectRandom);
	};

	removeUniform _AI; removeHeadgear _AI; removeBackpack _AI; removeAllItems _AI; removeAllWeapons	_AI; removeBackpack _AI; removeHeadGear	_AI; removeVest	_AI; {_AI removeMagazine _x;} foreach (magazines _AI);
	{_AI enableAI _x;}count ["TARGET","AUTOTARGET","MOVE","ANIM","FSM"];
	_AI setRank "Private"; _AI setskill SUP_AI_skill;
	
	_AI addHeadgear format["H_%1_EPOCH", ceil(random 104)];
	_AI forceAddUniform _uniform;
	_AI addVest _vest;

	for "_i" from 0 to (floor(random 3))+2 do {
		_AI addMagazine _ammo;
	};
	for "_i" from 0 to (floor(random 3))+2 do {
		_ammob = _pAmmo select 0;
		_AI addMagazine _ammob;
	};
	_AI addWeapon _gun;
	_AI addWeapon _pistol;
	
	if(SUP_AI_with_Rockets)then{
			if (random 1 < .20) then {
			_AI addBackpack _backpacks;
			for "_i" from 0 to 2 do {
				_AI addMagazine _ammod;
				};
				_AI addWeapon _launcher;
		};
	};
	if (random 1 < .33) then {
		_AI addPrimaryWeaponItem ((_attachment select 0)select 0);
	};
	if (random 1 < .33) then {
		_AI addItem ((_item select 0)select 0);
	};
	if(sunOrMoon < 0.1)then{
		_AI addWeapon "NVG_EPOCH";
	};
	_AI selectWeapon (primaryWeapon _AI);
	
	if (count (units _groupAI) == SUP_groupcount) then {
		_groupArray = _groupArray + [_groupAI];
		_groupAI = grpNull;
		_groupAI = createGroup RESISTANCE;
		_groupAI setBehaviour "AWARE";		// SAFE // AWARE
		_groupAI setCombatMode "RED";		// BLUE // RED
	};
};

HS_unit_killed = {
	
	_ai = _this select 0;
	_killer = _this select 1;
	_ai removeAllEventHandlers "Killed";
	{
		if(_x in ((weapons _ai)+(items _ai)))then{
			_ai removeWeaponGlobal "NVG_EPOCH";
			_ai removeWeaponGlobal _x;
			_ammo = [] + getArray(configFile >> "cfgweapons" >> _x >> "magazines");
			{if(_x in _ammo)then{_ai removeMagazine _x;_ai removeItem _x;};}forEach ((magazines _ai)+(items _ai));
		};
	}forEach ["launch_NLAW_F","launch_RPG32_F"];

	if (!(isPlayer _killer) || typeOf _killer != typeOf (vehicle _killer) && (assignedVehicleRole _killer) isEqualTo ["Driver"]) then {
		{_ai removeMagazine _x;} foreach (magazines _ai);
		removeAllWeapons _ai;removeAllItems _ai;removeAllAssignedItems _ai;
		removeUniform _ai;removeVest _ai;removeBackpack _ai;
		removeGoggles _ai;removeHeadGear _ai;
	};
};
	diag_log "***[Sector] AI_settings loaded***";