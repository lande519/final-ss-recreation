draw_set_font(global.smallfont)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width/2,100,"WOULD YOU LIKE TO TRANSFER YOUR EXHIBITION NIGHT SAVES?")
draw_text(room_width/2-200,300,"YES")
draw_text(room_width/2+200,300,"NO")
draw_text(room_width/2,300,filetransfershown)

if selected = 0
	draw_sprite(spr_selectionhand,image_index,room_width/2-200,280)	
if selected = 1
	draw_sprite(spr_selectionhand,image_index,room_width/2+200,280)	

