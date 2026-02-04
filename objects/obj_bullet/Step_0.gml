if (place_meeting(x, y, obj_game.collision_tiles_id)) {
	if (obj_sparkman.curr_anchor_bullet == id) {
		obj_sparkman.curr_anchor_bullet = noone;
		obj_sparkman.stun();
	}

	instance_destroy();
	return;
}

if (place_meeting(x, y, obj_sparkman)) {
	if (obj_sparkman.is_jumping && obj_sparkman.jumped_from != id) {
		obj_sparkman.curr_anchor_bullet = id;
		obj_sparkman.finish_jump();
	} else if (!obj_sparkman.is_jumping && obj_sparkman.curr_anchor_bullet == noone) {
		instance_destroy();
		obj_sparkman.damage();
	}
}

image_angle += 2;
