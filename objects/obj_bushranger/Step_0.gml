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
	case bossstates.painterdash:
		scr_painter_dash()
	break;
	case bossstates.painterlunge:
		scr_painter_lunge()
		//afterimagetimer--
		//if afterimagetimer <= 0
		//{
		//	with (instance_create(x, y, obj_mach3effect))
		//	{
		//	    playerID = other.object_index
		//		image_index = (other.image_index - 1)
		//		image_xscale = other.xscale
		//		sprite_index = other.sprite_index
		//	}
		//	afterimagetimer = 6
		//}
	break;
	case bossstates.paintball:
		scr_painter_paintball()
	break;
	case bossstates.painter_bomb:
		scr_painter_floatbomb()
	break;
	case bossstates.painter_createenem:
		var x_coord = delay[0]
		var y_coord = delay[1]
		if x_coord == -4
			x_coord = choose(128, 832)
		if !subattack_1 || !instance_exists(bID) {
			with instance_create(x_coord, y_coord, intensity)	{
				image_xscale = face_center_room()
				movespeed = 3
				important = true
				painter = true	
				if other.subattack_1
					other.bID = id
				if other.intensity = obj_cottonwitch {
					idlespr = spr_paintwitch
					stunfallspr = spr_paintwitch_stunned
					walkspr = spr_paintwitch
					grabbedspr = spr_paintwitch_stunned
					scaredspr = spr_paintwitch_scared
					spr_throw = spr_paintwitch_shoot
					deadspr = spr_paintwitch_dead;
					throw_frame = 4
					landspr = spr_paintwitch
				
				}
			}
		}
		boss_next_attack()	
	break
}

if flash && alarm[0] <= 0
	alarm[0] = (0.15 * room_speed)
x = clamp(x, 60, 900)	