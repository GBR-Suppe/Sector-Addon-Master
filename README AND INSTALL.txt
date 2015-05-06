Sector Addon 
Version "0.0.4" 
by GBR Suppe


What is Sector ?
A Missionframework to create your own Zone with AI. Sector B
Or create more then one Zone. (for example: 5 AI Soldiers in every big Town)
So you have plenty of opportunities.


Features:
- Work on every Map
- Millitarize, Fills area with units.
- FillHouse, Fills nearest building, OR all buildings in defined range, with soldiers.
- simpleCache, Makes fillHouse and militarize -units spawn when player is near, and despawn when player is further.
- Optional with AI Vehicles
- Boxes filled with guns, ammo, and supplies.

The AI work with "simplecache", so the AI spawn only if a player is near to the area. (default 1200 Meter) 

Not testet on full Servers ! And please report Bugs.


Download:
https://github.com/G...or-Addon-Master


Install and Configurate:

1.0 Select your Map from the MPMissions folder. Exchange these with your, or merge them together, or copy the markers in the Arma3 editor in your mission.sqf
  
1.1 (Optional) Open the Arma3 editor and place or sort the 19 marker in your Mission.sqm 
	*Markername: sec_center,sec1,sec2,sec3,sec4,sec5,sec6,sec7,sec8,sec9,sec10,sec11,sec12,sec13,sec14,sec15,sec16,sec17,sec18*
    *Markertype=Empty*  // if you need Help: https://www.youtube.com/watch?v=rkZCI14SbEU   watch here(1:39) or look in the "Example Folder" !  
																						 
2.0 Open Sector_addon\scripts\sector_controlcenter.sqf  to configurate the Sector. 

3.0 Add Mapcontant in \Sector_addon\mapcontant (Build with A3 3D Editor, export .sqf)
    *place Jammer to stop the Lootspawn and to stop player to build in the zone.*

4.0 (Optional) Open Sector_addon\scripts\LV\militarize.sqf and fillHouse.sqf to edit the AI, Guns, Ammo or Clothes. (is marked in the .sqf)

5.0 (Optional) Change the Loot in the Spawncrate.sqf (is marked in the Spawncrate.sqf)

6.0 Pack the .pbo back together and and copy them into: \@epochhive\addons\



Cooming Soon:
- Anti-Logout in the Sector Area
- More fixes (AI dont shot at Vehicles)


History:
Sector is original from Arma 2 DayZ Origins...
Sector or Salvation City, also known as (Sector B, the last human standing city where the elites and the rich still live, far away from the infected, protected by high walls and the worlds top trained elite mercenaries.


Credits: (Include)
- AI Spawn Script Pack by spunFIN
  http://www.armaholic...ge.php?id=19832
- Spawncrate by NedFox [TZW]
  http://epochmod.com/forum/index.php?/topic/32780-community-server-side-mod/

 
	Greetz GBR Suppe