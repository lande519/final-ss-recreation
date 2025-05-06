

if place_meeting_collision(x, y) || x > 896 || x < 64 {
	var dir = point_direction(x, y, obj_player1.x, obj_player1.y- 50)
	x += lengthdir_x(16, dir)
	y += lengthdir_y(16, dir)
}	

if stunned >= 1 && state == bossstates.hurt {
	var _loop = stunned % 6
	_loop = floor(_loop / 3)
	image_alpha = _loop + 0.5
}
else
	image_alpha = 1

if state != bossstates.grabbed {
	depth = -30
	scr_collision()	
}
switch state{
	case bossstates.waiting:
	break;
	case bossstates.frozen:
		scr_boss_frozen()
	break;
	case bossstates.normal:
		scr_boss_normal()
	break;
	case bossstates.intro:
		scr_boss_intro()
	break;
	case bossstates.hurt:
		scr_boss_hurt()
	break
	case bossstates.vulnerable:
		scr_boss_vunerable()
	break;
	case bossstates.slide:
		scr_coneboy_slide()
	break;
 	case bossstates.cottondash:
		scr_coneboy_cottondash()
	break;
 	case bossstates.headkick:
		scr_coneboy_headkick()
	break;
 	case bossstates.dog:
		scr_coneboy_dog()
	break;
}

if flash && alarm[0] <= 0
	alarm[0] = (0.15 * room_speed)
x = clamp(x, 60, 900)	