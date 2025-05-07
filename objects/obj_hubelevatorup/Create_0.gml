event_inherited();
spriteDoorDefault = spr_hub_elevatorup;
spriteDoorUnlocked = spr_hub_elevatorup;
spriteDoorLocked = spr_hub_elevatorlocked;
spriteDoorEscape = spr_hub_elevatorup;
spriteDoorLight = spr_hub_elevatorup;
spriteDoorLock = spr_doorlock;
showDoorLight = false

ini_open(global.SaveFileName)
alreadyopened = ini_read_real("Game","w1dooropened",0)
ini_close()
