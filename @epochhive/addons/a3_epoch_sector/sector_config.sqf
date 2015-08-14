/*
	a3_epoch_sector
	by Suppe
*/

	diag_log "***[Sector] Loading Sector_config***";
	
	
	/* ***************************** AI Group options ******************************** */
	
	/* AI per Group */
	SUP_groupcount = round(random 3)+1;		// 4 AI + 2 AI random
	
	/* AI Patrol Radius */
	SUP_AI_PR = 250;						// The AI Group patrol in a 250m radius around the starting Point
	
	/* AI Skill*/
	SUP_AI_skill = 0.75;						// "AI" Skill  // INFO: from 0.01 (very very bad AI) - 1.0 (Godlike AI) [default is 0.75]
	
	/* Option to stop AI spawning with rocket launcher */
	/* Normally get 20 % of the AI a rocket launcher (default) */
	/* The AI used the rocket launcher only against vehicles */
	
	SUP_AI_with_Rockets = true; 			// false and the AI will spawn without Rocket launcher.
	
	
	/* *****************************   Marker options   ******************************** */
	
	/* Markertext on Map: */
	SUP_markertext = format ["Sector C"];			// format ["CHANGETEXTHERE"]; do not delete the " format [" "]; "   // default is: SUP_markertext = format ["Sector C"];	
	
	
	/* *****************************  Vehicle options  ******************************** */
	
	/* In Epoch the Vehicles must be a Independent Vehicle (with I_ at the start) Use the examples ! */
	
	/* Helityp */
	/* The Helicopters are not really suitable for Epoch, the only one with is gun is:  I_Heli_light_03_F*/
	SUP_helityp = "I_Heli_light_03_F";		// I_Heli_light_03_F  I_Heli_light_03_unarmed_F  I_Heli_Transport_02_F  
	
	/* LandVehicle */
	SUP_LandVehicle = "I_G_Offroad_01_armed_F";  	// I_MRAP_03_hmg_F  I_MRAP_03_F   I_G_Offroad_01_armed_F
	
	/* StaticWeapon */
	SUP_MGtyp = "I_HMG_01_high_F";		// I_GMG_01_high_F    I_static_AT_F
	
	/* StaticVehicle */
	SUP_StaticVehicle = "I_G_Offroad_01_armed_F";  	// I_MRAP_03_hmg_F  I_MRAP_03_F   I_G_Offroad_01_armed_F
	
	
	/* ***************************** AI Gear options ******************************** */
	
	/* 	The AI get a random Weapons/Pistols/Uniforms/Vests outside the pools: 		  */
	/*	The AI get the correct Ammo automatically. 									  */
	/*	The AI spawned with random Scopes,Headgear and Food. 						  */
	/*	Remove or add Gear for the AI. The last one from every Pool without comma !   */
	
	SUP_gunpool = [
	/* Sniper */
	"m107_EPOCH","5Rnd_127x108_Mag","Srifle_GM6_F","Srifle_LRR_F",
	/* DMR */
	"M14_EPOCH","M14Grn_EPOCH","srifle_EBR_F","srifle_DMR_01_F","arifle_MXM_F","arifle_MXM_Black_F",
	/* SMG */
	"SMG_02_F","SMG_01_F","Hgun_PDW2000_F",
	/* LMG */
	"m249_EPOCH","m249Tan_EPOCH","LMG_Mk200_F","Arifle_MX_SW_F","Arifle_MX_SW_Black_F","LMG_Zafir_F",
	/* MG */
	"akm_EPOCH","m16_EPOCH","m16Red_EPOCH","m4a3_EPOCH","Arifle_Katiba_C_F","Arifle_Mk20_F","Arifle_Mk20C_F","Arifle_Mk20C_plain_F","Arifle_Mk20_plain_F","Arifle_MXC_F","Arifle_MXC_Black_F","Arifle_MX_F","Arifle_MX_Black_F","Arifle_SDAR_F","Arifle_TRG21_F","Arifle_TRG20_F"
	];
	SUP_pistolpool = [
	"hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","ruger_pistol_epoch","1911_pistol_epoch","hgun_Pistol_Signal_F"
	];
	SUP_uniformpool = [
	"U_OG_Guerilla1_1","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3","U_OG_Guerilla3_1","U_OG_Guerilla3_2"
	];
	SUP_vestpool = [
	"V_1_EPOCH","V_2_EPOCH","V_3_EPOCH","V_4_EPOCH","V_5_EPOCH","V_6_EPOCH","V_7_EPOCH","V_8_EPOCH","V_9_EPOCH","V_10_EPOCH","V_11_EPOCH","V_12_EPOCH","V_13_EPOCH","V_14_EPOCH","V_15_EPOCH","V_16_EPOCH","V_17_EPOCH","V_18_EPOCH","V_19_EPOCH","V_20_EPOCH","V_21_EPOCH","V_22_EPOCH","V_23_EPOCH","V_24_EPOCH","V_25_EPOCH","V_26_EPOCH","V_27_EPOCH","V_28_EPOCH","V_29_EPOCH","V_30_EPOCH","V_31_EPOCH","V_32_EPOCH","V_33_EPOCH","V_34_EPOCH","V_35_EPOCH","V_36_EPOCH","V_37_EPOCH","V_38_EPOCH","V_39_EPOCH","V_40_EPOCH"
	];
	
	
	/* ************************* DO NOT TOUCH LINE 83-91 **************************** */
	
	SUP_createLootbox = {
	
//	private ["_position","_box"];

	_position  = _this select 0;
	
	_box = "CargoNet_01_box_F" createvehicle _position;  
	clearMagazineCargoGlobal _box; clearWeaponCargoGlobal _box; clearItemCargoGlobal _box; clearBackpackCargoGlobal _box;
	_box setVariable ["permaLoot",true]; _box allowDamage false;
	
	/* ***************************** LootBox options ******************************** */
	
	/* 	Edit/add/remove Loot for the Lootboxes */
	/* 	More examples below... */
	
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

};

// 	EXAMPLES for the Lootbox:
// 	with a not random number:
// 	_box addBackpackCargoGlobal ["B_Carryall_ocamo",  	1 +		(random 1)];
// 	without random: 
// 	_box addBackpackCargoGlobal ["B_Carryall_ocamo",  	1 				  ];
	
	/* ****************************** Configuration END ********************************* */

	/* ***************************** DO NOT TOUCH BELOW ********************************* */
	_handleDoors = true;
	diag_log "***[Sector] Sector_config loaded***";