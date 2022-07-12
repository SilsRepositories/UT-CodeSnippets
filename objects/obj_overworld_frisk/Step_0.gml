Moving = false;
if keyboard_check_pressed(ord("S")) {
	show_debug_message("SAVED.");
	SAVE();
}
if keyboard_check_pressed(ord("L")) {
	show_debug_message("LOADED.");
	LOAD();
}
if !Frozen {
	depth = -y;
	if keyboard_check(vk_up) {
		sprite_index = Sprite_Up;
		Moving = true;
		repeat 2 {
			y -= MySpeed;
			if place_meeting(x, y, obj_CollisionWall) || place_meeting(x, y, obj_Overworld_Collision) {
				y += MySpeed;
				Moving = false;
			}
		}
	}
	if keyboard_check(vk_down) && !keyboard_check(vk_up) {
		sprite_index = Sprite_Down;
		Moving = true;
		repeat 2 {
			y += MySpeed;
			if place_meeting(x, y, obj_CollisionWall) || place_meeting(x, y, obj_Overworld_Collision) {
				y -= MySpeed;
				Moving = false;
			}
		}
	}
	if keyboard_check(vk_left) {
		sprite_index = Sprite_Left;
		Moving = true;
		repeat 2 {
			x -= MySpeed;
			if place_meeting(x, y, obj_CollisionWall) || place_meeting(x, y, obj_Overworld_Collision) {
				x += MySpeed;
				Moving = false;
			}
		}
	}
	if keyboard_check(vk_right) && !keyboard_check(vk_left) {
		sprite_index = Sprite_Right;
		Moving = true;
		repeat 2 {
			x += MySpeed;
			if place_meeting(x, y, obj_CollisionWall) || place_meeting(x, y, obj_Overworld_Collision) {
				x -= MySpeed;
				Moving = false;
			}
		}
	}
}
if !Moving {
	image_speed = 0;
	image_index = 0;
}
else {
	image_speed = 1;
	StepCount += 1;
	CheckRoomForEnemies(200);
}