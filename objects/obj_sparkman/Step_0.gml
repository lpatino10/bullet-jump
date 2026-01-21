var move_x = InputX(INPUT_CLUSTER.NAVIGATION);
var move_y = InputY(INPUT_CLUSTER.NAVIGATION);

// Handle jump button.
if (InputPressed(INPUT_VERB.JUMP)) {
	if (is_jumping || (move_x == 0 && move_y == 0)) {
		return;	
	}

	char_speed = 10;
	is_jumping = true;
	saved_move_x = move_x;
	saved_move_y = move_y;
	
	time_source_start(timer);
	
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

move_wrap(true, true, 0);
