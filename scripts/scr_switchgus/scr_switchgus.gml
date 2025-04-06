function scr_switchgustavo()
{
	ratmount_movespeed = 8;
	gustavodash = 0;
	isgustavo = true;
	visible = true;
	state = States.ratmount;
	sprite_index = spr_player_ratmountidle;
	jumpAnim = false;
            
	brick = true;
}

function scr_switchpeppino()
{
	gustavodash = 0;
	ratmount_movespeed = 8;
	isgustavo = false;
	brick = false;
            
	if (argument0)
	{
		visible = true;
		state = States.normal;
		jumpAnim = false;
		sprite_index = spr_player_PZ_idle;
	}
}
