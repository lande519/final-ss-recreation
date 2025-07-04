image_index = 0;
image_speed = 0;
depth = 10;
hasInteracted = false;
rank = "none";
highscore = "0";
secrets = [false, false, false];
levelName = "";
secretcanspit = false;
activategate = true

gotoLevel = function(argument0)
{
    scr_gotoLevel(argument0);
    obj_camera.chargeCameraX = 0;
    
    with (obj_parent_player)
    {
        image_index = 0;
        
        if isDemo && global.InternalLevelName != "tutorial"
        {
            sprite_index = spr_enterpainting;
            event_play_oneshot("event:/SFX/general/enterpainting");
        }
        else
        {
            sprite_index = spr_entergate;
        }
        
        state = States.victory;
        targetDoor = "A";
        targetRoom = global.LevelFirstRoom;
        global.ComboLost = false;
        hubRoom = room;
        hubX = x;
        hubY = y;
    }
};

surf = -4;
easelSurf = -4;
fadewhite = 1;
details = [gate_createlayer(spr_tvHUD_player_PZ_secret, 0), gate_createlayer(spr_tvHUD_player_PZ_secret, 1)];
fade = 1
bubblescale = 1;

defineConfecti = function(argument0, argument1, argument2) constructor
{
    spr_idle = argument0;
    spr_run = argument1;
    spr_taunt = argument2;
};

confectiSprites = [new defineConfecti(spr_marshmellow_idle, spr_marshemellow_run, spr_marshmellow_taunt), new defineConfecti(spr_chocolate_idle, spr_chocolate_walk, spr_chocolate_taunt), new defineConfecti(spr_crack_idle, spr_crack_run, spr_crack_taunt), new defineConfecti(spr_gummyworm_idle, spr_gummyworm_walk, spr_gummyworm_taunt), new defineConfecti(spr_candy_idle, spr_candy_walk, spr_candy_taunt)];
isEasel = false;
savedPaintSprite = undefined;

saveSurfaceSprite = function()
{
    var sp;
    
    if (!surface_exists(surf))
        exit;
    
    sp = sprite_create_from_surface(surf, 0, 0, sprite_width, sprite_height, false, false, 0, 0);
    
    if (!is_undefined(savedPaintSprite) && sprite_exists(savedPaintSprite))
    {
        sprite_assign(savedPaintSprite, sp);
        sprite_delete(sp);
    }
    else
    {
        savedPaintSprite = sp;
    }
};

defineObject = function(argument0, argument1) constructor
{
    xstart = argument0;
    ystart = argument1;
    x = argument0;
    y = argument1;
    sprite_index = spr_null;
    image_index = 0;
    image_speed = 0.35;
    visible = false;
    vsp = 0;
    hsp = 0;
};

secretCanvas = [new defineObject(x, y - 128), new defineObject(x, y - 128), new defineObject(x, y - 128)];
gatePointDisplay = new defineObject(x, y - 265);

gatePointDisplay.pointText = [self]

with (gatePointDisplay)
{
    targetY = other.y - 265;
    landed = false;
}

gateRankBubble = new defineObject(x, y - 210);

gateRankBubble.bubbleScale = 0