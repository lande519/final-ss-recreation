function scr_boss_grabbed() {
	grav = 0.5
	sprite_index = grabbed_spr
	depth = 0
	
	if (obj_player1.state == States.superslam) {
		
	    if (obj_player1.character == "P") {
			x = obj_player1.x - obj_player1.xscale * 2;
			y = obj_player1.y - 104;
	    }
	    else {
	        depth = -7;
	        x = obj_player1.x;
	        y = (obj_player1.y - 104);
	    }
	}
	else {
		var try_x = 0;
		while (try_x < 60) {
			if !scr_solid(obj_player1.x + (try_x * obj_player1.xscale), y) && !scr_slopePlatform(obj_player1.x + (try_x * obj_player1.xscale), y) {
				try_x++;
			} else {
				break;
			}
		}
		x = obj_player1.x + (try_x * obj_player1.xscale);
		y = obj_player1.y - 64;
		hsp = 0;
		vsp = 0;
	}

}
	

function scr_boss_hurt() {
	grav = 0.5
	hsp = xscale * -movespeed
	movespeed = approach(movespeed, 0, 0.05)
	if stunned > 90
		stunned = 90
	stunned--
	sprite_index = hurt_spr
	if thrown 
		vsp = 0
	if place_meeting_collision(x + xscale * -1, y) {
		xscale *= -1
		movespeed *= 0.66
		with(obj_bosscontroller)
			event_user(0)		
	
		if object_index = obj_bossthewalker{
			repeat(400){
				with(obj_bosscontroller)
					event_user(0)	
				x = -6699
				y = -6699	
			}
		}
		
		thrown = false
		flash = true;
	}
	if grounded 
		vsp = -4
	if stunned <= 0 {
		//hsp = 0
		state = bossstates.normal
		xscale = face_center_room()
		thrown = false
		ds_queue_clear(atkqueue)	
	}
}
function scr_boss_parry() {
	hsp = approach(hsp, 0, 0.1)
	if sprite_animation_end() {
		state = bossstates.normal
		xscale = boss_face_obj(obj_player1)
		thrown = false

		
	}
		
}