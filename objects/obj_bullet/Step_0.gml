x += lengthdir_x(pnt_dist, target_dir);
y += lengthdir_y(pnt_dist, target_dir);

//x += 17 * image_xscale

var thing = instance_place(x,y,all)

if thing != noone && thing.object_index != obj_slope && thing.object_index != obj_collectablebox && thing.object_index != obj_collect && thing.object_index != obj_bigcollect && thing.object_index != obj_platform && thing.object_index != obj_solid && thing.object_index != obj_player1 && thing.object_index != obj_hallway && thing.object_index != obj_uparrow && thing.object_index != obj_swordhitbox && thing.object_index != obj_slaphitbox && thing.object_index != obj_camera && thing.object_index != obj_hudManager && thing.object_index != obj_door && thing.object_index != id{
	with thing
		instance_destroy()
}
