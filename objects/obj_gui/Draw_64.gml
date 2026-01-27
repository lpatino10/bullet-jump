var space = 6;

for (var i = 0; i < obj_sparkman.char_lives; i++) {
	draw_sprite(spr_heart, 0, 16 + (16 * i) + (space * i), 16);	
}
