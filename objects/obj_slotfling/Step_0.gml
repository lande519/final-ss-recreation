if (place_meeting(x, y, obj_parent_player) && obj_parent_player.state != States.trick)
{
	with (obj_parent_player)
    {
		if other.countdown = 0{
			other.countdown = 20
			if (state != States.trick)
				event_play_oneshot("event:/SFX/player/rampjump", x, y);
			state = States.trick;
			vsp = -12;
			movespeed = 14;
			exit;
		}			
		state = States.actor
		sprite_index = spr_player_PZ_mach2_spinJump
		x = lerp(x,other.x+32*other.image_xscale, 0.2)
		y = lerp(y,other.y, 0.2)		
		vsp = 0
		hsp = 0
		dir = other.image_xscale
		xscale = other.image_xscale				
		other.countdown --
    }
}

if !place_meeting(x, y, obj_parent_player){
	countdown = 20
}