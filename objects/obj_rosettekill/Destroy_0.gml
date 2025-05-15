with (instance_create(x, y, obj_baddieDead))
{
    vsp = random_range(-7, -10);
    hsp = random_range(5, 10) * obj_player1.image_xscale;
    rotatevalue = random_range(5, 10);
    rotatedirection = obj_player1.image_xscale;
    canrotate = true;
    sprite_index = spr_rosette
    image_speed = 0;
}
