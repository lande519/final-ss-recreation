bosshp--
var i = bosshp
var _layer = floor(i / 8)
var _x = 775 + (1 - (i % 4)) * 50 + _layer * -4 + ((floor(i / 4)) % 2) * 20
var _y = 54 + (1 - (i % 4)) * 10 + ((floor(i / 4)) % 2) * 60 + _layer * -4
with (instance_create(_x, _y, obj_baddieDead))
{
    hsp = -10
    vsp = -10
    sprite_index = other.bosshpspr
    image_xscale = 1
    depth = -900
    spr_palette = 727
    paletteselect = 2 - _layer
}

if bosshp = 0 && state != bossstates.phasetrans && state != bossstates.phasetranssetup
	par_boss.state = bossstates.phasetranssetup
