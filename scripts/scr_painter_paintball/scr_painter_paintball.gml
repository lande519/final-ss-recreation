function scr_painter_paintball(){
	var spd = 0.35
	spd += (intensity * 0.075)
	image_speed = spd
	vsp = 0
	movespeed = 0
	hsp = approach(hsp, 0, 0.15)
	// Start Attack
	if sprite_index == normal_spr
	{
		sprite_index = spr_painter_paintballcharge
		image_index = 0
		xscale = face_center_room()
	}
	
	if sprite_animation_end() && sprite_index == spr_painter_paintballcharge
	{
		instance_create(x, y, obj_painter_paintball)
		sprite_index = spr_painter_paintballthrow
		hsp = -3 * xscale
		image_index = 0
	}

	if sprite_animation_end() && sprite_index == spr_painter_paintballthrow
	{
		state = bossstates.normal
		//delay = 
		xscale = face_center_room()
		image_index = 0
		movespeed = 9
	}
		
	
}