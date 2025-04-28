if (room == rank_room)
    instance_destroy();

selected = false;
selected_level = -4;
minutes = 0;
seconds = 25;

if (room != secret_entrance)
    start = true;

alarm[0] = 60;
startstate = -4;
isgustavo = false;
shotgunAnim = false;
global.noisejetpack = false;


/*
switch (room)
{
	//add transfo and rosette stuff here
}
*/

if (isgustavo != obj_player1.isgustavo)
{
    if (isgustavo)
        scr_switchgustavo();
    else
        scr_switchpeppino();
    
    with (obj_player1)
    {
        tauntstoredstate = isgustavo ? UnknownEnum.Value_191 : UnknownEnum.Value_0;
        tauntstoredsprite = sprite_index;
    }
}

if (isgustavo)
	scr_switchgustavo();
else
	scr_switchpeppino();

switch (startstate)
{
    case -4:
        with (obj_player1)
        {
            if (!isgustavo)
            {
                tauntstoredstate = States.normal;
                tauntstoredsprite = spr_idle;
            }
            else
            {
                tauntstoredstate = States.ratmount;
                tauntstoredsprite = spr_player_ratmountidle;
            }
            
            tauntstoredhsp = 0;
        }
        
        break;
}
