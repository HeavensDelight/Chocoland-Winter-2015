/*
chocoland globalChat format ["%1 script started",_object ];
_nameString = "<t size='0.5' shadow='2' color='#FFFFFF'>" + "Exchange your Chocos (Press E)" + "</t>";
[_nameString,0,0.8,0.1,0,0,3] spawn bis_fnc_dynamicText;
kein insasse if ((count(crew _x) == 0)
call compile format["_Index = _pvalue lbadd ""%1"";    _pvalue lbSetData [(lbSize _pvalue)-1, ""%1""];", name _x];
PLAYERGUID muss im STRING behandelt werden und darf nicht an letzter stelle stehen, bei ADDACTION von R3F wenn bedingung abgefragt wird.
obbject grabber :
_x1 = getposatl player select 0;
_x2 = getposatl player select 1;
{if (player distance _x < 50)then {diag_log [typeOf _x,[(getposatl _x select 0) - _x1,(getposatl _x select 1) - _x2,getposatl _x select 2],getdir _x, damage _x,{}]}}count allMissionObjects "All";
*/
if(!X_Client) exitWith {};
[] execVM "ban.sqf";
player enableSimulation false; 
removeAllWeapons player;
[] execVM "client\functions\playerAbort.sqf";
[] execVM"client\chocofunc\colorVehicle.sqf";
puid = getplayeruid player;
playerUID = getPlayerUID(player);
//epoch filmatic
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
chocoking = ["name player",0];
climbing=false;
SPAWNART = 1;
oldBounty=1;
COLORRED=0;
COLORGREEN=0;
COLORBLUE = 0;
COLORALPHA =0;
Admins = [
"76561198010316297",  // viggomarksman
"76561198032150693",  // misterixi
"76561198135184514",  // patrick2
"76561198112291918",// patrick
"76561198078783807"  // ikke chocobo
]; 
multikill=0;
magsbackpack = [];
chatint=0;
chocoString="";
detachCounter=0;
atthfix = 0;
home = false;
Donatorweapon = [];
loadgearable = true;
capturecore= [0];
classselect =0;
spawnHalo = false;
punishplayer = 0;
seagull = false;
mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = objNull;
doCancelAction = false;
shipspawned= false;
behindi = 1;
claymorelimit = 0;
locking= false;
moneypick = 1;
timeplayer = 0;
loadout=nil;
currentMissionsMarkers = [];
currentRadarMarkers = [];
chocodoor =0;
rainbow= 0;
Dcooldown =false;
playerCompiledScripts = false;
playerSetupComplete = false;
poscheck =false;
RESCUE =false;
waitUntil {!isNull player};
waitUntil{time > 2};
player call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";
player call playerSetup;
if(!isNil "client_initEH") then {player removeEventHandler ["Respawn", client_initEH];};
player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];
[] execVM "client\clientEvents\onMouseWheel.sqf";
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};
"clientRadarMarkers" addPublicVariableEventHandler {[] call updateRadarMarkers};
"chocostring" addPublicVariableEventHandler { call compile chocoString;chocostring ="";};
[] execVM "client\functions\createTownMarkers.sqf";
[]execVM"client\functions\createMarkers.sqf";
[]execVM"client\functions\createMCapturing.sqf";
true execVM "client\functions\loadAtmosphere.sqf";
[] execVM "client\functions\playerTags.sqf";
[] execVM "client\functions\groupTags.sqf";
[]execVM"client\chocofunc\fnc_numberformat.sqf";
[] call updateMissionsMarkers;
[] call updateRadarMarkers;
//if (isNil "FZF_IC_INIT") then   {    call compile preprocessFileLineNumbers "client\functions\newPlayerIcons.sqf";};
player setDamage 0;
player setvariable["home",[0],false];
player setvariable["ks",0,false];
player setvariable["ongui","",false];
player setVariable["dot",0,false];
player setVariable["animal",false,false];
player setVariable["bounty",1,true];
player setVariable["donator",0,false];
player setVariable["decoder",1,false];
player setVariable["basebuilder",1,false];
player setVariable["cmoney",55555,true];
player setVariable["attach",1,false];
player setVariable["upgrades",1,false];
player setVariable["chocopack","0",false];
player setVariable["chocoload","",false];
player setVariable["mothership",[0,0],false];
player setVariable["highscore",[0,0,0,0,0,0,0,0],false];
player setVariable["saveVehicle","",false];
player setVariable["medkits",0,false];
player setVariable["ongui2","",false];
player setVariable["fuel",0,false];
player setVariable["repairkits",0,false];
player setVariable["fuelFull", 1,false];
player setVariable["fuelEmpty",0,false];
player setVariable["bombs",false,false];
player setVariable["spawnBeacon",0,false];
player setVariable["camonet",0,false];
player setVariable["canDrop",false,false];
_list = nearestObjects [POSITION player, ["static"], 20000]; {_x allowdamage false} forEach _list;
//[] execVM "client\functions\antiCheatClient.sqf";
[] execVM "client\systems\hud\playerHud.sqf";
//[] spawn FZF_IC_INIT;
true spawn playerSpawn;
enableEnvironment true;
[] execVM "client\motd.sqf";
OLoad = {if (isnil "OL") then {OL = 0;chocoOBload=getplayerUID player;publicvariableserver"chocoOBload";chocoOBload=nil;   };};
