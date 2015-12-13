/*
 =======================================================================================================================

	downloadData - script to download data from a laptop and because of this complete a task (as example)

	File:		downloadData.sqf
	Author:		T-800a / cuel for percentages

	How to:
	If you want one or more objects to be used with the script, give those objects a name in the editor and add/edit the
	following line in the init.sqf

	[ [ laptop01, nameOfMyPlacedObj, ... ], "T8_fnc_addActionLaptop", true, true] spawn BIS_fnc_MP;

	You can check if the download on a laptop/object was finished by using the following var: T8_pubVarDataTask_MyObjectsName
	and with the var: T8_pubVarInUse_MyObjectsName you can check if someone uses this object.
	Compare with the triggers placed in the demo mission.


 ===== LICENSE =========================================================================================================

	DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
	Version 2, December 2004

	Copyright (C) 2004 Sam Hocevar
	14 rue de Plaisance, 75014 Paris, France
	Everyone is permitted to copy and distribute verbatim or modified
	copies of this license document, and changing it is allowed as long
	as the name is changed.

	DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
	TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

	0. You just DO WHAT THE FUCK YOU WANT TO.

 =======================================================================================================================
*/

T8_varFileSize = 85154;  								// Filesize ... smaller files will take shorter time to download!

T8_varTLine01 = "Uplink Code 22: Cancelado";				// download aborted
T8_varTLine02 = "Uplink Code 87: Uplink já iniciado";			// download already in progress by someone else
T8_varTLine03 = "Uplink Handshake: Iniciado";					// download started
T8_varTLine04 = "Uplink Code 43: Finalizado";				// download finished
T8_varTLine05 = "<t color='#FF0000'>Hackear Uplink</t>";				// line for the addaction

T8_varDiagAbort = false;
T8_varDownSucce = false;



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

T8_fnc_abortActionLaptop =
{
	if ( T8_varDownSucce ) then
	{
		// hint "DEBUG - DONE";
		T8_varDiagAbort = false;
		T8_varDownSucce = false;

	} else {
		player sideChat T8_varTLine01;
		T8_varDiagAbort = true;
		T8_varDownSucce = false;
	};
};


T8_fnc_addActionLaptop =
{
	{
		private [ "_DT", "_cDT" ];
		_DT = format [ "%1_%2", "T8_pubVarDataTask", _x ];
		_cDT = missionNamespace getVariable [ _DT, false ];
		if ( _cDT ) exitWith {};
		_x addAction [ T8_varTLine05, { call T8_fnc_ActionLaptop; }, [], 10, false, false ];
	} forEach _this;
};


T8_fnc_removeActionLaptop =
{
	_laptop = _this select 0;
	_id = _this select 1;
	_laptop removeAction _id;
};


T8_fnc_ActionLaptop =
{
	private [ "_laptop", "_caller", "_id", "_cIU", "_DT", "_IU" ];
	_laptop = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;

	_DT = format [ "%1_%2", "T8_pubVarDataTask", _laptop ];
	_IU = format [ "%1_%2", "T8_pubVarInUse", _laptop ];

	_cIU = missionNamespace getVariable [ _IU, false ];
	if ( _cIU ) exitWith { player sideChat T8_varTLine02; };

	player sideChat T8_varTLine03;

	missionNamespace setVariable [ _IU, true ];
	publicVariable _IU;

	[ _laptop, _id, _IU, _DT ] spawn
	{
		private [ "_laptop", "_id", "_newFile", "_dlRate" ];

		_laptop		= _this select 0;
		_id			= _this select 1;
		_IU			= _this select 2;
		_DT			= _this select 3;

		_newFile = 0;

		[_laptop,3] call BIS_fnc_dataTerminalAnimate;
		sleep 3;

		createDialog "T8_DataDownloadDialog";

		sleep 0.5;
		ctrlSetText [ 8001, "Conectando ..." ];
		sleep 0.5;
		ctrlSetText [ 8001, "Conectado:" ];
		ctrlSetText [ 8003, format [ "%1 kb", T8_varFileSize ] ];
		ctrlSetText [ 8004, format [ "%1 kb", _newFile ] ];

		while { !T8_varDiagAbort } do
		{
			_dlRate = 200 + random 80;
			_newFile = _newFile + _dlRate;

			if ( _newFile > T8_varFileSize ) then
			{
				_dlRate = 0;
				_newFile = T8_varFileSize;
				ctrlSetText [ 8001, "Uplink Finalizado!" ];
				T8_varDiagAbort = true;
				player sideChat T8_varTLine04;
				T8_varDownSucce = true;

				missionNamespace setVariable [ _DT, true ];
				publicVariable _DT;

				[ [ _laptop, _id ], "T8_fnc_removeActionLaptop", true, true ] spawn BIS_fnc_MP;
				[_laptop,0] call BIS_fnc_dataTerminalAnimate;
				hacked = true;
				publicVariable "hacked";

			};

			// percentage part by cuel!
			ctrlSetText [ 8002, format [ "%1 kb/s", _dlRate ] ];
			_percent =  (_newFile/ T8_varFileSize);
			_percent = toArray str _percent;
			{_percent set [_x,-1]} forEach [0,1];
			_percent = _percent - [-1];
			_percent resize 2;
			_percent = toString _percent;
			ctrlSetText [ 8004, format [ "%1 kb (%2%3)", _newFile,if (T8_varDiagAbort) then {100}else{_percent},"%"]];

			sleep 0.2;
		};

		T8_varDiagAbort = false;

		missionNamespace setVariable [ _IU, false ];
		publicVariable _IU;
		[_laptop,0] call BIS_fnc_dataTerminalAnimate;
	};
};

downloadDataDONE = true;
