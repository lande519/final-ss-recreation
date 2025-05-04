if (ds_list_find_index(global.BaddieRoom, id) != -1)
    exit;


with (obj_sucroseTimer)
{
	for (addseconds += other.seconds; other.minutes > 0; addseconds += 60)
		other.minutes--;
        
	alarm[0] = -1;
	alarm[2] = 1;
}

enemyDeath_SpawnDeathFX();
enemyDeath_awardPoints(importantEnemy);

if (!importantEnemy)
{
    ds_list_add(global.BaddieRoom, id);
    
    if (escapeEnemy)
        ds_list_add(global.EscapeRoom, id);
}
