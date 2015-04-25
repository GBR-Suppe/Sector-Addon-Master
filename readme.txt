Sector Addon Version "0.0.1 alpha" by GBR Suppe.

Sector is unfinished and not 100 % ready, but it works good and the Ai Spawn dont create a lag or frezze. Not testet on full Servers !
The AI work with "simplecache", so the AI spawn only if a player is near to the area (default 1200 Meter)

You are free to edit,share or add what you want, but please share your improvements with the community, and dont remove my header in the scripts !

What is Sector ?
Sector is a static AI Mission, it will spawn 72-90 Soldiers in a Area you want.

History:
Sector is original from Arma 2 Origins...
Sector or Salvation City, also known as (Sector B, the last human standing city where the elites and the rich still live, far away from the infected, protected by high walls and the worlds top trained elite mercenaries.

Features:
- Millitarize, Fills area with units.
- FillHouse, Fills nearest building, OR all buildings in defined range, with soldiers.
- simpleCache, Makes fillHouse and militarize -units spawn when player is near, and despawn when player is further.
- High skilled mercenaries to protect their inhabitants - These mercenaries will shoot anyone one sight.
- Weapons and supplies - Look for their Boxes filled with guns, ammo, and supplies.
- Inhabitants - These pacific humans are trying to survive the apocalypse and pose no immediate threat.

 
Download:
https://github.com/G...or-Addon-Master

 
Install:
	***This addon is not easy to configurate and to install, please dont use it if you not understand it !***

- Copy the "sector_addon.pbo" into the folder "@epochhive\addons\"

- Create 18 marker in your Mission.sqm (Markername: sec1,sec2,sec3,sec4,sec5,sec6,sec7,sec8,sec9,sec10,sec11,sec12,sec13,sec14,sec15,sec16,sec17,sec18) markertype=Empty (look in the mission.sqm example !)

  On every marker 4 Soldiers + 1 Random will be spawn, so 72-90 Soldiers will spawn there, if 72-90 are to much, then use only 12 markers or so...
  The AI patrol in a 300 Meter radius, so every 300 Meter radius one marker (change the radius in the fn_init)
  Check the example epoch.Mission or the example picture.

  Marker 1-10 fills all buildings in defined range, with soldiers., so u need houses there.....
  Marker 11-18 are Millitarize, Fills area with units. work without Buildings.

- Add Mapcontant in \Sector_addon\mapcontant (Build with A3 3D Editor, export sqf)
  *place Jammer to stop the Lootspawn and to stop player to build in the zone.*

 
Configurate:
- Change the Coords and the Loot in the Spawncrate.sqf. (is marked in the Spawncrate.sqf)

- Open Sector_addon\init\fn_init to lower the number the AI (more explanations are in the init itself)

  //Millitarize  // Fills area with units.    
  nul = ["Markername",SIDE 3=INDEPENDET,RADIUS AI PATROL,[true,false],[false,false,false],false,[NUMBEROFAI,+RANDOMAINUMBER],[3,0],"default",nil,nil,AI ID FOR SIMPLECACHE]...
  nul = ["sec11",3,300,[true,false],[false,false,false],false,[4,1],[3,0],"default",nil,nil,11] execVM "\x\addons\Sector_addon\scripts\LV\militarize.sqf";
 
  //FillHouse  //Fills nearest building, OR all buildings in defined range, with soldiers.
  nul = ["sec1",3,true,2,[4,1],300,"default",nil,nil,1] execVM "\x\addons\Sector_addon\scripts\LV\fillHouse.sqf";
  nul = ["Markername",SIDE 3=INDEPENDET,true,2,[NUMBEROFAI,+RANDOMAINUMBER],RADIUS AI PATROL,"default",nil,nil,AI ID FOR SIMPLECACHE]...
 
  //simpleCache  // Makes fillHouse and militarize -units spawn when player is near, and despawn when player is further.
  nul = [[  ID,ID,ID ],[TARGET],RADIUS AI WILL SPAWN,true,true]
  nul = [[  1,2,3,4,5,6,7,8,9,10 ],[player],1200,true,true]
 
More Infos in the "Configurate LV" Folder.

Configurate Optional:
- Open Sector_addon\scripts\LV\militarize.sqf and fillHouse.sqf to edit the AI Guns or Items..... (is marked in the .sqf)

 
Cooming Soon:
- Heli Patrol over the Sector Area
- Anti-Logout in the Sector Area

 
Greetz GBR Suppe