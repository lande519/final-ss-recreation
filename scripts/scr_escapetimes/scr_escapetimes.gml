function scr_escapetimes(argument0 = room)
{
    var seconds, minutes, time_array;
    
    seconds = 0;
    minutes = 0;
    
    switch (argument0)
    {
        case steamy_12:
            minutes = 3;
            seconds = 30;
            break;
        
        case entryway_11:
            minutes = 3;
            seconds = 0;
            break;
        
        case molasses_10:
            minutes = 4;
            seconds = 0;
            break;
        
        case mineshaft_12:
            minutes = 3;
            seconds = 30;
            break;
        
        case mountain_11:
            minutes = 5;
            seconds = 0;
            break;
        
        case entryway_1:
            minutes = 5;
            seconds = 0;
            break;
        
        case cafe_10:
            minutes = 4;
            seconds = 30;
            break;
        
        default:
            minutes = 3;
            seconds = 0;
            break;
    }
    
    time_array[0] = minutes;
    time_array[1] = seconds;
    return time_array;
}
