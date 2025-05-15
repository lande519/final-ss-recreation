var list = ds_list_create();

collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, all, false, true, list, false);

for (var i = 0; i < ds_list_size(list); i++) {
    var inst = list[| i];
    if inst.id != id && inst.object_index != obj_slope && inst.object_index != obj_baddieDead && inst.object_index != obj_ladder && inst.object_index != obj_collectablebox && inst.object_index != obj_collect && inst.object_index != obj_bigcollect && inst.object_index != obj_platform && inst.object_index != obj_solid && inst.object_index != obj_player1 && inst.object_index != obj_hallway && inst.object_index != obj_uparrow && inst.object_index != obj_swordhitbox && inst.object_index != obj_slaphitbox && inst.object_index != obj_camera && inst.object_index != obj_hudManager && inst.object_index != obj_door{
        with inst
            instance_destroy();
    }
}

ds_list_destroy(list);
