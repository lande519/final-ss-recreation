if flash
	draw_sprite_ext_flash(sprite_index, image_index, x, y, xscale, image_yscale, 0, c_white, 1)
else
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, 0, c_white, image_alpha)


draw_text(x,y,state)
draw_text(x,y-25,hsp)
draw_text(x,y-50,movespeed)