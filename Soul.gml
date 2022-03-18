if keyboard_check(vk_left) {
	x -= global.SoulSpeed;
}
if keyboard_check(vk_right) {
	x += global.SoulSpeed;
}
if keyboard_check(vk_up) {
	y -= global.SoulSpeed;
}
if keyboard_check(vk_down) {
	y += global.SoulSpeed;
}

// Animation of the Soul in the event that it takes damage
if (global.InvFrames > 0) {
	global.InvFrames -= 1;
	image_speed = 1;
}
else {
	image_speed = 0;
	image_index = 0;
}
