shield_id = instance_create_layer(x, y, "Instances", obj_half_shield, {
	image_xscale: 3,
	image_yscale: 3,
});

create_bullet = function(bullet_speed) {
	instance_create_layer(x, y, "Instances", obj_bullet, {
		speed: bullet_speed,
		direction: point_direction(x, y, obj_sparkman.x, obj_sparkman.y),
	});
}

shoot = function () {
	var fast_bullet_timer = time_source_create(timer, 0, time_source_units_seconds, create_bullet, [3], 1);
	var slow_bullet_timer_0 = time_source_create(timer, 0.5, time_source_units_seconds, create_bullet, [2], 1);
	var slow_bullet_timer_1 = time_source_create(timer, 1, time_source_units_seconds, create_bullet, [2], 1);
	
	time_source_start(fast_bullet_timer);
	time_source_start(slow_bullet_timer_0);
	time_source_start(slow_bullet_timer_1);
}

timer = time_source_create(time_source_game, 3, time_source_units_seconds, shoot, [], -1);
time_source_start(timer);

