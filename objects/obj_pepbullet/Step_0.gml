x += (image_xscale * 10);

if (scr_solid(x + image_xscale, y))
{
    instance_create(x, y, obj_bumpEffect);
    instance_destroy();
}
