/*private ["_obj","_dat","_cString","_adString"];

_obj = objNull;_dat = [];_adString = "CAN_COLLIDE";
_cString = {_obj = createVehicle [(_dat select 0), call compile (_dat select 1), [], 0, _adString];if((_dat select 4) == 0) then {_obj enableSimulation false};_obj setdir (_dat select 2);if((_dat select 3) == -100) then {_obj setposATL (call compile (_dat select 1))} else {_obj setposASL [((call compile (_dat select 1)) select 0),((call compile (_dat select 1)) select 1),(_dat select 3)]};if((_dat select 5) == 0) then {_obj setVectorUp [0,0,1]} else {_obj setVectorUp (surfacenormal (getPosATL _obj))};if(count (_dat select 6) > 0) then {{call _x} foreach (_dat select 6)}};

_dat = ["plp_ctm_WeathCrateLongWornLeaned","[2689.219482,4590.797363,5.16721]",276.414,-100,0,0,[]];call _cString;
_dat = ["plp_ct_MilBoxMediumBlack","[2691.0625,4588.454102,4.76515]",185.695,-100,0,0,[]];call _cString;
_dat = ["plp_ct_MilBoxSmallBlack","[2691.220703,4588.459961,5.81723]",1.32573,-100,0,0,[]];call _cString;
_dat = ["plp_ct_MilBoxLongBlack","[2689.977051,4591.887207,6.72034]",112.058,-100,0,0,[]];call _cString;
_dat = ["Land_PaperBox_open_full_F","[2690.599121,4593.276367,4.55092]",104.167,-100,0,0,[]];call _cString;
_dat = ["plp_ctm_PartitioningFenceGrey","[2691.150391,4586.736328,4.97768]",104.167,-100,0,0,[]];call _cString;
_dat = ["plp_ctm_PartitioningFenceGreyDoorOpen","[2690.298828,4588.547363,4.80908]",183.889,-100,0,0,[]];call _cString;
_dat = ["plp_ctm_PartitioningFenceGreyPole","[2690.298096,4587.937012,4.90067]",184.52,-100,0,0,[]];call _cString;
_dat = ["plp_ct_MilBoxMediumBlack","[2691.0625,4588.454102,5.12071]",181.086,-100,0,0,[]];call _cString;
_dat = ["plp_ct_MilBoxMediumBlack","[2691.0625,4588.454102,5.47713]",188.347,-100,0,0,[]];call _cString;
_dat = ["plp_ct_MilBoxSmallBlack","[2690.758057,4588.467773,5.84669]",3.40906,-100,0,0,[]];call _cString;
_dat = ["plp_ctm_TrolleyRedHand","[2691.950439,4588.455078,4.70418]",273.737,-100,0,0,[]];call _cString;
_dat = ["plp_cts_WeathCrateBigGreen","[2694.201172,4586.264648,4.88002]",280.745,-100,0,0,[]];call _cString;
_dat = ["plp_cts_WeathCrateBigGreen","[2694.201172,4586.264648,5.27586]",281.818,-100,0,0,[]];call _cString;
_dat = ["plp_cts_WeathCrateBigGreen","[2694.201172,4586.264648,5.6717]",279.482,-100,0,0,[]];call _cString;
_dat = ["plp_cts_WeathCrateBigGreen","[2694.201172,4586.264648,6.06754]",281.061,-100,0,0,[]];call _cString;
_dat = ["plp_cts_BarrelBlack","[2693.240723,4585.564453,4.98795]",281.061,-100,0,0,[]];call _cString;
_dat = ["plp_cts_BarrelBlack","[2693.376953,4586.261719,4.88693]",377.904,-100,0,0,[]];call _cString;
_dat = ["plp_cts_BarrelBlack","[2693.49707,4586.978516,4.78003]",165.189,-100,0,0,[]];call _cString;
_dat = ["plp_ctm_WeathCrateBigGreenLeaned","[2694.546631,4587.377441,4.68771]",102.563,-100,0,0,[]];call _cString;
_dat = ["plp_ctm_DisplayPegWallWide","[2692.739258,4593.270508,4.53383]",187.853,-100,0,0,[]];call _cString;
_dat = ["plp_ctm_DisplayPegWallWide","[2695.125977,4592.786133,4.69965]",194.04,-100,0,0,[]];call _cString;
_dat = ["Land_Laptop_unfolded_F","[2694.0351563,4590.866699,4.87399]",75.353,-100,0,0,[]];call _cString;
_dat = ["Land_SatellitePhone_F","[2693.937256,4589.937988,4.8279]",57.6763,-100,0,0,[]];call _cString;
_dat = ["Land_Tablet_01_F","[2694.255615,4590.540527,4.87721]",135.517,-100,0,0,[]];call _cString;
_dat = ["Land_BottlePlastic_V2_F","[2694.048584,4590.512695,4.85641]",101.868,-100,0,0,[]];call _cString;

_dat = ["plp_ctwh_HelpRifleHangHoriz","[2692.0795898,4592.865723,5.20168]",7.99201,-100,1,0,[{_obj addWeaponCargo ["hlc_rifle_ak74",1];_obj setObjectTexture [0, "\plp_containers\Holders\wh_empty_ca.paa"]}]];call _cString;
_dat = ["plp_ctwh_HelpRifleHangHoriz","[2693.166748,4592.701172,5.20168]",7.99201,-100,1,0,[{_obj addWeaponCargo ["hlc_rifle_bcmjack",1];_obj setObjectTexture [0, "\plp_containers\Holders\wh_empty_ca.paa"]}]];call _cString;
_dat = ["plp_ctwh_HelpRifleHangHoriz","[2692.0766602,4592.813965,4.55482]",7.99201,-100,1,0,[{_obj addWeaponCargo ["hlc_rifle_akmgl",1];_obj setObjectTexture [0, "\plp_containers\Holders\wh_empty_ca.paa"]}]];call _cString;
_dat = ["plp_ctwh_HelpRifleHangHoriz","[2693.178955,4592.660645,4.55482]",7.99201,-100,1,0,[{_obj addWeaponCargo ["SMA_HK417_16in_afg",1];_obj setObjectTexture [0, "\plp_containers\Holders\wh_empty_ca.paa"]}]];call _cString;
_dat = ["plp_ctwh_HelpRifleHangHoriz","[2694.470459,4592.424805,4.61122]",14.8102,-100,1,0,[{_obj addWeaponCargo ["SMA_Mk16_blackQCB",1];_obj setObjectTexture [0, "\plp_containers\Holders\wh_empty_ca.paa"]}]];call _cString;
_dat = ["plp_ctwh_HelpRifleHangHoriz","[2695.468018,4592.160645,4.75516]",14.8102,-100,1,0,[{_obj addWeaponCargo ["SMA_HK416CUSTOMCQBafgB",1];_obj setObjectTexture [0, "\plp_containers\Holders\wh_empty_ca.paa"]}]];call _cString;
_dat = ["plp_ctwh_HelpRifleHangHoriz","[2695.468018,4592.160645,5.38187]",14.8102,-100,1,0,[{_obj addWeaponCargo ["hlc_rifle_honeybadger",1];_obj setObjectTexture [0, "\plp_containers\Holders\wh_empty_ca.paa"]}]];call _cString;
_dat = ["plp_ctwh_HelpRifleHangHoriz","[2694.439697,4592.414063,5.22783]",14.8102,-100,1,0,[{_obj addWeaponCargo ["SMA_AAC_MPW_9_Black",1];_obj setObjectTexture [0, "\plp_containers\Holders\wh_empty_ca.paa"]}]];call _cString;



_dat = ["plp_ct_MilBoxMediumOlive","[2691.972656,4592.927246,4.49388]",14.8102,-100,0,0,[]];call _cString;
_dat = ["plp_ct_MilBoxMediumOlive","[2693.10376,4592.693359,4.48294]",14.8102,-100,0,0,[]];call _cString;
_dat = ["plp_ct_MilBoxMediumOlive","[2692.5271,4592.837891,4.8385]",4.51979,-100,0,0,[]];call _cString;
_dat = ["Land_ExtensionCord_F","[2693.484131,4586.986328,5.74663]",4.51979,-100,0,0,[]];call _cString;
_dat = ["Land_Portable_generator_F","[2694.563965,4588.162598,4.60802]",4.51979,-100,0,0,[]];call _cString;

_dat = ["Land_PortableLight_single_F","[2694.40625,4585.0205078,4.98598]",158.623,-100,1,0,[]];call _cString;
_dat = ["Land_PortableLight_single_F","[2690.834229,4592.13623,4.54292]",317.588,-100,1,0,[]];call _cString;*/

//_dat = ["Sign_Arrow_F","[2694.904541,4591.0258789,4.97559]",332.992,-100,0,0,[]];call _cString;
//_dat = ["Sign_Arrow_F","[2695.0305176,4590.120605,4.51431]",12.3858,-100,0,0,[]];call _cString;






// Contrabandista

removeAllWeapons contrabandista;
removeAllItems contrabandista;
removeAllAssignedItems contrabandista;
removeUniform contrabandista;
removeVest contrabandista;
removeBackpack contrabandista;
removeHeadgear contrabandista;
removeGoggles contrabandista;

contrabandista forceAddUniform "TRYK_U_pad_j_blk";
for "_i" from 1 to 3 do {contrabandista addItemToUniform "9Rnd_45ACP_Mag";};
contrabandista addVest "V_Rangemaster_belt";
contrabandista addWeapon "hgun_ACPC2_F";
contrabandista linkItem "ItemMap";
contrabandista linkItem "ItemCompass";
contrabandista linkItem "ItemWatch";
contrabandista linkItem "ItemRadioAcreFlagged";
contrabandista setFace "GreekHead_A3_04";
contrabandista setSpeaker "ACE_NoVoice";




// GUarda Costas
removeAllWeapons guarda_costas;
removeAllItems guarda_costas;
removeAllAssignedItems guarda_costas;
removeUniform guarda_costas;
removeVest guarda_costas;
removeBackpack guarda_costas;
removeHeadgear guarda_costas;
removeGoggles guarda_costas;

guarda_costas forceAddUniform "TRYK_U_B_Denim_T_BG_BK";
guarda_costas addItemToUniform "9Rnd_45ACP_Mag";
guarda_costas addItemToUniform "hlc_20Rnd_762x51_B_fal";
guarda_costas addVest "TRYK_V_Sheriff_BA_TB";
for "_i" from 1 to 2 do {guarda_costas addItemToVest "hlc_20Rnd_762x51_B_fal";};


guarda_costas addWeapon "hlc_rifle_FAL5061";
guarda_costas addWeapon "hgun_ACPC2_F";


guarda_costas linkItem "ItemMap";
guarda_costas linkItem "ItemCompass";
guarda_costas linkItem "ItemWatch";
guarda_costas linkItem "ItemRadioAcreFlagged";


guarda_costas setFace "WhiteHead_03";
guarda_costas setSpeaker "ACE_NoVoice";
