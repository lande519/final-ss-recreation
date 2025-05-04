if (is_boss() || room == hub_soundTest)
    exit;

draw_set_font(global.MoneyFont);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_sprite(spr_pigtotal,image_index,832,448)
draw_text(832,448,concat("$", string(global.money)))