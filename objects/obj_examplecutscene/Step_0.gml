obj_Overworld_Frisk.Frozen = true;
if Event == 1 {
	obj_Overworld_Camera.x -= 3;
	if (obj_Overworld_Camera.x <= 0) {
		Event = 2;
		alarm[0] = 60;
	}
}
if (Event == 3) {
	instance_create_depth(0, 0, -999999, obj_Overworld_Dialogue);
	Dialogue = instance_create_depth(obj_Overworld_Camera.x + 24, obj_Overworld_Camera.y + 173, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "* Something isn't right about&  this room.";
	Dialogue.TextQueue[0] = "* Isn't it time to go back?";
	Event = 4;
}
if Event == 4 && !instance_exists(obj_Overworld_Dialogue) {
	Event = 5;
}
if Event == 5 {
	obj_Overworld_Camera.x += 3;
	if (obj_Overworld_Camera.x >= (obj_Overworld_Frisk.x - 160)) {
		obj_Overworld_Frisk.Frozen = false;
		instance_destroy();
	}
}