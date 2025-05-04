draw_self()
if image_alpha = 1 && !instance_exists(obj_theg){
	var offset_x, offset_y;

	draw_set_color(c_white);
	draw_self();
	draw_sprite(sprite_index, 2, x, y);
	scr_startgate_draw_normal();
	draw_sprite(spr_gateriseeffect,rubbleindex,xstart,ystart)
	
	if (hideDetails)
	    exit;


	if (rank == "none")
	    exit;
		
	if (gateRankBubble.visible)
	{
	    offset_x = (sprite_get_width(gateRankBubble.sprite_index) / 2) * gateRankBubble.bubbleScale;
	    offset_y = (sprite_get_height(gateRankBubble.sprite_index) / 2) * gateRankBubble.bubbleScale;
	    draw_sprite_ext(gateRankBubble.sprite_index, 0, gateRankBubble.x - offset_x, gateRankBubble.y - offset_y, gateRankBubble.bubbleScale, gateRankBubble.bubbleScale, 0, c_white, 1);
	}
}