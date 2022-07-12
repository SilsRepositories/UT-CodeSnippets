draw_set_color(c_white);
draw_rectangle(obj_Overworld_Camera.x + 10, obj_Overworld_Camera.y + 165, obj_Overworld_Camera.x + 310, obj_Overworld_Camera.y + 230, false);
draw_set_color(c_black);
draw_rectangle(obj_Overworld_Camera.x + 13, obj_Overworld_Camera.y + 168, obj_Overworld_Camera.x + 307, obj_Overworld_Camera.y + 227, false);
if !instance_exists(obj_TextElement) {
	obj_Overworld_Frisk.Frozen = false;
	instance_destroy();
}