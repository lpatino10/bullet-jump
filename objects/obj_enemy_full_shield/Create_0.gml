active_bullet_ids = [];

create_bullet = function (bullet_x, bullet_y, bullet_direction) {
	var new_bullet_id = instance_create_layer(bullet_x, bullet_y, "Instances", obj_bullet, {
		speed: 0,
		direction: bullet_direction,
	});
	array_push(active_bullet_ids, new_bullet_id);
}

fire_bullet_ring = function() {
	var bullet_timer_0 = time_source_create(timer, 0, time_source_units_seconds, create_bullet, [x, y - 20, 90], 1);
	var bullet_timer_1 = time_source_create(timer, 0.125, time_source_units_seconds, create_bullet, [x + 15, y - 15, 45], 1);
	var bullet_timer_2 = time_source_create(timer, 0.25, time_source_units_seconds, create_bullet, [x + 20, y, 0], 1);
	var bullet_timer_3 = time_source_create(timer, 0.375, time_source_units_seconds, create_bullet, [x + 15, y + 15, 315], 1);
	var bullet_timer_4 = time_source_create(timer, 0.5, time_source_units_seconds, create_bullet, [x, y + 20, 270], 1);
	var bullet_timer_5 = time_source_create(timer, 0.625, time_source_units_seconds, create_bullet, [x - 15, y + 15, 225], 1);
	var bullet_timer_6 = time_source_create(timer, 0.75, time_source_units_seconds, create_bullet, [x - 20, y, 180], 1);
	var bullet_timer_7 = time_source_create(timer, 0.875, time_source_units_seconds, create_bullet, [x - 15, y - 15, 135], 1);
	
	time_source_start(bullet_timer_0);
	time_source_start(bullet_timer_1);
	time_source_start(bullet_timer_2);
	time_source_start(bullet_timer_3);
	time_source_start(bullet_timer_4);
	time_source_start(bullet_timer_5);
	time_source_start(bullet_timer_6);
	time_source_start(bullet_timer_7);
	
	var shoot_timer = time_source_create(timer, 1, time_source_units_seconds, function() {
		for (var i = 0; i < array_length(active_bullet_ids); i++) {
			active_bullet_ids[i].speed = 1;
		}
		
		active_bullet_ids = [];
	}, [], 1);
	time_source_start(shoot_timer);
}

timer = time_source_create(time_source_game, 5, time_source_units_seconds, fire_bullet_ring, [], -1);
time_source_start(timer);
