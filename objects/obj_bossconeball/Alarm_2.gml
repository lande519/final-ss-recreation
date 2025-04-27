
if throwround = 1
	var creating = array_get(enemythrowround1,irandom(array_length(enemythrowround1)-1))
	
if throwround = 2
	var creating = array_get(enemythrowround2,irandom(array_length(enemythrowround2)-1))
	
if throwround = 3
	var creating = array_get(enemythrowround3,irandom(array_length(enemythrowround3)-1))
	
if throwround = 4
	var creating = array_get(enemythrowround4,irandom(array_length(enemythrowround4)-1))
	
if throwround = 5
	var creating = array_get(enemythrowround5,irandom(array_length(enemythrowround5)-1))


with instance_create(x,y,creating){
	state = (4 << 0)
	hasSquashedX = true
	squashValueX = 0
	baddieStunTimer = 50
	vsp = -5
	importantEnemy = true		
}
if obj_bosscontroller.bosshp = 8
	alarm[2] = 300
	
if obj_bosscontroller.bosshp = 7 or obj_bosscontroller.bosshp = 6
	alarm[2] = 250
	
if obj_bosscontroller.bosshp = 5 or obj_bosscontroller.bosshp = 4
	alarm[2] = 150
	
if obj_bosscontroller.bosshp < 4
	alarm[2] = 100
	
	