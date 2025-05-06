function state_enemyNormal()
{
	if object_index = obj_bucket{
		state = States.actor
		exit;
	}
	
    var dist_start_pos, hallway_direction, _bbox_side;
    
    image_speed = 0.35;
    
    if (!isFlyingEnemy && !grounded)
    {
        hsp = 0;
        movespeed = 0;
    }
    
    if (grounded || isFlyingEnemy)
        movespeed = approach(movespeed, defaultMovespeed, defaultMovespeedAcc ?? max(abs(movespeed), abs(defaultMovespeed)));
    
    hsp = image_xscale * movespeed;
    
    if (isFlyingEnemy)
    {
        vsp = 0;
        dist_start_pos = sign(ystart - y);
        
        if (!place_meeting_collision(x, y + dist_start_pos))
            y += dist_start_pos;
    }
    
    scr_conveyorBeltKinematics();
    
    if (grounded || isFlyingEnemy)
    {
        if (!is_undefined(baddieSpriteIdle) && movespeed == 0)
            sprite_index = baddieSpriteIdle;
        else
            sprite_index = baddieSpriteWalk;
    }
    
    if (canTurnSelf && movespeed > 0 && turnTimer-- < 0)
    {
        scr_enemy_turn_trigger();
        exit;
    }
    
    if (place_meeting_collision(x + image_xscale, y, Exclude.SLOPES) || (place_meeting(x + image_xscale, y, obj_clutterCone) && !place_meeting(x, y, obj_clutterCone)))
    {
        scr_enemy_turn_trigger();
        exit;
    }
    
    if (place_meeting(x + image_xscale, y, obj_hallway))
    {
        hallway_direction = -sign(instance_place(x + sign(image_xscale), y, obj_hallway).image_xscale);
        
        if (sign(other.image_xscale) != hallway_direction)
        {
            scr_enemy_turn_trigger();
            exit;
        }
    }
    
    _bbox_side = (image_xscale >= 1) ? bbox_right : bbox_left;
    
    if (!isFlyingEnemy && grounded && movespeed > 0 && !place_meeting_collision(_bbox_side + image_xscale, y + 31) && !place_meeting_slopePlatform(_bbox_side + image_xscale, y + 31))
    {
        scr_enemy_turn_trigger();
        exit;
    }
}

function state_enemyTurn()
{
    sprite_index = baddieSpriteTurn;
    image_speed = 0.35;
    movespeed = approach(movespeed, 0, defaultMovespeedDecc ?? movespeed);
    hsp = -image_xscale * movespeed;
    scr_conveyorBeltKinematics();
    
    if (isFlyingEnemy)
        vsp = 0;
    
    if (sprite_animation_end())
    {
        hsp = 0;
        movespeed = defaultMovespeed;
        image_index = 0;
        sprite_index = baddieSpriteWalk;
        image_xscale *= -1;
        state = States.frozen;
        exit;
    }
}

function state_enemyScared()
{
    image_speed = 0.35;
    movespeed = 0;
    hsp = image_xscale * movespeed;
    
    if (isFlyingEnemy)
        vsp = 0;
    
    baddieScareBuffer--;
    
    if (baddieScareBuffer <= 0)
    {
        state = States.frozen;
        sprite_index = baddieSpriteWalk;
        baddieScareBuffer = 0;
        scare_jump = false;
    }
    
    scr_conveyorBeltKinematics();
}

function state_enemyStunned()
{
    baddieStunTimer--;
    movespeed = 0;
    sprite_index = baddieSpriteStun;
    image_speed = 0.35;
    
    if (grounded)
    {
        hsp = approach(hsp, 0, 0.3);
        scr_conveyorBeltKinematics();
        
        if (abs(hsp) > 4 && !instance_exists(dashCloudID))
        {
            dashCloudID = instance_create(x, y, obj_dashCloud, 
            {
                image_xscale: sign(hsp)
            });
        }
    }
    
    if (grounded && baddieStunTimer < 0)
    {
        image_index = 0;
        state = States.frozen;
        sprite_index = baddieSpriteWalk;
    }
}

function state_enemyHit()
{
    var impact_test;
    
    sprite_index = baddieSpriteHit ?? baddieSpriteDead;
    baddieStunTimer = 500;
    image_speed = 0.35;
    
    with (create_afterimage(AfterImageType.plain, image_xscale))
    {
        image_alpha = 0.6;
        vanish = true;
    }
    
    movespeed = 0;
    hsp = hitHsp;
    vsp = hitVsp;
    impact_test = false;
    
    if (hitHsp != 0 && (place_meeting_collision(x + sign(hitHsp), y) || place_meeting(x + sign(hitHsp), y, obj_hallway)) && !place_meeting(x + sign(hitHsp), y, obj_destructibles))
    {
        vsp = -5;
        impact_test = true;
    }
    
    if (hitVsp != 0 && (place_meeting_collision(x, y - 1) || place_meeting(x, y - 1, obj_vertical_hallway)) && !place_meeting(x, y + hitVsp, obj_destructibles))
    {
        vsp = 5;
        impact_test = true;
    }
    
    if (impact_test)
    {
        if (canBeKilled && object_index != obj_bosspizzano)
        {
            instance_destroy();
            exit;
        }
        if object_index != obj_bosspizzano
			state = 4;
		else
			state = 302;
        exit;
    }
}

function state_enemyWaiting_Panic()
{
    var _player;
    
    visible = false;
    hsp = 0;
    vsp = 0;
    x = -900;
    y = -200;
    invincibleBaddie = true;
    
    if (escapeEnemy && global.panic)
    {
        _player = get_nearestPlayer();
        
        if (!instance_exists(escapePortalEffect) && point_in_rectangle(xstart, ystart, _player.x - 500, _player.y - 100, _player.x + 500, _player.y + 100))
        {
            escapePortalEffect = instance_create(xstart, ystart, obj_panicPortal, 
            {
                baddieID: id
            });
        }
    }
}

function state_enemyWaiting_Box()
{
    visible = false;
    hsp = 0;
    vsp = 0;
    x = -900;
    y = -200;
    invincibleBaddie = true;
    
    if (!place_meeting(xstart, ystart, obj_bigdestructibles))
    {
        x = xstart;
        y = ystart;
        visible = true;
        jumpedFromBlock = true;
        hasSquashedX = true;
        squashValueX = 0;
        baddieStunTimer = 3;
        vsp = -8;
        grounded = false;
        state = States.charge;
        sprite_index = baddieSpriteWalk;
    }
}

function scr_enemyThrowDefault(sprite, frame, animspd, func)
{
    image_speed = animspd;
    sprite_index = sprite;
    enemyAttackTimer = enemyAttackTimerMax;
    
    if (isFlyingEnemy)
        vsp = 0;
    
    if (!grounded)
        hsp = approach(hsp, 0, 0.1);
    else
        hsp = 0;
    
    scr_conveyorBeltKinematics();
    
    if (!hasAttacked && sprite_animation_end(sprite_index, image_index, frame))
    {
        event_play_oneshot("event:/SFX/enemies/projectile", x, y);
        func();
        hasAttacked = true;
    }
    
    if (sprite_animation_end())
    {
        hsp = 0;
        movespeed = defaultMovespeed;
        image_index = 0;
        sprite_index = baddieSpriteWalk;
        state = States.frozen;
        exit;
    }
}


function state_bossNmovestart(){
	if place_meeting(x,y,obj_parent_player)
		scr_hurtplayer()
		
	if image_alpha != 1
		image_alpha += 0.1
	else{
		randomize()
		if movepicked = 0 {
			movetaking = irandom_range(11,12) //change the last value for more moves
			movepicked = 1 
		}
		sprite_index = spr_player_PA_speen
		image_speed = 0.35
		hsp = image_xscale * 1;
	
		if sprite_animation_end() && sprite_index = spr_player_PA_speen{	
			if movetaking = 12
				sprite_index = spr_player_PA_flycancel_start
			if movetaking = 13
				sprite_index = spr_player_PA_flying
			state = movetaking
			movetaking = 0
			movepicked = 0
		}
	}
}






function state_bossNbombchuckstart(){
	if place_meeting(x,y,obj_parent_player)
		scr_hurtplayer()
		
	vsp = 0
	hsp = 0	
	if image_alpha != 0
		image_alpha -= 0.1
	else{
		x = obj_bombtpos.x
		y = obj_bombtpos.y
		state = 300	
	}
	
	sprite_index = spr_player_PA_jetpack	
}

function state_bossNbombchuck(){
	if sprite_index = spr_player_PA_jetpackthrow && sprite_animation_end(){
		sprite_index = spr_player_PA_jetpack	
	}
	vsp = 0
	hsp = 0
	if bombthrewcount != 2{
		if image_alpha != 1
			image_alpha += 0.1
	}
	
	if image_alpha = 1{
		if bombthrewcount != 2{
			bombcooldown -= 3	
			if bombcooldown < 0{
				event_play_oneshot("event:/SFX/player/punch", x, y)
				sprite_index = spr_player_PA_jetpackthrow
				instance_create(x,y,obj_pizzanobombprojectile)	
				bombcooldown = 300	
				bombthrewcount += 1
			}
		}
		else{
			state = 301
			bombthrewcount = 0
			bombcooldown = 300
		}
	}
}


function state_bosscanhit()
{
	if image_alpha != 1
		image_alpha += 0.1
	
	if !flash
		flash = true
	sprite_index = spr_player_PZ_idle_breakdance		
	hitcountdown -= 1
	var valid_hitstates = [32, 302, 4, 22, 88, 90, 89, 16, 39, 75, 69, 33, 3, 86, 12, 57, 65, 66, 48, 51, 53, 54, 40, 26, 61, 41, 42, 68, 58, 8, 7, 10];
	if place_meeting(x,y,obj_parent_player) && array_contains(valid_hitstates, obj_parent_player.state){
        flash = true
		camera_shake_add(20, 20)
        global.ComboTime = 60
        alarm[1] = 5
		event_play_oneshot("event:/SFX/enemies/kill")
        grounded = false
        hitHsp = obj_parent_player.xscale * 25
        hitVsp = 0
        hsp = hitHsp
        vsp = hitVsp
        hp = 0
		hitcountdown = 100
        throwAntiGrav = true
        state = (6 << 0)
		flash = false
		if instance_exists(obj_bosscontroller){
			with obj_bosscontroller
				event_user(0);
		}		
        if (baddieStunTimer < 500)
            baddieStunTimer = 500
        create_particle(x, y, spr_bangEffect)
        create_particle(x, y, spr_parryeffect)
        repeat (6)
            create_baddiedebris()
		with obj_parent_player{
	        if (move != 0)
	            move = xscale
	        inputBufferSlap = 0
	        state = (46 << 0)
	        movespeed = hsp
	        if (sprite_index == spr_swingDing)
	            sprite_index = spr_swingDingEnd
	        else if key_up
	            sprite_index = spr_suplexmashUppercut
	        else
	            sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4)
	        image_index = 0			
		}	
	}
	
	if phase = 0{
		if hitcountdown = 0{
			flash = false
			if object_index = obj_bosspizzano
				state = 10
			hitcountdown = 100
		}
	}
	else{
		if hitcountdown = 30{
			state = 10
			hitcountdown = 100
		}			
	}
}



function state_bosshitbounce(){
	hsp = image_xscale * movespeed;
	
	movespeed = 4
	if ((scr_solid((x + sign(hsp)), y))){
		image_xscale *= -1;	
	}
	
	if grounded{
		bouncecount += 1
		if bouncecount != 2
			vsp = -5		
	}	
		
	if bouncecount = 2{
		vsp = 0
		if object_index = obj_bosspizzano
			state = 10
		bouncecount = 0
	}
}



function state_bossNhatthrow(){
	if !instance_exists(obj_pizzanobosshat){
		event_play_oneshot("event:/SFX/general/secretSplat", x, (y + 32))
		with instance_create(x,y,obj_pizzanobosshat)	
			image_xscale = other.image_xscale
	}
	
	hsp = 0
	vsp = 0
	
	if sprite_index = spr_player_PA_flycancel_start && sprite_animation_end(){
		sprite_index = spr_player_PA_flycancel
	}	

}



function state_bossN_fly(){
    hsp = movespeed;
	var move = 0
	if alarm_get(2) = -1{
		alarm[2] = 300
	}	
	if x > obj_player1.x{
		move = -1
	}	
	else{
		move = 1
	}	
		movespeed = approach(movespeed, 5 * move, 0.8);
		dir = move;
	
	
	if place_meeting(x,y,obj_parent_player)
		scr_hurtplayer()		
}

function state_boss_intro(){
	image_speed = 0.35
	vsp = 0
	hsp = 0
	movespeed = 0
	if obj_bosscontroller.state = 27{
		sprite_index = spr_player_PA_idle	
	}
	else{
		startcountdown --
		if startcountdown < 0{
			sprite_index = spr_player_PA_shoulderstart
			screamcountdown --
			if screamcountdown < 0{
				state = 10
				startcountdown = 100
				screamcountdown = 150
			}
		}
	}		
}


function state_bossN_end(){
	hsp = 0
	vsp = 0
	startcountdown --
	if startcountdown < 0{
		instance_create(x,y,obj_bombExplosion)			
		instance_destroy()
	    with (instance_create(x, y, obj_baddieDead))
	    {
	        image_xscale = 1;
	        sprite_index = spr_player_PA_kungfuairend;
	    }
	}
}


