function state_player_rocketlauncher()
{
    hsp = approach(hsp, 0, 0.3);
    movespeed = 0;
    sprite_index = spr_player_PZ_bazooka_shoot;
    
    if (sprite_animation_end())
        state = States.normal;
	
    if (image_index = 3 && room = boss_coneball)
        state = States.normal;
		
	if room = boss_coneball
		do_grab()
}

