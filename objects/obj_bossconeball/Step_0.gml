if place_meeting_collision(x, y) || x > 896 || x < 64 {
	var dir = point_direction(x, y, obj_player1.x, obj_player1.y- 50)
	x += lengthdir_x(16, dir)
	y += lengthdir_y(16, dir)
}	

if hp = 0{
	with obj_bosscontroller
		event_user(0);
	hp = 10
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

if phase = 0
	scr_coneballphase1()
if phase = 1
	scr_coneballphase2()


if flash && alarm[0] <= 0
	alarm[0] = (0.15 * room_speed)
x = clamp(x, 60, 900)	