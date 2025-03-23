event_inherited();

canCollide = function(argument0 = obj_parent_player)
{
    var _state;
    
    switch (argument0)
    {
        case obj_parent_player:
        case obj_player1:
        case obj_player2:
            _state = global.freezeframe ? argument0.frozenState : argument0.state;
            return !place_meeting(x, y, argument0) || _state == States.climbwall || _state == States.machslide;
            break;
        
        case obj_escaperosette:
            return false;
            break;
        
        default:
            return !place_meeting(x, y, argument0);
            break;
    }
};

scr_collision_init();
grav = 0.5;
dhsp = 0;
dvsp = 0;
spinspeed = 0;

