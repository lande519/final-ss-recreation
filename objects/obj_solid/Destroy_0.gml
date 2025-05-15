var i;

event_play_multiple("event:/SFX/general/explosion", (x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2));

for (i = 0; i < array_length(tiles); i++)
    scr_destroy_tile(tiles[i]);

scr_destroy_nearby_tiles();
