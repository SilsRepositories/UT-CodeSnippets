if !instance_exists(obj_ExampleCutscene) {
	x = obj_Overworld_Frisk.x - 160;
	y = obj_Overworld_Frisk.y - 120;
}

x = clamp(x, 0, room_width - 320);
y = clamp(y, 0, room_height - 240);
camera_set_view_pos(view_camera[0], x, y);

if keyboard_check_pressed(ord("C")) {
	if obj_Overworld_Frisk.Frozen && !Menu
		exit;
	obj_Overworld_Frisk.Frozen = !Menu;
	Menu = !Menu;
	OWMenu = 0;
	OWMenu_Sel = 0;
}