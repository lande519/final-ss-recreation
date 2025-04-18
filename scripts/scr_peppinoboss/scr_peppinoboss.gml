// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_peppino_lunge(){
	sprite_index = spr_player_lunge
	image_speed = 0.35
	hsp = movespeed * xscale
	
	movespeed = approach(movespeed, 12, 0.4)
	
	if scr_solid(x+xscale, y)
	{
		state = bossstates.normal
		instance_create(x,y,obj_poofeffect)	
	}
}