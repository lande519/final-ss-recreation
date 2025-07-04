global.GameLevelMap = ds_map_create();
global.InternalLevelName = "none";

function scr_defineTitleCard(argument0, argument1 = "event:/music/w1/entryway_titlecard", argument2 = -4, argument3 = -4) constructor
{
    image_index = argument0;
    music = argument1;
    x = argument2;
    y = argument3;
}

function scr_defineLevel(argument0, argument1, argument2, argument3, argument4 = [], argument5 = 20000, argument6 = -4, argument7 = false)
{
    ds_map_add(global.GameLevelMap, argument1, 
    {
        internalName: argument1,
        levelWorld: argument0,
        visualName: argument2,
        groupArr: argument4,
        firstRoom: argument3,
        sRankRequirement: argument5,
        titleCardInfo: argument6,
        isBoss: argument7
    });
}

scr_defineLevel(0, "demohub", "Demo 2 Hub", hub_hallway);
scr_defineLevel(0, "tutorial", "Tutorial", tutorial_1);
scr_defineLevel(0, "entryway", "Crunchy Construction", entryway_1, ["Entryway"], 16500, new scr_defineTitleCard(0, "event:/music/w1/entryway_titlecard", 37, 42));
scr_defineLevel(0, "steamy", "Cottontown", steamy_1, ["Cottontown"], 22500, new scr_defineTitleCard(1, "event:/music/w1/cottontown_titlecard", 37, 498));
scr_defineLevel(0, "mineshaft", "Sugarshack Mines", mineshaft_1, ["Mines"], 21500, new scr_defineTitleCard(3, "event:/music/w1/mines_titlecard", 37, 498));
scr_defineLevel(0, "gumbob", "Boss 1", boss_gumbob);
scr_defineLevel(1, "molasses", "Molasses Swamp", molasses_1, ["Molasses", "geyserwaves"], 19000, new scr_defineTitleCard(2, "event:/music/w2/molasses_titlecard", 37, 498));
scr_defineLevel(1, "fudge", "Mt. Fudgetop", mountain_intro, ["Fudgetop"], 1900,  new scr_defineTitleCard(4, "event:/music/w2/molasses_titlecard", 37, 498));
scr_defineLevel(1, "cafe", "Chocoa Cafe", cafe_1, ["Cafe"], 1900, new scr_defineTitleCard(5, "event:/music/w2/molasses_titlecard", 37, 498));
scr_defineLevel(1, "coneboy", "Boss 2", boss_coneboy);
scr_defineLevel(2, "dance", "Dance Off", dance_1, ["Dance"], 1900, new scr_defineTitleCard(8, "event:/music/w2/molasses_titlecard", 37, 498));
scr_defineLevel(2, "bee", "Sting Operation", bee_1, ["Bee"], 1900, new scr_defineTitleCard(7, "event:/music/w2/molasses_titlecard", 37, 498));
scr_defineLevel(2, "casino", "Coneboy Casino", casino_intro, ["Casino"]);
scr_defineLevel(2, "pizzano", "Pizzano", boss_pizzano);
scr_defineLevel(3, "sucrose", "Sucrose Snowstorm", sucrose_start, ["Sucrose"], 1900, new scr_defineTitleCard(6, "event:/music/w2/molasses_titlecard", 37, 498));
scr_defineLevel(3, "licorice", "Licorice Castle", licorice_intro, ["Licorice"]);
scr_defineLevel(3, "sour", "Souractive", sour_1, ["Sour"]);
scr_defineLevel(3, "coneball", "Coneball", boss_coneball);
scr_defineLevel(-1, "oldmines", "Old Mines", mines_1);

function scr_gotoLevel(argument0)
{
    var level_info, first_room;
    
    level_info = ds_map_find_value(global.GameLevelMap, argument0);
    first_room = level_info.firstRoom;
    global.texturesToLoad = array_concat(global.texturesToLoad, level_info.groupArr);
    global.InternalLevelName = level_info.internalName;
    global.LevelFirstRoom = first_room;
    global.srank = level_info.sRankRequirement;
    global.arank = global.srank / 2;
    global.brank = global.arank / 2;
    global.crank = global.brank / 2;
}

function scr_defineLevelMenuTune(argument0)
{
    var note_array;
    
    note_array = [];
    
    switch (argument0)
    {
        default:
            note_array = [MusicNote.CS6, MusicNote.GS6, MusicNote.CS7, MusicNote.CS6, MusicNote.GS6, MusicNote.CS7, MusicNote.CS6, MusicNote.GS6, MusicNote.CS6, MusicNote.GS6, MusicNote.CS7, MusicNote.CS6, MusicNote.GS6, MusicNote.CS7, MusicNote.CS6, MusicNote.GS6, MusicNote.C6, MusicNote.G6, MusicNote.C7, MusicNote.C6, MusicNote.G6, MusicNote.C7, MusicNote.C6, MusicNote.G6, MusicNote.C6, MusicNote.G6, MusicNote.C7, MusicNote.C6, MusicNote.C7, MusicNote.G6, MusicNote.C6, MusicNote.G6];
            break;
        
        case "tutorial":
            note_array = [MusicNote.D5, MusicNote.DS5, MusicNote.E5, MusicNote.C6, MusicNote.E5, MusicNote.C6, MusicNote.E5, MusicNote.C6, MusicNote.C6, MusicNote.D6, MusicNote.DS6, MusicNote.E6, MusicNote.C6, MusicNote.D6, MusicNote.E6, MusicNote.B5, MusicNote.D6, MusicNote.C6, MusicNote.D5, MusicNote.DS5, MusicNote.E5, MusicNote.C6, MusicNote.E5, MusicNote.C6, MusicNote.E5, MusicNote.C6, MusicNote.A5, MusicNote.G5, MusicNote.FS5, MusicNote.A5, MusicNote.C6, MusicNote.E6, MusicNote.D6, MusicNote.C6, MusicNote.A5, MusicNote.D6];
            break;
        
        case "entryway":
            note_array = [MusicNote.FS5, MusicNote.A5, MusicNote.B5, MusicNote.CS6, MusicNote.B5, MusicNote.A5, MusicNote.FS5, MusicNote.D5, MusicNote.A5, MusicNote.B5, MusicNote.CS6, MusicNote.B5, MusicNote.E6, MusicNote.CS6, MusicNote.FS5, MusicNote.A5, MusicNote.B5, MusicNote.CS6, MusicNote.E6, MusicNote.A6, MusicNote.B6, MusicNote.B6, MusicNote.A6, MusicNote.B6, MusicNote.CS7, MusicNote.D7, MusicNote.CS7, MusicNote.FS6];
            break;
        
        case "steamy":
            note_array = [MusicNote.D6, MusicNote.F6, MusicNote.A6, MusicNote.AS6, MusicNote.GS6, MusicNote.A6, MusicNote.GS6, MusicNote.F6, MusicNote.D6, MusicNote.C6, MusicNote.F6, MusicNote.A6, MusicNote.AS6, MusicNote.GS6, MusicNote.A6, MusicNote.F7, MusicNote.E7, MusicNote.D7, MusicNote.AS5, MusicNote.D6, MusicNote.F6, MusicNote.A6, MusicNote.F6, MusicNote.GS6, MusicNote.G6, MusicNote.F6, MusicNote.AS5, MusicNote.A5, MusicNote.CS6, MusicNote.E6, MusicNote.G6, MusicNote.E6, MusicNote.A6, MusicNote.G6, MusicNote.F6, MusicNote.D6];
            break;
        
        case "mineshaft":
            note_array = [MusicNote.C6, MusicNote.D6, MusicNote.DS6, MusicNote.D6, MusicNote.B5, MusicNote.GS5, MusicNote.G5, MusicNote.F5, MusicNote.DS5, MusicNote.F5, MusicNote.GS5, MusicNote.C6, MusicNote.DS6, MusicNote.GS6, MusicNote.G6, MusicNote.F6, MusicNote.DS6, MusicNote.D6, MusicNote.DS6, MusicNote.D6, MusicNote.C6, MusicNote.DS6, MusicNote.D6, MusicNote.C6, MusicNote.DS6, MusicNote.D6, MusicNote.G5, MusicNote.DS6, MusicNote.D6, MusicNote.B5, MusicNote.G5, MusicNote.GS5, MusicNote.G5, MusicNote.F5, MusicNote.G5, MusicNote.GS5, MusicNote.DS5, MusicNote.C5, MusicNote.GS5, MusicNote.DS5, MusicNote.C5, MusicNote.GS5, MusicNote.DS5, MusicNote.GS5, MusicNote.GS5, MusicNote.DS6, MusicNote.D6, MusicNote.G6];
            break;
        
        case "molasses":
            note_array = [MusicNote.CS5, MusicNote.CS6, MusicNote.B5, MusicNote.GS5, MusicNote.FS5, MusicNote.E5, MusicNote.E5, MusicNote.E5, MusicNote.FS5, MusicNote.E5, MusicNote.GS5, MusicNote.FS5, MusicNote.CS5, MusicNote.CS5, MusicNote.E5, MusicNote.E5, MusicNote.FS5, MusicNote.CS5, MusicNote.GS5, MusicNote.B5, MusicNote.CS6, MusicNote.CS6, MusicNote.GS5, MusicNote.FS5, MusicNote.GS5, MusicNote.FS5, MusicNote.E5, MusicNote.FS5, MusicNote.GS5, MusicNote.CS5, MusicNote.CS5, MusicNote.E5, MusicNote.E5, MusicNote.GS5, MusicNote.CS6, MusicNote.B5, MusicNote.CS6, MusicNote.E6];
            break;
    }
    
    return note_array;
}

global.MenuNoteArray = scr_defineLevelMenuTune("none");
global.MenuNoteArraySelect = 0;