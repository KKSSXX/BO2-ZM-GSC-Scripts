#include maps\mp\zombies\_zm_magicbox;
#include common_scripts\utility;

init()
{
	level thread onplayerconnect();
}

onplayerconnect()
{
	for(;;)
	{
	level waittill( "connected", player );
	player thread onplayerspawned();
	}

}

onplayerspawned()
{
	self endon( "disconnect" );
	for(;;)
	{
	self waittill( "spawned_player" );
	self thread AllChests();
	self thread ChestsAreActive();
	self thread ChestsFireSale();
	}
}

AllChests()
{
flag_wait("initial_blackscreen_passed");
wait 1;
foreach (chest in level.chests)
{
    chest.hidden = 0;         
    chest.can_spawn = 1;      
    chest.active = 1;        
    chest thread maps\mp\zombies\_zm_magicbox::show_chest();
	chest thread maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( chest.unitrigger_stub, ::magicbox_unitrigger_think );

    if (isdefined(level.pandora_show_func))
    {
      	   [[level.pandora_show_func]](chest);
    }
wait 1;
}
}


ChestsAreActive()
{
while(true)
	{	
	foreach (chest in level.chests)
	{
    chest.active = 1;      
	chest thread maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( chest.unitrigger_stub, ::magicbox_unitrigger_think );
	}
	wait 1;
}
}

ChestsFireSale()
{
level waittill("fire_sale_off");
foreach (chest in level.chests)
	{
		chest.can_spawn = 1;
		chest.active = 1;
		chest.hidden = 0;

		chest thread maps\mp\zombies\_zm_magicbox::show_chest();
		chest thread maps\mp\zombies\_zm_unitrigger::register_static_unitrigger(chest.unitrigger_stub, ::magicbox_unitrigger_think);
	wait 1;
	}
}
