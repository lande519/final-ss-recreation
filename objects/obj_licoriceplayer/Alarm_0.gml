flash = 1

var _deb;
repeat (10 + irandom_range(0, 2))
{
    _deb = create_debris(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), spr_leafDebris);
    
    with (_deb)
    {
        vsp = random_range(3, -10);
        terminalVelocity = 7;
    }
}
alarm[0] = -1