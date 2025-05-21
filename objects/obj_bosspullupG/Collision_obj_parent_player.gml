with instance_create(x,y,obj_bossgumbob){
	xscale = -xscale
	movespeed = 12
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddieGibs);
	instance_create(x, y, obj_bangEffect);
	with instance_create(x, y, obj_bangEffect)
		sprite_index = spr_enemypuncheffect;
	sprite_index = hurt_spr
	flash = true
	vsp = -3
	state = bossstates.hurt
	stunned = 120
	invtime = 20
	setfordeath = true;
	camera_shake_add(3, 3)
}

instance_destroy()
with other{
	state = States.finishingblow
	image_index = 0
	sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4);	
}
obj_bossconeball.x = -888
obj_bossconeball.y = -888
obj_bossconeball.state = bossstates.nothing