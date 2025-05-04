enum thegstates{
	idle,
	run,
	cutscene,
	cutscenesetup
}

ini_open(global.SaveFileName)
iniw1 = ini_read_real("Game","w1G",0)
iniw2 = ini_read_real("Game","w2G",0)
iniw3 = ini_read_real("Game","w3G",0)
iniw4 = ini_read_real("Game","w4G",0)
ini_close()

amountneeded = 50
state = thegstates.idle
image_speed = 0.35
scr_collision_init()

switch room{
	case hub_w1:
		amountneeded = 50
		if iniw1 = 1
			instance_destroy()
	break;
	case hub_w2:
		amountneeded = 100
		if iniw2 = 1
			instance_destroy()				
	break;
	case hub_w3:
		amountneeded = 200
		if iniw3 = 1
			instance_destroy()				
	break;		
	case hub_w4:
		amountneeded = 250
		if iniw4 = 1
			instance_destroy()				
	break;	
}