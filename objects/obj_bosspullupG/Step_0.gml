scr_collision()
if grounded && sprite_index != spr_gumbob_idle{
	instance_create(x+100,y,obj_bosspullupC)	
	sprite_index = spr_gumbob_idle
}