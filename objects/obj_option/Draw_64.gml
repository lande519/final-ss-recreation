var i, _optLength, _strHeight, _realstrHeight, _xx, _option, _yy, _iColor, _finalStr, _optStr, _old_font, _max_length, _icon_x, old_halign, _ov, barPad, bar_start_x, bar_end_x, iconPos, si, xlen, _desc_str, _desc_yy, _desc_width;

draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, false);

for (i = 0; i < array_length(bg_alpha); i++)
    draw_sprite_tiled_ext(bg_options, i, bgx, bgy, 1, 1, c_white, bg_alpha[i]);

with (obj_option_keyconfig)
{
    event_perform(ev_draw, ev_gui);
    exit;
}

with (obj_langSpriteLoader)
{
    event_perform(ev_draw, ev_gui);
    exit;
}

draw_set_font(global.font);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
_optLength = array_length(options);
_strHeight = string_height("A") + 12;
_realstrHeight = string_height("A");
_xx = 150;

if (alignCenter)
{
    _xx = camera_get_view_width(view_camera[0]) / 2;
    draw_set_halign(fa_center);
}

for (i = 0; i < _optLength; i++)
{
    _option = options[i];
    _yy = (camera_get_view_height(view_camera[0]) / 2) + round(-((_optLength - 1) * _strHeight * 0.5)) + (i * _strHeight);
    _iColor = (i == optionSelected) ? 16777215 : 8421504;
    _option.icon_alpha = approach(_option.icon_alpha, i == optionSelected, 0.2);
    
    switch (_option.type)
    {
        default:
            _finalStr = _option.translate_name ? lang_get(_option.id) : _option.id;
            _optStr = "";
            _old_font = draw_get_font();
            
            if (array_length(_option.options))
                _optStr = _option.translate_opt ? lang_get(_option.options[_option.value]) : _option.options[_option.value];
            
            if (alignCenter && array_length(_option.options))
                _finalStr = string("{0} {1}", _finalStr, _optStr);
            
            _finalStr = string_upper(_finalStr);
            _max_length = 500;
            
            if (string_width(_finalStr) > _max_length || string_height(_finalStr) > _realstrHeight)
            {
                draw_set_font(global.smallfont);
                draw_text_ext_color(_xx, _yy, _finalStr, 16, _max_length / 2, _iColor, _iColor, _iColor, _iColor, 1);
            }
            else
            {
                draw_text_color(_xx, _yy, _finalStr, _iColor, _iColor, _iColor, _iColor, 1);
            }
            
            if (_option.sprite_index != -4)
            {
                _icon_x = alignCenter ? (_xx + (string_width(_finalStr) / 2)) : (_xx + string_width(_finalStr));
                _icon_x += 50;
                draw_sprite_ext(_option.sprite_index, _option.image_index, _icon_x + irandom_range(-1, 1), _yy + irandom_range(-1, 1), 1, 1, 0, c_white, _option.icon_alpha);
            }
            
            draw_set_font(_old_font);
            
            if (!alignCenter && array_length(_option.options))
            {
                old_halign = draw_get_halign();
                draw_set_halign(fa_right - old_halign);
                draw_text_color(camera_get_view_width(view_camera[0]) - _xx, _yy, _optStr, _iColor, _iColor, _iColor, _iColor, 1);
                draw_set_halign(old_halign);
            }
            
            break;
        
        case OptionType.Slider:
            old_halign = draw_get_halign();
            _xx = 150;
            draw_set_halign(fa_left);
            _finalStr = _option.translate_name ? lang_get(_option.id) : _option.id;
            draw_text_color(_xx, _yy, _finalStr, _iColor, _iColor, _iColor, _iColor, 1);
            _ov = _option.value / 100;
            
            if (sliderSprite != spr_optionslide_bar)
            {
                draw_sprite_ext(sliderSprite, 0, camera_get_view_width(view_camera[0]) - _xx, _yy, 1, 1, 0, _iColor, 1);
                barPad = 20;
                bar_start_x = (camera_get_view_width(view_camera[0]) - _xx - sprite_get_width(sliderSprite)) + barPad;
                bar_end_x = camera_get_view_width(view_camera[0]) - _xx - barPad;
                iconPos = lerp(bar_start_x, bar_end_x, _ov);
                draw_sprite(sliderIcon, _option.moving, iconPos, _yy);
            }
            else
            {
                si = _option.moving ? 1 : 2;
                xlen = 160;
                
                if (_ov <= 0)
                    si = 0;
                
                draw_sprite_ext(sliderIcon, 0, camera_get_view_width(view_camera[0]) - _xx, _yy, 1, 1, 0, _iColor, 1);
                draw_sprite_stretched_ext(sliderSprite, si, camera_get_view_width(view_camera[0]) - _xx - xlen - 54, _yy - 24, 48 + (_ov * xlen), 48, _iColor, 1);
            }
            
            if (_option.show_percent)
            {
                draw_set_font(global.smallfont);
                draw_set_halign(fa_right);
                draw_text_color(bar_start_x - barPad, _yy, string("{0}%", _option.value), _iColor, _iColor, _iColor, _iColor, 1);
            }
            
            draw_set_halign(old_halign);
            draw_set_font(global.font);
            break;
    }
}

draw_set_font(global.smallfont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
_desc_str = (descfadeout || !showdesc) ? old_desc : description;
_desc_yy = camera_get_view_height(view_camera[0]) - 48;
_desc_width = string_width(_desc_str) + 16;
draw_sprite_ext(spr_optionSubtitle, 0, camera_get_view_width(view_camera[0]) / 2, _desc_yy, _desc_width / 32, 1, 0, c_white, descalp);
draw_text_color(camera_get_view_width(view_camera[0]) / 2, _desc_yy, _desc_str, c_white, c_white, c_white, c_white, descalp);

