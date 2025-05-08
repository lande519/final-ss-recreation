// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fmod_start_music(music){
	var fuckingfmodforsomereasonmakesmedothiswhy = fmod_createEventInstance(music);
	fmod_studio_event_instance_start(fuckingfmodforsomereasonmakesmedothiswhy);
	fmod_studio_event_instance_set_paused(fuckingfmodforsomereasonmakesmedothiswhy, false);
	fmod_studio_event_instance_set_parameter_by_name(fuckingfmodforsomereasonmakesmedothiswhy, "state", 0, false);	
}