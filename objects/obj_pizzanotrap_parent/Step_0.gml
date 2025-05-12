if (!instance_exists(obj_pizzano_dance))
{
    visible = false;
    exit;
}

switch (state)
{
    case trapstates.normal:
        visible = false;
        image_speed = 0;
        image_index = 0;
        
        if (cooldown > 0)
        {
            cooldown--;
        }
        else if (point_distance(x, 0, obj_player1.x, 0) <= threshold_x && point_distance(0, y, 0, obj_player1.y) <= threshold_y)
        {
            state = trapstates.bomb;
            attack_buffer = 20;
        }
        
        break;
    
    case trapstates.bomb:
        visible = true;
        image_speed = 0.35;
        
        if (attack_buffer > 0)
        {
            attack_buffer--;
        }
        else
        {
            with (obj_pizzano_dance)
            {
                if (state != pizzano_dancestates.bomb)
                {
                    trap_x = other.x;
                    trap_y = other.y;
                    event_perform(ev_alarm, 0);
                    other.state = trapstates.normal;
                    other.cooldown = other.cooldown_max;
                }
            }
        }
        
        break;
}
