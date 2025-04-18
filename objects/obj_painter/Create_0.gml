event_inherited()
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
delay = 120
max_delay = 120
stun_timer = 200
setfordeath = false;
tgtNeg = 160
tgtPos = 800
thrown = false;
can_parry = true;
phase_atks = [
//1
[boss_create_attack(bossstates.painterdash, 0, 15)],
//2
[boss_create_attack(bossstates.painterlunge, 0, 15), 
boss_create_attack(bossstates.painterdash, 0, 10)],
//3
[boss_create_attack(bossstates.painterlunge, 0, 15), 
boss_create_attack(bossstates.painterdash, 1, 10)],
//4
[boss_create_attack(bossstates.painterlunge, 3, 15), 
boss_create_attack(bossstates.paintball, 0, 0), 
boss_create_attack(bossstates.vulnerable, 90, 30)],
//5
[boss_create_attack(bossstates.painterlunge, 5, 15), 
boss_create_attack(bossstates.paintball, 0, 0), 
boss_create_attack(bossstates.painterlunge, 5, 15), 
boss_create_attack(bossstates.paintball, 0, 0), 
boss_create_attack(bossstates.vulnerable, 90, 30)],
//6
[boss_create_attack(bossstates.painterlunge, 1, 15), 
boss_create_attack(bossstates.painterlunge, 2, 15),
boss_create_attack(bossstates.paintball, 0, 0),
boss_create_attack(bossstates.painterdash, 0, 15)]

]

