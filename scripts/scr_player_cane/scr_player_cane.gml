// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_player_cane(){
move = key_left + key_right;

if (move == 0 && hsp != 0)
    hsp = xscale * movespeed;
else
    hsp = move * movespeed;

if (move != 0 && !scr_solid(x, y + 1))
{
    if (movespeed < 6)
        movespeed += 0.5;
}

if (move != xscale || move == 0 || place_meeting(x + xscale, y, obj_solid))
{
    movespeed = 0;
    pogospeed = 6;
}

if (sign(hsp) != 0)
    xscale = sign(hsp);
else if (move != 0)
    xscale = move;

if (grounded && (sprite_index != spr_player_PZ_canebounce && sprite_index != spr_player_PZ_canebounce))
{
    image_index = 0;
    movespeed = 0;
    vsp = 0;
    
    if (pogochargeactive == 1)
        sprite_index = spr_player_PZ_canebounce;
    else
        sprite_index = spr_player_PZ_canebounce;
    
    instance_create(x, y, obj_landcloud);
}

if (floor(image_index) == 2 && (sprite_index == spr_player_PZ_canebounce || sprite_index == spr_player_PZ_canebounce))
{
    if (key_jump2)
        vsp = -12;
    else if (key_down)
        vsp = -3;
    else
        vsp = -6;
    
    if (move == xscale && movespeed < 12)
        pogospeed += 2;
    
    if (move == -xscale && movespeed > 0)
        pogospeed -= 2;
    
    movespeed = pogospeed;
}

if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_PZ_canebounce || sprite_index == spr_player_PZ_canefall || sprite_index == spr_player_PZ_canebounce || sprite_index == spr_playerN_pogostart))
{
    if (pogochargeactive == 1)
        sprite_index = spr_player_PZ_canefall;
    else
        sprite_index = spr_player_PZ_canefall;
}

if (movespeed > 12 && pogochargeactive == 0)
{
    pogochargeactive = 1;
    pogocharge = 50;
}

if (movespeed > 12)
    pogocharge = 50;

if (!key_attack)
    state = States.normal

image_speed = 0.35;

do_grab()

}