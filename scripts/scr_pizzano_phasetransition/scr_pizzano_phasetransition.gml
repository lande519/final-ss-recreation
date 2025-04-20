// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pizzano_phasetranssetup(){
	x = obj_player1.roomStartX
	y = obj_player1.roomStartY 
	obj_player1.x = xstart
	obj_player1.y = ystart
	obj_player1.state = States.actor
	obj_player1.sprite_index = spr_player_PZ_idle
	obj_player1.hsp = 0
	obj_player1.vsp = 0
	obj_player1.movespeed = 0
	state = bossstates.phasetrans
	sprite_index = spr_pizzano_drill
	xscale = 1
	obj_bosscontroller.fadealpha = 1
	obj_player1.xscale = -1
}

function scr_pizzano_phasetrans(){
	waitTimer --
	if waitTimer < 0{
		hsp = approach(hsp,10,0.5)
		vsp = 0
		
		if place_meeting(x+20*xscale,y,obj_pizzanobossdestroy)
			instance_destroy(obj_pizzanobossdestroy)	
			
		if place_meeting(x,y,obj_player1) && obj_player1.state = States.actor{
			obj_player1.x = x	
			obj_player1.y = y	
			obj_player1.sprite_index = spr_player_PZ_hurt
		}
	}
	
	
}