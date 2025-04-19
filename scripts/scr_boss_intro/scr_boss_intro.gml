// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_intro(){
	with obj_player1{
		if sprite_index != spr_player_PZ_bossintro2 && sprite_index != spr_player_PZ_bossintro1{
			state = States.actor
			sprite_index = spr_player_PZ_bossintro1
			image_index = 0
			xscale = 1
			other.xscale = -1
			hsp = 0
			vsp = 0
			other.image_index = 0
			other.hsp = 0
			other.vsp = 0
		}
		if sprite_index = spr_player_PZ_bossintro1 && sprite_animation_end(){
			sprite_index = spr_player_PZ_bossintro2
			other.image_index = 0
			image_index = 0
			other.sprite_index = spr_player_PA_bossintro2
		}
		if sprite_index = spr_player_PZ_bossintro2 && sprite_animation_end(){
			sprite_index = spr_player_PZ_idle
			state = States.normal
			other.state = bossstates.normal
		}
	}
}