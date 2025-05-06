
event_inherited()
baddieSpriteIdle = spr_popice
baddieSpriteWalk = spr_popice
baddieSpriteStun = spr_gumslime_stun
baddieSpriteScared = spr_popice_scared
baddieSpriteTurn = spr_popice_turn
baddieSpriteHit = undefined
baddieSpriteDead = spr_gumslime_dead

enemyAttack_TriggerEvent = function()
{
	if (scr_enemy_playerisnear(100, 20) && grounded && state == (0 << 0))
	{
		slide = 0
		state = (2 << 0)
		movespeed = 0
		var _player = get_nearestPlayer()
		image_xscale = face_obj(_player)
		sprite_index = spr_popice_sneeze
		image_index = 0
		fmod_studio_event_instance_start(sndCharge)
	}
}

enemyState_Attack = function()
{
   scr_enemyThrowDefault(spr_popice_sneeze, 14, 0.35, function()
    {
        with instance_create((x + image_xscale * 50), y, obj_popice_sneezeparticle)
        {
            image_xscale = other.image_xscale
        }
    }
)
}
 
