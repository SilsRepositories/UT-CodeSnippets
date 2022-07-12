if (((x > 350 && hspeed > 0) || (x < 290 && hspeed < 0)) && global.BarCount > 1) {
	if image_alpha == 1
		global.PriorityBar += 1;
	image_alpha -= 0.05;
	dead = true;
	if (image_alpha < 0) {
		instance_destroy();
	}
}
if ((x > 580 && hspeed > 0) || (x < 60 && hspeed < 0)) {
	global.PriorityBar += 1;
	instance_destroy();
	dead = true;
}
if (global.PriorityBar > priority && !dead) {
	image_speed = 1;
	if (hspeed != 0) {
		BarDistance = distance_to_point(320, y);
		FieldWidth = 540;
		
		global.Damage += ((global.PlayerAttack - global.Monster[global.MRN].Defense) + random(2));
		
		if (BarDistance <= 12) {
			global.Damage *= 1.4;
			
			if (global.BarCount > 1) audio_play_sound(MultiBar_Perfect, 20, false);
		}
		else {
		    global.Damage *= 1 - (BarDistance / FieldWidth);
			
			if (global.BarCount > 1) audio_play_sound(MultiBar_NotPerfect, 20, false);
		}
			
		global.Damage -= (global.Monster[global.MRN].Defense / 2);
		global.Damage = round(global.Damage);
		if (global.Damage < 1) {
			global.Damage = 1;
		}
		
		
		if (global.PlayerAttack - (global.Monster[global.MRN].Defense / 2) <= 0) {
			global.Damage = 0;
		}
	}
	hspeed = 0;
	if (global.BarCount > 1) {
		if (BarDistance > 12) {
			image_speed = 0;
			image_index = 0;
		}
		image_xscale += 0.04;
		image_yscale += 0.04;
		image_alpha -= 0.05;
		if (image_alpha < 0) {
			instance_destroy();
		}
	}
}
