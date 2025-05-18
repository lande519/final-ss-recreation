event_inherited()
baddieSpriteIdle = spr_honeyslime
baddieSpriteWalk = spr_honeyslime
baddieSpriteStun = spr_honeyslime_stun
baddieSpriteScared = spr_honeyslime_scared
baddieSpriteTurn = spr_honeyslime
baddieSpriteHit = undefined
baddieSpriteDead = spr_honeyslime_dead
enemyAttackTimerMax = 200;

enemyAttack_TriggerEvent = function()
{
	if (enemyAttackTimer <= 0 && scr_enemy_playerisnear(100, 20) && grounded && state == (0 << 0))
	{
		enemyAttackTimer = enemyAttackTimerMax;
		slide = 0
		state = (2 << 0)
		movespeed = 0
		var _player = get_nearestPlayer()
		image_xscale = face_obj(_player)
		sprite_index = spr_honeyslime_shoot
		image_index = 0
		fmod_studio_event_instance_start(sndCharge)
	}
}

enemyState_Attack = function()
{
   scr_enemyThrowDefault(spr_honeyslime_shoot, 3, 0.35, function()
    {
        with instance_create(x, y, obj_sludge)
        {
            image_xscale = other.image_xscale
			movespeed = 5
			vsp = -8
        }
    }
)
}
 
