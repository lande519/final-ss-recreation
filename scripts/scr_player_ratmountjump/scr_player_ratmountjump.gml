function scr_player_ratmountjump()
{
	move = key_left + key_right;
	if sprite_index == spr_lonegustavo_dashjump
		image_speed = 0.6;
	else
		image_speed = 0.35;
	if !jumpStop && vsp < 0.5 && !key_jump2 && sprite_index != spr_lonegustavo_punch
	{
		vsp /= 10;
		jumpStop = true;
	}
	hsp = movespeed;
	if ((place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles)) || (abs(movespeed) < 8 && move != xscale) || abs(movespeed) <= 6)
	{
		gustavodash = 0;
		ratmount_movespeed = 8;
	}
    if ((!grounded || slopeCheck(x + xscale, y)) && scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
    {
    }
    else if (scr_solid(x + xscale, y, true) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_metalblock))
    {
        _ledge = snap_to_ledge();
        
        if (!_ledge)
        {
            event_play_oneshot("event:/SFX/player/groundpound", x, y);
            camera_shake_add(20, 40);
            image_speed = 0.35;
            
            with (obj_parent_enemy)
            {
                if (bbox_in_camera(id, view_camera[0]) && grounded)
                {
                    stun = 1;
                    alarm[0] = 200;
                    ministun = 0;
                    vsp = -5;
                    hsp = 0;
                }
            }
            
            flash = false;
            combo = 0;
			if brick
				sprite_index = spr_player_ratmountbump;
			else
				sprite_index = spr_lonegustavo_bump;
				
            state = States.bump;
            hsp = -6 * xscale;
            vsp = -6;
            machTwo = 0;
            image_index = 0;
            instance_create(x + (10 * xscale), y + 10, obj_bumpEffect);
        }
    }
	if gusdashpadbuffer > 0
		gusdashpadbuffer--;
	if gusdashpadbuffer <= 0
	{
		if move != 0
		{
			if move == xscale
				movespeed = approach(movespeed, xscale * ratmount_movespeed, 0.5);
			else if gustavodash == 51
				movespeed = approach(movespeed, 0, 0.5);
			else
				movespeed = approach(movespeed, 0, 0.5);
		}
		else if gustavodash == 51
			movespeed = approach(movespeed, 0, 0.5);
		else
			movespeed = approach(movespeed, 0, 0.5);
		if move != xscale && move != 0
		{
			ratmount_movespeed = 8;
			xscale = move;
		}
	}
	if gusdashpadbuffer > 0 && movespeed != 0
		xscale = sign(movespeed);
	if (jumpAnim && floor(image_index) == image_number - 1)
	{
		jumpAnim = false;
		switch sprite_index
		{
			case spr_lonegustavo_jumpstart:
				sprite_index = spr_lonegustavo_jump;
				break;
			case spr_lonegustavo_dashjump:
				sprite_index = spr_lonegustavo_dashjump;
				break;
			case spr_player_ratmountgroundpound:
				sprite_index = spr_player_ratmountgroundpoundfall;
				break;
			case spr_player_ratmountjump:
				sprite_index = spr_player_ratmountfall;
				break;
			case spr_player_ratmountjump2:
				sprite_index = spr_player_ratmountfall2;
				break;
			case spr_player_ratmountballoonend2:
				sprite_index = spr_player_ratmountballoonend3;
				break;
			case spr_player_ratmountmushroombounce:
				jumpAnim = true;
				image_index = image_number - 1;
				break;
			case spr_player_ratmountballoonend1:
				if vsp > 0
				{
					jumpAnim = true;
					sprite_index = spr_player_ratmountballoonend2;
				}
				else
					jumpAnim = true;
				break;
		}
	}
	if scr_checkgroundpound()
	{
		if brick
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = true;
				instance_create(x, y, obj_poofeffect);
			}
		}
		brick = false;
		movespeed = hsp;
		state = States.ratmountgroundpound;
		image_index = 0;
		sprite_index = spr_lonegustavo_poundstart;
	}
	if (((inputBufferSlap > 0 && key_up)) && brick)
	{
		inputBufferSlap = 0;
		ratmount_kickbrick();
	}
	if inputBufferSlap > 0 && !key_up && brick = true
	{
		inputBufferSlap = 0;
		state = States.ratmountpunch;
		image_index = 0;
		if move != 0
			xscale = move;
			
        if (brick == true)
        {
            with (instance_create(x, y, obj_brickcomeback))
                wait = true;
        }
        brick = false;
        ratmountpunchtimer = 25;
        gustavohitwall = false;
        image_index = 0;
        movespeed = xscale * 12;
        sprite_index = spr_lonegustavo_punch;		
	}
	var bounce = true;
	if (inputBufferJump > 0 && can_jump && gusdashpadbuffer == 0)
	{
		bounce = false;
		inputBufferJump = 0;
		if brick
		{
			if ratmount_movespeed >= 12 && key_attack
				sprite_index = spr_player_ratmountdashjump;
			else
				sprite_index = spr_player_ratmountjump;
		}
		else if ratmount_movespeed >= 12 && key_attack
			sprite_index = spr_lonegustavo_dashjump;
		else
			sprite_index = spr_player_ratmountgroundpound;
		image_index = 0;
		jumpAnim = true;
		state = States.ratmountjump;
		vsp = -11;
		jumpStop = false;
	}
	if key_jump && brick && bounce
	{
		state = States.ratmountbounce;
		sprite_index = spr_player_ratmountwalljump;
		image_index = 0;
		vsp = -16;
	}
	if grounded && vsp > 0 && sprite_index != spr_lonegustavo_kick
	{
		doublejump = false;
		if sprite_index = spr_marble_jump
			movespeed = 6 * xscale
		state = States.ratmount;
		landAnim = true;
		jumpStop = false;
		if brick && !key_attack
			sprite_index = spr_player_ratmountland;
		else
			landAnim = false;
		image_index = 0;
	}
	do_taunt()
}
