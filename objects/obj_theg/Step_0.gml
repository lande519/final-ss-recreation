var p = obj_player1
scr_collision()

switch state{
	
	case thegstates.cutscenesetup:
		if image_index > 15{
			p.hsp = 10 * p.xscale * -1;
			p.sprite_index = spr_player_PZ_bumped;
			state = thegstates.cutscene;
		}
	break;	
	
	case thegstates.cutscene:
		if p.hsp != 0{
			if p.hsp > 0
				p.hsp --
			if p.hsp < 0
				p.hsp ++
		}
		else{
			p.sprite_index = spr_player_PZ_idle
			if sprite_animation_end() && sprite_index = spr_theg_grab{
				state = thegstates.run
			}
		}
	break;
	
	case thegstates.run:
		hsp = 10 * image_xscale
		sprite_index = spr_theg_idle
	break;	
	
}