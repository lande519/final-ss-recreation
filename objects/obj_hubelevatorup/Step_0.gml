var target_x, target_y;

showDoorLight = false;

if (escapeBlockedDoor && global.panic)
{
    sprite_index = spriteDoorEscape;
    exit;
}

sprite_index = spriteDoorLocked;

if alreadyopened = 1 && sprite_index != spr_hub_elevatorup{
	sprite_index = spr_hub_elevatorup
}

with (obj_parent_player)
{
    if (place_meeting(x, y, other.id) && !instance_exists(obj_fadeoutTransition) && key_up && grounded && (state == States.normal || state == States.Sjumpprep || state == States.mach2 || state == States.mach3) && state != States.door && state != States.victory && state != States.comingoutdoor)
    {   
		if other.alreadyopened = 1 or instance_exists(obj_bigkey){
	        image_index = 0;
	        state = States.door;
	        targetDoor = other.targetDoor;
	        targetRoom = other.targetRoom;
	        obj_camera.chargeCameraX = 0;
		}
        
        if instance_exists(obj_bigkey) && other.alreadyopened = false
        {
            target_x = (x - sprite_xoffset) + (sprite_width / 2);
            target_y = (y - sprite_yoffset) + (sprite_height / 2);
            
            instance_create((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), obj_lock, 
            {
                sprite_index: other.spriteDoorLock
            });
            state = States.victory;
            event_play_oneshot("event:/SFX/general/cheers", x, y);
            event_play_oneshot("event:/SFX/general/keyunlock", x, y);
            fmod_studio_event_instance_start(obj_parent_player.voiceCollect);
            
            with (other)
            {
				ini_open(global.SaveFileName)
				ini_write_real("Game","w1dooropened",1)
				ini_close()
                sprite_index = spriteDoorUnlocked;
                image_index = 0;
                image_speed = 0.35;
            }
        }
    }
}

