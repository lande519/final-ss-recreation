if ((!reciever) && (!active) && obj_parent_player.state != (71 << 0) && (!global.freezeframe) && is_for_me)
{
    alarm[0] = 25
    active = true
	with instance_create(x,y,obj_telespitfx)
		sprite_index = spr_candyifiedeffect1
    event_play_oneshot("event:/SFX/general/teleporterstart", x, y)
    with (obj_parent_player)
    {
        visible = false
        other.storedstate = state
        other.storedmovespeed = movespeed
        other.storedgrav = grav
        other.storedimageindex = image_index
        other.storedspriteindex = sprite_index
        other.storedfreefallsmash = freeFallSmash
        hsp = 0
        vsp = 0
        grav = 0
        alarm[7] = 50
        alarm[5] = 2
        hurted = true
        state = (71 << 0)
    }
}