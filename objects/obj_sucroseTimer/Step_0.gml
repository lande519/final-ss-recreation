if (room == rank_room)
{
    visible = false;
    instance_destroy();
}
else
{
    visible = true;
}

timer_y = approach(timer_y, 540, 2);

if (floor(timer_index) > (sprite_get_number(spr_timer) - 1))
    timer_index = frac(timer_index);
