// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_player_minesoldcutscene(){
	if sprite_animation_end() && sprite_index = spr_player_PZ_gotKey
	{
		global.TransfoPrompt = "prompt_fireass";
		state = States.normal
		hsp = 0
		vsp = 0
		movespeed = 0
	}
}