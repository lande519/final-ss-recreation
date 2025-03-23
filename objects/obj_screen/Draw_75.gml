surface_reset_target();
shader_reset();
draw_clear_alpha(c_black, 1);
draw_set_color(c_white);
gpu_set_blendenable(false);
screen_draw_gui_surf();
gpu_set_blendenable(true);
gpu_set_blendmode(bm_normal);
gpu_set_texfilter(false);

if (window_has_focus())
    gameframe_draw();
