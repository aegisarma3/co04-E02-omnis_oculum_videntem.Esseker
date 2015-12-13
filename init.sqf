enableSaving [false, false];

[] execVM "aegis\init.sqf";
[] execVM "armas.sqf";


call compile preprocessFile "uplink\downloadData.sqf";
waitUntil { !isNil "downloadDataDONE" };

if ( !isServer ) exitWith {};
 
[ [ data_terminal ], "T8_fnc_addActionLaptop", true, true] spawn BIS_fnc_MP;
