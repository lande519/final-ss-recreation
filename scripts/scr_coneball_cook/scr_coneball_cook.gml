// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_coneball_cook(){
	sprite_index = spr_stupidrat_cook
	
	if !instance_exists(obj_firebomb) && !instance_exists(obj_crushertrail)
		instance_create(x,y,obj_firebomb)
	
	if !instance_exists(obj_firebomb) && !instance_exists(obj_crushertrail)
		state = bossstates.normal	
}