if !instance_exists(obj_npc)
	exit;
	
var count = instance_number(obj_npc);
var n = irandom(count - 1);
var b = -4;
var found = false;
while (!found){
	with (instance_find(obj_npc, n)){
		found = true;
		b = id;
	}
	n = irandom(count - 1);
}
with (obj_npc){
	if (id != b)
		instance_destroy();
}