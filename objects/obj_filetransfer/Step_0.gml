if instance_exists(obj_fadeoutTransition)
	exit;

selected += (obj_player1.key_right2 + obj_player1.key_left2);	
selected = clamp(selected, 0, 1);
	
if selected = 2{
	files = true
	selected = 1
}

if obj_player1.key_jump2{
	if selected = 0
		file_copy("saveData1_EN.ini", "saveData1_FR.ini");
	obj_player1.targetRoom = rm_startupLogo	
	stop_music()
	filetransfershown = 1
	ini_open("optionData.ini");
	ini_write_string("filetransfer","filetransfershown",filetransfershown)
	ini_close()
	instance_create(x,y,obj_fadeoutTransition)
}

if (obj_player1.key_right2 || -obj_player1.key_left2)
	event_play_oneshot("event:/SFX/general/paperballhit");