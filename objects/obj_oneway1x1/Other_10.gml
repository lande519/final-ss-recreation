var _check;

_check = (DestroyedBy.bbox_left > (x + 16) && sign(image_xscale) == 1) || (DestroyedBy.bbox_right < (x - 16) && sign(image_xscale) == -1);

if (_check && !(DestroyedBy.object_index == obj_parent_enemy && DestroyedBy.state == States.stun))
{
    if (DestroyedBy.object_index == obj_parent_player && ((place_meeting(x, y - DestroyedBy.vsp, DestroyedBy) || place_meeting(x, y - sign(DestroyedBy.vsp), DestroyedBy)) && DestroyedBy.vsp < 0 && DestroyedBy.state == States.jump))
        DestroyedBy.vsp = 0;
    
    instance_destroy();
}

