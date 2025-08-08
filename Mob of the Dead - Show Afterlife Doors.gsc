#include maps\mp\zombies\_zm_utility;

init()
{
	level thread onplayerconnect();
	replaceFunc(maps\mp\zombies\_zm_afterlife::afterlife_doors_close, ::afterlife_doors_close);
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
	}
}

afterlife_doors_close()
{
	n_network_sent = 0;
    a_show = getentarray( "afterlife_show", "targetname" );
    a_show = arraycombine( a_show, getentarray( "afterlife_prop", "script_noteworthy" ), 0, 0 );

    foreach ( ent in a_show )
    {
        n_network_sent++;

        if ( n_network_sent > 10 )
        {
            n_network_sent = 0;
            wait_network_frame();
        }

        if ( isdefined( ent ) )
            ent setvisibletoplayer( self );
    }
	
    a_show = getentarray( "zombie_door", "targetname" );
    a_show = arraycombine( a_show, getentarray( "zombie_door", "targetname" ), 0, 0 );
    a_show = arraycombine( a_show, getentarray( "quest_trigger", "script_noteworthy" ), 0, 0 );
    a_show = arraycombine( a_show, getentarray( "trap_trigger", "script_noteworthy" ), 0, 0 );
    a_show = arraycombine( a_show, getentarray( "travel_trigger", "script_noteworthy" ), 0, 0 );

    foreach ( ent in a_show )
    {
        n_network_sent++;

        if ( n_network_sent > 10 )
        {
            n_network_sent = 0;
            wait_network_frame();
        }

        if ( isdefined( ent ) )
            ent setvisibletoplayer( self );
    }

    if ( isdefined( self.claymores ) )
    {
        foreach ( claymore in self.claymores )
        {
            if ( isdefined( claymore.pickuptrigger ) )
                claymore.pickuptrigger setvisibletoplayer( self );
        }
    }
}