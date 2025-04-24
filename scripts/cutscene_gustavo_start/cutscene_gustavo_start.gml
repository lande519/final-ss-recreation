function cutscene_gustavo_start()
{
    var _id = id;
    
    with (obj_cutscene_handlerPT)
    {
        if (id < _id)
            instance_destroy();
    }
    
    if (!instance_exists(obj_fadeoutTransition) && obj_player1.state != States.comingoutdoor && obj_player1.state != States.hurt)
    {
        with (obj_player1)
        {
            visible = true;
            image_alpha = 1;
            state = States.actor;
            sprite_index = spr_idle;
            image_speed = 0.35;
            xscale = 1;
            hsp = 0;
            vsp = 0;
        }
        
        with (obj_gustavo)
        {
            state = States.actor;
            
            if (!global.failcutscene)
                sprite_index = spr_gustavo_makepizza;
            else
                sprite_index = spr_gustavo_idle;
            
            image_speed = 0.35;
            image_xscale = -1;
        }
        
        cutscene_end_action();
    }
}
