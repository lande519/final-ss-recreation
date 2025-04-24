event_inherited();
baddieSpriteIdle = undefined;
baddieSpriteWalk = spr_archergoblin_walk;
baddieSpriteStun = spr_archergoblin_stun;
baddieSpriteScared = spr_archergoblin_scared;
baddieSpriteTurn = undefined;
baddieSpriteHit = undefined;
baddieSpriteDead = spr_archergoblin_dead;
enemyAttackTimerMax = 200;
defaultMovespeed = 1.5;

enemyAttack_TriggerEvent = function()
{
    var target_player, facing_xscale;
    
    target_player = get_nearestPlayer();
    facing_xscale = -getFacingDirection(target_player.x, x);
    
    if (enemyAttackTimer <= 0 && scr_enemy_playerisnear(200, 200) && !target_player.cutscene && image_xscale == facing_xscale && grounded && state == States.frozen)
    {
        movespeed = 0;
        enemyAttackTimer = enemyAttackTimerMax;
        state = States.titlescreen;
        image_xscale = facing_xscale;
        sprite_index = spr_archergoblin_shoot;
        image_index = 0;
    }
};

enemyState_Attack = function()
{
    scr_enemyThrowDefault(spr_archergoblin_shoot, 21, 0.35, function()
    {
		instance_create(x,y,obj_noisegoblinProjectile)
    });
    hsp = movespeed * image_xscale;
    movespeed = approach(movespeed, defaultMovespeed, 0.1);
};

