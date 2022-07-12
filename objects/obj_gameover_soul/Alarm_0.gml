if Stage == 0 {
	audio_play_sound(Soul_Halve, 20, false);
	alarm[0] = 60;
	image_index = 1;
}
if Stage == 1 {
	audio_play_sound(Soul_Shatter, 20, false);
	repeat 5 {
		shard = instance_create_depth(x, y, -100, obj_GameOver_SoulBit);
		shard.hspeed = random_range(-3, 3);
		shard.vspeed = random_range(-2, 1);
		shard.gravity = 0.02;
	}
	instance_destroy();
}
Stage += 1;