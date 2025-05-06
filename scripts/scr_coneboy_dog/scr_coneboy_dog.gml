// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_coneboy_dog(){
	hsp = movespeed * xscale
	sprite_index = spr_coneboy_dog
	
	if grounded
		vsp = -6
	
	if scr_solid(x+20 * xscale,y)
		xscale *= -1	
}