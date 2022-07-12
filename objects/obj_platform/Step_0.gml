image_index = !carry;
x += spd;
if bounce {
	if (x > global.RightEdge - (sprite_width / 2)) {
		x = global.RightEdge - (sprite_width / 2);
		spd = -spd;
	}
	if (x < global.LeftEdge + (sprite_width / 2)) {
		x = global.LeftEdge + (sprite_width / 2);
		spd = -spd;
	}
}
if obj_Soul.BLUE_Gravity >= 0 && obj_Soul.Mode == 1 {
	if collision_line(obj_Soul.xprevious, obj_Soul.yprevious, obj_Soul.x, obj_Soul.y, self, false, false) {
		if carry
			obj_Soul.x += spd;
		obj_Soul.y = y - 5;
		obj_Soul.BLUE_Gravity = 0;
		obj_Soul.BLUE_Jumped = 0;
	}
}