function face_obj(argument0)
{
    var dir;
    
    dir = sign(argument0.x - x);
    
    if (dir == 0)
        dir = 1;
    
    return dir;
}

function faceup_obj(argument0)
{
    var dir;
    
    dir = sign(argument0.y - y);
    
    if (dir == 0)
        dir = 1;
    
    return dir;
}
