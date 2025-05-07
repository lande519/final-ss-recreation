event_inherited();
var checkrank, alreadyopened
ini_open(global.SaveFileName)

if room = hub_w1{
	checkrank = ini_read_string("Ranks", "gumbob", "none");	
	alreadyopened = ini_read_real("Game","w1dooropened",0)
	if checkrank == "none" or alreadyopened == 1{
		instance_destroy()
	}	
}


ini_close()