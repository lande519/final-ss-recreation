if global.panic == escape
{
	with other
	{
		hsp = 0;
		vsp = 0;
		visible = false;
		state = States.actor;
	}
	create_particle(x, y, obj_poofeffect);
	sprite_index = switchstart;
	global.switchbuffer = 200;
	playerid = other.id;
	with obj_peppinoswitch
	{
		playerid = other.playerid;
		sprite_index = switchend;
		image_index = 0;
	}
	with (instance_create(0, 0, obj_charswitch_intro))
	{
		spr = spr_backtopeppino;
	}
}
