if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter)) && !instance_exists(Dialogue) && !obj_Overworld_Camera.Menu && !instance_exists(obj_SavePointMenu) {
	instance_create_depth(0, 0, -999999, obj_Overworld_Dialogue);
	Dialogue = instance_create_depth(obj_Overworld_Camera.x + 24, obj_Overworld_Camera.y + 173, -1000000, obj_TextElement);
	Dialogue.TextToDraw = TextToDraw;
	if variable_instance_exists(id, "TextQueue") {
		for (var i = 0; i < array_length(TextQueue); i++) {
			Dialogue.TextQueue[i] = TextQueue[i];
		}
	}
	obj_Overworld_Frisk.Frozen = true;
	if (_Host == obj_Overworld_FriskStatue.id) {
		TextToDraw = "* I told you, I'm a placeholder.";
		TextQueue[0] = "* Can you not understand that?";
	}
	if (_Host == obj_SavePoint.id) {
		audio_play_sound(Heal, 20, false);
		global.PlayerHP = global.PlayerMaxHP;
	}
}