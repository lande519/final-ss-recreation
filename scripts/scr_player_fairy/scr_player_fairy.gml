// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_player_fairy(){
    var maxspeed = 10;
    var hspaccel = 0.8;
    var vspaccel = 0.8;	
	move2 = key_down - key_up;
	
	if hsp != 0{
		if hsp > 0
			xscale = 1
		else
			xscale = -1
	}
	
	if sprite_index != spr_player_PZ_fairy_dash
		sprite_index = spr_player_PZ_fairy
		
	if sprite_index = spr_player_PZ_fairy_dash{
		instance_destroy(position_meeting(x,y,obj_parent_enemy))
		
		if move != 0
			movespeed = 10 * move
		else{
			movespeed = 10 * xscale
		}
		verticalMovespeed = approach(verticalMovespeed, move2 * maxspeed, vspaccel);
		hsp = movespeed
		vsp = verticalMovespeed
		
		if sprite_animation_end()
			sprite_index = spr_player_PZ_fairy
		
		exit;
	}	
    move = key_right + key_left;
	
	if (scr_solid(x + xscale, y, true))
		movespeed = 0

	if (scr_solid(x, y + move2, true))
		verticalMovespeed = 0
	
    movespeed = approach(movespeed, move * maxspeed, hspaccel);
    verticalMovespeed = approach(verticalMovespeed, move2 * maxspeed, vspaccel);
    hsp = movespeed;
    vsp = verticalMovespeed;	
	
	if inputBufferSlap > 0{
		inputBufferSlap = 0
		sprite_index = spr_player_PZ_fairy_dash
	}
	
	
	
}