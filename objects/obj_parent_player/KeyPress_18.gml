if global.playerCharacter = Characters.Pizzelle{
	global.playerCharacter = Characters.Coneboy
	global.PlayerPaletteIndex = 0
	scr_characterSprite()
	exit;
}
	
if global.playerCharacter = Characters.Coneboy{
	global.playerCharacter = Characters.Pizzelle
	global.PlayerPaletteIndex = 0
	scr_characterSprite()
}
