// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_coneboy_headkick(){
	if sprite_index != spr_coneboyprojectile && sprite_index != spr_coneboy_headlessrun
		sprite_index = spr_coneboy_kickhead
		
	if !instance_exists(obj_coneboyprojectile)
		instance_create(x,y,obj_coneboyprojectile)
	
	if sprite_animation_end() && sprite_index = spr_coneboy_kickhead
		sprite_index = spr_coneboy_headlessrun
	
	if sprite_index = spr_coneboy_headlessrun
		hsp = 10 * xscale
		
	if scr_solid(x+20 * xscale,y)
		xscale *= -1
}