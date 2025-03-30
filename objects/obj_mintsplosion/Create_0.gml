event_inherited()
baddieSpriteIdle = undefined
baddieSpriteWalk = spr_mintsplosion
baddieSpriteStun = spr_mintsplosion_stun
baddieSpriteScared = spr_mintsplosion_scare
baddieSpriteTurn = undefined
baddieSpriteHit = undefined
baddieSpriteDead = spr_mintsplosion_dead
enemyAttackTimerMax = 200
defaultMovespeed = 1.5
enemyAttack_TriggerEvent = function()
{
	if !instance_exists(obj_mintsplosion_bomb){
	    if (scr_enemy_playerisnear(200, 20) && grounded && state == (0 << 0))
	    {
	        slide = 0
	        state = (2 << 0)
	        movespeed = 0
	        var _player = get_nearestPlayer()
	        image_xscale = face_obj(_player)
	        sprite_index = spr_mintsplosion_throw
	        image_index = 0
	        fmod_studio_event_instance_start(sndCharge)
	    }
	}
}

enemyState_Attack = function()
{
   scr_enemyThrowDefault(spr_mintsplosion_throw, 13, 0.35, function()
    {
        with instance_create((x + image_xscale * 50), y, obj_mintsplosion_bomb)
        {
            image_xscale = other.image_xscale
        }
    }
)
}