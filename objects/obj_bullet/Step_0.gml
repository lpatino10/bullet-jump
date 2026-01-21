if (place_meeting(x, y, obj_sparkman)) {
	if (obj_sparkman.is_jumping && obj_sparkman.jumped_from != id) {
		obj_sparkman.curr_anchor_bullet = id;
		time_source_stop(obj_sparkman.timer);
		obj_sparkman.finish_jump();
	} else if (!obj_sparkman.is_jumping && obj_sparkman.curr_anchor_bullet == noone) {
		obj_sparkman.char_health -= 1;
	}
}

image_angle += 2;
