event_inherited();
baddieSpriteIdle = undefined;
baddieSpriteWalk = spr_melon_walk;
baddieSpriteStun = spr_melon_stunned;
baddieSpriteScared = spr_melon_scared;
baddieSpriteTurn = undefined;
baddieSpriteHit = undefined;
baddieSpriteDead = spr_melon_dead;
enemyAttackTimerMax = 200;
defaultMovespeed = 1.5;

enemyAttack_TriggerEvent = function()
{
    var target_player, facing_xscale;
    
    target_player = get_nearestPlayer();
    facing_xscale = -getFacingDirection(target_player.x, x);
    
    if (enemyAttackTimer <= 0 && scr_enemy_playerisnear(100, 200) && !target_player.cutscene && image_xscale == facing_xscale && grounded && state == States.frozen)
    {
        movespeed = 0;
        enemyAttackTimer = enemyAttackTimerMax;
        state = States.titlescreen;
        image_xscale = facing_xscale;
        sprite_index = spr_crackerkicker_kick;
        image_index = 0;
    }
};

enemyState_Attack = function()
{
    scr_enemyThrowDefault(spr_crackerkicker_kick, 3, 0.35, function()
    {
        movespeed = 8;
        instance_create(x + (image_xscale * 50), y, obj_crackerkicker_kickhitbox, 
        {
            image_xscale: image_xscale,
            baddieID: id
        });
    });
    hsp = movespeed * image_xscale;
    movespeed = approach(movespeed, defaultMovespeed, 0.1);
};

