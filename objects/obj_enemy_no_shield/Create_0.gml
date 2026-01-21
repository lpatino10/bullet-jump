// Inherit the parent event
event_inherited();

shoot = function () {
	with (instance_create_layer(x, y, "Instances", obj_bullet)) {
		speed = 2;
		direction = point_direction(other.x, other.y, obj_sparkman.x, obj_sparkman.y);
	}
}

timer = time_source_create(time_source_game, 3, time_source_units_seconds, shoot, [], -1);
time_source_start(timer);
