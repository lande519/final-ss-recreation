if !trapped
{
	if comeback == 1 && obj_player1.sprite_index != spr_lonegustavo_punch && obj_player1.sprite_index != spr_lonegustavo_hurt && obj_player1.state != States.ratmountgroundpound && other.state != States.launchprep
	{
		other.brick = true;
		if other.state != States.ratmountcrouch && other.state != States.backbreaker && other.state != States.bump && other.state != States.ratmounthurt
		{
			if !other.grounded
				other.sprite_index = spr_player_ratmountfall;
			else
				other.sprite_index = spr_player_ratmountidle;
		}
		if other.state == States.ratmountjump
		{
			other.sprite_index = spr_player_ratmountfall;
			other.jumpAnim = false;
		}
		else if other.state == States.bump
			other.sprite_index = spr_player_ratmountbump;
		instance_create(other.x, other.y, obj_poofeffect);
		instance_destroy();
	}
}
else if (other.sprite_index != spr_lonegustavo_punch or other.state == States.launchprep) && baddieID == noone
{
	vsp = -6;
	hsp = other.xscale * 8;
	trapped = false;
	wait = true;
	comeback = false;
	alarm[0] = 30;
}
