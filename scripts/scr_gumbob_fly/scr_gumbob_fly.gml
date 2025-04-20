function scr_gumbob_fly(){
	flytimer --
	throwtimer --
	
	if throwtimer < 0{
		instance_create(x,y,obj_bottle)
		throwtimer = 50
	}
	
	if flytimer < 0{
		state = bossstates.normal
		throwtimer = 50
		flytimer = 200
	}
		
	
	if sprite_index = normal_spr or sprite_index = fall_spr{
		sprite_index = spr_gumbob_fly
	}
	else{
		if sprite_index = spr_gumbob_fly{
			vsp -= 1
			
			if x > obj_player1.x{
				hsp = -5
				xscale = -1
			}
			else{
				hsp = 5
				xscale = 1				
			}	
		}
	}
}