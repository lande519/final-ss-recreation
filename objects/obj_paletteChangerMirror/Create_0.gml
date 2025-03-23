var locked_palettes, i, palette_array, z, locked_key;

depth = 4;
alpha = 0;
savedIndex = global.PlayerPaletteIndex;
lockedPalettes = [];
ini_open("optionData.ini");
ini_write_real("Palettes", "palette_PZ_exhibition", true);
locked_palettes = array_filter(scr_get_palettes(false), function(argument0, argument1)
{
    return !ini_read_real("Palettes", argument0.taskKey, false);
});
ini_close();
script_UpArrow = -4;

for (i = 0; i < array_length(locked_palettes); i++)
{
    palette_array = global.CharacterPalette[global.playerCharacter].palettes;
    
    for (z = 0; z < array_length(palette_array); z++)
    {
        locked_key = locked_palettes[i].taskKey;
        
        if (palette_array[z].palName == locked_key)
            array_push(lockedPalettes, z);
    }
}
