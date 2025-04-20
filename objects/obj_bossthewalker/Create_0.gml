event_inherited()
grabbed_spr = spr_thewalker_ouch
hurt_spr = spr_thewalker_ouch
normal_spr = spr_thewalker_idle
vulnerable_spr = spr_thewalker_ouch
fall_spr = spr_thewalker_idle
image_speed = 0.35
depth = -30
state = bossstates.intro
jumped = false
dashed = false
stunned = 0
atk_details = [-4, -4, -4]
subattack_1 = -4
subattack_2 = -4
inv_time = 200
bID = -4
substate = 0
intensity = 0
delay = 120
max_delay = 1000000000000000000000000000
stun_timer = 1000000000000000000000000000
setfordeath = false;
tgtNeg = 160
tgtPos = 800
thrown = false;
can_parry = true;
sprite_index = intro_spr
obj_player1.sprite_index = spr_player_PZ_idle
image_index = 0
obj_player1.image_index = 0
flytimer = 200
throwtimer = 50

phase_atks = [
//1
[boss_create_attack(bossstates.walker, 0, 15)]
]
