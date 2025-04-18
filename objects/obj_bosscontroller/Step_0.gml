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
