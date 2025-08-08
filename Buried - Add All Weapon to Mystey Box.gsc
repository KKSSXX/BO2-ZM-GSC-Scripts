#include common_scripts\utility;
#include maps\mp\_utility;

init()
{
	level thread onplayerconnect();
	level thread box_preset();
}

onplayerconnect()
{
	level waittill("connected", player);
	player thread onplayerspawned();
}

onplayerspawned()
{
	for(;;)
	{
		self waittill("spawned_player");
	}
}

box_preset()
{
	thread place_in_box();
}

place_in_box()
{
	level.moddedBox = 1;
	level.custom_magic_box_selection_logic = undefined;
	level.special_weapon_magicbox_check = undefined;
	level.content_weapon = undefined;
	level.pers_box_weapons = [];
	level.chest_box_weapons = [];
	
	weap = [];

weap[0] = "m1911_zm";
weap[1] = "rnma_zm";
weap[2] = "judge_zm";
weap[3] = "kard_zm";
weap[4] = "fiveseven_zm";
weap[5] = "beretta93r_zm";
weap[6] = "fivesevendw_zm";
weap[7] = "ak74u_zm";
weap[8] = "mp5k_zm";
weap[9] = "pdw57_zm";
weap[10] = "870mcs_zm";
weap[11] = "rottweil72_zm";
weap[12] = "saiga12_zm";
weap[13] = "srm1216_zm";
weap[14] = "m14_zm";
weap[15] = "saritch_zm";
weap[16] = "m16_zm";
weap[17] = "tar21_zm";
weap[18] = "galil_zm";
weap[19] = "fnfal_zm";
weap[20] = "dsr50_zm";
weap[21] = "barretm82_zm";
weap[22] = "svu_zm";
weap[23] = "lsat_zm";
weap[24] = "hamr_zm";
weap[25] = "frag_grenade_zm";
weap[26] = "claymore_zm";
weap[27] = "usrpg_zm";
weap[28] = "m32_zm";
weap[29] = "an94_zm";
weap[30] = "cymbal_monkey_zm";
weap[31] = "ray_gun_zm";
weap[32] = "raygun_mark2_zm";
weap[33] = "knife_ballistic_zm";
weap[34] = "knife_ballistic_bowie_zm";
weap[35] = "knife_ballistic_no_melee_zm";
weap[36] = "tazer_knuckles_zm";
weap[37] = "slowgun_zm";
weap[38] = "time_bomb_zm";
weap[39] = "knife_zm";
weap[40] = "bowie_knife_zm";
weap[41] = "equip_springpad_zm";
weap[42] = "equip_subwoofer_zm";
weap[43] = "equip_headchopper_zm";
weap[44] = "equip_turbine_zm";

	// Waffen registrieren
	for(i = 0; i < weap.size; i++)
	{
		level.chest_box_weapons[i] = weap[i];
		level.pers_box_weapons[i] = weap[i];
		level.zombie_weapons[ weap[i] ].is_in_box = 1;
		level.limited_weapons[ weap[i] ] = undefined;
	}
}

