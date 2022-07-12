if (image_alpha > 0.6) {
	if (global.InvFrames <= 0) {
		if (image_blend == c_aqua && !keyboard_check(vk_left) && !keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_right)) {
			exit;
		}
		if (image_blend == c_orange && (keyboard_check(vk_left) || keyboard_check(vk_up) || keyboard_check(vk_down) || keyboard_check(vk_right))) {
			exit;
		}
		audio_play_sound(Hurt, 1, false);
		global.InvFrames = 1;
		global.PlayerHP -= 1;		
		if (global.PlayerHP < 1 && global.Karma > 1) {
			global.PlayerHP = 1;
			global.Karma -= 1;
		}
		if (global.PlayerHP <= 0) {
			global.PlayerHP = 0;
			room_goto(Room_GameOver);
		}
	}
}