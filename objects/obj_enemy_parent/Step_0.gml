if (place_meeting(x, y, obj_sparkman)) {
	if (obj_sparkman.is_jumping && obj_sparkman.jumped_from != noone) {
		instance_destroy();
	} else {
		obj_sparkman.damage();
	}
}
