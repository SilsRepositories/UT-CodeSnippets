draw_set_color(c_white);
draw_rectangle(obj_Overworld_Camera.x + 90, obj_Overworld_Camera.y + 50, obj_Overworld_Camera.x + 250, obj_Overworld_Camera.y + 120, false);
draw_set_color(c_black);
draw_rectangle(obj_Overworld_Camera.x + 93, obj_Overworld_Camera.y + 53, obj_Overworld_Camera.x + 247, obj_Overworld_Camera.y + 117, false);
draw_set_color(c_white);
if SaveState == 1 draw_set_color(c_yellow);
draw_set_font(font_battle_dialogue_overworld);
draw_text(obj_Overworld_Camera.x + 99, obj_Overworld_Camera.y + 59, global.Name);
draw_text(obj_Overworld_Camera.x + 203, obj_Overworld_Camera.y + 59, "LV " + string(global.PlayerLV));
obj_Overworld_Frisk.Frozen = true;
if keyboard_check_pressed(ord("Z")) {
	SaveState += 1;
	if SaveState == 1 {
		SAVE();
		audio_play_sound(Save, 20, false);
	}
}
if SaveState == 2 || keyboard_check_pressed(ord("X")) {
	instance_destroy();
	obj_Overworld_Frisk.Frozen = false;
}
if SaveState == 0 {
	draw_text(obj_Overworld_Camera.x + 109, obj_Overworld_Camera.y + 84, "Press Z to save");
	draw_text(obj_Overworld_Camera.x + 101, obj_Overworld_Camera.y + 98, "Press X to refuse");
}
if SaveState == 1 {
	draw_text(obj_Overworld_Camera.x + 129, obj_Overworld_Camera.y + 95, "File saved.");
}