// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_player_licoricespin(){
	var licorice_id = instance_place(x,y,obj_licoricespin)
        x = licorice_id.x;
		grav = 0
		if key_up
			vsp = approach(vsp, -8, 0.3)
		if key_down
			vsp = approach(vsp, 8, 0.3)	
		if !key_down && !key_up
			vsp = approach(vsp, 0, 0.8)	
			
		hsp = 0
        sprite_index = spr_player_PZ_freeFallSpin
        switch (floor(licorice_id.image_index))
        {
			case 18:
			case 0:
                x += (licorice_id.image_xscale * 20);
                break;			
			case 17:	
			case 1:
                x += (licorice_id.image_xscale * 25);
                break;	
			case 16:	
			case 2:
                x += (licorice_id.image_xscale * 30);
                break;
			case 15:	
			case 3:
                x += (licorice_id.image_xscale * 40);
                break;
			case 14:
			case 4:
                x += (licorice_id.image_xscale * 50);
                break;
			case 13:
			case 5:
                x += (licorice_id.image_xscale * 60);
                break;
			
			case 12:
			case 6:
                x += (licorice_id.image_xscale * 70);
                break;
			
			case 11:
			case 7:
                x += (licorice_id.image_xscale * 80);
                break;
			
			case 10:
			case 8:
                x += (licorice_id.image_xscale * 90);
                break;
			
			case 9:
                x += (licorice_id.image_xscale * 100);
                break;
				
        }
		
		if licorice_id.image_index >= 9{
			licorice_id.depth = obj_player1.depth + 1	
		}
		else{
				licorice_id.depth = -5	
		}
		move = key_left + key_right;
		
		if inputBufferJump > 0{
			licorice_id.depth = -5
			inputBufferJump = 0
			if move != 0
				xscale = move
			hsp = 7 * xscale
            sprite_index = spr_wallJumpCancelIntro;
            image_index = 0;
            movespeed = 12;
            hsp = movespeed * xscale;
            vsp = -5;
            state = States.mach3;
			global.targetCamX = obj_parent_player.x;
			global.targetCamY = obj_parent_player.y - 32;				
            fmod_studio_event_instance_start(sndMachStart);
            fmod_studio_event_instance_start(sndWallkickCancel);
		}
}