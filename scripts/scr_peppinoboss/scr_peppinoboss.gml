// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_peppino_lunge(){
	sprite_index = spr_player_lunge
	image_speed = 0.35
	hsp = approach(hsp, 12* xscale, 0.4)
	
	xscale = -getFacingDirection(get_nearestPlayer().x, x)
	
	if scr_solid(x+xscale, y) or sprite_animation_end()
	{
		state = bossstates.normal
		instance_create(x,y,obj_poofeffect)	
	}
}