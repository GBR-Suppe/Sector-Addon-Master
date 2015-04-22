class CfgPatches {
	class Sector_addon {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_server_settings"};
	};
};
class CfgFunctions {
	class Sector {
		class main {
			file = "\x\addons\Sector_addon\init";
			class init {
				postInit = 1;
			};
		};
	};
};

