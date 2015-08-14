class CfgPatches {
	class a3_epoch_sector {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_server_settings"};
	};
};
class CfgFunctions {
	class Suppe {
		class main {
			file = "\x\addons\a3_epoch_sector\init";
			class init {
				postInit = 1;
			};
		};
	};
};

