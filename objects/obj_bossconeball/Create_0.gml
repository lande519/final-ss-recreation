event_inherited()
grabbed_spr = spr_coneball_hit
hurt_spr = spr_coneball_hit
normal_spr = spr_stupidrat_idle
vulnerable_spr = spr_coneball_hit
fall_spr = spr_stupidrat_idle
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
dir = 1
hp = 10
thrown = false;
can_parry = true;
sprite_index = intro_spr
obj_player1.sprite_index = spr_player_PZ_idle
image_index = 0
obj_player1.image_index = 0
topy = 128
enemythrowround1 = [obj_gumslime]
enemythrowround2 = [obj_gumslime,obj_knight]
enemythrowround3 = [obj_gumslime,obj_knight,obj_snowMint]
enemythrowround4 = [obj_gumslime,obj_knight,obj_snowMint,obj_mintsplosion]
enemythrowround5 = [obj_gumslime,obj_knight,obj_snowMint,obj_mintsplosion,obj_miniHarry]
throwround = 1
hurtstates = [bossstates.grabbed, bossstates.hurt]
flicker = false
phase = 0
waitTimer = 50

phase_atks = [
//1
[boss_create_attack(bossstates.cook, 0, 15)]

]
