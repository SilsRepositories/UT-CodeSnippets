if Menu {
	var cam = obj_Overworld_Camera;
	draw_set_color(c_white);
	draw_rectangle(cam.x + 20, cam.y + 40, cam.x + 95, cam.y + 96, false);
	draw_set_color(c_black);
	draw_rectangle(cam.x + 23, cam.y + 43, cam.x + 92, cam.y + 93, false);
	
	draw_set_font(font_battle_dialogue_overworld);
	draw_set_color(c_white);
	draw_text(cam.x + 27, cam.y + 46, global.Name);
	
	draw_set_font(font_overworld_mars);
	draw_text(cam.x + 28, cam.y + 64, "LV: " + string(global.PlayerLV));
	draw_text(cam.x + 28, cam.y + 73, "HP: " + string(global.PlayerHP) + "/" + string(global.PlayerMaxHP));
	draw_text(cam.x + 28, cam.y + 82, "G: " + string(global.PlayerGOL));
	
	draw_set_color(c_white);
	draw_rectangle(cam.x + 20, cam.y + 100, cam.x + 88, cam.y + 156, false);
	draw_set_color(c_black);
	draw_rectangle(cam.x + 23, cam.y + 103, cam.x + 85, cam.y + 153, false);
	draw_set_font(font_battle_dialogue_overworld);
	
	draw_set_color(c_white);
	draw_text(cam.x + 45, cam.y + 107, "ITEM");
	draw_text(cam.x + 45, cam.y + 120, "STAT");
	draw_text(cam.x + 45, cam.y + 133, "CELL");
	
	if keyboard_check_pressed(ord("X")) {
		if OWMenu == 0 {
			Menu = false;
			obj_Overworld_Frisk.Frozen = false;
		}
		if OWMenu > 0
			OWMenu = 0;
	}
	if OWMenu == 0 {
		if keyboard_check_pressed(vk_up) {
			audio_play_sound(MenuMove, 1, false);
			OWMenu_Sel -= 1;
			if (OWMenu_Sel < 0) {
				OWMenu_Sel = 2;
			}
		}
		if keyboard_check_pressed(vk_down) {
			audio_play_sound(MenuMove, 1, false);
			OWMenu_Sel += 1;
			if (OWMenu_Sel > 2) {
				OWMenu_Sel = 0;
			}
		}
		if keyboard_check_pressed(ord("Z")) {
			audio_play_sound(Select, 1, false);
			OWMenu = (OWMenu_Sel + 1);
			OWMenu_Sel2 = 0;
			exit;
		}
	}
	if OWMenu == 1 {
		draw_set_color(c_white);
		draw_rectangle(cam.x + 100, cam.y + 40, cam.x + 238, cam.y + 156, false);
		draw_set_color(c_black);
		draw_rectangle(cam.x + 103, cam.y + 43, cam.x + 235, cam.y + 153, false);
		
		draw_set_font(font_battle_dialogue_overworld);
		draw_set_color(c_white);
		for (var i = 0; i < array_length(global.Item); i++) {
			draw_text(cam.x + 124, cam.y + 48 + (13 * i), global.Item[i]);
		}
		var dir = 0;
		if keyboard_check_pressed(vk_up) {
			audio_play_sound(MenuMove, 1, false);
			OWMenu_Sel2 -= 1;
			dir = 1;
			if (OWMenu_Sel2 < 0) {
				OWMenu_Sel2 = array_length(global.Item) - 1;
			}
		}
		if keyboard_check_pressed(vk_down) {
			audio_play_sound(MenuMove, 1, false);
			OWMenu_Sel2 += 1;
			dir = -1;
			if (OWMenu_Sel2 > array_length(global.Item) - 1) {
				OWMenu_Sel2 = 0;
			}
		}
		var l = 0;
		if array_length(global.Item) >= 1 {
			while (global.Item[OWMenu_Sel2] == "") {
				OWMenu_Sel2 -= dir;
				if (OWMenu_Sel2 < 0) {
					OWMenu_Sel2 = array_length(global.Item) - 1;
				}
				if (OWMenu_Sel2 > array_length(global.Item) - 1) {
					OWMenu_Sel2 = 0;
				}
				l += 1;
				if (l > 20) {
					break;
				}
			}
		}
		else {
			OWMenu = 0;
		}
		if keyboard_check_pressed(ord("Z")) {
			audio_play_sound(Select, 1, false);
			global.Monster[0] = obj_Interaction;
			instance_create_depth(0, 0, -999999, obj_Overworld_Dialogue);
			UseItem(OWMenu_Sel2);
			Menu = false;
		}
	}
	if OWMenu == 2 {
		draw_set_color(c_white);
		draw_rectangle(cam.x + 100, cam.y + 40, cam.x + 288, cam.y + 206, false);
		draw_set_color(c_black);
		draw_rectangle(cam.x + 103, cam.y + 43, cam.x + 285, cam.y + 203, false);
		
		draw_set_font(font_battle_dialogue_overworld);
		draw_set_color(c_white);
		draw_text(cam.x + 109, cam.y + 48, global.Name);
		draw_text(cam.x + 109, cam.y + 61, "LV " + string(global.PlayerLV));
		
		draw_text(cam.x + 109, cam.y + 87, "HP " + string(global.PlayerHP) + "/" + string(global.PlayerMaxHP));
	
		draw_text(cam.x + 109, cam.y + 113, "ATK " + string(global.PlayerAttack));
		draw_text(cam.x + 109, cam.y + 126, "DEF " + string(global.PlayerDefense));
		
		draw_set_color(c_red);
		draw_text(cam.x + 184, cam.y + 119, "EXP: " + string(global.PlayerEXP));
		
		draw_set_color(c_white);
		draw_text(cam.x + 109, cam.y + 152, "Weapon: " + string(global.PlayerWeapon));
		draw_text(cam.x + 109, cam.y + 165, "Armor: " + string(global.PlayerArmor));
		
		draw_text(cam.x + 109, cam.y + 180, "GOLD: " + string(global.PlayerGOL));
	}
	if OWMenu == 3 {
		draw_set_color(c_white);
		draw_rectangle(cam.x + 100, cam.y + 40, cam.x + 288, cam.y + 156, false);
		draw_set_color(c_black);
		draw_rectangle(cam.x + 103, cam.y + 43, cam.x + 285, cam.y + 153, false);
		
		draw_set_font(font_battle_dialogue_overworld);
		draw_set_color(c_white);
		for (var i = 0; i < array_length(global.Cell); i++) {
			draw_text(cam.x + 124, cam.y + 48 + (13 * i), global.Cell[i]);
		}
		var dir = 0;
		if keyboard_check_pressed(vk_up) {
			audio_play_sound(MenuMove, 1, false);
			OWMenu_Sel2 -= 1;
			dir = 1;
			if (OWMenu_Sel2 < 0) {
				OWMenu_Sel2 = array_length(global.Cell) - 1;
			}
		}
		if keyboard_check_pressed(vk_down) {
			audio_play_sound(MenuMove, 1, false);
			OWMenu_Sel2 += 1;
			dir = -1;
			if (OWMenu_Sel2 > array_length(global.Cell) - 1) {
				OWMenu_Sel2 = 0;
			}
		}
		var l = 0;
		while (global.Cell[OWMenu_Sel2] == "") {
			OWMenu_Sel2 -= dir;
			if (OWMenu_Sel2 < 0) {
				OWMenu_Sel2 = array_length(global.Cell) - 1;
			}
			if (OWMenu_Sel2 > array_length(global.Cell) - 1) {
				OWMenu_Sel2 = 0;
			}
			l += 1;
			if (l > 20) {
				break;
			}
		}
		if keyboard_check_pressed(ord("Z")) {
			audio_play_sound(Select, 1, false);
			global.Monster[0] = obj_Interaction;
			instance_create_depth(0, 0, -999999, obj_Overworld_Dialogue);
			UseCell(OWMenu_Sel2);
			Menu = false;
		}
	}
	draw_sprite_ext(Soul, 0, cam.x + 34, cam.y + 115 + (13 * OWMenu_Sel), 0.5, 0.5, 0, c_white, 1);
	if OWMenu == 1 || OWMenu == 3 {
		draw_sprite_ext(Soul, 0, cam.x + 113, cam.y + 56 + (13 * OWMenu_Sel2), 0.5, 0.5, 0, c_white, 1);
	}
}