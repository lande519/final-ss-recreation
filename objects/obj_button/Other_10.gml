if (currentState == States.frozen)
{
    currentState = States.titlescreen;
    sprite_index = spr_Lowering;
    
    if (save_trigger && ds_list_find_index(global.SaveRoom, id) == -1)
        ds_list_add(global.SaveRoom, id);
}

