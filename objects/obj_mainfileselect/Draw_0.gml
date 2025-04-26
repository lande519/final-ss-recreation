var i, thingamajig, jd, startedandstuff, fartr, fart, fuuck, thingmabob, hoversprite, thingmabob2;

for (i = 0; i < array_length(fileSelectHeightRatio); i++)
{
    draw_set_alpha(1);
    thingamajig = (selectedFile == i) ? 1 : 0;
    jd = fileJudgment[i];
    startedandstuff = fileOpened[i];
    fartr = "spr_judgment_files" + string(i + 1);
    fart = asset_get_index(fartr);


    fuuck = "spr_menutvselect" + string(selectedFile + 1);
    thingmabob = asset_get_index(fuuck);	
	hoversprite = "spr_menutvhover" + string(selectedFile + 1);
    thingmabob2 = asset_get_index(hoversprite);	
	
    draw_sprite_ext(spr_menutv, i, 735 - (60 * fileSelectHeightRatio[i]), 125+ (100 * i), 1, 1, 0, c_white, 1);
    
    if (activated)
        draw_sprite_ext(thingmabob, painterIndex, 735 - (60 * fileSelectHeightRatio[i]), 125+ (100 * i), 1, 1, 0, c_white, thingamajig);
	else
        draw_sprite_ext(thingmabob2, painterIndex, 735 - (60 * fileSelectHeightRatio[i]), 125+ (100 * i), 1, 1, 0, c_white, thingamajig);	
		
    shader_set(shd_titlescreenDoodle);
    
    if (surface_exists(fileDoodleSurf[i]))
        draw_surface(fileDoodleSurf[i], fileDoodlePos[i][0], fileDoodlePos[i][1]);
     
    shader_reset();
    
    
    if (selectedFile == i)
    {	
        draw_text_scribble(160, 115, "[spr_fontPercentage][fa_center][fa_top]" + string(filePercentage[selectedFile]) + "%");
    }
}

if files = false{
	if selectedoption = 0
		draw_sprite(spr_selectionhand,painterIndex,70,200)	
	if selectedoption = 1
		draw_sprite(spr_selectionhand,painterIndex,250,200)	
}

draw_set_font(global.smallfont)
draw_text(70, 200, "TIMES");
draw_text(250, 200, "RANKS");
draw_player_sprite_ext(saves_sprite, saves_index, pizzyX, pizzyY, 1, 1, 0, c_white, 1, Characters.Pizzelle, filePalette[selectedFile]);
draw_set_alpha(hudAlpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_control_sprite("menuback", 126, 60);
draw_control_sprite("menudelete", 50, 380);
draw_control_sprite("start", 600, 490);
draw_set_alpha(image_alpha);
draw_self();


