state = noone
bossstarted = false
xscale = image_xscale
scr_collision_init()
grav = 0.5
movespeed = 0

atkqueue = ds_queue_create()
atktimer = 75


flash = false
hurted = false
phase = 1
setfordeath = false;
fall_spr = spr_player_PA_fall
grabbed_spr = spr_painter_stun
hurt_spr = spr_painter_hurt
normal_spr = spr_painter_idle
vulnerable_spr = spr_painter_tired
intro_spr = spr_player_PA_bossintro1
intro2_spr = spr_player_PA_bossintro2
walk_spr = spr_coneboy_walk