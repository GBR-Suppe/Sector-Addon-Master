Sector Addon Version "0.0.1b" by GBR Suppe.

This is not easy to install and configurate !

Sector is unfinished and not 100 % ready, but it works good and the Ai Spawn dont create a lag or frezze. Not testet on full Servers !
Sector was more then 4 weeks aktiv on one of my Epoch Servers, no problem with the AI or Loot ! But please report Bugs.

The AI work with "simplecache", so the AI spawn only if a player is near to the area (default 1200 Meter)

You are free to edit,share or add what you want, but please share your improvements with the community, and dont remove my header in the scripts !

What is Sector ?
Sector is a static AI Mission, it will spawn 72-90 Soldiers on places you want.

History:
Sector is original from Arma 2 DayZ Origins...
Sector or Salvation City, also known as (Sector B, the last human standing city where the elites and the rich still live, far away from the infected, protected by high walls and the worlds top trained elite mercenaries.

Features:
- Work on every Map
- Millitarize, Fills area with units.
- FillHouse, Fills nearest building, OR all buildings in defined range, with soldiers.
- simpleCache, Makes fillHouse and militarize -units spawn when player is near, and despawn when player is further.
- Weapons and supplies - Look for their Boxes filled with guns, ammo, and supplies.


Download:
https://github.com/G...or-Addon-Master


Install and Configurate:

- Select your Map from the MPMissions folder. Exchange these with your, or merge them together, or copy the markers in the Arma3 editor in your mission.sqf
  
- Copy the "sector_addon.pbo" into the folder "@epochhive\addons\"

Optional:

-1- Open the Arma3 editor and place or sort the 18 marker in your Mission.sqm (Markername: sec1,sec2,sec3,sec4,sec5,sec6,sec7,sec8,sec9,sec10,sec11,sec12,sec13,sec14,sec15,sec16,sec17,sec18)
                                                                              (Markertype=Empty)
  *On every marker 4 Soldiers + 1 Random will be spawn, so 72-90 Soldiers will spawn there, if 72-90 are to much, then use only 12 markers or so...
  The AI patrol in a 300 Meter radius, so every 300 Meter radius one marker (change the radius in the fn_init)
  
-2- Open the Arma3 editor and place or sort the 1 marker in your Mission.sqm (Markername: sec_center)
                                                                             (Markertype=Empty) (look in the "Example Folder" !)   
    *The Lootbox spawn near the "sec_center" marker

-3- Add Mapcontant in \Sector_addon\mapcontant (Build with A3 3D Editor, export sqf)
    *place Jammer to stop the Lootspawn and to stop player to build in the zone.*

-4- Change the Loot in the Spawncrate.sqf (is marked in the Spawncrate.sqf)

-5- Open Sector_addon\scripts\LV\militarize.sqf and fillHouse.sqf to edit the AI, Guns or Items..... (is marked in the .sqf)

-6- Open Sector_addon\init\fn_init to lower the number the AI (more explanations are in the init itself)

  *Info fn_init.sqf, importend are:
  //Millitarize  // Fills area with units.    
  nul = ["Markername",SIDE 3=INDEPENDET,RADIUS AI PATROL,[true,false],[false,false,false],false,[NUMBEROFAI,+RANDOMAINUMBER],[3,0],"default",nil,nil,AI ID FOR SIMPLECACHE]...  (!!! Do not change the Side, 3 is INDEPENDET and correctly !!!)
  nul = ["sec11",        3             ,      300       ,[true,false],[false,false,false],false,[     4    ,     1         ],[3,0],"default",nil,nil,        11           ]...
 
  //FillHouse  //Fills nearest building, OR all buildings in defined range, with soldiers.
  nul = ["Markername",SIDE 3=INDEPENDET,true,2,[NUMBEROFAI,+RANDOMAINUMBER],RADIUS AI PATROL,"default",nil,nil,AI ID FOR SIMPLECACHE]...   (!!! Do not change the Side, 3 is INDEPENDET and correctly !!!)
  nul = ["sec1"            3           ,true,2,[           4,1            ],     300        ,"default",nil,nil,       1             ]... 
 
  //simpleCache  // Makes fillHouse and militarize -units spawn when player is near, and despawn when player is further.
  nul = [[  ID,ID,ID ],[TARGET],RADIUS AI WILL SPAWN,true,true]
  nul = [[  1,2,3,4,5,6,7,8,9,10 ],[player],1200,true,true]
 

  More Infos in the "Configurate LV" Folder.  Examples are in the "Example Folder".


HowTo place Marker:
https://www.youtube.com/watch?v=rkZCI14SbEU   watch here(1:39)


Cooming Soon:
- Heli Patrol over the Sector Area
- Anti-Logout in the Sector Area


Credits: (Include)
- AI Spawn Script Pack by spunFIN
  http://www.armaholic...ge.php?id=19832
- Spawncrate by NedFox [TZW]
  http://epochmod.com/forum/index.php?/topic/32780-community-server-side-mod/

 

Greetz GBR Suppe