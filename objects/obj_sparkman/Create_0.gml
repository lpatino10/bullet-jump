char_health = 100;
curr_anchor_bullet = noone;
jumped_from = noone;

char_speed = 5;
is_jumping = false;
saved_move_x = 0;
saved_move_y = 0;

finish_jump = function () {
	show_debug_message("DONE JUMPING");
	self.char_speed = 5;
	self.is_jumping = false;
	self.saved_move_x = 0;
	self.saved_move_y = 0;
}

timer = time_source_create(time_source_game, 1, time_source_units_seconds, finish_jump, [], 1);
