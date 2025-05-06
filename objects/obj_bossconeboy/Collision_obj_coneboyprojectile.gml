if sprite_index != spr_coneboy_kickhead{
	flash = true
	state = bossstates.vulnerable
	sprite_index = hurt_spr
	vsp = -8
	intensity = 120
	delay = 60	
	hsp = -7 * xscale
	instance_destroy(other)
}