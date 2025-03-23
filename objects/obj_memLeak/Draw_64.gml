var i, _c, _r, _y;

artifacts += 50;

for (i = 0; i < 10; i++)
    surf[i] = surface_create(9000, 9000);

_c = artifacts / 180000;
room_speed = random_range(50, 90);

if (chance(_c))
{
    repeat (irandom(artifacts * 3))
    {
        _r = irandom(255);
        _c = make_color_rgb(irandom(255), irandom(255), irandom(255));
        draw_point_color(irandom(960), irandom(540), _c);
    }
}

_y = irandom(540);

if (chance(_c))
{
    repeat (irandom(artifacts))
    {
        _r = irandom(255);
        _c = make_color_rgb(_r, _r, _r);
        draw_line_color(0, _y, 960, _y + 1, _c, _c);
    }
}
