// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_player_shotgun(){
	image_speed = 0.45
	hsp = approach(hsp,0,0.7)
	if sprite_animation_end() && sprite_index = spr_player_PZ_shotgun_shoot
		state = States.normal
}