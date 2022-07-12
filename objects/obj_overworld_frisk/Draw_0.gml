if ShowExclamation {
	draw_sprite(Alert, 0, x, y - 32);
}
draw_self();
if (SoulX != 0) {
	PrepareForBattle += 1;
	if (PrepareForBattle >= 30) {
		depth = -1000000;
		draw_set_color(c_black);
		draw_rectangle(0, 0, room_width, room_height, false);
		if (PrepareForBattle < 60)
			draw_self();
		if (PrepareForBattle % 4 == 0 && PrepareForBattle < 44) {
			audio_play_sound(CutNoise, 0, false);
		}
		else if (PrepareForBattle <= 60) {
			draw_sprite_ext(Soul, 0, SoulX, SoulY, 0.5, 0.5, 0, c_white, 1);
		}
		if (PrepareForBattle == 60) {
			audio_play_sound(Battle_Soul, 0, false);
		}
		if (PrepareForBattle > 60 && PrepareForBattle < 100) {
			if (SoulX != (obj_Overworld_Camera.x + 20))
				SoulX += ((obj_Overworld_Camera.x + 20) - SoulX) / 8;
			if (SoulY != (obj_Overworld_Camera.y + 228))
				SoulY += ((obj_Overworld_Camera.y + 228) - SoulY) / 8;
			draw_sprite_ext(Soul, 0, SoulX, SoulY, 0.5, 0.5, 0, c_white, 1);
		}
		if (PrepareForBattle == 75) {
			trans = instance_create_depth(x, y, -1000000, obj_RoomTransitioner);
			trans.Destination = BattleRoom;
		}
		if (PrepareForBattle == 100) {
			ShowExclamation = false;
			Frozen = false;
			PrepareForBattle = 0;
			audio_resume_sound(global.OverworldMusic);
			audio_sound_gain(global.OverworldMusic, 1, 1000);
			SoulX = 0;
		}
	}
}