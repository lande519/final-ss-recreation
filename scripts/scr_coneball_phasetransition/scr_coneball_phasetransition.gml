// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_coneball_phasetranssetup(){
	sprite_index = spr_coneball_sad
	x = xstart
	y = ystart+500
	obj_player1.x = obj_player1.roomStartX
	obj_player1.y = obj_player1.roomStartY
	obj_player1.state = States.actor
	obj_player1.sprite_index = spr_player_PZ_idle
	obj_player1.hsp = 0
	obj_player1.vsp = 0
	obj_player1.movespeed = 0
	alarm[2] = -1
	alarm[1] = -1
	alarm[0] = -1
	state = bossstates.phasetrans
	sprite_index = spr_coneball_sad
	grav = 0
	hsp = 0
	vsp = 0
	xscale = 1
	obj_bosscontroller.fadealpha = 1
	obj_player1.xscale = 1
	with obj_parent_enemy
		instance_destroy()
}

function scr_coneball_phasetrans(){
	if sprite_index != spr_coneball_phasetrans1
		waitTimer --
		
	if waitTimer < 0 && sprite_index != spr_coneball_phasetrans1{
		if y != topy
			vsp = approach(vsp,-1,0.5)
		else{
			vsp = 0
			sprite_index = spr_coneball_phasetrans1
			image_index = 0
			waitTimer = 50		
		}
		
		hsp = 0	
	}
	
	if sprite_index = spr_coneball_phasetrans1 && image_index > 40{
		phase = 1
		state = bossstates.phasetranssetup
	}
	
	
}