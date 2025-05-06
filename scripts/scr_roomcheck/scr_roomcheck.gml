function is_preGame(argument0 = room)
{
    var special_rooms;
    
    special_rooms = [rm_preinitializer, rm_initializer, rm_startupLogo, rm_introVideo, rm_mainmenu, rm_credits, rm_titlecard, rm_disclaimer];
    return array_contains(special_rooms, argument0);
}

function scr_roomcheck(argument0 = room)
{
    var special_rooms;
    
    special_rooms = [rm_initializer, rm_preinitializer, rm_startupLogo, rm_devroom, rm_introVideo, rank_room, timesuproom, rm_mainmenu, rm_credits, rm_titlecard, rm_disclaimer, rm_blank];
    return !array_contains(special_rooms, argument0);
}

function is_hub(argument0 = room)
{
    var hub_rooms;
    
    hub_rooms = [hub_soundTest, hub_coneballentrance, hub_outside, ctop_1, hub_hallway, hub_w1, hub_w2, hub_w3, hub_w4, hub_molasses, hub_mindpalace, hub_mindvault, rm_credits];
    return array_contains(hub_rooms, argument0);
}


function is_boss(argument0 = room)
{
    var boss_rooms;
    
    boss_rooms = [boss_pizzano, boss_painter, boss_peppino, boss_gumbob, boss_thewalker, boss_coneball, boss_coneboy];
    return array_contains(boss_rooms, argument0);
}

function is_tutorial(argument0 = room)
{
    var tut_rooms;
    
    tut_rooms = [tutorial_1, tutorial_2, tutorial_3, tutorial_4, tutorial_5];
    return array_contains(tut_rooms, argument0);
}
