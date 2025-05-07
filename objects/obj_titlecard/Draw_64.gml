if (fadein)
{
    draw_sprite(lang_get_sprite(spr_titlecards), info.image_index, 0, 0);
    draw_sprite(lang_get_sprite(spr_titlecards_title), info.image_index, irandom_range(-1, 1), irandom_range(-1, 1));
}

draw_set_alpha(fadealpha);
draw_rectangle_color(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, 0);
draw_set_alpha(1);
