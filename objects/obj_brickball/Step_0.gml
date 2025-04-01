hsp = image_xscale * movespeed;
if !kicked
{
	x = obj_player1.x + (xoffset * obj_player1.xscale);
	y = obj_player1.y;
	if (scr_solid(x, y))
		x = obj_player1.x;
}
if (scr_solid(x, y + 1) && bounce == 0)
{
	vsp = -5;
	bounce = true;
}
if (scr_solid(x + image_xscale, y) && kicked && !place_meeting(x + image_xscale, y, obj_destructibles) && !place_meeting(x + image_xscale, y, obj_slope))
	instance_destroy();
	
with (instance_place(x + image_xscale, y, obj_destructibles))
{
	if object_index != obj_oneway && object_index != obj_parent_clutterDestroyable
		instance_destroy();
	else if other.kicked
	{
		var x1 = other.x;
		var y1 = other.y;
		var _col = collision_line(x + (35 * image_xscale), y + (16 * image_yscale), x1, y1, obj_solid, false, true);
		if _col == noone
			instance_destroy();
		else
			instance_destroy(other);
	}
}
