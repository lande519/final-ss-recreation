scr_collision();
hsp = movespeed * image_xscale;

if (place_meeting_collision(x + image_xscale, y))
    image_xscale *= -1;

if (grounded)
{
    vsp = -6;
    
    if (!once)
    {
        once = true;
        
        if (!bounced)
            bounced = true;
        else{
            instance_destroy();
			instance_create(x,y,obj_poofeffect)		
		}
    }
}
else
{
    once = false;
}
