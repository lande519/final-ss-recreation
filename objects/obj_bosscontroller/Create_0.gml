playhp = 6
bossmusic = "event:/music/w2/coneboyboss"

if room = boss_painter{
	bosshp = 10
}
if room = boss_bushranger{
	bosshp = 10
}
if room = boss_gumbob
	bosshp = 10
if room = boss_pizzano{
	bosshp = 8
	bossmusic = "event:/music/w3/pizzanoboss"
}
if room = boss_peppino
	bosshp = 8
if room = boss_coneball{
	bosshp = 8
	bossmusic = "event:/music/w4/coneballphase1"
}
if room = boss_thewalker
	bosshp = 22
if room = boss_coneboy{
	bosshp = 8
	bossmusic = "event:/music/w2/coneboyboss"	
}
	
boss_func = -4
lastbosshp = bosshp
playmaxhp = playhp
bossmaxhp = bosshp
playhpindex = 0
bosshpindex = 0
playhpspr = spr_pizzellehp
bosshpspr = spr_coneballhp
bossspr_pal = -4
boss_scale = 10
stopall = false
boss_shake = 0
boss_color = 0
boss_sprite = spr_pizzanobossintro
fadealpha = 0
boss_alpha = 1
showing_boss = false
boss_surface = -4
player_scale = 10
player_shake = 0
player_color = 0
player_alpha = 1
showing_player = false
player_surface = -4
fadeout = 1
color = 0
color_fade = 0
showing_versus = true
intro_state = 0
intro_timer = 20
versus_shake = 0
showing_names = false
boss_name = 1429
name_shake = 0
playhpindex = 0
bosshpindex = 0
firey = 0
boss_intro = 1846
portaitx = -500
portrait_shake = 0
state = (27 << 0)
fmod_event_stop_all(true);
event_play_oneshot("event:/music/bossintro");