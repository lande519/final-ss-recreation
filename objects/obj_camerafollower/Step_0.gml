if obj_player1.state = States.licoricespin{
	x = approach(x,obj_player1.x,5)
	y = obj_player1.y	
	global.targetCamX = obj_camerafollower.x;
	global.targetCamY = obj_camerafollower.y - 32;		
}
else{
	x = obj_player1.x
	y = obj_player1.y	
}

image_alpha = 0