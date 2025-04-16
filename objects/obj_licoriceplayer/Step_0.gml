switch state{
	case States.normal:
		if (!touched)
		{
			if obj_player1.state != States.gotkey{
			    var xx = obj_player1.x;
			    var yy = obj_player1.y;
			    var ixs = obj_player1.xscale;
			    var v = obj_player1.vsp;
			    var msk = obj_player1.mask_index;
			    var spr = obj_player1.sprite_index;
			    var ind = obj_player1.image_index;
			    ds_queue_enqueue(followqueue, [xx, yy, ixs, v, msk, spr, ind]);
    
			    if (ds_queue_size(followqueue) > LAG_STEPS)
			    {
			        var b = ds_queue_dequeue(followqueue);
			        x = b[0];
			        y = b[1];
			        image_xscale = b[2];
			        vsp = b[3];
			        mask_index = b[4];
			        sprite_index = b[5];
			        image_index = b[6];
			    }
			}
			if obj_player1.state = States.gotkey{
				sprite_index = spr_player_PZ_hurt
			}
		    image_speed = 0.35;
		}
	break;
	
	case States.intro:
		if obj_parent_player.state != States.comingoutdoor{
			obj_parent_player.state = States.actor
			obj_parent_player.sprite_index = spr_player_PZ_idle
			obj_parent_player.hsp = 0
			obj_parent_player.vsp = 0
			if alarm_get(0) = -2
				alarm[0] = 20
			if alarm[0] = -1{				
				image_alpha = 1	
				flash -= 0.01
				if flash < 0{
					state = States.intropt2
					obj_parent_player.state = States.normal
				}
			}
		}
	break;
	
	case States.intropt2:	
		y += vsp
		if sprite_index != spr_player_PZ_divebomb_land{
			if vsp != 20
				vsp += 0.5	
			sprite_index = spr_player_PZ_divebomb_fall
			if (place_meeting(x,y-1,obj_platform)){
				vsp = 0
				image_index = 0
				sprite_index = spr_player_PZ_divebomb_land	
			}
		}
		else{
			if sprite_animation_end(){
				sprite_index = spr_player_PZ_idle
				state = States.normal
				with (instance_create(x, y, obj_landcloud))
					sprite_index = spr_groundpoundLandEffect;
				event_play_oneshot("event:/SFX/player/groundpound", x, y);
			}
		}
	break;
}
