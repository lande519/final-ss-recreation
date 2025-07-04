var i, bg_asset, _oldSel, _diff, _arr, old_mouseX, old_mouseY, _stepsDynamic, _scrollMove, _color, _grid_x, _grid_y, z, _xx, _yy;


if (!loaded)
    exit;

if (!blockedInputs)
{
    scr_getinput_menu();
    
    if (keyboard_check_pressed(vk_f1))
        scr_resetinput();
}

flashbuffer = min(flashbuffer - 1, 0);

if (!flashbuffer)
{
    flashshake[0] = 0;
    flashshake[1] = 0;
    flashshake[2] = 0;
}

if (image_index >= (image_number - 1))
{
    image_speed = 0;
    abletomove = true;
    movePizzy = true;
    hudAlpha = min(hudAlpha + 0.08, 1);
}
else if (any_input_pressed_check())
{
    if (image_speed != 1)
    {
        event_play_oneshot("event:/SFX/fileselect/curtain");
        image_speed = 1;
    }
}


	for (i = 0; i < array_length(fileSelectHeightRatio); i++)
	{
	    if (selectedFile == i && abletomove)
	        fileSelectHeightRatio[i] = lerp(fileSelectHeightRatio[i], 1, 0.1);
	    else
	        fileSelectHeightRatio[i] = lerp(fileSelectHeightRatio[i], 0, 0.1);
	}

	lightsOn = image_index == 4 || image_index > 6;
	bg_asset = layer_sprite_get_id(layer_get_id("Assets_1"), "graphic_5C74AFEA");
	layer_sprite_index(bg_asset, lightsOn);
	painterIndex += 0.35;

	/*
	if (movePizzy)
	{
	    pizzyX = round(lerp(pizzyX, 636, 0.2));
	    pizzyY = round(lerp(pizzyY, 137, 0.3));
	}
	*/

	if (flashbuffer > 0)
	    flashbuffer--;

	if (array_contains(saves_idle, saves_sprite))
	{
	    if (saves_visual == 0 && selectedFile == 2)
	    {
	        saves_visual = 2;
	        saves_sprite = saves_left[0];
	    }
	    else if (saves_visual == 2 && selectedFile == 0)
	    {
	        saves_visual = 0;
	        saves_sprite = saves_right[2];
	    }
	    else if (saves_visual != selectedFile)
	    {
	        _oldSel = saves_visual;
	        saves_visual = approach(saves_visual, selectedFile, 1);
	        _diff = saves_visual - _oldSel;
	        _arr = (_diff == -1) ? saves_left : saves_right;
	        saves_sprite = _arr[_oldSel];
	        saves_index = 0;
	    }
	}

	if (array_contains(saves_left, saves_sprite) || array_contains(saves_right, saves_sprite))
	{
	    saves_index += 0.35;
    
	    if (sprite_animation_end(saves_sprite, saves_index))
	    {
	        saves_index = 0;
        
	        switch (saves_sprite)
	        {
	            case spr_titlePizzelle_exhib2l:
	            case spr_titlePizzelle_exhib3r:
	                saves_sprite = spr_titlePizzelle1;
	                break;
            
	            case spr_titlePizzelle_exhib1r:
	            case spr_titlePizzelle_exhib3l:
	                saves_sprite = spr_titlePizzelle2;
	                break;
            
	            case spr_titlePizzelle_exhib1l:
	            case spr_titlePizzelle_exhib2r:
	                saves_sprite = spr_titlePizzelle3;
	                break;
	        }
	    }
	}

	if (abletomove && !blockedInputs && !activated && files = true)
	{
	    if (!instance_exists(obj_option) && !instance_exists(obj_fileDeleter) && !instance_exists(obj_exitGame))
	    {
	        selectedFile += (key_down2 + -key_up2);
        
	        if (selectedFile < 0)
	            selectedFile = 2;
	        else if (selectedFile > 2)
	            selectedFile = 0;
        
	        if (key_up2 || key_down2)
	            event_play_oneshot("event:/SFX/general/paperballhit");
        
	        if (filePercentage[selectedFile] <= 0)
	        {
	            if (!event_instance_isplaying(sndEmpty))
	                fmod_studio_event_instance_start(sndEmpty);
	        }
	        else
	        {
	            fmod_studio_event_instance_stop(sndEmpty, true);
	        }
        
	        if (key_jump)
	        {
	            with (obj_music)
	            {
	                if (!is_undefined(global.RoomMusic))
	                {
	                    fmod_studio_event_instance_stop(global.RoomMusic.musicInst, true);
	                    fmod_studio_event_instance_stop(global.RoomMusic.secretMusicInst, true);
	                }
	            }
            
	            if (event_instance_isplaying(sndEmpty))
	                fmod_studio_event_instance_stop(sndEmpty, true);
            
	            event_play_oneshot("event:/SFX/general/collectbig");
	            event_play_oneshot("event:/SFX/fileselect/fileselect");
	            blockedInputs = true;
	            alarm[2] = 250;
	            activated = true;
	            saves_sprite = saves_idle[selectedFile];
	            fileSelectHeightRatio[selectedFile] = 1;
	            ds_queue_clear(saves_queue);
	        }
	        else if (key_start2)
	        {
	            blockedInputs = true;
	            instance_create(0, 0, obj_option);
	            exit;
	        }
	        else if (key_slap2)
	        {
	            blockedInputs = true;
	            instance_create(0, 0, obj_exitGame);
	            exit;
	        }
	        else if (key_taunt2 && filePresent[selectedFile])
	        {
	            blockedInputs = true;
	            instance_create(0, 0, obj_fileDeleter, 
	            {
	                selectedFile: selectedFile
	            });
	            exit;
	        }
	    }
    
	    old_mouseX = mouseX;
	    old_mouseY = mouseY;
	    mouseX = device_mouse_x_to_gui(0);
	    mouseY = device_mouse_y_to_gui(0);
	    _stepsDynamic = point_distance(old_mouseX, old_mouseY, mouseX, mouseY);
    
	    if (_stepsDynamic < 1)
	        _stepsDynamic = 1;
    
	    _stepsDynamic = round(_stepsDynamic);
	    _scrollMove = mouse_wheel_up() - mouse_wheel_down();
	    lineWidth += _scrollMove;
	    lineWidth = round(clamp(lineWidth, 1, 20));
	}
	
	if -key_left2
		files = false
	
if files = false{
	if abletomove && !blockedInputs && !activated{
		selectedoption += (key_right2 + key_left2);	
		selectedoption = clamp(selectedoption, 0, 2);
		
		if selectedoption = 2{
			files = true
			selectedoption = 1
		}
	
		if (key_right2 || -key_left2)
			event_play_oneshot("event:/SFX/general/paperballhit");
		
		
		if (key_jump)
		{
			with (obj_music)
			{
				if (!is_undefined(global.RoomMusic))
				{
					fmod_studio_event_instance_stop(global.RoomMusic.musicInst, true);
					fmod_studio_event_instance_stop(global.RoomMusic.secretMusicInst, true);
				}
			}
            
		if (event_instance_isplaying(sndEmpty))
			fmod_studio_event_instance_stop(sndEmpty, true);
            
		event_play_oneshot("event:/SFX/general/collectbig");
		event_play_oneshot("event:/SFX/fileselect/fileselect");
		blockedInputs = true;
		alarm[4] = 250;
		activated = true;
		saves_sprite = saves_idle[selectedFile];
		fileSelectHeightRatio[selectedFile] = 1;
		ds_queue_clear(saves_queue);
		}
	}
}