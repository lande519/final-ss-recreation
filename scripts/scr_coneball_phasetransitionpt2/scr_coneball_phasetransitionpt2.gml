// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_coneball_transetuppt2(){
	stop_music()
	fmod_start_music("event:/music/w4/coneballphase2")
	instance_create(x,y,obj_bombExplosion)
	image_index = 0
	sprite_index = 	spr_coneball_phase3_intro1
	grav = 0.5
	x = obj_player1.roomStartX+700
	y = obj_player1.roomStartY-100	
	xscale = -1
	obj_bosscontroller.fadealpha = 1
	vsp = 0
	hsp = 0
	state = bossstates.phasetrans
	obj_player1.x = obj_player1.roomStartX
	obj_player1.y = obj_player1.roomStartY	
	obj_player1.state = States.actor
	obj_player1.sprite_index = spr_player_PZ_idle
	obj_player1.hsp = 0
	obj_player1.vsp = 0
	obj_player1.movespeed = 0	
}


function scr_coneball_transpt2(){
	if sprite_index = spr_coneball_phase3_intro1 && sprite_animation_end(){
		image_index = 0
		sprite_index = spr_coneball_phase3_intro2	
	}	
	
	if sprite_index = spr_coneball_phase3_intro2 && sprite_animation_end(){
		image_index = 0
		sprite_index = spr_stupidrat_idle
		instance_create(x-400, y+70,obj_bosspullupG)
	}	
	if sprite_index = spr_stupidrat_idle && instance_exists(obj_bosspullupPN){
		obj_player1.sprite_index = spr_player_PZ_lunge
		obj_player1.hsp = 6
	}
}