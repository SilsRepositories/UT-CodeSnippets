if Stage == 1 {
	if (image_alpha == 0) {
		audio_sound_gain(MUSIC_GameOver, 1, 0);
		audio_play_sound(MUSIC_GameOver, 20, true);
	}
	image_alpha += 0.01;
}
if Stage == 2 {
	alarm[0] = -1;
	Dialogue = instance_create_depth(154, 348, -1000000, obj_TextElement);
	Dialogue.TextToDraw = "@2You cannot give up&just yet!";
	Dialogue.TextQueue[0] = "@2" + string(global.Name) + "!&Stay determined!";
	Dialogue.Talker = "Asgore";
	Stage = 3;
}
if (Stage == 3 && !instance_exists(obj_TextElement)) {
	Stage = 4;
	audio_sound_gain(MUSIC_GameOver, 0, 3000);
}
if (Stage == 4) {
	image_alpha -= 0.01;
	if (image_alpha < -0.2) {
		audio_stop_all();
		if file_exists("sdt")
			LOAD();
		else {
			room_goto(Room_Name);
			instance_destroy();
			exit;
		}
		Stage = 5;
	}
}
if (Stage == 5) {
	if (room == global.GORoom) {
		room_persistent = false;
		room_restart();
		instance_destroy();
	}
}