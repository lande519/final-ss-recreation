// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pizzano_bounce(){
	if sprite_index = normal_spr{
		sprite_index = spr_player_PA_bounce
	}
	balltimer --
	if sprite_index = spr_player_PA_bounce{
		hsp = 10 * xscale
		if scr_solid(x+xscale,y){
			xscale *= -1		
			instance_create(x,y,obj_bangEffect)	
		}
		if grounded
			vsp = -14
	}
	if balltimer < 0{
		state = bossstates.normal
		balltimer = 300
	}
	
	
}