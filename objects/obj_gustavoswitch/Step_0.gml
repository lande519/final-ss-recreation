if (sprite_index == switchend && instance_exists(obj_charswitch_intro) && obj_charswitch_intro.state != states.fall)
	image_index = 0;
if (sprite_index == switchend && floor(image_index) == image_number - 1)
{
	with obj_player1
	{
		scr_switchgustavo();
		x = obj_gustavoswitch.x;
		y = obj_gustavoswitch.y;
		global.switchbuffer = 100;
		create_particle(x, y, obj_poofeffect);
	}
	sprite_index = spr_sign;
}
if sprite_index == spr_sign && global.panic != escape
	visible = false;
else
	visible = true;
if sprite_index == spr_noiseswitch1 && !collisioned
{
	mask_index = spr_player_mask;
	var xs = sign(x - obj_peppinoswitch.x);
	while (!place_meeting(x - (1 * xs), y, obj_solid))
		x -= 1 * xs;
	collisioned = true;
	image_xscale = 1 * xs;
}
