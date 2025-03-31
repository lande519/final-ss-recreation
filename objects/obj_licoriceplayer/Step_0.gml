if (!touched)
{
	if obj_player1.state != States.gotkey{
	    var xx = obj_player1.x;
	    var yy = obj_player1.y;
	    var ixs = obj_player1.xscale;
	    var v = obj_player1.vsp;
	    var msk = obj_player1.mask_index;
	    var spr = obj_player1.sprite_index;
	    var ind = obj_player1.image_index;
	    ds_queue_enqueue(followqueue, [xx, yy, ixs, v, msk, spr, ind]);
    
	    if (ds_queue_size(followqueue) > LAG_STEPS)
	    {
	        var b = ds_queue_dequeue(followqueue);
	        x = b[0];
	        y = b[1];
	        image_xscale = b[2];
	        vsp = b[3];
	        mask_index = b[4];
	        sprite_index = b[5];
	        image_index = b[6];
	    }
	}
	if obj_player1.state = States.gotkey{
		sprite_index = spr_player_PZ_hurt
	}
    image_speed = 0.35;
}
