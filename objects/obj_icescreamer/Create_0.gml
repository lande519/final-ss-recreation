event_inherited()
baddieSpriteIdle = undefined
baddieSpriteWalk = spr_icescreamer_walk
baddieSpriteStun = spr_icescreamer_stunned
baddieSpriteScared = spr_icescreamer_stunned
baddieSpriteTurn = undefined
baddieSpriteHit = undefined
baddieSpriteDead = spr_icescreamer_stunned
enemyAttackTimerMax = 200
defaultMovespeed = 1.5
enemyAttack_TriggerEvent = function()
{
	if !instance_exists(obj_crushertrail){
	    if (scr_enemy_playerisnear(700, 100) && grounded && state == (0 << 0))
	    {
	        slide = 0
	        state = (2 << 0)
	        movespeed = 0
	        var _player = get_nearestPlayer()
	        image_xscale = face_obj(_player)
	        sprite_index = spr_icescreamer_shoot
	        image_index = 0
	        fmod_studio_event_instance_start(sndCharge)
	    }
	}
}

enemyState_Attack = function()
{
   scr_enemyThrowDefault(spr_icescreamer_shoot, 15, 0.35, function()
    {
        with instance_create((x + image_xscale * 50), y, obj_icescreamer_cone)
            image_xscale = other.image_xscale
    }
)
}