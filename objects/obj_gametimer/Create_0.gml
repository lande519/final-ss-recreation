if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

depth = -180;
global.SaveFrames = 0;
global.SaveSeconds = 0;
global.SaveMinutes = 0;
global.LevelFrames = 0;
global.LevelSeconds = 0;
global.LevelMinutes = 0;
in_level = false;
freeze_timer = true;
stop_timer = true;
ls_buffer = -1;
ls_buffer_start = 0;
use_livesplit = false;

livesplitInit = function()
{
    var p_i, p_c, p_s, MAGIC, Mi, Ml;
    
    if (buffer_exists(ls_buffer))
        buffer_delete(ls_buffer);
    
    p_i = 0;
    p_c = parameter_count();
    
    while (p_i <= p_c)
    {
        p_s = string_lower(parameter_string(p_i));
        
        switch (p_s)
        {
            case "--livesplit":
            case "-livesplit":
                use_livesplit = true;
                break;
        }
        
        p_i++;
    }
    
    if (global.option_livesplit_enabled)
        use_livesplit = true;
    
    if (!use_livesplit)
        return 0;
    
    trace("Initializing Livesplit Buffer");
    ls_buffer = buffer_create(2048, buffer_fixed, 1);
    buffer_fill(ls_buffer, 0, buffer_u8, 0, buffer_get_size(ls_buffer));
    buffer_seek(ls_buffer, buffer_seek_start, 0);
    MAGIC = [29, 138, 192, 91, 180, 25, 83, 62, 93, 130, 232, 179, 171, 58, 54, 168, 128, 49, 242, 41, 155, 20, 159, 173, 163, 187, 254, 101, 98, 124, 174, 209];
    MAGICsize = array_length(MAGIC);
    Mi = 0;
    Ml = MAGICsize;
    
    while (Mi < Ml)
    {
        buffer_write(ls_buffer, buffer_u8, MAGIC[Mi]);
        Mi++;
    }
    
    buffer_seek(ls_buffer, buffer_seek_start, 0);
    buffer_poke(ls_buffer, MAGICsize, buffer_text, "3.0.3.1");
    buffer_poke(ls_buffer, MAGICsize + 32, buffer_string, lang_get("version"));
    ls_buffer_start = MAGICsize + 96;
    show_debug_message("BUFFER ADDRESS = " + string(buffer_get_address(ls_buffer)));
    show_debug_message("END!");
};

saveTime = function(argument0 = global.SaveFileName)
{
    ini_open(argument0);
    ini_write_real("Game", "frames", global.SaveFrames);
    ini_write_real("Game", "seconds", global.SaveSeconds);
    ini_write_real("Game", "minutes", global.SaveMinutes);
    ini_close();
};

makeString = function(argument0, argument1, argument2)
{
    var s_str, m_str, dsec_str, len, s_real, hours, days, timer_string;
    
    s_str = "";
    m_str = "";
    dsec_str = string_format(argument2 / 60, 1, 3);
    dsec_str = string_delete(dsec_str, 1, 2);
    
    while (string_length(dsec_str) != 3)
    {
        len = string_length(dsec_str);
        
        if (len < 3)
            dsec_str += "0";
        else if (len > 3)
            dsec_str = string_delete(dsec_str, string_length(dsec_str), 1);
    }
    
    s_real = floor(argument1);
    argument0 = floor(argument0 + floor(s_real / 60));
    s_real = s_real % 60;
    
    if (s_real < 10)
        s_str = string("0{0}", s_real);
    else
        s_str = string(s_real);
    
    hours = floor(argument0 / 60);
    argument0 %= 60;
    
    if (argument0 < 10)
        m_str = string("0{0}", argument0);
    else
        m_str = string(argument0);
    
    days = floor(hours / 24);
    hours = hours % 24;
    
    if (hours < 10)
        hours = string("0{0}", hours);
    else
        hours = string(hours);
    
    timer_string = string("{0}:{1}:{2}.{3}", hours, m_str, s_str, dsec_str);
    
    if (days > 0)
        timer_string = string("{0}:{1}", days, timer_string);
    
    return timer_string;
};

addTime = function(argument0 = [], argument1 = [], argument2 = [], argument3 = [])
{
    var rs;
    
    rs = 0;
    
    while (array_length(argument3) > 0)
        rs += (array_pop(argument3) * 60 * 60);
    
    while (array_length(argument2) > 0)
        rs += (array_pop(argument2) * 60);
    
    while (array_length(argument1) > 0)
        rs += array_pop(argument1);
    
    while (array_length(argument0) > 0)
        rs += (array_pop(argument0) / 60);
    
    return rs;
};

livesplitInit();
