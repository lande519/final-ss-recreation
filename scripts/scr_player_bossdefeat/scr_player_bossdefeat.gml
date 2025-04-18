function state_player_bossdefeat()
{
    image_speed = 0.35;
    hsp = movespeed * -xscale;
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !grounded)
    {
        xscale *= -1;
        movespeed /= 2;
    }
    
    if (grounded && vsp > -1)
    {
        movespeed = approach(movespeed, 0, 0.17)
        
        if (sprite_index == spr_player_PZ_outofpizza2)
        {
            sprite_index = spr_player_PZ_outofpizza3;
            image_index = 0;
        }
    }
    
    if (image_index > (image_number - 1))
    {
        switch (sprite_index)
        {
            case spr_player_PZ_outofpizza1:
                sprite_index = spr_player_PZ_outofpizza2;
                image_index = 0;
                break;
            
            case spr_player_PZ_outofpizza3:
                sprite_index = spr_player_PZ_outofpizza4;
                image_index = 0;
                break;
        }
    }
}
