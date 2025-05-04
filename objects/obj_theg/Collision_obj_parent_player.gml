if other.key_up2 && other.grounded && state = thegstates.idle && global.money >= amountneeded{
	other.state = States.actor
	other.hsp = 0
	other.vsp = 0
	other.movespeed = 0
	other.sprite_index = spr_player_PZ_idle
	state = thegstates.cutscenesetup
	image_index = 0;
	sprite_index = spr_theg_grab;	
	global.money -= amountneeded
	
	ini_open(global.SaveFileName)
	ini_write_real("Game","money",global.money)
	if room = hub_w1
		ini_write_real("Game","w1G", 1)
	if room = hub_w2
		ini_write_real("Game","w2G", 1)
	if room = hub_w3
		ini_write_real("Game","w3G", 1)
	if room = hub_w4
		ini_write_real("Game","w4G", 1)
	ini_close()	
	
	with obj_forsale
		image_alpha = 0
}