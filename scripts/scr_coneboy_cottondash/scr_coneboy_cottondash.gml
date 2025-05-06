// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_coneboy_cottondash(){
	xscale = face_obj(obj_player1)
	hsp = movespeed
	movespeed = approach(movespeed,10*xscale,0.4)
	sprite_index = spr_coneboy_cottondash
	
	if !instance_exists(obj_bucket){
		with instance_create(x,-100,obj_bucket){
			state = (4 << 0)
			hasSquashedX = true
			squashValueX = 0
			baddieStunTimer = 50
			vsp = -5
			importantEnemy = true
		}		
	}
	
}