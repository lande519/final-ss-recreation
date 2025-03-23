var coneballtimesup, _yy, _offset, _font, _str_h, _x, _y, border_sprite, meter_sprite, _fillXStart, _fillYstart, _xx, percentage, dist, roll_index, time_in_seconds, mins, secs, timer_string;

coneballtimesup = spr_bartimer_showtime;
coneballtimesup = spr_bartimer_blotchspotshowtime;

if (saveAlpha)
{
    saveAlpha = approach(saveAlpha, 0, 0.1);
    _yy = camera_get_view_height(view_camera[0]);
    _offset = 0;
    _font = draw_get_font();
    draw_set_font(global.smalltimerfont);
    _str_h = string_height("A");
    draw_set_font(_font);
    
    if (global.option_timer_type >= 1)
    {
        _yy -= _str_h;
        _offset = -8;
    }
    
    if (obj_gametimer.in_level && global.option_timer_type != 1)
    {
        _yy -= _str_h;
        _offset = -8;
    }
    
    draw_sprite_ext(spr_saveicon, save_index, camera_get_view_width(view_camera[0]), _yy + _offset, 1, 1, 0, c_white, saveAlpha);
    save_index += 0.35;
}

if (!global.ShowHUD)
    exit;

if (!(is_hub() || is_tutorial() || !scr_roomcheck() || room == mineshaft_elevator))
{
    with (HUDObject_comboMeter)
    {
        _x = round(x);
        _y = round(y);
        draw_sprite_ext(spr_tvHUD_comboMeter_back, 0, _x, _y, 1, 1, 0, c_white, 1);
        border_sprite = sprite_get_info(spr_tvHUD_comboMeter_back);
        meter_sprite = sprite_get_info(elm_meterFill.sprite_index);
        
        if (!surface_exists(comboSurface))
        {
            comboSurface = surface_create(meter_sprite.width, meter_sprite.height);
        }
        else
        {
            surface_set_target(comboSurface);
            draw_clear_alpha(c_black, 0);
            pal_swap_set(spr_comboMeterFill_pal, !global.ComboLost, false);
            draw_sprite(elm_meterFill.sprite_index, elm_meterFill.image_index, round(combofillDisplay) - meter_sprite.width, 0);
            pal_swap_reset();
            gpu_set_blendmode(bm_subtract);
            draw_sprite(spr_tvHUD_comboMeter_cut, 0, 0, 0);
            gpu_set_blendmode(bm_normal);
            surface_reset_target();
        }
        
        _fillXStart = 50;
        _fillYstart = 73;
        _xx = (_x - border_sprite.xoffset) + _fillXStart;
        _yy = (_y - border_sprite.yoffset) + _fillYstart;
        draw_surface(comboSurface, _xx, _yy);
        draw_sprite_ext(sprite_index, image_index, _x, _y, 1, 1, 0, c_white, 1);
        draw_text_scribble(_x - 17, _y + 26, string("[fa_right][fa_top][spr_tvHUD_comboFont]{0}", comboDisplay));
    }
    
    with (HUDObject_TV)
    {
        draw_sprite_ext(tvBG, tvBG_index, x, y, 1, 1, 0, c_white, 1);
        draw_player_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
        
        if (sprite_index != spr_tvHUD_turnedOff && sprite_index != spr_tvHUD_turningOn)
        {
            if (get_panic())
                draw_sprite_ext(weakSignal.sprite_index, weakSignal.image_index, x, y, 1, 1, 0, c_white, 1);
            
            if (transition.activated)
                draw_sprite_ext(spr_tvHUD_transitionStatic, transition.image_index, x, y, 1, 1, 0, c_white, 1);
            
            if (idleScreenSaver.activated)
                draw_sprite_ext(spr_tvHUD_logoBounce, 0, x + idleScreenSaver.x, y + idleScreenSaver.y, 1, 1, 0, c_white, 1);
            
            if (global.masterVolume <= 0 || (global.soundVolume <= 0 && global.musicVolume <= 0))
                draw_sprite_ext(spr_tvHUD_muteIcon, 0, x, y, 1, 1, 0, c_white, muteIconAlpha);
        }
    }
    
    with (HUDObject_timer)
    {
        percentage = clamp(1 - (targetEscapeTime / global.MaxEscapeTime), 0, 1);
        dist = clamp(percentage * 268, 0, 268);
        
        if (elm_coneBall.sprite_index != coneballtimesup)
        {
            draw_sprite_ext(spr_bartimer_normalBack, elm_coneBall.image_index, x, y, 1, 1, 0, c_white, 1);
            draw_sprite_part(spr_bartimer_strip, 0, 0, 0, 45 + dist, 113, x - 184, y - 56);
            roll_index = (percentage * sprite_get_number(spr_bartimer_roll) * 10) % sprite_get_number(spr_bartimer_roll);
            draw_sprite_ext(spr_bartimer_roll, roll_index, (x - 147) + dist, y + (-12 * percentage) + 31, 1, 1, 0, c_white, 1);
            time_in_seconds = floor(targetEscapeTime / 60);
            mins = abs(max(floor(time_in_seconds / 60), 0));
            secs = abs(max(time_in_seconds % 60, 0));
            
            if (secs < 10)
                secs = "0" + string(secs);
            
            timer_string = string("[fa_center][fa_top][spr_promptfont][c_white]{0}:{1}", mins, secs);
            draw_text_scribble(x, y, timer_string);
            draw_sprite_ext(spr_clockTimer, elm_clockTimer.image_index, (x - string_width_scribble(timer_string)) + 16, y + 16, 1, 1, 0, c_white, 1);
        }
        
        draw_sprite_ext(elm_coneBall.sprite_index, elm_coneBall.image_index, x, y, 1, 1, 0, c_white, 1);
    }
}

if (!global.gamePauseState)
{
    scribble(string("[wave][pPrompt]{0}", global.TooltipPrompt)).blend(16777215, HUDObject_tooltipPrompts.image_alpha).align(1, 1).draw(HUDObject_tooltipPrompts.x, HUDObject_tooltipPrompts.y);
    draw_set_alpha(1);
}
