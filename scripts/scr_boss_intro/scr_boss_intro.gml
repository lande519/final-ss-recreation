// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_intro(){
	if sprite_index != intro2_spr
		sprite_index = intro_spr
		
	with obj_player1{
		if sprite_index != spr_player_PZ_bossintro2 && sprite_index != spr_player_PZ_bossintro1{
			state = States.actor
			sprite_index = spr_player_PZ_bossintro1
			image_index = 0
			xscale = 1
			other.xscale = -1
			hsp = 0
			vsp = 0
			x = obj_parent_doortrigger.x
			y = obj_parent_doortrigger.y-16
			other.image_index = 0
			other.hsp = 0
			other.vsp = 0
		}
		if sprite_index = spr_player_PZ_bossintro1 && sprite_animation_end(){
			sprite_index = spr_player_PZ_bossintro2
			other.image_index = 0
			image_index = 0
			other.sprite_index = other.intro2_spr
		}
		if sprite_index = spr_player_PZ_bossintro2 && sprite_animation_end(){
			sprite_index = spr_player_PZ_idle
			state = States.normal
			other.state = bossstates.normal
		}
	}
}