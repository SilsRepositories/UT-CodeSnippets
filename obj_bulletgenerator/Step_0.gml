if (Turn > 2) {
	Turn = choose(1, 2);
}
if (Turn == 1) {
	bullet = instance_create_depth(choose(280, 360), -10, -1, obj_Bullet);
	bullet.hspeed = random_range(-5, 5);
	bullet.vspeed = random_range(2, 3);
}
if (Turn == 2) {
	if (alarm[0] <= 0) {
		alarm[0] = 60;	
	}
}