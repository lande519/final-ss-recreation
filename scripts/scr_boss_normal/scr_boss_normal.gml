function scr_boss_normal(){
	hsp = approach(hsp, 0, 0.25)
	
	mask_index = spr_player_mask
	image_speed = 0.35
	
	if grounded
		sprite_index = normal_spr
	else
		sprite_index = fall_spr
		
	hurted = false
	
	
	//var tgtx = 960 - 128
	//if xscale == 1
		//tgtx =  128
	//movespeed = 
	//x = approach(x, tgtx, 10)	
	if delay > 0 
		delay--
	if delay <= 0 && hsp = 0{
		image_index = 0
		boss_next_attack()
	}
}

function scr_boss_normal_coneball(){
	xscale = 1
	hsp = movespeed * dir
	sprite_index = spr_coneball_new
	if place_meeting(x+50*dir,y,obj_solid)
		dir *= -1
	grav = 0	
	if y > topy
		y -= 4
	else{
		vsp = 0
		alarm[4] = -1
		alarm[3] = -1
	}
	
	if obj_bosscontroller.bosshp = 8
	{
		throwround = 1
		movespeed = 5
	}

	if obj_bosscontroller.bosshp = 7
	{
		movespeed = 6	
		throwround = 2	
	}

	if obj_bosscontroller.bosshp = 6
	{
		movespeed = 7	
		throwround = 3	
	}
	
	if obj_bosscontroller.bosshp < 5
		sprite_index = spr_coneball_weak
	
	if obj_bosscontroller.bosshp = 4{
		sprite_index = spr_coneball_weak
		throwround = 4
	}
	if obj_bosscontroller.bosshp = 2
	{
		throwround = 5
	}	
}