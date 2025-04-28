function scr_player_ratmountskid()
{
	hsp = xscale * -movespeed;
	movespeed = approach(movespeed, 0, 0.8);
	if brick
		sprite_index = spr_ratmount_skid;
	else
		sprite_index = spr_lonegustavo_skid;
	gustavodash = 0;
	ratmount_movespeed = 8;
	image_speed = 0.4;
	if (abs(movespeed) <= 0 || abs(hsp) <= 0)
	{
		movespeed = 0;
		state = States.ratmount;
	}
	if inputBufferJump > 0 && can_jump
	{
		if brick
			sprite_index = spr_player_ratmountjump;
		else if ratmount_movespeed >= 12
			sprite_index = spr_lonegustavo_dashjump;
		else
			sprite_index = spr_player_ratmountgroundpound;
		image_index = 0;
		if state != States.ratmount
			xscale *= -1;
		inputBufferJump = 0;
		movespeed = hsp;
		jumpAnim = true;
		state = States.ratmountjump;
		vsp = -11;
		jumpStop = false;
	}
	if (((inputBufferSlap > 0 && key_up)) && brick)
	{
		inputBufferSlap = 0;
		ratmount_kickbrick();
		movespeed = -movespeed;
		hsp = movespeed;
		ratmount_movespeed = 8;
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
}
