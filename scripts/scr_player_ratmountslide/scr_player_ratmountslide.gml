function scr_player_ratmountslide()
{
	if !key_down
		state = States.ratmount
		
	if key_jump{
		vsp = -20
		inputBufferJump = 0;
		sprite_index = spr_marble_jump;
		image_index = 0;
		jumpAnim = true;
		state = States.ratmountjump;
		jumpStop = false;			
	}
}
