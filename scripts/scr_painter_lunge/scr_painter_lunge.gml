function scr_painter_lunge(){
	
	image_speed = 0.35
	//sprite_index = vulnerable_spr

	if sprite_index == spr_painter_lungestart
	{
		hsp = approach(hsp, 0.0001, 0.3)
		if sprite_animation_end() && hsp != 0
			hsp = -4 * xscale	
		if sprite_animation_end()
		{
			sprite_index = spr_painter_lungestart2
			image_index = 0
			movespeed = 21
			flash = true
			if !instance_exists(obj_painter_lungebox)
				instance_create(x, y, obj_painter_lungebox)
		}
		
	}
	if sprite_index == spr_painter_lunge || sprite_index == spr_painter_lungestart2
	{
		create_afterimage(AfterImageType.pureblue, xscale)
		if sprite_index == spr_painter_lungestart2 && sprite_animation_end() 
			sprite_index = spr_painter_lunge
		var diff_mvsp = 15 + (intensity * 2)
		var target_x = tgtNeg
		if xscale == 1
			target_x = tgtPos
		var dist = point_distance(x, 0, target_x, 0)
		var _move = dist < 200 ? ((dist / 200) * (diff_mvsp * (2/3))) + (diff_mvsp * (1/3)) : diff_mvsp
		movespeed = approach(movespeed, _move, 0.7)
		x = approach(x, target_x, movespeed)
		
		
		
		if dist < 10
		{
			x = target_x
			state = bossstates.normal
			xscale = face_center_room()
			image_index = 0
			movespeed = 0
		}
	}
	
	if sprite_index == spr_painter_idle
	{
		image_index = 0
		sprite_index = spr_painter_lungestart
		if !(x <= 320 || x >= 672)
			xscale = boss_face_obj(obj_player1)
		else
			xscale = face_center_room()
		
	}

}