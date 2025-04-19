// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_peppino_lunge(){
	sprite_index = spr_player_lunge
	image_speed = 0.35
	hsp = approach(hsp, 12* xscale, 0.4)
	
	xscale = -getFacingDirection(get_nearestPlayer().x, x)
	
	if scr_solid(x+xscale, y) or sprite_animation_end()
	{
		state = bossstates.vulnerable
		instance_create(x,y,obj_poofeffect)	
	}
}

function scr_peppino_breakdancestart(){
	sprite_index = spr_player_breakdance;
	image_speed = 0.35
	hsp = approach(hsp, 2*xscale, 0.4);
	
	if image_index >= 11 and sprite_index == spr_player_breakdance {
		state = peppinostates.breakdance
		xscale = -getFacingDirection(get_nearestPlayer().x, x)
		sprite_index = spr_player_buttattackstart;
		vsp = -7;
		movespeed = 15;
	}
	
	if scr_solid(x+xscale, y) {
		xscale *= -1
	}
}

function scr_peppino_breakdance(){
	hsp = movespeed*xscale
	if grounded {
		movespeed = approach(movespeed, 0, 0.2);
		sprite_index = spr_player_buttattackend;
		if hsp <= 0 {
			state = bossstates.vulnerable
			instance_create(x,y,obj_poofeffect)	
		}
	}
	
	if scr_solid(x+xscale, y) {
		xscale *= -1
	}
	
	if (sprite_animation_end()) and (sprite_index == spr_player_buttattackstart) {
		sprite_index = spr_player_buttattack
	}
}