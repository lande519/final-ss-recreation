if instance_exists(obj_bossgumbob)
	x += 6
else
	scr_collision()

if grounded && sprite_index != spr_coneboy_idle{
	instance_create(x+100,y,obj_bosspullupPN)	
	sprite_index = spr_coneboy_idle
}

