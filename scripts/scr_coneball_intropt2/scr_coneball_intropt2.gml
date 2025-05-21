// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_coneball_setupintropt2(){
	stop_music()
	fmod_start_music("event:/music/w4/coneballphase2")
	instance_create(x,y,obj_bombExplosion)
	sprite_index = spr_stupidrat_fall
	grav = 0.5
	obj_bosscontroller.fadealpha = 1
	vsp = -30
	state = bossstates.intro
}


function scr_coneball_intropt2(){
	if obj_player1.sprite_index != spr_player_PZ_bossintro2{
		if grounded && sprite_index = spr_stupidrat_fall{
			sprite_index = spr_stupidrat_land	
			image_index = 0
			obj_bosscontroller.fadealpha = 1
			obj_bosscontroller.bosshp = 8
		}
	
		if sprite_index = spr_stupidrat_land && sprite_animation_end(){
			sprite_index = 	spr_stupidrat_idle
			obj_player1.sprite_index = spr_player_PZ_bossintro2
		}
	
		if sprite_index = spr_stupidrat_land && sprite_animation_end(){
			sprite_index = 	spr_stupidrat_idle
			obj_player1.sprite_index = spr_player_PZ_bossintro2
			obj_player1.image_index = 0
		}
	}
	else if sprite_animation_end(){
		hsp = 10	
		obj_player1.sprite_index = spr_player_PZ_idle
		obj_player1.state = States.normal
		sprite_index = spr_stupidrat_walk
	}
	
	if x > 800{
		sprite_index = spr_stupidrat_idle
		instance_create(x,y,obj_minibazooka)
		state = bossstates.waiting
		hsp = 0
		vsp = 0
	}	
}