// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fmod_start_music(music){
	global.RoomMusic.musicInst = fmod_createEventInstance(music);
	fmod_studio_event_instance_start(global.RoomMusic.musicInst);
	fmod_studio_event_instance_set_paused(global.RoomMusic.musicInst, false);
	fmod_studio_event_instance_set_parameter_by_name(global.RoomMusic.musicInst, "state", 0, false);	
}