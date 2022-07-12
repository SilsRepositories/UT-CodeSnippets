if keyboard_check_pressed(vk_up)
	Angle = 90;
if keyboard_check_pressed(vk_down)
	Angle = -90;
if keyboard_check_pressed(vk_left)
	Angle = 180;
if keyboard_check_pressed(vk_right)
	Angle = 0;
image_angle = Angle - 90;
x = obj_Soul.x + lengthdir_x(26, Angle);
y = obj_Soul.y + lengthdir_y(26, Angle);