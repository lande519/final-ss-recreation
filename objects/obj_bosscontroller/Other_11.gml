playhp--
var i = playhp
var _layer = floor(i / 6)
var _x = 160 - (1 - (i % 3)) * -50 + _layer * 4 + ((floor(i / 3)) % 2) * -20
var _y = 54 - (1 - (i % 3)) * 10 + _layer * 4 + ((floor(i / 3)) % 2) * 60
with (instance_create(_x, _y, obj_baddieDead))
{
    hsp = 10
    vsp = -10
    sprite_index = spr_pizzellehp
    image_xscale = 1
    depth = -900
}
