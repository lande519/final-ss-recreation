event_inherited()
grabbed_spr = spr_player_hurt
hurt_spr = spr_player_hurt
normal_spr = spr_player_idle
vulnerable_spr = spr_player_outofpizza4
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
pistoltime = 25;
pistolammo = 3;
firing = false;

enum peppinostates
{
	lunge = 700,
	mach = 701,
	breakdance = 702,
	pistol = 703,
	breakdancestart = 704
}

phase_atks = [
//1
[boss_create_attack(peppinostates.lunge, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)],
//2
[boss_create_attack(peppinostates.breakdancestart, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)],

[boss_create_attack(peppinostates.pistol, 0, 15),
boss_create_attack(bossstates.vulnerable, 90, 30)]

]
