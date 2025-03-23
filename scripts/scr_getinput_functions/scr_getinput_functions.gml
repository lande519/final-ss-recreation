function scr_input_varinit()
{
    key_up = false;
    key_up2 = false;
    key_right = false;
    key_right2 = false;
    key_left = false;
    key_left2 = false;
    key_down = false;
    key_down_release = false;
    key_down2 = false;
    key_jump = false;
    key_jump2 = false;
    key_jump_release = false;
    key_slap = false;
    key_slap2 = false;
    key_taunt = false;
    key_taunt2 = false;
    key_attack = false;
    key_attack2 = false;
    key_shoot = false;
    key_shoot2 = false;
    key_start = false;
    key_start2 = false;
    key_escape = false;
    stickpressed = false;
}

function scr_getinput_menu()
{
    if (global.shellactivate)
        exit;
    
    key_up = input_check("menuup");
    key_up2 = input_check_pressed("menuup");
    key_right = input_check("menuright");
    key_right2 = input_check_pressed("menuright");
    key_left = -input_check("menuleft");
    key_left2 = -input_check_pressed("menuleft");
    key_down = input_check("menudown");
    key_down_release = input_check_released("menudown");
    key_down2 = input_check_pressed("menudown");
    key_jump2 = input_check("menuconfirm");
    key_jump = input_check_pressed("menuconfirm");
    key_jump_release = input_check_released("menuconfirm");
    key_slap = input_check("menuback");
    key_slap2 = input_check_pressed("menuback");
    key_taunt = input_check("menudelete");
    key_taunt2 = input_check_pressed("menudelete");
    key_attack = false;
    key_attack2 = false;
    key_shoot = false;
    key_shoot2 = false;
    key_start = input_check("start");
    key_start2 = input_check_pressed("start");
    key_special = false;
    key_special2 = false;
    key_escape = key_start;
    key_superjump = input_check("superjump");
    key_groundpound = input_check("groundpound");
    return true;
}

function scr_getinput()
{
    scr_input_varinit();
    
    if (global.shellactivate)
        exit;
    
    key_up = input_check("up");
    key_up2 = input_check_pressed("up");
    key_right = input_check("right");
    key_right2 = input_check_pressed("right");
    key_left = -input_check("left");
    key_left2 = -input_check_pressed("left");
    key_down = input_check("down");
    key_down_release = input_check_released("down");
    key_down2 = input_check_pressed("down");
    key_jump2 = input_check("jump");
    key_jump = input_check_pressed("jump");
    key_jump_release = input_check_released("jump");
    key_slap = input_check("slap");
    key_slap2 = input_check_pressed("slap");
    key_taunt = input_check("taunt");
    key_taunt2 = input_check_pressed("taunt");
    key_attack = input_check("attack");
    key_attack2 = input_check_pressed("attack");
    key_shoot = input_check("shoot");
    key_shoot2 = input_check_pressed("shoot");
    key_start = input_check("start");
    key_start2 = input_check_pressed("start");
    key_special = input_check("special");
    key_special2 = input_check_pressed("special");
    key_escape = input_check("start");
    key_superjump = input_check("superjump");
    key_groundpound = input_check("groundpound");
    return true;
}

function input_check(argument0)
{
    return input_get(argument0).held || input_get(string("{0}C", argument0)).held;
}

function input_check_pressed(argument0)
{
    return input_get(argument0).pressed || input_get(string("{0}C", argument0)).pressed;
}

function input_check_released(argument0)
{
    return input_get(argument0).released || input_get(string("{0}C", argument0)).released;
}

function any_input_check()
{
    var keys, i;
    
    keys = ds_map_keys_to_array(global.input_map);
    
    for (i = 0; i < array_length(keys); i++)
    {
        if (ds_map_find_value(global.input_map, array_get(keys, i)).held || ds_map_find_value(global.input_map, array_get(keys, i)).pressed)
        {
            return true;
            break;
        }
    }
    
    return keyboard_check(vk_anykey) || keyboard_check_pressed(vk_anykey);
}

function any_input_pressed_check()
{
    var keys, i;
    
    keys = ds_map_keys_to_array(global.input_map);
    
    for (i = 0; i < array_length(keys); i++)
    {
        if (ds_map_find_value(global.input_map, array_get(keys, i)).pressed)
        {
            return true;
            break;
        }
    }
    
    return keyboard_check_pressed(vk_anykey);
}

function scr_key_display(argument0)
{
}

function scr_keyname(argument0)
{
    var key_name, _f;
    
    key_name = "";
    
    if (ds_map_exists(global.SpecialKeyNameMap, argument0))
    {
        key_name = ds_map_find_value(global.SpecialKeyNameMap, real(argument0));
    }
    else
    {
        _f = draw_get_font();
        draw_set_font(font_arial12);
        key_name = chr(argument0);
        draw_set_font(_f);
    }
    
    return key_name;
}

function scr_initKeyNameMap()
{
    if (!variable_global_exists("SpecialKeyNameMap"))
        global.SpecialKeyNameMap = ds_map_create();
    
    ds_map_set(global.SpecialKeyNameMap, 37, lang_get("key_left"));
    ds_map_set(global.SpecialKeyNameMap, 39, lang_get("key_right"));
    ds_map_set(global.SpecialKeyNameMap, 38, lang_get("key_up"));
    ds_map_set(global.SpecialKeyNameMap, 40, lang_get("key_down"));
    ds_map_set(global.SpecialKeyNameMap, 13, lang_get("key_enter"));
    ds_map_set(global.SpecialKeyNameMap, 27, lang_get("key_escape"));
    ds_map_set(global.SpecialKeyNameMap, 32, lang_get("key_space"));
    ds_map_set(global.SpecialKeyNameMap, 16, lang_get("key_shift"));
    ds_map_set(global.SpecialKeyNameMap, 17, lang_get("key_control"));
    ds_map_set(global.SpecialKeyNameMap, 18, lang_get("key_alt"));
    ds_map_set(global.SpecialKeyNameMap, 8, lang_get("key_backspace"));
    ds_map_set(global.SpecialKeyNameMap, 9, lang_get("key_tab"));
    ds_map_set(global.SpecialKeyNameMap, 36, lang_get("key_home"));
    ds_map_set(global.SpecialKeyNameMap, 35, lang_get("key_end"));
    ds_map_set(global.SpecialKeyNameMap, 46, lang_get("key_delete"));
    ds_map_set(global.SpecialKeyNameMap, 45, lang_get("key_insert"));
    ds_map_set(global.SpecialKeyNameMap, 33, lang_get("key_pageup"));
    ds_map_set(global.SpecialKeyNameMap, 34, lang_get("key_pagedown"));
    ds_map_set(global.SpecialKeyNameMap, 19, lang_get("key_pause"));
    ds_map_set(global.SpecialKeyNameMap, 44, lang_get("key_printscreen"));
    ds_map_set(global.SpecialKeyNameMap, 112, "F1");
    ds_map_set(global.SpecialKeyNameMap, 113, "F2");
    ds_map_set(global.SpecialKeyNameMap, 114, "F3");
    ds_map_set(global.SpecialKeyNameMap, 115, "F4");
    ds_map_set(global.SpecialKeyNameMap, 116, "F5");
    ds_map_set(global.SpecialKeyNameMap, 117, "F6");
    ds_map_set(global.SpecialKeyNameMap, 118, "F7");
    ds_map_set(global.SpecialKeyNameMap, 119, "F8");
    ds_map_set(global.SpecialKeyNameMap, 120, "F9");
    ds_map_set(global.SpecialKeyNameMap, 121, "F10");
    ds_map_set(global.SpecialKeyNameMap, 122, "F11");
    ds_map_set(global.SpecialKeyNameMap, 123, "F12");
    ds_map_set(global.SpecialKeyNameMap, 96, lang_get("key_numpad0"));
    ds_map_set(global.SpecialKeyNameMap, 97, lang_get("key_numpad1"));
    ds_map_set(global.SpecialKeyNameMap, 98, lang_get("key_numpad2"));
    ds_map_set(global.SpecialKeyNameMap, 99, lang_get("key_numpad3"));
    ds_map_set(global.SpecialKeyNameMap, 100, lang_get("key_numpad4"));
    ds_map_set(global.SpecialKeyNameMap, 101, lang_get("key_numpad5"));
    ds_map_set(global.SpecialKeyNameMap, 102, lang_get("key_numpad6"));
    ds_map_set(global.SpecialKeyNameMap, 103, lang_get("key_numpad7"));
    ds_map_set(global.SpecialKeyNameMap, 104, lang_get("key_numpad8"));
    ds_map_set(global.SpecialKeyNameMap, 105, lang_get("key_numpad9"));
    ds_map_set(global.SpecialKeyNameMap, 106, lang_get("key_multiply"));
    ds_map_set(global.SpecialKeyNameMap, 111, lang_get("key_divide"));
    ds_map_set(global.SpecialKeyNameMap, 107, lang_get("key_add"));
    ds_map_set(global.SpecialKeyNameMap, 109, lang_get("key_subtract"));
    ds_map_set(global.SpecialKeyNameMap, 110, lang_get("key_decimal"));
    ds_map_set(global.SpecialKeyNameMap, gp_face1, "A");
    ds_map_set(global.SpecialKeyNameMap, gp_face2, "B");
    ds_map_set(global.SpecialKeyNameMap, gp_face3, "X");
    ds_map_set(global.SpecialKeyNameMap, gp_face4, "Y");
    ds_map_set(global.SpecialKeyNameMap, gp_axislh, "LH");
    ds_map_set(global.SpecialKeyNameMap, gp_axislv, "LV");
    ds_map_set(global.SpecialKeyNameMap, gp_axisrh, "RH");
    ds_map_set(global.SpecialKeyNameMap, gp_axisrv, "RV");
    ds_map_set(global.SpecialKeyNameMap, gp_shoulderl, "L");
    ds_map_set(global.SpecialKeyNameMap, gp_shoulderlb, "ZL");
    ds_map_set(global.SpecialKeyNameMap, gp_shoulderr, "R");
    ds_map_set(global.SpecialKeyNameMap, gp_shoulderrb, "ZR");
    ds_map_set(global.SpecialKeyNameMap, gp_select, lang_get("key_select"));
    ds_map_set(global.SpecialKeyNameMap, gp_start, lang_get("key_start"));
    ds_map_set(global.SpecialKeyNameMap, gp_stickl, lang_get("key_stickl"));
    ds_map_set(global.SpecialKeyNameMap, gp_stickr, lang_get("key_stickr"));
    ds_map_set(global.SpecialKeyNameMap, gp_padu, lang_get("key_padup"));
    ds_map_set(global.SpecialKeyNameMap, gp_padl, lang_get("key_padleft"));
    ds_map_set(global.SpecialKeyNameMap, gp_padr, lang_get("key_padright"));
    ds_map_set(global.SpecialKeyNameMap, gp_padd, lang_get("key_paddown"));
    ds_map_set(global.SpecialKeyNameMap, 106, "*");
    ds_map_set(global.SpecialKeyNameMap, 107, "+");
    ds_map_set(global.SpecialKeyNameMap, 109, "-");
    ds_map_set(global.SpecialKeyNameMap, 110, ".");
    ds_map_set(global.SpecialKeyNameMap, 111, "/");
    ds_map_set(global.SpecialKeyNameMap, 186, ";");
    ds_map_set(global.SpecialKeyNameMap, 187, "=");
    ds_map_set(global.SpecialKeyNameMap, 188, ",");
    ds_map_set(global.SpecialKeyNameMap, 189, "-");
    ds_map_set(global.SpecialKeyNameMap, 190, ".");
    ds_map_set(global.SpecialKeyNameMap, 191, "/");
    ds_map_set(global.SpecialKeyNameMap, 192, "`");
    ds_map_set(global.SpecialKeyNameMap, 219, "{");
    ds_map_set(global.SpecialKeyNameMap, 220, "\\");
    ds_map_set(global.SpecialKeyNameMap, 221, "]");
    ds_map_set(global.SpecialKeyNameMap, 222, "'");
    ds_map_set(global.SpecialKeyNameMap, -1, lang_get("key_presskey"));
}
