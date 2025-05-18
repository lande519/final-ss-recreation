event_inherited()
baddieSpriteIdle = undefined
baddieSpriteWalk = spr_betonbacon
baddieSpriteStun = spr_betonbacon_stun
baddieSpriteScared = spr_betonbacon_scared
baddieSpriteTurn = undefined
baddieSpriteHit = undefined
baddieSpriteDead = spr_betonbacon_dead
enemyAttackTimerMax = 200
defaultMovespeed = 1.5
enemyAttack_TriggerEvent = function()
{
	if (enemyAttackTimer <= 0 && scr_enemy_playerisnear(200, 20) && grounded && state == (0 << 0) && sprite_index != spr_betonbacon_attack)
	{
		enemyAttackTimer = enemyAttackTimerMax;
	    state = (2 << 0)
		sprite_index = spr_betonbacon_attack;
		
		if (x != obj_parent_player.x)
			image_xscale = sign(obj_parent_player.x - x);
			
		with (instance_create(x, y, obj_forkhitbox, 
	    {
	        ID: other.id
	    }))	
		
		image_index = 0;
		image_speed = 0.35;
		flash = true;
		hsp = 4 * image_xscale
		create_heat_afterimage(AfterImageType.plain);
	}
}

enemyState_Attack = function()
{
	if (sprite_index == spr_betonbacon_attack && sprite_animation_end() && state == States.titlescreen)
	{
		state = States.frozen
	}
}