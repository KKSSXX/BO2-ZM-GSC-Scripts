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
weap[1] = "judge_zm";
weap[2] = "beretta93r_zm";
weap[3] = "fivesevendw_zm";
weap[4] = "uzi_zm";
weap[5] = "thompson_zm";
weap[6] = "mp5k_zm";
weap[7] = "pdw57_zm";
weap[8] = "870mcs_zm";
weap[9] = "rottweil72_zm";
weap[10] = "saiga12_zm";
weap[11] = "blundergat_zm";
weap[12] = "blundersplat_zm";
weap[13] = "ak47_zm";
weap[14] = "m14_zm";
weap[15] = "tar21_zm";
weap[16] = "galil_zm";
weap[17] = "fnfal_zm";
weap[18] = "dsr50_zm";
weap[19] = "barretm82_zm";
weap[20] = "minigun_alcatraz_zm";
weap[21] = "lsat_zm";
weap[22] = "frag_grenade_zm";
weap[23] = "claymore_zm";
weap[24] = "willy_pete_zm";
weap[25] = "usrpg_zm";
weap[26] = "bouncing_tomahawk_zm";
weap[27] = "ray_gun_zm";
weap[28] = "raygun_mark2_zm";
weap[29] = "upgraded_tomahawk_zm";
weap[30] = "knife_zm";
weap[31] = "lightning_hands_zm";
weap[32] = "knife_zm_alcatraz";
weap[33] = "spork_zm_alcatraz";
weap[34] = "alcatraz_shield_zm";

	// Waffen registrieren
	for(i = 0; i < weap.size; i++)
	{
		level.chest_box_weapons[i] = weap[i];
		level.pers_box_weapons[i] = weap[i];
		level.zombie_weapons[ weap[i] ].is_in_box = 1;
		level.limited_weapons[ weap[i] ] = undefined;
	}
}

