// CREATE EVENT
dmg = 4;
disocon = true; // Set to false if you want the bullet to stay 
gravity = 0.3;

// COLLISION EVENT - obj_Soul
if (global.InvFrames <= 0) {
	audio_play_sound(Hurt, 1, false);
	global.InvFrames = 30;
	global.PlayerHP -= dmg;
	if (global.PlayerHP <= 0) {
		game_end(); // Placeholder function, set this to game_restart() if you don't want to constantly open the game to test
	}
}
if (disocon) {
	instance_destroy();
}
