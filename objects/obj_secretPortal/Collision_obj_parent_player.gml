var _cutscene;

if (secretActivated && visible && !place_meeting(x, y, obj_secretPortalexit))
{
    if (other.state != States.actor && sprite_index == spr_secretPortal)
    {
        _cutscene = cutscene_create([cutscene_secretPortal_start, cutscene_secretPortal_middle, cutscene_secretPortal_preend, cutscene_secretPortal_end]);
        cutscene_declare_actor(id, "SECRETPORTAL");
        
        if (is_undefined(storedState))
            storedState = functionState();
        
        with (_cutscene)
            storedState = other.storedState;
        
        image_index = 0;
        sprite_index = spr_secretPortal_tele;
        
        repeat (5)
            instance_create(x, y, obj_secretpoof);
        
        event_play_oneshot("event:/SFX/general/secretenter", x, y);
        instance_create(x, y, obj_tilePaintSplatter, 
        {
            blendColor: 11230063
        });
        ds_list_add(global.SaveRoom, id);
    }
}

