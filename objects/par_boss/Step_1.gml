if setfordeath && !global.hitstunEnabled {
	camera_shake_add(3, 3);
	repeat(2) 
	{
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddieGibs);
	}
	setfordeath = false;	
}