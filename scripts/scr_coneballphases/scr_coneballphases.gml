// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_coneballphase1(){
	switch state{
		case bossstates.waiting:
		break;
		case bossstates.frozen:
			scr_boss_frozen()
		break;
		case bossstates.normal:
			scr_boss_normal_coneball()
		break;
		case bossstates.intro:
			scr_boss_introconeballpt1()
		break;
			case bossstates.hurt:
			scr_boss_hurt()
		break
		case bossstates.vulnerable:
			scr_boss_vunerable()
		break;
		case bossstates.grabbed:
			scr_boss_grabbed()
		break;
		case bossstates.phasetranssetup:
			scr_coneball_phasetranssetup()
		break;
		case bossstates.phasetrans:
			scr_coneball_phasetrans()
		break;		
	}
}


function scr_coneballphase2(){
	switch state{
		case bossstates.waiting:
			if !instance_exists(obj_minibazooka)
				state = bossstates.normal
		break;
		case bossstates.frozen:
			scr_boss_frozen()
		break;
		case bossstates.nothing:
			grav = 0
			vsp = 0
			hsp = 0
		break;
		case bossstates.normal:
			scr_boss_normal()
		break;
			case bossstates.hurt:
			scr_boss_hurt()
		break
		case bossstates.vulnerable:
			scr_boss_vunerable()
		break;
		case bossstates.grabbed:
			scr_boss_grabbed()
		break;
		case bossstates.introsetup:
			scr_coneball_setupintropt2()
		break;
		case bossstates.intro:
			scr_coneball_intropt2()
		break;		
		case bossstates.cook:
			scr_coneball_cook()
		break;	
		case bossstates.phasetranssetup:
			scr_coneball_transetuppt2()
		break;
		case bossstates.phasetrans:
			scr_coneball_transpt2()
		break;				
	}
}