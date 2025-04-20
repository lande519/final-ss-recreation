function scr_bosscontroller_intro() //gml_Script_scr_bosscontroller_intro
{
	obj_player1.hsp = 0
	obj_player1.vsp = 0
	par_boss.state = bossstates.nothing	
		
    if showing_player
    {
        player_scale = approach(player_scale, 1, 0.8)
        player_shake = approach(player_shake, 0, 0.8)
    }
    if showing_boss
    {
        boss_scale = approach(boss_scale, 1, 0.8)
        boss_shake = approach(boss_shake, 0, 0.8)
    }
    if showing_names
    {
        name_shake = approach(name_shake, 0, 1.2)
        versus_shake = approach(versus_shake, 0, 1.5)
    }
    switch intro_state
    {
        case 0:
            color_fade = approach(color_fade, 255, 10)
            color = make_color_hsv(0, 0, color_fade)
            if (color_fade >= 255)
                intro_state = 1
            break
        case 1:
            fadeout = approach(fadeout, 0, 0.1)
            if (!showing_player)
            {
                showing_player = true
                player_shake = 45
                player_color = 0
                alarm[0] = 10
            }
            break
        case 2:
            if (intro_timer > 0)
            {
                intro_timer--
                fadeout = approach(fadeout, 0, 0.1)
            }
            else
            {
                fadeout = approach(fadeout, 1, 0.1)
                color = 0
                if (fadeout == 1)
                {
                    intro_state = 3
                    showing_versus = false
                }
            }
            break
        case 3:
            fadeout = approach(fadeout, 0, 0.1)
            state = (1 << 0)
			
			obj_player1.state = States.actor
			par_boss.state = bossstates.intro	
            break
    }

}

function scr_bosscontroller_normal() //gml_Script_scr_bosscontroller_normal
{
    if (boss_func != -4)
        self.boss_func()
    if (bosshp != lastbosshp)
        lastbosshp = bosshp
}

function scr_bosscontroller_draw_health(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) //gml_Script_scr_bosscontroller_draw_health
{
    if (argument0 == undefined)
        argument0 = spr_pizzellehp
    if (argument1 == undefined)
        argument1 = 1
    if (argument2 == undefined)
        argument2 = playmaxhp
    if (argument3 == undefined)
        argument3 = playhp
    if (argument4 == undefined)
        argument4 = 64
    if (argument5 == undefined)
        argument5 = 50
    if (argument6 == undefined)
        argument6 = argument2 / 2
    if (argument7 == undefined)
        argument7 = 54
    if (argument8 == undefined)
        argument8 = 52
    if (argument9 == undefined)
        argument9 = playhpindex
    for (var i = 0; i < argument2; i++)
    {
        var _color = (i < argument3 ? c_white : c_black)
        var real_x = argument4 + (i % argument6) * (argument1 * argument7)
        var real_y = argument5 + (floor(i / argument6)) * argument8
		if argument9 = playhpindex
			draw_player_sprite_ext(argument0, argument9, real_x, real_y, 1, 1, 0, _color, 1)
		else
			draw_sprite_ext(argument0, argument9, real_x, real_y, 1, 1, 0, _color, 1)
        shader_reset()
    }
}

