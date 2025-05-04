if (room != rank_room && minutes <= 0 && seconds <= 0 && addseconds <= 0)
{
    with (obj_player1)
    {
		instance_destroy(obj_fadeoutTransition);
		scr_levelSet();
		targetDoor = "A";
		global.panic = 0;
		global.greyscalefade = 0;
		room = timesuproom;
		state = States.timesup;
		sprite_index = spr_Timesup;
		image_index = 0;
		event_play_oneshot("event:/music/timesup");
    }

    instance_destroy();
}
