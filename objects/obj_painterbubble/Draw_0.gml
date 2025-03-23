var txt, use_typist, text;

draw_self();
draw_set_font(global.npcsmallfont);
txt = "";
use_typist = undefined;

if (!buffering)
{
    txt = idleThoughts[idleThought];
}
else
{
    txt = bufferThought;
    
    if (usePaletteThought)
    {
        txt += " ";
        txt += paletteThoughts[savedPaletteIndex];
    }
    
    use_typist = typist;
}

text = scribble(txt);
text.starting_format(font_get_sprite(global.npcsmallfont, true));
text.blend(16777215, fade);
text.wrap(250);
text.align(1, 1);
text.draw(x - 2, y + 4, use_typist);
