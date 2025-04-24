// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_player_guscutscene(){
	image_speed = 0.35
	if !place_meeting(x+50,y,obj_gustavo){
		hsp = 5
		sprite_index = spr_player_PZ_walk
	}
	else{
		hsp = 0
		with obj_gustavo{
			if sprite_index = spr_gustavo_idle{
				sprite_index = spr_gustavo_makepizza
				image_index = 0	
			}
			if sprite_index = spr_gustavo_makepizza && sprite_animation_end(){
				sprite_index = spr_gustavo_showpizza
				image_index = 0
			}
			if sprite_index = spr_gustavo_showpizza && sprite_animation_end(){
				sprite_index = spr_gustavo_givepizza
				image_index = 0
				other.sprite_index = spr_player_gnomepizza
				other.image_index = 0
			}
			if sprite_index = spr_gustavo_givepizza && sprite_animation_end(){
				sprite_index = spr_gustavo_point
				image_index = 0
			}
		}
		if sprite_index != spr_player_gnomepizza
			sprite_index = spr_player_PZ_idle
			
		
		if sprite_index = spr_player_gnomepizza && sprite_animation_end(){
			state = States.normal
	        global.showgnomelist = 1;
	        global.pizzadelivery = 1;
	        if (!instance_exists(obj_gnome_checklist))
	            instance_create(0, 0, obj_gnome_checklist);			
		}		
	}
}