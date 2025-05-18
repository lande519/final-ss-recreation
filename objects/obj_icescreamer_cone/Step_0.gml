hsp = 5 * image_xscale;
vsp = 5 * image_yscale;

if (scr_solid(x, y + image_yscale))
{
    if (!oncev)
    {
        image_yscale *= -1;
        bounce--;
        oncev = true;
        
        if (bounce <= 0)
            instance_destroy();
    }
}
else
{
    oncev = false;
}

if (scr_solid(x + image_xscale, y))
{
    if (!onceh)
    {
        image_xscale *= -1;
        bounce--;
        onceh = true;
        
        if (bounce <= 0)
            instance_destroy();
    }
}
else
{
    onceh = false;
}

x += hsp;
y += vsp;
