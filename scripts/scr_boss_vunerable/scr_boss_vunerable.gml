function scr_boss_vunerable(){
	grav = 0.5
	if grounded {
		hsp = approach(hsp, 0, 0.1)
		if vsp > 0
			hsp = 0
	}
	movespeed = 0	
	if sprite_index != hurt_spr
		sprite_index = vulnerable_spr
	if intensity >= 0 
		intensity--
	else
	{
		sprite_index = normal_spr
		state = bossstates.normal
		image_index = 0
	}
	var p = obj_player1
	if place_meeting(x, y, p) && p.state != States.hurt {
		var _o = id
		with p {
			// Instakill
			if (instakillmove || state == States.uppercut || state == States.grabdash) {
				_o.xscale = -xscale
				_o.movespeed = 12
				instance_create(_o.x, _o.y, obj_slapstar);
			    instance_create(_o.x, _o.y, obj_baddieGibs);
				instance_create(_o.x, _o.y, obj_bangEffect);
				with instance_create(_o.x, _o.y, obj_bangEffect)
					sprite_index = spr_enemypuncheffect;

				_o.sprite_index = _o.hurt_spr
				_o.flash = true
				_o.vsp = -3
				_o.state = bossstates.hurt
				_o.stunned = 120
				_o.invtime = 20
				_o.setfordeath = true;
				//scr_sound(sound_punch)
				camera_shake_add(3, 3)
			}
			// Grab
			if state == States.grabdash {
				//scr_sound(sound_slaphit);
				baddiegrabbedID = _o.id
				instance_create((_o.x + (other.xscale * 40)), _o.y, obj_punchdust)			
				if !key_up {
					state = States.finishingblow
					image_index = 0
					sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
				} else {
					state = States.superslam;
					sprite_index = spr_player_PZ_pileDriver;
					if grounded
						vsp = -12;
					else
						vsp = -6;
					grounded = false;
					image_index = 0;
					image_speed = 0.35;	
				}
			}
			
		}
		
		
	}
	/*
	if place_meeting(x, y, obj_slaphitbox)
	{
		state = bossstates.grabbed
		with obj_player1
		{
			xscale *= -1
			state = States.finishingblow
			image_index = 0
			sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);
		}
	}
	*/
}