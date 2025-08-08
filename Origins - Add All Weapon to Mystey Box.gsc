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

weap[0] = "mg08_zm";
weap[1] = "hamr_zm";
weap[2] = "type95_zm";
weap[3] = "galil_zm";
weap[4] = "fnfal_zm";
weap[5] = "m14_zm";
weap[6] = "mp44_zm";
weap[7] = "scar_zm";
weap[8] = "870mcs_zm";
weap[9] = "srml216_zm";
weap[10] = "ksg_zm";
weap[11] = "ak74u_zm";
weap[12] = "ak74u_extclip_zm";
weap[13] = "pdw57_zm";
weap[14] = "thompson_zm";
weap[15] = "qcw05_zm";
weap[16] = "mp40_zm";
weap[17] = "mp40_stalker_zm";
weap[18] = "evoskorpion_zm";
weap[19] = "ballista_zm";
weap[20] = "dsr50_zm";
weap[21] = "beretta93r_zm";
weap[22] = "beretta93r_extclip_zm";
weap[23] = "kard_zm";
weap[24] = "fiveseven_zm";
weap[25] = "python_zm";
weap[26] = "c96_zm";
weap[27] = "fivesevendw_zm";
weap[28] = "m32_zm";
weap[29] = "beacon_zm";
weap[30] = "claymore_zm";
weap[31] = "cymbal_monkey_zm";
weap[32] = "frag_grenade_zm";
weap[33] = "ray_gun_zm";
weap[34] = "raygun_mark2_zm";
weap[35] = "sticky_grenade_zm";
weap[36] = "staff_air_zm";
weap[37] = "staff_air_upgraded_zm";
weap[38] = "staff_fire_zm";
weap[39] = "staff_fire_upgraded_zm";
weap[40] = "staff_lightning_zm";
weap[41] = "staff_lightning_upgraded_zm";
weap[42] = "staff_water_zm";
weap[43] = "staff_water_zm_cheap";
weap[44] = "staff_water_upgraded_zm";
weap[45] = "staff_revive_zm";
weap[46] = "knife_zm";
weap[47] = "tomb_shield_zm";
weap[48] = "staff_air_melee_zm";
weap[49] = "staff_fire_melee_zm";
weap[50] = "staff_lightning_melee_zm";
weap[51] = "staff_water_melee_zm";

	// Waffen registrieren
	for(i = 0; i < weap.size; i++)
	{
		level.chest_box_weapons[i] = weap[i];
		level.pers_box_weapons[i] = weap[i];
		level.zombie_weapons[ weap[i] ].is_in_box = 1;
		level.limited_weapons[ weap[i] ] = undefined;
	}
}

