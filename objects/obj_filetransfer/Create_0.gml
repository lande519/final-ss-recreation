selected = 0

ini_open("optionData.ini");
filetransfershown = ini_read_real("Settings", "filetransfershown", 0);
ini_close()

if filetransfershown = true
	room_goto(rm_startupLogo)