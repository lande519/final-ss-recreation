event_inherited()
grabbed_spr = spr_coneboy_hurt
hurt_spr = spr_coneboy_hurt
normal_spr = spr_coneboy_idle
vulnerable_spr = spr_coneboy_vulnerable
fall_spr = spr_coneboy_fall
walk_spr = spr_coneboy_walk
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
max_delay = 120
stun_timer = 200
setfordeath = false;
tgtNeg = 100
tgtPos = 860
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
[boss_create_attack(bossstates.slide, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)],

//2
[boss_create_attack(bossstates.cottondash, 0, 15)],

//3
[boss_create_attack(bossstates.headkick, 0, 15)]


]
