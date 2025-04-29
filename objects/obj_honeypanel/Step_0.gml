if place_meeting(x,y,obj_player1){
	if touched = 0{
		touched = 1	
		with obj_player1{
			scr_taunt_storeVariables();
			state = States.honey	
		}
	}
}
else
	touched = 0
	
if obj_player1.inputBufferJump > 0 && place_meeting(x,y,obj_player1){
	with obj_player1{
		scr_taunt_setVariables()		
		vsp = -11
		inputBufferJump = 0
	}
}