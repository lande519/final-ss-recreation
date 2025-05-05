if (collide == 1)
{
    image_alpha = 0
    
    with (obj_parent_player)
    {
        if (state != States.bottlerocket)
        {
            state = States.bottlerocket;
            xscale = other.image_xscale;
            x = other.x;
            y = other.y;
            image_index = 0;
            sprite_index = spr_player_PZ_bottleRocket_normal;
        }
    }
}

