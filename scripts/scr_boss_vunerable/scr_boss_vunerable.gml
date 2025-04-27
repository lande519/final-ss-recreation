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
		var o = id
		with p {
			// Instakill
			if (instakillmove || state == States.uppercut || state == States.grabdash) {
				o.xscale = -xscale
				o.movespeed = 12
				instance_create(o.x, o.y, obj_slapstar);
			    instance_create(o.x, o.y, obj_baddieGibs);
				instance_create(o.x, o.y, obj_bangEffect);
				with instance_create(o.x, o.y, obj_bangEffect)
					sprite_index = spr_enemypuncheffect;

				o.sprite_index = o.hurt_spr
				o.flash = true
				o.vsp = -3
				o.state = bossstates.hurt
				o.stunned = 120
				o.invtime = 20
				o.setfordeath = true;
				//scr_sound(sound_punch)
				camera_shake_add(30, 15)
			}
			// Grab
			if state == States.grabdash {
				//scr_sound(sound_slaphit);
				baddiegrabbedID = o.id
				instance_create((o.x + (other.xscale * 40)), o.y, obj_punchdust)			
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