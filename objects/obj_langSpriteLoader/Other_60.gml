var sID, sDict, s, sp, spT, xoff, yoff;

sID = ds_map_find_value(async_load, "id");
sDict = ds_map_find_value(global.langSpritesAsync, sID);
trace(string("Async Image Load :: {0} for {1}", sID, sDict));
ds_map_delete(global.langSpritesAsync, sID);

if (is_undefined(sDict))
    exit;

s = asset_get_index(sDict);
sp = sprite_get_speed(s);
spT = sprite_get_speed_type(s);
xoff = sprite_get_xoffset(s);
yoff = sprite_get_yoffset(s);
sprite_set_offset(sID, xoff, yoff);
sprite_set_speed(sID, sp, spT);
ds_map_set(global.langSprites, s, sID);
trace(string("Set localized sprite for {0}, ID: {1}, Offset: ({2}, {3})", sDict, sID, xoff, yoff));
lang_sprite_check_persistence(s, sID);
