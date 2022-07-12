if (global.Damage > 0) {
	if (global.PlayerWeapon == "Stick" || global.PlayerWeapon == "Real Knife") {
		slice = instance_create_depth(global.Monster[global.MRN].x, 140, -10, obj_Slice);
		slice.alarm[0] = 45;
		global.Monster[global.MRN].alarm[1] = 60;
		audio_play_sound(Slash, 0, false);
	}
	global.Monster[global.MRN].alarm[1] = 60;
}
else {
	global.Monster[global.MRN].alarm[1] = 1;
	for (var i = 0; i < array_length(global.Monster); i++) {
		with (global.Monster[i]) {
			ReadyForBattle = true;
		}
	}
}
