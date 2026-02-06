if (place_meeting(x, y, obj_sparkman)) {
	if (obj_sparkman.is_jumping && obj_sparkman.jumped_from != noone) {
		instance_destroy();
		obj_sparkman.finish_jump();
		
		var bullet_list = ds_list_create();
		// Note: The radius here should match the eventual animation.
		var nearby_bullet_count = collision_circle_list(x, y, 100, obj_bullet, false, true, bullet_list, false);
		if (nearby_bullet_count > 0) {
			for (var i = 0; i < nearby_bullet_count; ++i) {
				instance_destroy(bullet_list[| i]);
			}
		}
		ds_list_destroy(bullet_list);
	} else {
		obj_sparkman.damage();
	}
}
