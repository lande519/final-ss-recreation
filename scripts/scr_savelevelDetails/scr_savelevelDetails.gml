function scr_savelevelDetails(argument0 = true)
{
    var all_confecti, ranks, rank_cutoffs, i, level_sec, _score, rank_as_num;
    
    all_confecti = global.MallowFollow && global.ChocoFollow && global.CrackFollow && global.WormFollow && global.CandyFollow;
    global.rank = "d";
    
    if (global.Collect >= global.srank)
    {
        if (!global.ComboLost && global.secretfound > 2 && global.lapcount >= 1 && global.Treasure)
            global.rank = "p";
        else
            global.rank = "s";
    }
    else
    {
        ranks = ["a", "b", "c"];
        rank_cutoffs = [global.arank, global.brank, global.crank];
        
        for (i = 0; i < array_length(ranks); i++)
        {
            if (global.Collect >= rank_cutoffs[i])
            {
                global.rank = ranks[i];
                break;
            }
        }
    }
    
    level_sec = 0;
    
    with (obj_gametimer)
    {
        saveTime();
        level_sec = addTime([global.LevelFrames], [global.LevelSeconds], [global.LevelMinutes]);
    }
    
    ini_open(global.SaveFileName);
    ini_update_stat("Game", string("damage_{0}", scr_getCharacterPrefix(global.playerCharacter)), global.HurtCounter);
    global.HurtMilestone = global.HurtCounter;
    ini_update_stat("Time", string(global.InternalLevelName), level_sec, true);
    
    for (i = 0; i < 3; i++)
        ini_update_stat("Secret", string(global.InternalLevelName) + string(i + 1), global.SecretsFound[i]);
    
    ini_update_stat("Treasure", string(global.InternalLevelName), global.Treasure);
    _score = real(ini_read_string("Highscore", string(global.InternalLevelName), "0"));
    ini_update_stat("Highscore", string(global.InternalLevelName), global.Collect);
    
    if (global.Collect > _score)
        global.NewHighScore = true;
    else
        global.NewHighScore = false;
    
    ini_update_stat("Laps", string(global.InternalLevelName), global.lapcount);
    ini_update_stat("Confecti", string(global.InternalLevelName) + "1", global.MallowFollow);
    ini_update_stat("Confecti", string(global.InternalLevelName) + "2", global.ChocoFollow);
    ini_update_stat("Confecti", string(global.InternalLevelName) + "3", global.CrackFollow);
    ini_update_stat("Confecti", string(global.InternalLevelName) + "4", global.WormFollow);
    ini_update_stat("Confecti", string(global.InternalLevelName) + "5", global.CandyFollow);
    
    if (global.InternalLevelName == "tutorial")
    {
        ini_update_stat("Misc", "completedtutorial", true);
        
        if (!ini_read_real("Misc", "lapunlockall", false) && level_sec <= 90)
        {
            ini_write_real("Misc", "lapunlockall", true);
            scr_queueToolTipPrompt(lang_get("prompt_lap_unlockall"));
        }
    }
    
    if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", string(global.InternalLevelName), "none")))
        ini_write_string("Ranks", string(global.InternalLevelName), global.rank);
    
    ini_close();
    obj_hudManager.saveAlpha = 10;
    
    if (argument0)
    {
        fmod_studio_event_instance_start(global.RankMusicInst);
        fmod_studio_event_instance_set_paused(global.RankMusicInst, false);
        rank_as_num = clamp(5 - rank_checker(), 0, 5);
        fmod_studio_event_instance_set_parameter_by_name(global.RankMusicInst, "state", rank_as_num, true);
    }
}

function ini_update_stat(argument0, argument1, argument2, argument3 = false)
{
    var val;
    
    val = ini_read_string(argument0, argument1, 0);
    
    if (argument3)
    {
        if (val > argument2 || val == 0)
            ini_write_string(argument0, argument1, argument2);
        
        exit;
    }
    
    if (val < argument2)
        ini_write_string(argument0, argument1, argument2);
}

function confecti_count_level(argument0)
{
    var confecti_count, i, c;
    
    confecti_count = 0;
    ini_open(global.SaveFileName);
    
    for (i = 1; i < 6; i++)
    {
        c = string(argument0) + string(i);
        
        if (ini_read_string("Confecti", c, 0) == 1)
            confecti_count++;
    }
    
    ini_close();
    return confecti_count;
}
