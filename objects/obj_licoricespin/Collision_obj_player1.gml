if touched = false or obj_player1.state != States.licoricespin && obj_player1.state != States.mach3{
	other.sprite_index = spr_player_PZ_freeFallSpin
	other.vsp = 0
	other.state = States.licoricespin
	touched = true
}