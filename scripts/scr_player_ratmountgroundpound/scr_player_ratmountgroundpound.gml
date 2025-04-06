function scr_player_ratmountgroundpound()
{
	if sprite_index == spr_player_ratmountgroundpound
	{
		if floor(image_index) == image_number - 1
			sprite_index = spr_player_ratmountgroundpoundfall;
	}
	move = key_left + key_right;
	hsp = movespeed;
	if brick == 1
	{
		state = States.ratmountjump;
		sprite_index = spr_player_ratmountfall;
	}
	if gustavokicktimer > 0
		gustavokicktimer--;
	if gustavokicktimer == 0
	{
		if sprite_index == spr_lonegustavo_jumpstart
		{
			vsp = -11;
			instance_create(x, y - 20, obj_bangEffect);
		}
		else
			instance_create(x + (xscale * 50), y + 20, obj_bangEffect);
		gustavokicktimer = -1;
	}
	if sprite_index == spr_lonegustavo_jumpstart && gustavokicktimer > 0
	{
		vsp = 0;
		hsp = 0;
	}
	if move != 0
	{
		if sprite_index == spr_lonegustavo_groundpoundland
			movespeed = approach(movespeed, move * ratmount_movespeed, 0.25);
		else
			movespeed = approach(movespeed, move * ratmount_movespeed, 0.5);
	}
	else
		movespeed = approach(movespeed, 0, 0.5);
	if (sprite_index == spr_lonegustavo_groundpoundstart && floor(image_index) == image_number - 1)
	{
		image_index = 0;
		sprite_index = spr_lonegustavo_groundpound;
	}
	if (sprite_index == spr_lonegustavo_groundpound || sprite_index == spr_lonegustavo_groundpoundstart)
	{
		vsp++;
		if (grounded && vsp > 0 && !place_meeting(x, y + vsp, obj_destructibles) && !place_meeting(x, y + vsp + 2, obj_destructibles) && !place_meeting(x, y + 10, obj_destructibles))
		{
			if (scr_slope())
			{
				with (instance_place(x, y + 1, obj_slope))
				{
					other.xscale = -sign(image_xscale);
					other.state = States.ratmount;
					other.movespeed = other.xscale * 8;
					with (instance_create(other.x, other.y, obj_jumpdust))
						image_xscale = -sign(other.image_xscale);
				}
			}
			else
			{
				if move != 0
					movespeed = xscale * 3;
				sprite_index = spr_lonegustavo_groundpoundland;
				image_index = 0;
				jumpAnim = true;
				jumpStop = false;
				with obj_camera
				{
					shake_mag = 5;
					shake_mag_acc = 15 / room_speed;
				}
			}
		}
	}
	if (sprite_index == spr_lonegustavo_groundpoundland && floor(image_index) == image_number - 1)
	{
		if (sign(hsp) != 0)
			xscale = sign(hsp);
		sprite_index = spr_lonegustavo_idle;
		state = States.ratmount;
	}
	if ((sprite_index == spr_lonegustavo_kick || sprite_index == spr_lonegustavo_jumpstart) && floor(image_index) == image_number - 1)
	{
		if (sign(hsp) != 0)
			xscale = sign(hsp);
		if sprite_index == spr_lonegustavo_kick
			sprite_index = spr_player_ratmountgroundpoundfall;
		else
			sprite_index = spr_lonegustavo_jump;
		state = States.ratmount;
	}
	image_speed = 0.35;
}
