if flashtime = 0{
	if other.state = 6{
		scr_flash()
		if instance_exists(obj_bosscontroller){
			with obj_bosscontroller
				event_user(0);
		}			
		with other{
			instance_destroy()
		}
	}
}