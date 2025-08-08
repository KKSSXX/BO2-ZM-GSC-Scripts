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

	self thread RemoveJoker();
	
	for(;;)
	{
	self waittill( "spawned_player" );
	}
}

RemoveJoker()
{
 level.chest_min_move_usage = 999999; // So hoch, dass sie nie erreicht wird
    level.chest_moves = 0;
    level.chest_accessed = 0;

    level.override_teddy_check = true;

    while (true)
    {
        level.chest_accessed = 0;

        level.chance_of_joker = -1; // Erzwinge "kein Teddy"

        wait 1; // Regelmäßig Teddy-Chance zurücksetzen
    }
}
