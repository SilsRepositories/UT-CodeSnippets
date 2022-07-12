if !Spawned {
	x = DestinationX + lengthdir_x(400, DestinationAngle + 180);
	y = DestinationY + lengthdir_y(400, DestinationAngle + 180);
	image_angle = DestinationAngle + 180;
	Spawned = true;
}
if (Timer > 0) {
	x += lengthdir_x(20, DestinationAngle);
	y += lengthdir_y(20, DestinationAngle);
	image_angle += 9;
	Timer -= 1;
}
else {
	if (Interval == 0) {
		audio_sound_pitch(GasterBlaster_Fire, 1.2);
		audio_play_sound(GasterBlaster_Fire, 20, false);
		audio_play_sound(GasterBlaster_Fire2, 20, false);
		Beam = instance_create_depth(x, y, depth + 1, obj_GasterBlasterBeam);
		direction = image_angle + 90;
		speed = 7;
		friction = -0.4;
	}
	if (Interval % 2 == 0 && Interval < 0) {
		image_index += 1;
		if (image_index == 5) {
			image_index = 4;
		}
	}
	if (Interval < -30) {
		image_xscale *= 0.93;
		if (image_xscale < 0.1) {
			instance_destroy();
			instance_destroy(Beam);
		}
	}
	Interval -= 1;
}
if (x < -100 || x > 740 || y < -100 || y > 580) {
	speed = 0;
	friction = 0;
}
if instance_exists(Beam) {
	Beam.x = x;
	Beam.y = y;
	Beam.image_angle = image_angle;
	Beam.image_xscale = image_xscale * (abs(sin(Interval / 6) / 3) + 1);
	Beam.image_yscale = image_yscale;
	Beam.image_alpha = (image_xscale * 2);
}