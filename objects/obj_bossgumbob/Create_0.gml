event_inherited()
grabbed_spr = spr_gumbob_hurt
hurt_spr = spr_gumbob_hurt
normal_spr = spr_gumbob_idle
vulnerable_spr = spr_gumbob_vulnerable
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
tgtNeg = 160
tgtPos = 800
thrown = false;
can_parry = true;
sprite_index = intro_spr
obj_player1.sprite_index = spr_player_PZ_idle
image_index = 0
obj_player1.image_index = 0

phase_atks = [
//1
[boss_create_attack(bossstates.spray, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)],

//2
[boss_create_attack(peppinostates.lunge, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)]

]
