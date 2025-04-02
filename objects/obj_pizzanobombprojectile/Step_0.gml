move_towards_point(gotopointx,gotopointy,10)	

if x < gotopointx + 10 && x > gotopointx - 10 && y < gotopointy + 10 && y > gotopointy - 10{
	sprite_index = spr_pizzano_bombland
	move_towards_point(gotopointx,gotopointy,0)		
}