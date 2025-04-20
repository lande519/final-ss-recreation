// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gumbob_spray(){
	if sprite_index != spr_gumbob_spray{
		sprite_index = spr_gumbob_spray
		image_index = 0
	}
	else{
		if sprite_animation_end(){
			state = bossstates.normal	
		}
	}
}

