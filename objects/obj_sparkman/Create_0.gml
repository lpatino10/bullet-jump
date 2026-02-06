jump_end_threshold = 200;

char_lives = 3;
curr_anchor_bullet = noone;
jumped_from = noone;

char_speed = 5;
is_jumping = false;
jump_start_x = 0;
jump_start_y = 0;
saved_move_x = 0;
saved_move_y = 0;

is_stunned = false;
stun_end_time_source_id = time_source_create(time_source_global, 1, time_source_units_seconds, function () {
	sprite_index = spr_sparkman_idle;
	is_stunned = false;
});

is_invulverable = false;
flicker_step_period = 5;
flicker_step_counter = 0;
invul_end_time_source_id = time_source_create(time_source_global, 3, time_source_units_seconds, function () {
	is_invulverable = false;
});

// TODO: Handle this with a more dynamic animation + animation end event?
finish_jump = function () {
	sprite_index = spr_sparkman_idle;
	char_speed = 5;
	is_jumping = false;
	saved_move_x = 0;
	saved_move_y = 0;
}

damage = function () {
	if (is_invulverable) {
		return;
	}

	is_invulverable = true;
	char_lives -= 1;
	
	time_source_start(invul_end_time_source_id);
}

stun = function () {
	sprite_index = spr_sparkman_stunned;
	is_stunned = true;
	time_source_start(stun_end_time_source_id);
}
