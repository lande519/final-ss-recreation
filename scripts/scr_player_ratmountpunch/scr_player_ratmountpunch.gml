function scr_player_launchprep()
{
	hsp = 0
	vsp = 0
	movespeed = 0
	sprite_index = spr_player_ratmountwalljump
	move = key_left + key_right;
	if move != 0{
		xscale = move
		dir = move
	}
	if !key_slap{
		state = States.ratmountpunch
		if !key_up{
			vsp = -10
			movespeed = 20 * xscale
		}
		if key_up{
			vsp = -25
				
		}
		if brick == 1
		{
			with (instance_create(x, y, obj_brickcomeback))
				wait = true;
		}
		brick = 0;		
		exit;
	}
}

function scr_player_ratmountpunch()
{
	sprite_index = spr_lonegustavo_launch
	state = States.ratmountjump
    if (!key_up)
    {
		sprite_index = spr_lonegustavo_launch;
		image_index = 0;
		movespeed = 20 * xscale;
		vsp = -5;
		fmod_studio_event_instance_start(sndMachStart);
		fmod_studio_event_instance_start(sndWallkickCancel);
	}
	else
	{
		sprite_index = spr_lonegustavo_launch;
		image_index = 0;
		vsp = -25;
		fmod_studio_event_instance_start(sndMachStart);
		fmod_studio_event_instance_start(sndWallkickCancel);
	}
	
}
