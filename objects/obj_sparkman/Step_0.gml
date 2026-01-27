var move_x = InputX(INPUT_CLUSTER.NAVIGATION);
var move_y = InputY(INPUT_CLUSTER.NAVIGATION);

// Handle flicker during invulnerability.
if (is_invulverable) {
	flicker_step_counter += 1;
	
	if (flicker_step_counter == flicker_step_period) {
		if (image_alpha == 0) {
			image_alpha = 1;
		} else {
			image_alpha = 0;
		}

		flicker_step_counter = 0;
	}
} else {
	image_alpha = 1;
}

// Handle hold animation.
if (InputCheck(INPUT_VERB.JUMP)) {
	sprite_index = spr_sparkman_charged;
}

// Handle jump action.
if (InputReleased(INPUT_VERB.JUMP)) {
	if (is_jumping || (move_x == 0 && move_y == 0)) {
		sprite_index = spr_sparkman_idle;
		return;	
	}

	sprite_index = spr_sparkman_jumping;
	char_speed = 10;
	is_jumping = true;
	jump_start_x = x;
	jump_start_y = y;
	saved_move_x = move_x;
	saved_move_y = move_y;

	
	if (obj_sparkman.curr_anchor_bullet == noone) {
		obj_sparkman.jumped_from = noone;
	} else {
		obj_sparkman.jumped_from = curr_anchor_bullet;
		obj_sparkman.curr_anchor_bullet = noone;
	}
}

var final_x;
var final_y;

if (curr_anchor_bullet != noone) {
	final_x = curr_anchor_bullet.x;
	final_y = curr_anchor_bullet.y;
} else if (is_jumping) {
	final_x = x + saved_move_x * char_speed;
	final_y = y + saved_move_y * char_speed;
} else {
	final_x = x + move_x * char_speed;
	final_y = y + move_y * char_speed;
}

// Ignore collisions only if player is jumping from a bullet.
if ((is_jumping && jumped_from != noone) || place_free(final_x, final_y)) {
	x = final_x;
	y = final_y;
}

// Stop jumping if we've jumped past threshold.
if (is_jumping && point_distance(jump_start_x, jump_start_y, x, y) > jump_end_threshold) {
	finish_jump();
}
