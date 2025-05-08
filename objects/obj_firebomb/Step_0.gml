scr_collision()

if grounded{
	with instance_create(x,y,obj_crushertrail)
		xscale = image_xscale
	instance_destroy()	
}
