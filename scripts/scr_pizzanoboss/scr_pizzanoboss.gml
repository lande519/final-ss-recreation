// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pizzano_thunder(){
	if sprite_index = spr_player_PA_idle{
		sprite_index = spr_player_PZ_pileDriver_intro
		vsp = -10
	}
	if sprite_index = spr_player_PZ_pileDriver_intro && sprite_animation_end()
		sprite_index = spr_player_PZ_pileDriver
	
	if !instance_exists(obj_crushertrail) && grounded && sprite_index != spr_player_PZ_pileDriver_intro{
		image_index = 0
		sprite_index = spr_player_PZ_pileDriver_land

		with (instance_create(x + (image_xscale * 40), y, obj_crushertrail))
	            image_xscale = other.image_xscale;
        
		with (instance_create(x - (image_xscale * 40), y, obj_crushertrail))
			image_xscale = -other.image_xscale;
	}
	
	if sprite_index = spr_player_PZ_pileDriver_land && sprite_animation_end() && grounded
		state = bossstates.normal
	
}

function scr_pizzano_retro(){
	if sprite_index = spr_player_PA_idle
		sprite_index = spr_player_PA_button
		
	if sprite_animation_end(){
		if sprite_index = spr_player_PA_button{
			image_index = 0
			sprite_index = spr_player_PA_mini_idle
			instance_create(x,y,obj_poofeffect)
		}
			
		if sprite_index = spr_player_PA_mini_idle
			sprite_index = spr_player_PA_mini_walk	
	}
		
	if sprite_index != spr_player_PA_button{
		retrozanotimer --
		
		if retrozanotimer < 0{
			if grounded
				vsp = -10
			hsp = 0
			if vsp = 1{
				state = bossstates.normal
				instance_create(x,y,obj_poofeffect)	
				retrozanotimer = 250
			}
			exit;
		}
		
		mask_index = spr_player_PA_mini_idle
		if grounded{
			xscale = face_obj(obj_player1)	
			hsp = 8 * xscale	
			if scr_enemy_playerisnear(200,10000)
				vsp = -5
			
			if sprite_index = spr_player_PA_mini_jump
				sprite_index = spr_player_PA_mini_walk	
			
		}
		else{
			sprite_index = spr_player_PA_mini_jump
		}
	}

}

function scr_pizzano_dash(){
	dashtimer --
	if dashtimer < 0{
		movespeed = approach(movespeed, 0, 0.9)
		if movespeed = 0{
			state = bossstates.normal
			dashtimer = 300
		}
	}
	
	
	image_speed = 0.35
	hsp = movespeed * xscale
	// Start Dash State
	if sprite_index == spr_player_PA_idle
	{
		hsp = 0
		xscale = face_center_room()
		movespeed = 0
		sprite_index = spr_player_PA_spinstart
		image_index = 0
	}
	if sprite_index == spr_player_PA_spin || sprite_index == spr_player_PA_spinstart
	{
		if sprite_animation_end() && sprite_index = spr_player_PA_spinstart
			sprite_index = spr_player_PA_spin
			
		if movespeed < 20 && dashtimer > 0
			movespeed += 0.1
			
		var target_x = tgtNeg
		if xscale == 1
			target_x = tgtPos

		if scr_solid(x + hsp, y, true)
		{
			xscale *= -1
		}
	}
}
