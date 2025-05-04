rubbleindex ++

if image_alpha = 0 && !instance_exists(obj_theg){
	y = y+300
	image_alpha = 1
	sprite_index = gatesprite
}

if image_alpha = 1 && !instance_exists(obj_theg){
	if y != ystart{
		y -= 2
		camera_shake_add(1, 1);
	}
	else{
		with instance_create(x,y,obj_bossgate){
			sprite_index = other.sprite_index
			details = other.details
			level = other.level
		}
		instance_destroy()
	}
}
