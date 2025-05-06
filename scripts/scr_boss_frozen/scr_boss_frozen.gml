// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_frozen(){
		state =	bossstates.hurt;
		sprite_index = spr_painter_hurt;
		image_index = 0;
		image_speed = 1;
		hsp = 20;
		movespeed = 20;
		repeat(2) 
		{
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_baddieGibs);
		}
		with obj_bosscontroller
			event_user(0)
		setfordeath = 0
}
