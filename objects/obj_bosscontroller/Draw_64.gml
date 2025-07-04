switch state
{
    case (27 << 0):
        firey--
        draw_sprite_tiled(spr_versusbg, 0, 0, firey)
        if (!surface_exists(player_surface))
            player_surface = surface_create(480, 540)
        else
        {
            surface_set_target(player_surface)
            draw_clear_alpha(c_black, 0)
            if showing_player
				draw_player_sprite_ext(spr_pizzellebossintro, 0, 200 + random_range(player_shake, -player_shake), 391 + random_range(player_shake, -player_shake), player_scale, player_scale, 0, player_color, player_alpha);
            if showing_names
                draw_sprite_ext(spr_boss_pizzelleTitle, 0, (200 + (random_range(name_shake, (-name_shake)))), (70 + (random_range(name_shake, (-name_shake)))), 1, 1, 0, c_white, 1)
            pal_swap_reset()
            surface_reset_target()
            draw_surface(player_surface, 0, 0)
        }
        if (!surface_exists(boss_surface))
            boss_surface = surface_create(480, 540)
        else
        {
            surface_set_target(boss_surface)
            draw_clear_alpha(c_black, 0)
            if showing_boss
                draw_sprite_ext(boss_sprite, 0, (395 + (random_range(boss_shake, (-boss_shake)))), (391 + (random_range(boss_shake, (-boss_shake)))), (-1 * boss_scale), boss_scale, 0, boss_color, boss_alpha)
            pal_swap_reset()
            surface_reset_target()
            draw_surface(boss_surface, 480, 0)
        }
        if showing_names
        {
            draw_sprite_ext(spr_boss_vs, 0, (480 + (random_range(versus_shake, (-versus_shake)))), (270 + (random_range(versus_shake, (-versus_shake)))), 1, 1, 0, c_white, 1)
            draw_sprite_ext(spr_boss_pizzelleTitle, 0, (760 + (random_range(name_shake, (-name_shake)))), (70 + (random_range(name_shake, (-name_shake)))), 1, 1, 0, c_white, 1)
        }
        draw_set_alpha(fadeout)
        draw_rectangle_color(-10, -10, 970, 550, color, color, color, color, false)
        draw_set_alpha(1)
        break
    case (1 << 0):
        scr_bosscontroller_draw_health()
        scr_bosscontroller_draw_health(bosshpspr, -1, bossmaxhp, lastbosshp, 896, 50, undefined, undefined, undefined, bosshpindex)
        break
}

draw_set_alpha(fadealpha)
draw_set_color(c_white)
draw_rectangle(-64, -64, (room_width + 64), (room_height + 64), 0)
draw_set_alpha(1)
