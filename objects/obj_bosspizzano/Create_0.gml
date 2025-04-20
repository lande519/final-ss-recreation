event_inherited()
grabbed_spr = spr_player_PA_hurt
hurt_spr = spr_player_PA_hurt
normal_spr = spr_player_PA_idle
vulnerable_spr = spr_player_PA_vulnerable
fall_spr = spr_player_PA_fall
image_speed = 0.35
depth = -30
state = bossstates.normal
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
delay = 40
max_delay = 40
stun_timer = 200
setfordeath = false;
tgtNeg = 160
tgtPos = 800
thrown = false;
can_parry = true;
retrozanotimer = 250
dashtimer = 300
balltimer = 300

phase_atks = [
//1
[boss_create_attack(bossstates.pizzanothunder, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)],
//2
[boss_create_attack(bossstates.pizzanoretro, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)],

//3
[boss_create_attack(bossstates.pizzanodash, 0, 15),
boss_create_attack(bossstates.pizzanothunder, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)],

//4
[boss_create_attack(bossstates.bounce, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)],


//5
[boss_create_attack(bossstates.bounce, 0, 15),
boss_create_attack(bossstates.pizzanothunder, 90, 30),
boss_create_attack(bossstates.pizzanothunder, 90, 30),
boss_create_attack(bossstates.vulnerable, 90, 30)],

//6
[boss_create_attack(bossstates.pizzanoretro, 90, 30),
boss_create_attack(bossstates.pizzanothunder, 90, 30),
boss_create_attack(bossstates.pizzanothunder, 90, 30),
boss_create_attack(bossstates.bounce, 0, 15),
boss_create_attack(bossstates.pizzanothunder, 90, 30),
boss_create_attack(bossstates.vulnerable, 90, 30)]
]
