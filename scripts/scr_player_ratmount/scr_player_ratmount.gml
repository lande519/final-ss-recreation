function scr_player_ratmount()
{
    var _ledge;	
    move = key_left + key_right;
	doublejump = false;
	if (ratgrabbedID != -4 && !instance_exists(ratgrabbedID))
		ratgrabbedID = -4;
	hsp = movespeed;
	if ((place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles)) || (abs(movespeed) < 8 && move != xscale) || !key_attack || abs(movespeed) <= 6)
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
	
	if ratmount_movespeed >= 12 && gustavodash != 51
	{
		instance_create(x, y, obj_jumpdust);
		gustavodash = 51;
	}
	if (ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
	{
	    if (!instance_exists(obj_chargeEffect) && sprite_index != spr_dive)
	    {
	        instance_create(x, y, obj_chargeEffect, 
	        {
	            playerID: id
	        });
	    }
	}
	else{
		instance_destroy(obj_chargeEffect)	
	}
	if move != xscale && move != 0 && gusdashpadbuffer <= 0 && sprite_index != spr_lonegustavo_kick
	{
		xscale = move;
		if (abs(movespeed) > 2 && abs(hsp) > 2 && grounded)
		{
			state = States.ratmountskid;
			movespeed = abs(movespeed);
		}
	}
	if gusdashpadbuffer > 0 && movespeed != 0
		xscale = sign(movespeed);
	if gusdashpadbuffer > 0
		gusdashpadbuffer--;
	if gusdashpadbuffer <= 0
	{
		if move != 0
		{
			if move == xscale
				movespeed = approach(movespeed, xscale * ratmount_movespeed, 0.5);
			else
				movespeed = approach(movespeed, 0, 0.5);
		}
		else
			movespeed = approach(movespeed, 0, 0.5);
	}
	else
	{
		ratmount_movespeed = 12;
		movespeed = xscale * ratmount_movespeed;
	}
	if (abs(movespeed) > 2)
		image_speed = abs(movespeed) / 12;
	else
		image_speed = 0.35;
	if (sprite_index == spr_player_ratmountmach3 || sprite_index == spr_lonegustavo_mach3)
		image_speed = 0.4;
	var front = scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope);
	if brick
	{
		if !landAnim
		{
			if hsp != 0 && !front
			{
				if (ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
					sprite_index = spr_player_ratmountmach3;
				else if key_attack
					sprite_index = spr_player_ratmountattack;
				else
					sprite_index = spr_player_ratmountmove;
			}
			else
			{
				image_speed = 0.35;
				if sprite_index != spr_player_ratmountidleanim
				{
					sprite_index = spr_player_ratmountidle;
					if ratgrabbedID == noone
					{
						if idle < 400
							idle++;
						if idle >= 150
						{
							sprite_index = spr_player_ratmountidleanim;
							image_index = 0;
						}
					}
				}
				else if floor(image_index) == image_number - 1
				{
					idle = 0;
					sprite_index = spr_player_ratmountidle;
				}
			}
		}
		if floor(image_index) == image_number - 1
		{
			landAnim = false;
			if sprite_index == spr_player_ratmountland
				sprite_index = spr_player_ratmountidle;
		}
		if sprite_index == spr_player_ratmountland
			image_speed = 0.35;
	}
	else
	{
		if hsp != 0 && !front
		{
			if (ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
				sprite_index = spr_lonegustavo_mach3;
			else if key_attack
				sprite_index = spr_lonegustavo_dash;
			else
				sprite_index = spr_lonegustavo_walk;
		}
		else
			sprite_index = spr_lonegustavo_idle;
		image_speed = 0.35;
	}
	if inputBufferJump > 0 && can_jump && gusdashpadbuffer == 0 && state != States.ratmountskid
	{
		inputBufferJump = 0;
		if brick
		{
			if ((ratmount_movespeed >= 12 && key_attack) || gusdashpadbuffer > 0)
				sprite_index = spr_player_ratmountdashjump;
			else
				sprite_index = spr_player_ratmountjump;
		}
		else if ((ratmount_movespeed >= 12 && key_attack) || gusdashpadbuffer > 0)
			sprite_index = spr_lonegustavo_dashjump;
		else
			sprite_index = spr_player_ratmountgroundpound;
		image_index = 0;
		jumpAnim = true;
		state = States.ratmountjump;
		vsp = -11;
		jumpStop = false;
	}
	if !grounded
	{
		state = States.ratmountjump;
		jumpAnim = false;
		if ratmount_movespeed >= 12
		{
			if brick
				sprite_index = spr_player_ratmountdashjump;
			else
				sprite_index = spr_lonegustavo_dashjump;
		}
		else if brick
			sprite_index = spr_player_ratmountfall;
		else
			sprite_index = spr_player_ratmountgroundpoundfall;
	}
	if (key_attack && grounded && !place_meeting(x + xscale, y, obj_solid))
	{
		move = xscale;
		if ratmount_movespeed < 12
			ratmount_movespeed = approach(ratmount_movespeed, 12, 0.15);
	}
	if (((inputBufferSlap > 0 && key_up) || key_shoot2) && brick && gusdashpadbuffer == 0)
	{
		inputBufferSlap = 0;
		ratmount_kickbrick();
		if state == States.ratmountskid
		{
			movespeed = -movespeed;
			hsp = movespeed;
		}
	}
	if inputBufferSlap > 0 && !key_up && brick = true
	{
		inputBufferSlap = 0;
		state = States.ratmountlaunchprep;
		image_index = 0;
		if move != 0
			xscale = move;
	}
	with ratgrabbedID
		scr_enemy_ratgrabbed();
	ratmount_shootpowerup();
	do_taunt();
}
function ratmount_kickbrick()
{
	var _pad = 32;
	with (instance_create(x + (image_xscale * _pad), y, obj_brickball))
	{
		if (other.state == States.ratmountjump || other.state == States.ratmountbounce)
			up = true;
		image_xscale = other.xscale;
		xoffset = _pad;
	}
	state = States.ratmountgroundpound;
	sprite_index = spr_lonegustavo_kick;
	image_index = 0;
	image_speed = 0.35;
	gustavokicktimer = 5;
	brick = false;
}
function ratmount_shootpowerup()
{
	if key_shoot2 && ratpowerup != -4 && ratshootbuffer <= 0
	{
		switch ratpowerup
		{
			case obj_noisegoblin:
				with (instance_create(x + (20 * xscale), y, obj_playernoisearrow))
					direction = point_direction(x, y, x + (other.xscale * 4), y);
				break;
			case obj_smokingpizzaslice:
				with (instance_create(x + (20 * xscale), y + 20, obj_playersmokehitbox))
				{
					spd += (other.movespeed / 2);
					image_xscale = other.xscale;
				}
				break;
			case obj_spitcheese:
				with (instance_create(x + (20 * xscale), y, obj_playerspikecheese))
				{
					spd += other.movespeed;
					image_xscale = other.xscale;
				}
				break;
		}
		ratshootbuffer = 30;
	}
	
	if sprite_index = spr_player_ratmountmach3 && key_down2{
		sprite_index = spr_marble_crouch
		state = States.ratmountslide	
		with (instance_create(x, y, obj_brickcomeback))
		{
			wait = true;
			instance_create(x, y, obj_poofeffect);
		}
		image_index = 0;
		image_speed = 0.35;
		brick = false;	
	}
}
