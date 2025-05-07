if room = hub_w1{
	level = "gumbob";
	gatesprite = spr_pepperman_startgate
	details = default_gate_scroll(spr_cotton_gatebg);
}

if room = hub_w3{
	level = "pizzano";
	gatesprite = spr_pepperman_startgate
	details = default_gate_scroll(spr_cotton_gatebg);
}


if room = hub_w2{
	level = "coneboy";
	gatesprite = spr_pepperman_startgate
	details = default_gate_scroll(spr_cotton_gatebg);
}
	


surf = -4;
isEasel = false
fade = 1
hideDetails = false
rank = "none";
image_speed = 0
depth = 999
rubbleindex = 0

defineObject = function(argument0, argument1) constructor
{
    xstart = argument0;
    ystart = argument1;
    x = argument0;
    y = argument1;
    sprite_index = spr_null;
    image_index = 0;
    image_speed = 0.35;
    visible = false;
    vsp = 0;
    hsp = 0;
};

secretCanvas = [new defineObject(x, y - 128), new defineObject(x, y - 128), new defineObject(x, y - 128)];
gatePointDisplay = new defineObject(x, y - 265);

ini_open(global.SaveFileName)
iniw1 = ini_read_real("Game","w1G",0)
iniw2 = ini_read_real("Game","w2G",0)
iniw3 = ini_read_real("Game","w3G",0)
iniw4 = ini_read_real("Game","w4G",0)
ini_close()

if room = hub_w1{
	if iniw1 = 1{
		with instance_create(x,y,obj_bossgate){
			sprite_index = other.gatesprite
			details = other.details
			level = other.level
		}
		instance_destroy()		
	}
}

if room = hub_w2{
	if iniw2 = 1{
		with instance_create(x,y,obj_bossgate){
			sprite_index = other.gatesprite
			details = other.details
			level = other.level
		}
		instance_destroy()		
	}
}

if room = hub_w3{
	if iniw3 = 1{
		with instance_create(x,y,obj_bossgate){
			sprite_index = other.gatesprite
			details = other.details
			targetRoom = steamy_1;
			level = other.level
		}
		instance_destroy()		
	}
}

if room = hub_w4{
	if iniw4 = 1{
		with instance_create(x,y,obj_bossgate){
			sprite_index = other.gatesprite
			details = other.details
			level = other.level
		}
		instance_destroy()		
	}
}