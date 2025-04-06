if global.panic == escape
{
	with other
	{
		hsp = 0;
		vsp = 0;
		visible = false;
		state = states.actor;
	}
	fmod_event_one_shot("event:/sfx/misc/pepgusswitch");
	create_particle(x, y, particle.genericpoofeffect);
	sprite_index = switchstart;
	playerid = other.id;
	global.switchbuffer = 200;
	with obj_gustavoswitch
	{
		sprite_index = switchend;
		image_index = 0;
	}
	with (instance_create(0, 0, obj_charswitch_intro))
	{
		if obj_player1.ispeppino && global.laps < 2
			spr = spr_gustavo_intro;
		if obj_player1.ispeppino && global.laps > 1
			spr = spr_gustavo_intro_lap3
		if !obj_player1.ispeppino && global.laps < 2
			spr = spr_noise_intro;
		if !obj_player1.ispeppino && global.laps > 1
			spr = spr_noise_intro_lap3
	}
}
