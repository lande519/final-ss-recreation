function scr_player_ratmountpunch()
{
	image_speed = abs(movespeed) / 12;
	hsp = movespeed;
	move = key_left + key_right;
	landAnim = false;
	sprite_index = spr_lonegustavo_punch;
	if grounded
		movespeed = approach(movespeed, xscale * 4, 0.1);
	ratmountpunchtimer--;
	if (ratmountpunchtimer < 0 && (!key_slap || gustavohitwall))
	{
		sprite_index = spr_lonegustavo_walk;
		state = States.ratmount;
		if hsp != 0
		{
			dir = sign(hsp);
			xscale = dir;
		}
	}
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		ratmountpunchtimer = 10;
		gustavohitwall = true;
		instance_create(x + hsp, y, obj_bangEffect);
		movespeed /= 1.5;
		movespeed *= -1;
	}
	if (scr_checkgroundpound() && !grounded && !gustavohitwall)
	{
		movespeed = hsp;
		state = States.ratmountgroundpound;
		image_index = 0;
		sprite_index = spr_lonegustavo_groundpoundstart;
	}
}
