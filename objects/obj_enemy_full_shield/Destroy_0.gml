// Clean up bullets that aren't moving when enemy is destroyed.
for (var i = 0; i < array_length(active_bullet_ids); i++) {
	var active_bullet = active_bullet_ids[i];

	if (active_bullet.speed == 0) {
		instance_destroy(active_bullet_ids[i]);
	}
}
