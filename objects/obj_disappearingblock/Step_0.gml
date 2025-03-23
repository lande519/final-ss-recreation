if (place_meeting(x, y - 1, obj_parent_player) && !dissolving && sprite_index == spr_caramel_idle)
{
    image_index = 0;
    image_speed = 0.35;
    sprite_index = spr_caramel_dissolve;
    dissolving = true;
}

if (sprite_index == spr_caramel_dissolve)
{
    if (dissolving && image_index > 9)
    {
        destroyed = true;
        dissolving = false;
        reset = 100;
        x = -960;
        y = -100;
    }
    
    if (sprite_animation_end())
        sprite_index = spr_caramel_dead;
}

if (reset < 0)
{
    reset = 100;
    visible = true;
    destroyed = false;
    dissolving = false;
    image_speed = 0.5;
    image_index = 0;
    sprite_index = spr_caramel_alive;
}

if (sprite_index == spr_caramel_alive)
{
    if ((!place_meeting(xstart, ystart, obj_parent_player) && !place_meeting(xstart, ystart, obj_parent_enemy)) && floor(image_index) >= 17)
    {
        x = xstart;
        y = ystart;
    }
    
    if (sprite_animation_end())
    {
        image_index = image_number - 1;
        sprite_index = spr_caramel_idle;
        image_speed = 0.35;
        image_index = 0;
    }
}

if (destroyed)
    reset--;
