function state_player_comingoutdoor()
{
    var dark_color;
    
    image_speed = 0.35;
    jumpAnim = true;
    landAnim = false;
    crouchAnim = true;
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != spr_Timesup)
    {
        sprite_index = spr_walkfront;
        
        if (!stepEffectBuffer--)
        {
            instance_create(x, y + 43, obj_puffEffect);
            event_play_oneshot("event:/SFX/player/step", x, y);
            stepEffectBuffer = 12;
        }
    }
    
    if (sprite_index == spr_walkfront && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_exitgate) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_keydoorclock)))
    {
        dark_color = image_index / image_number;
        image_blend = make_color_hsv(0, 0, dark_color * 255);
    }
    
    if (sprite_animation_end())
    {
		if global.InternalLevelName == "oldmines"{
			image_index = 0
			image_speed = 0.35
			sprite_index = spr_player_PZ_gotKey			
			state = States.minesoldcutscene	
		}
		else{
	        movespeed = 0;
	        state = States.normal;
	        image_blend = c_white;
		}
    }
    
    global.ComboFreeze = 15;
}

