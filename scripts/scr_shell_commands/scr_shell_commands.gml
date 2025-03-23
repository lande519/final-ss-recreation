var i;

for (i = 0; room_exists(i); i++)
    global.RoomNameList[i] = room_get_name(i);

for (i = 0; object_exists(i); i++)
    global.ObjectNameList[i] = object_get_name(i);

function scr_parseBool(argument0, argument1)
{
    var true_strings, false_strings;
    
    true_strings = ["1", "y", "true", "yes", "t", "+"];
    false_strings = ["0", "n", "false", "no", "f", "-"];
    argument0 = string_lower(argument0);
    
    if (array_contains(true_strings, argument0))
    {
        return true;
    }
    else if (array_contains(false_strings, argument0))
    {
        return false;
    }
    else
    {
        show_debug_message(string("SHELL WARNING: Couldn't parse {0} as a string, using default value of {1}.", argument0, argument1));
        return argument1;
    }
}

function sh_escape(argument0)
{
    var arg0, arg1, arg2, minutes, seconds;
    
    arg0 = scr_parseBool(string(argument0[1]), !global.panic);
    arg1 = argument0[2];
    arg2 = argument0[3];
    global.panic = arg0;
    minutes = real(string_digits(arg1));
    seconds = real(string_digits(arg2));
    global.EscapeTime = ((minutes * 60) + seconds) * 60;
    
    with (obj_hudManager.HUDObject_timer)
        targetEscapeTime = global.EscapeTime;
    
    global.MaxEscapeTime = global.EscapeTime;
    
    if (!instance_exists(obj_panicchanger))
        instance_create(x, y, obj_panicchanger);
}

function meta_escape()
{
    return 
    {
        description: "Activates escape and sets escape time",
        arguments: ["<bool>", "<min>", "<sec>", "<isSucroseTimer?>"],
        suggestions: [["true", "false"], [], [], ["true", "false"]],
        argumentDescriptions: ["Escape mode", "Minutes left", "Seconds left", "Toggles if Timer is Sucrose mode"]
    };
}

function sh_game_speed(argument0)
{
    var arg0, new_game_speed;
    
    arg0 = argument0[1];
    new_game_speed = max(round(real(string_digits(arg0))), 1);
    game_set_speed(new_game_speed, gamespeed_fps);
}

function meta_game_speed()
{
    return 
    {
        description: "Changes the game speed.",
        arguments: ["<fps>"],
        suggestions: [[]],
        argumentDescriptions: ["Game speed, in frames per second."]
    };
}

function sh_character(argument0)
{
    var choosen_character;
    
    choosen_character = Characters.Pizzelle;
    
    switch (argument0[1])
    {
        default:
            show_debug_message(string("SHELL WARNING: [{0}] is not a valid character. Defaulting to Pizzelle.", argument0[1]));
        
        case "Pizzelle":
            choosen_character = Characters.Pizzelle;
            break;
    }
    
    scr_player_changeCharacter(obj_parent_player, choosen_character);
}

function meta_character()
{
    return 
    {
        description: "Change the character you're currently playing as.",
        arguments: ["<character>"],
        suggestions: [["Pizzelle"]],
        argumentDescriptions: ["The character to switch to."]
    };
}

function sh_roomcheck(argument0)
{
    instance_create(0, 0, obj_roomCheck);
}

function meta_roomcheck()
{
    return 
    {
        description: "Checks all rooms currently in the game.",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}

function sh_unlock(argument0)
{
    var type, levels, i, int_level, level_info, z, clothes_info, cheftask_info;
    
    type = argument0[1];
    
    if (type == "all" || type == "levels")
    {
        levels = ["tutorial", "entryway", "steamy", "mineshaft", "molasses"];
        ini_open(global.SaveFileName);
        
        for (i = 0; i < array_length(levels); i++)
        {
            int_level = levels[i];
            level_info = ds_map_find_value(global.GameLevelMap, int_level);
            
            for (z = 0; z < 3; z++)
                ini_update_stat("Secret", string(int_level) + string(z + 1), true);
            
            ini_update_stat("Treasure", string(int_level), true);
            ini_update_stat("Highscore", string(int_level), level_info.sRankRequirement + 150);
            ini_update_stat("Laps", string(int_level), 1);
            ini_update_stat("Confecti", string(int_level) + "1", true);
            ini_update_stat("Confecti", string(int_level) + "2", true);
            ini_update_stat("Confecti", string(int_level) + "3", true);
            ini_update_stat("Confecti", string(int_level) + "4", true);
            ini_update_stat("Confecti", string(int_level) + "5", true);
            
            if (int_level == "tutorial")
            {
                ini_update_stat("Misc", "completedtutorial", true);
                
                if (!ini_read_real("Misc", "lapunlockall", false))
                {
                    ini_write_real("Misc", "lapunlockall", true);
                    scr_queueToolTipPrompt(string("[spr_promptfont]{0}", lang_get("prompt_lap_unlockall")));
                }
            }
            
            ini_write_string("Ranks", string(int_level), "p");
        }
        
        ini_close();
    }
    
    if (type == "all" || type == "clothes")
    {
        ini_open("optionData.ini");
        clothes_info = scr_get_palettes(false);
        
        for (i = 0; i < array_length(clothes_info); i++)
            ini_write_real("Palettes", clothes_info[i].taskKey, true);
        
        ini_close();
    }
    
    if (type == "all" || type == "achievements")
    {
        levels = ["demoEN", "entryway", "steamy", "mineshaft", "molasses"];
        ini_open(global.SaveFileName);
        
        for (z = 0; z < array_length(levels); z++)
        {
            cheftask_info = scr_get_chef_tasks(levels[z], false);
            
            for (i = 0; i < array_length(cheftask_info); i++)
                ini_write_real("ChefTasks", cheftask_info[i].taskKey, true);
        }
        
        ini_close();
    }
}

function meta_unlock()
{
    return 
    {
        description: "Unlocks Stuff",
        arguments: ["<type>"],
        suggestions: [["all", "levels", "clothes", "achievements"]],
        argumentDescriptions: ["Category to Unlock. (type:<levels> gives you P ranks)"]
    };
}

function sh_toggle_collisions(argument0)
{
    var arg1;
    
    arg1 = scr_parseBool(argument0[1], !global.showcollisions);
    global.showcollisions = arg1;
    toggle_collision_function();
}

function meta_toggle_collisions()
{
    return 
    {
        description: "Toggles collision object visibility.",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["Visibility"]
    };
}

function sh_lock_camera(argument0)
{
    var arg1;
    
    with (obj_camera)
    {
        arg1 = scr_parseBool(argument0[1], !cameraLock);
        cameraLock = arg1;
    }
}

function meta_lock_camera()
{
    return 
    {
        description: "Locks camera.",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["Lock"]
    };
}

function toggle_collision_function()
{
    var array, length, i;
    
    if (!variable_global_exists("showcollisionarray"))
        global.showcollisionarray = [obj_solid, obj_slope, obj_slopePlatform, obj_platform, obj_sidePlatform, obj_cameraRegion, obj_cottonplatform, obj_creamThiefGoTrigger, obj_creamThiefTurnTrigger, obj_creamThiefJumpTrigger, obj_creamThiefGrabTrigger, obj_creamThiefLoseTrigger, obj_creamThiefTauntTrigger, obj_creamThiefBIGJump, obj_secretdestroyable, obj_secretdestroyable_Point, obj_secretdestroyable_big, obj_secret_brainBlock, obj_secretdestroyable_bigPoint, obj_secretdestroyable_metal, obj_eventtrigger, obj_parent_doortrigger, obj_doorS, obj_doorA, obj_doorB, obj_doorC, obj_doorD, obj_doorE, obj_doorP, obj_grindRail, obj_grindRail_Slope, obj_minecartRail, obj_minecartRail_Slope, obj_hangRail, obj_gnomeTNTBlock, obj_cottonsolid, obj_dirtpatch];
    
    array = global.showcollisionarray;
    length = array_length(array);
    i = length - 1;
    
    while (i >= 0)
    {
        with (array[i])
        {
            if (object_index == array[i])
            {
                visible = global.showcollisions;
                depth = 0;
                
                if (object_index != obj_solid && object_index != obj_slope)
                    image_alpha = 0.6;
            }
        }
        
        i--;
    }
}

function sh_showtiles(argument0)
{
    var arg1;
    
    arg1 = scr_parseBool(argument0[1], !global.showtiles);
    global.showtiles = arg1;
    show_tiles_function();
}

function meta_showtiles()
{
    return 
    {
        description: "Toggles tile layer visibility.",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["Visibility"]
    };
}

function show_tiles_function()
{
    var i;
    
    for (i = 0; i < array_length(tiles_array); i++)
        layer_set_visible(tiles_array[i], global.showtiles);
}

function scr_shell_inittiles()
{
    var _layers, i, tile_id;
    
    tiles_array = [];
    _layers = layer_get_all();
    
    for (i = 0; i < array_length(_layers); i++)
    {
        tile_id = layer_tilemap_get_id_fixed(_layers[i]);
        
        if (layer_exists(_layers[i]) && tile_id != -1 && layer_get_visible(_layers[i]))
            array_push(tiles_array, _layers[i]);
    }
}

global.PlayerDebugView = undefined;

function toggle_debugView(argument0)
{
    global.DebugVisuals = argument0;
    show_debug_log(argument0);
    
    if (global.DebugVisuals)
    {
        show_debug_log(global.DebugVisuals);
        global.PlayerDebugView = dbg_view("Player", true);
        dbg_section("Sprite Info");
        dbg_sprite(ref_create(obj_player1, "sprite_index"), ref_create(obj_player1, "image_index"), "Player Sprite", 100, 100);
        dbg_section("Position Info");
        dbg_watch(ref_create(obj_player1, "roomName"), "room");
        dbg_watch(ref_create(obj_player1, "x"), "X Position");
        dbg_watch(ref_create(obj_player1, "y"), "Y Position");
        dbg_watch(ref_create(obj_player1, "roomStartX"), "Room X Position");
        dbg_watch(ref_create(obj_player1, "roomStartY"), "Room Y Position");
        dbg_section("Physics Info");
        dbg_watch(ref_create(obj_player1, "movespeed"), "movespeed");
        dbg_watch(ref_create(obj_player1, "verticalMovespeed"), "verticalMovespeed");
        dbg_watch(ref_create(obj_player1, "hsp"), "hsp");
        dbg_watch(ref_create(obj_player1, "fracHsp"), "fracHsp");
        dbg_watch(ref_create(obj_player1, "vsp"), "vsp");
        dbg_watch(ref_create(obj_player1, "fracVsp"), "fracVsp");
        dbg_watch(ref_create(obj_player1, "grounded"), "grounded");
        dbg_watch(ref_create(obj_player1, "groundedSlope"), "groundedSlope");
        dbg_section("Misc Info");
        dbg_watch(ref_create(obj_player1, "xscale"), "xscale");
        dbg_watch(ref_create(obj_player1, "state"), "Player State");
        dbg_watch(ref_create(obj_player1, "stateName"), "Player State Name");
        dbg_watch(ref_create(obj_player1, "baddieGrabbedID"), "baddieGrabbedID");
    }
    else
    {
        dbg_view_delete(global.PlayerDebugView);
    }
}

function sh_toggle_debugmode(argument0)
{
    var arg1;
    
    arg1 = scr_parseBool(argument0[1], !global.DebugVisuals);
    toggle_debugView(arg1);
}

function meta_toggle_debugmode()
{
    return 
    {
        description: "Toggles debug mode.",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]],
        argumentDescriptions: ["Debug state"]
    };
}

function sh_room_goto(argument0)
{
    var arg1, arg2;
    
    arg1 = asset_get_index(argument0[1]);
    arg2 = argument0[2];
    
    if (asset_get_type(argument0[1]) != 3)
    {
        return "Can't find room " + string(argument0[1]);
    }
    else
    {
        obj_parent_player.targetRoom = arg1;
        obj_parent_player.targetDoor = arg2;
        instance_create(0, 0, obj_fadeoutTransition);
    }
}

function meta_room_goto()
{
    return 
    {
        description: "Changes current room.",
        arguments: ["<room_id>", "<door>"],
        suggestions: [global.RoomNameList, ["N/A", "A", "B", "C", "D", "E", "P", "S"]],
        argumentDescriptions: ["targetRoom", "targetDoor"]
    };
}

function sh_instance_create(argument0)
{
    var _obj;
    
    _obj = asset_get_index(argument0[1]);
    
    if (_obj > -1)
        instance_create(argument0[2] ?? mouse_x, argument0[3] ?? mouse_y, _obj);
}

function meta_instance_create()
{
    return 
    {
        description: "Spawn a new object.",
        arguments: ["<object_id>", "<x>", "<y>"],
        suggestions: [global.ObjectNameList, mouseArgumentType.worldX, mouseArgumentType.worldY],
        argumentDescriptions: ["The object to spawn", "The X spawn coordinate", "The Y spawn coordinate"]
    };
}

function sh_noclip()
{
    if (obj_parent_player.state != States.noclip)
        obj_parent_player.state = States.noclip;
    else
        obj_parent_player.state = States.normal;
}

function meta_noclip()
{
    return 
    {
        description: "Toggle noclip.",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}

function sh_freeflight()
{
    if (obj_parent_player.state != States.freeflight)
        obj_parent_player.state = States.freeflight;
    else
        obj_parent_player.state = States.normal;
}

function meta_freeflight()
{
    return 
    {
        description: "Toggle freeflight.",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}

function sh_give_all(argument0)
{
    var confecti_objs, i;
    
    confecti_objs = [obj_confectimallow, obj_confectichoco, obj_confecticrack, obj_confectiworm, obj_confecticandy];
    
    for (i = 0; i < array_length(confecti_objs); i++)
        instance_create(x, y, confecti_objs[i]);
    
    global.Treasure = true;
    global.secretfound = 3;
    global.Collect = global.srank;
}

function meta_give_all()
{
    return 
    {
        description: "Gives you all 5 confecti, 3 secrets, secret treasure, and S rank score.",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}

function sh_give_prank(argument0)
{
    var confecti_objs, i;
    
    confecti_objs = [obj_confectimallow, obj_confectichoco, obj_confecticrack, obj_confectiworm, obj_confecticandy];
    
    for (i = 0; i < array_length(confecti_objs); i++)
        instance_create(x, y, confecti_objs[i]);
    
    global.rank = "p";
    global.panic = 1;
    global.ComboLost = 0;
    global.Treasure = true;
    global.secretfound = 3;
    global.Collect = global.srank * 1.8;
    global.SecretsFound[0] = true;
    global.SecretsFound[1] = true;
    global.SecretsFound[2] = true;
    global.lapcount = 1;
}

function meta_give_prank()
{
    return 
    {
        description: "gives you a specified rank",
        arguments: ["rank"],
        suggestions: ["d", "c", "a", "s", "p"],
        argumentDescriptions: []
    };
}

function sh_set_combo(argument0)
{
    global.Combo = real(string_digits(argument0[1]));
    obj_parent_player.superTauntBuffer = global.Combo;
    global.ComboTime = 60;
    global.ComboFreeze = 15;
}

function meta_set_combo()
{
    return 
    {
        description: "Set Combo",
        arguments: ["<comboamount>"],
        suggestions: [],
        argumentDescriptions: []
    };
}

function sh_give_stat(argument0)
{
    var arg1, add;
    
    arg1 = argument0[1];
    add = argument0[2];
    
    switch (arg1)
    {
        case "combo":
            global.Combo += add;
            global.ComboTime = 60;
            break;
        
        case "score":
            global.Collect += add;
            break;
        
        case "lap":
            global.lapcount += add;
            break;
    }
}

function meta_give_stat()
{
    return 
    {
        description: "Adds...",
        arguments: ["<string>", "<real>"],
        suggestions: [["combo", "score", "lap"]],
        argumentDescriptions: ["Variable to add to", "Number to add by"]
    };
}

function sh_lang_reload(argument0)
{
    scr_lang_reload();
}

function meta_lang_reload()
{
    return 
    {
        description: "Reload the lang directory",
        arguments: [],
        suggestions: [],
        argumentDescriptions: []
    };
}

