if (!global.ShowHUD)
    exit;

if (start && room != secret_entrance)
{
    var _mins = minutes;
    var _secs = string(seconds);
    
    if (seconds < 10)
        _secs = concat("0", seconds);
    else
        _secs = string(seconds);
    
    draw_set_halign(fa_center); 
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    draw_set_font(global.font);
    var xx = 960 / 2;
    var yy = 540 - 16;
    
    if (minutes <= 0 && seconds <= 10)
    {
        draw_set_color(c_red);
        
        if (seconds <= 5)
        {
            xx += irandom_range(-4, 4);
            yy += irandom_range(-4, 4);
        }
        else
        {
            xx += irandom_range(-1, 1);
            yy += irandom_range(-1, 1);
        }
    }
    
    draw_text(xx, yy, concat(_mins, ":", _secs));
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(global.MoneyFont);
    draw_sprite(spr_secretsleft, 0, 64, 480);
    draw_text_color(64, 480, string(array_length(levels)), c_white, c_white, c_white, c_white, 1);
}
