image_xscale = face_obj(obj_player1)
hsp = movespeed
movespeed = approach(movespeed,4*image_xscale,0.4)


image_yscale = faceup_obj(obj_player1)
vsp = vmovespeed
vmovespeed = approach(vmovespeed,4*image_yscale,0.4)

x += hsp
y += vsp