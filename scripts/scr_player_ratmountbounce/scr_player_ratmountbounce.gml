function scr_player_ratmountbounce()
{
	if sprite_index == spr_player_ratmountwalljump && vsp > 0
	{
		vsp += 0.5;
		image_speed = abs(vsp) / 10;
	}
	else
		image_speed = 0.35;
		
	if (!instance_exists(groundpoundEffect))
    {
		groundpoundEffect = instance_create(x, y + 32, obj_groundPoundEffect, 
		{
			playerID: id
		});
	}	
	if sprite_index == spr_player_ratmountbounce
	{
		move = key_left + key_right;
		hsp = movespeed;
		movespeed = approach(movespeed, 0, 1);
		if floor(image_index) == image_number - 1
		{
			if hsp != 0
				xscale = sign(hsp);
			state = States.ratmount;
		}
	}
	else
	{
		hsp = movespeed;
		move = key_left + key_right;
		if move != 0
			movespeed = approach(movespeed, move * 8, 0.5);
		else
			movespeed = approach(movespeed, 0, 0.5);
		if (((inputBufferSlap > 0 && key_up) || key_shoot2) && brick)
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
		ratmount_fallingspeed += 0.5;
		if (brick && scr_solid(x + sign(hsp), y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
		{
			if (move != 0 && move == sign(hsp) && key_jump2)
			{
				state = States.ratmountclimbwall;
				sticktime = 15;
				xscale = sign(hsp);
				landAnim = false;
			}
		}
		if (grounded && vsp > 0 && !place_meeting(x, y + vsp, obj_destructibles) && !place_meeting(x, y + 15, obj_destructibles) && !place_meeting(x, y + 15, obj_metalblock) && brick)
		{
			with obj_camera
			{
				shake_mag = 10;
				shake_mag_acc = 30 / room_speed;
			}
			sprite_index = spr_player_ratmountbounce;
			image_index = 0;
		}
	}
	do_taunt();
}
