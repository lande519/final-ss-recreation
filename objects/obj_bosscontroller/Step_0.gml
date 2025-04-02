	if fadealpha != 0	
		fadealpha = approach(fadealpha, 0, 0.1)
	
	playhpindex += 0.35
	if (playhpindex > sprite_get_number(playhpspr))
	    playhpindex = frac(playhpindex)
	bosshpindex += 0.35
	if (bosshpindex > sprite_get_number(bosshpspr))
	    bosshpindex = frac(bosshpindex)
	switch state
	{
	    case (27 << 0):
	        scr_bosscontroller_intro()
	        break
	    case (1 << 0):
	        scr_bosscontroller_normal()
	        break
	    case (61 << 0):
	        break
	}

	if instance_exists(obj_bosspizzano){
		if state = 27{
			obj_player1.state = 309
		}
		else{
			if instance_exists(obj_bosspizzano){
				if obj_bosspizzano.state = -1
					obj_bosspizzano.state = 10
			}
		}

		if bosshp = 0 && obj_bosspizzano.phase = 0{
			bosshp = 10
			fadealpha = 2
			obj_bosspizzano.phase += 1
	
		}

	}
