for (var i = 0; i < array_length(global.Monster); i++) {
	if instance_exists(global.Monster[i]) {
		if (global.Monster[i].alarm[4] > 0) {
			if instance_exists(obj_SpeechBubble) {
				global.Monster[i].alarm[4] = 3;
			}
		}
	}
}
if (Myself == -1) {
	for (var i = 0; i < array_length(global.Monster); i++) {
		if global.Monster[i] == id {
			Myself = i;
			break;
		}
	}
}

image_index = 0;
if ShakeEffect > 0 {
	x = xstart + random_range(-ShakeEffect, ShakeEffect);
	ShakeEffect -= 1;
	image_index = 1;
}
Siner += 0.03;
y = 230 - (sin(Siner) * 4);

/*
  Only use THIS when you want the enemy to DODGE attacks
*/
//if alarm[1] > 0 {
//	DodgeAnim = 1;
//}
//else {
//	x += 6;
//	if (x >= 320) {
//		x = 320;
//		DodgeAnim = 0;
//	}
//}
//if (DodgeAnim == 1) {
//	x -= 6;
//	if (x < 160) {
//		x = 160;
//	}
//}

if instance_exists(Dialogue) {
	for (var i = 0; i < array_length(global.Monster); i++) {
		if instance_exists(global.Monster[i]) {
			with global.Monster[i] {
				ReadyForBattle = true;
				if i != Myself
					if instance_exists(Dialogue)
						instance_destroy(Dialogue);
			}
		}
	}
}
else {
	if ReadyForBattle {
		if instance_exists(obj_TextElement) {
			ReadyForBattle = false;
			alarm[0] = 2;
		}
	}
}
if Killed {
	image_alpha -= 0.01;
	repeat (3)
		instance_create_depth(x + random_range(-60, 60), y - random(sprite_height), -1, obj_Particle);
	if image_alpha <= 0
		instance_destroy();
}
