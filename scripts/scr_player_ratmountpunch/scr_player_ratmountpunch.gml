function scr_player_ratmountpunch()
{
    image_speed = abs(movespeed) / 12;
    hsp = movespeed;
    move = key_left + key_right;
    landAnim = false;
    sprite_index = spr_lonegustavo_punch;
    
    if (grounded)
        movespeed = approach(movespeed, xscale * 4, 0.1);
    
    ratmountpunchtimer--;
    
    if (ratmountpunchtimer < 0 && (!key_slap || gustavohitwall))
    {
        sprite_index = spr_lonegustavo_walk;
        state = States.ratmount;
        
        if (hsp != 0)
        {
            dir = sign(hsp);
            xscale = dir;
        }
    }
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_slopePlatform) && !place_meeting(x + hsp, y, obj_destructibles))
    {
        event_play_oneshot("event:/SFX/player/bumpwall", x, y);
        p1Vibration(5, 5);
        ratmountpunchtimer = 10;
        gustavohitwall = true;
		sprite_index = spr_lonegustavo_dashjump
		vsp = -15
		state = States.ratmountjump
        instance_create(x + hsp, y, obj_bangEffect);
        movespeed *= -1;
    }
	if inputBufferJump > 0 && can_jump && grounded{
		vsp = -11
		inputBufferJump = 0	
	}
}
