

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
switch state {
	case bossstates.waiting:
	break;
	case bossstates.frozen:
		scr_boss_frozen()
	break;
	case bossstates.intro:
		scr_boss_intro()
	break;	
	case bossstates.normal:
		scr_boss_normal()
	break;
	case bossstates.hurt:
		scr_boss_hurt()
	break
	case bossstates.vulnerable:
		scr_boss_vunerable()
	break;
	case bossstates.grabbed:
		scr_boss_grabbed()
	break;
 	case bossstates.pizzanothunder:
		scr_pizzano_thunder()
	break;
	case bossstates.pizzanoretro:
		scr_pizzano_retro()
	break;
	case bossstates.pizzanodash:
		scr_pizzano_dash()
	break;
	case bossstates.bounce:
		scr_pizzano_bounce()
	break;
	case bossstates.phasetranssetup:
		scr_pizzano_phasetranssetup()
	break;
	case bossstates.phasetrans:
		scr_pizzano_phasetrans()
	break;
}

if flash && alarm[0] <= 0
	alarm[0] = (0.15 * room_speed)
