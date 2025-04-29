var targ = obj_parent_player
if around
	targ = instance_nearest(x, y, obj_icescreamer)
var dir = point_direction(x, y, targ.x, targ.y)
x = approach(x, targ.x, lengthdir_x(10, dir))
y = approach(y, targ.y, lengthdir_y(10, dir))