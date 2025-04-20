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