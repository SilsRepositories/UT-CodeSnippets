// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseCell(cellNum) {	
	var border_l = obj_Overworld_Camera.x - 6;
	var border_u = obj_Overworld_Camera.y + 158;
	
	global.Monster[0].Dialogue = instance_create_depth(border_l + 30, border_u + 15, -1000000, obj_TextElement);
	global.Monster[0].Dialogue.CanAdvance = true;
	
	if (global.Cell[cellNum] == "Toriel's Phone") {
		global.Monster[0].Dialogue.TextToDraw = "* Dialing...";
		global.Monster[0].Dialogue.TextQueue[0] = "* ...";
		global.Monster[0].Dialogue.TextQueue[1] = "* But nobody came.";
	}
	audio_play_sound(Ring, 1, false);
}