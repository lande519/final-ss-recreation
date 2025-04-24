if (state == (0 << 0))
{
    var player = instance_nearest(x, y, obj_player1)
    if (player.x != x)
        image_xscale = (-(sign((x - player.x))))
}

