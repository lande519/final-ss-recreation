function state_player_honey()
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    move = key_left + key_right;
    sprite_index = spr_player_PZ_honeystuck;
    image_speed = 0.35;
    
    if (move != 0)
        xscale = move;
    
    var webID = instance_place(x, y, obj_honeypanel);
    
    if (instance_exists(webID))
    {
        x = lerp(x, webID.x, 0.3);
        y = lerp(y, webID.y, 0.3);
    }

}