if instance_exists(content)
	exit;
	
var _content, confecti_prompt_type, confecti_prompt, _string;

_content = instance_create(x + (sprite_width / 2), y + (sprite_height / 2), content);

if (object_get_parent(_content.object_index) == obj_parent_confecti)
{
    create_particle((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), spr_taunteffect).particle_depth(_content.depth + 1);
    event_play_oneshot("event:/SFX/general/collectfollower");
    helptimer = -1;
    global.ToppinTotal += 1;
    confecti_prompt_type = (global.ToppinTotal >= 5) ? "last_confecti_found" : "confecti_found";
    confecti_prompt = ((global.InternalLevelName == "tutorial") ? "prompt_tut_" : "prompt_") + confecti_prompt_type;
    _string = lang_get(confecti_prompt, [global.ToppinTotal]);
    scr_queueToolTipPrompt(_string);
    global.Collect += 1000;
    scr_queueTVAnimation(global.TvSprPlayer_Happy, 150);
    create_small_number((x - sprite_xoffset) + (sprite_width / 2), (y - sprite_yoffset) + (sprite_height / 2), 1000);
    global.ComboFreeze = 15;
    global.ComboTime = 60;
	other.state = States.normal
	other.hsp = 0
	other.vsp = 0
	other.movespeed = 0
	instance_create(x, y, obj_customeractor)
	obj_gnome_checklist.gnome_check[0] = 1;
	instance_destroy(obj_gnomecustomerblock)
}