if other.state = 6 && !array_contains(hurtstates,state){
	flash = true
	if instance_exists(obj_bosscontroller){
		flash = true
		state = bossstates.vulnerable
		intensity = 120
		delay = 60
		sprite_index = hurt_spr
		vsp = -8
		hsp = -7 * xscale
	}			
	with other{
		instance_destroy()
	}
}