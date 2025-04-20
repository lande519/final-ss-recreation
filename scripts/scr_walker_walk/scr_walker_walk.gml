// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_walker_walk(){
	hsp = -20
	sprite_index = spr_thewalker_move
	if place_meeting(x,y,obj_player1) or place_meeting(x+xscale,y,obj_solid){
		state = bossstates.vulnerable
		intensity = 238473247234983247302496324234693282347
		delay = 238473247234983247302496324234693282347
		sprite_index = spr_thewalker_ouch
		vsp = -8
		hsp = -7 * xscale		
		exit;
	}
}