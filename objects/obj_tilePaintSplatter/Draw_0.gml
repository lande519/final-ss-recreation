var pw, ph, fade, i, tile_id;

pw = sprite_width / 2;
ph = sprite_height / 2;

if (!surface_exists(splatSurface))
{
    splatSurface = surface_create(sprite_width, sprite_height);
}
else
{
    surface_set_target(splatSurface);
    draw_clear_alpha(c_black, 0);
    shader_set(shd_greyscale);
    fade = shader_get_uniform(shd_premulti, "fade");
    shader_set_uniform_f(fade, 1);
    
    for (i = 0; i < array_length(tileLayerArr); i++)
    {
        tile_id = layer_tilemap_get_id_fixed(tileLayerArr[i]);
        draw_tilemap(tile_id, -x + pw, -y + ph);
    }
    
    shader_reset();
    gpu_set_blendmode(bm_subtract);
    draw_sprite_ext(sprite_index, image_index, pw - scale, ph - scale, 1 + scale, 1 + scale, 0, c_white, 1);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    draw_surface_ext(splatSurface, x - pw, y - ph, 1, 1, 0, blendColor, 1);
}
