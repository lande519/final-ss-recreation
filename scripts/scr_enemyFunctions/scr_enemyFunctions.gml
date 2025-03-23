function scr_enemy_playerisnear(argument0 = 350, argument1 = 60, argument2 = argument0, argument3 = argument1, argument4 = obj_player1, argument5 = x, argument6 = y)
{
    var rect_x1, rect_y1, rect_x2, rect_y2;
    
    rect_x1 = argument5 - argument0;
    rect_y1 = argument6 - argument1;
    rect_x2 = argument5 + argument2;
    rect_y2 = argument6 + argument3;
    return point_in_rectangle(argument4.x, argument4.y, rect_x1, rect_y1, rect_x2, rect_y2);
}

function scr_enemy_grabUpdatePosition(argument0)
{
    var walk_bobbingy, walk_bobbingx, yoffsets, xoffsets, _yoff;
    
    if (global.freezeframe)
        exit;
    
    image_xscale = -argument0.xscale;
    
    if (baddieStunTimer < 200)
        baddieStunTimer = 200;
    
    argument0.baddieGrabbedID = id;
    
    with (obj_parent_player)
    {
        if (!global.freezeframe && state != States.frozen && state != States.grab && state != States.finishingblow && state != States.charge && state != States.superslam)
        {
            other.x = x;
            other.y = y;
            other.state = States.charge;
            other.image_index = 0;
        }
    }
    
    if (argument0.state == States.grab)
    {
        walk_bobbingy = 0;
        walk_bobbingx = 0;
        
        if (argument0.sprite_index == argument0.spr_haulingWalk)
        {
            yoffsets = [0, 2, 3, 9, 12, 0, -7, -6, -5, -3, 6, 5, 2];
            xoffsets = [-4, -4, -3, -3, -2, -7, -10, -9, -8, -6, -3, -3, -3];
            walk_bobbingy = yoffsets[floor(argument0.image_index)];
            walk_bobbingx = xoffsets[floor(argument0.image_index)] * argument0.image_xscale;
        }
        
        _yoff = -56 + walk_bobbingy;
        
        if (argument0.sprite_index == argument0.spr_haulingIntro)
        {
            yoffsets = [-13, -35, -60, -55, -56];
            _yoff = yoffsets[floor(argument0.image_index)];
        }
        
        if (argument0.sprite_index == argument0.spr_haulingLand)
        {
            yoffsets = [-31, -49, -53, -55];
            _yoff = yoffsets[floor(argument0.image_index)];
        }
        
        if (argument0.sprite_index == argument0.spr_haulingJump)
        {
            yoffsets = [-22, -41, -62, -58];
            _yoff = yoffsets[floor(argument0.image_index)];
        }
        
        if (argument0.sprite_index == argument0.spr_haulingFall)
        {
            yoffsets = [-58, -58, -58];
            _yoff = yoffsets[floor(argument0.image_index)];
        }
        
        y = argument0.y + _yoff;
        x = argument0.x + walk_bobbingx;
        image_xscale = -argument0.xscale;
    }
    
    if (argument0.state == States.charge)
    {
        x = argument0.x;
        
        switch (floor(argument0.image_index))
        {
            case 0:
            case 8:
                x += (argument0.xscale * 20);
                break;
            
            case 1:
            case 7:
                x += (argument0.xscale * 10);
                break;
            
            case 3:
            case 5:
                x += (argument0.xscale * -10);
                break;
            
            case 4:
                x += (argument0.xscale * -20);
                break;
        }
        
        y = argument0.y;
    }
    
    if (argument0.state == States.superslam)
    {
        if (argument0.sprite_index != argument0.spr_piledriverland)
        {
            x = argument0.x - (argument0.xscale * 10);
            y = argument0.y - 70;
        }
        else
        {
            x = argument0.x;
            y = argument0.y;
        }
    }
    
    if (argument0.state == States.finishingblow && state != States.climbwall)
    {
        x = argument0.x + (60 * argument0.xscale);
        y = argument0.y;
        scr_enemyFinishingBlowPos(argument0);
    }
}

function scr_enemyFinishingBlowPos(argument0)
{
    var _dist, try_x;
    
    if (place_meeting_collision(x, y))
    {
        _dist = abs(x - argument0.x);
        x = argument0.x;
        y = argument0.y;
        
        if (place_meeting_collision(x + argument0.xscale, y))
            exit;
        
        try_x = 0;
        
        while (!place_meeting_collision(x + argument0.xscale, y))
        {
            x += argument0.xscale;
            try_x++;
            
            if (try_x > _dist)
                break;
        }
        
        try_x = 0;
        
        while (place_meeting_collision(x, y))
        {
            x -= argument0.xscale;
            try_x++;
            
            if (try_x > _dist)
                break;
        }
    }
}

function scr_enemy_turn_trigger()
{
    turnTimer = turnTimerMax;
    
    if (!is_undefined(baddieSpriteTurn))
    {
        hsp = 0;
        image_index = 0;
        sprite_index = baddieSpriteTurn;
        state = States.normal;
    }
    else
    {
        image_xscale *= -1;
        hsp = 0;
        movespeed = 0;
    }
}

function scr_enemyDestroyableCheck(argument0 = xstart, argument1 = ystart)
{
    if (place_meeting(argument0, argument1, obj_bigdestructibles))
    {
        xstart = argument0;
        ystart = argument1;
        state = States.machtumble;
        return true;
    }
    
    return false;
}

function scr_scareenemy()
{
    var player_object, max_buf, min_buf;
    
    if (global.freezeframe)
        exit;
    
    player_object = get_nearestPlayer();
    
    if (!jumpedFromBlock && scr_enemy_playerisnear(400, 130, undefined, 90, player_object) && collision_line(x, y, player_object.x, player_object.y, obj_solid, false, true) == -4 && (player_object.state == States.mach3 || ((player_object.state == States.doughmount && object_index != obj_fancypancake) && abs(movespeed) >= 12) || player_object.state == States.doughmountspin || (player_object.movespeed >= 10 && player_object.state == States.minecart)))
    {
        if (state != States.run && state != States.climbwall && state != States.charge && state != States.stun)
        {
            state = States.run;
            sprite_index = baddieSpriteScared;
            
            if (chance(5))
                event_play_oneshot("event:/SFX/enemies/enemyrarescream", x, y);
            
            if (x != player_object.x)
                image_xscale = getFacingDirection(x, player_object.x);
            
            hsp = 0;
            
            if (vsp < 0)
                vsp = 0;
            
            if (grav != 0 && grounded)
                vsp = -3;
            
            image_index = 0;
        }
        
        max_buf = 80;
        min_buf = 50;
        baddieScareBuffer = 100;
    }
}

