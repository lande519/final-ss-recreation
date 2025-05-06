// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_coneboy_slide(){
	image_speed = 0.35
	//sprite_index = vulnerable_spr

	if sprite_index == spr_coneboy_dashstart
	{
		hsp = approach(hsp, 0.0001, 0.3)
		if sprite_animation_end() && hsp != 0
			hsp = -4 * xscale	
		if sprite_animation_end()
		{
			sprite_index = spr_coneboy_dash
			image_index = 0
			movespeed = 21
			flash = true
		}
		
	}
	if sprite_index == spr_coneboy_dash || sprite_index == spr_coneboy_dash
	{
		create_afterimage(AfterImageType.purepink, xscale)
		if sprite_index == spr_coneboy_dash && sprite_animation_end() 
			sprite_index = spr_coneboy_dashstart
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
	
	if sprite_index == spr_coneboy_idle
	{
		image_index = 0
		sprite_index = spr_coneboy_dashstart
		if !(x <= 320 || x >= 672)
			xscale = boss_face_obj(obj_player1)
		else
			xscale = face_center_room()
		
	}
}