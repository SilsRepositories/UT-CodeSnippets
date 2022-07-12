if (menu == 0) {
	draw_set_font(font_defaulttitle);
	ha = draw_get_halign();
	draw_set_halign(fa_center);
	va = draw_get_valign();
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(320, 200, "UNDERTALE ENGINE");
	draw_set_font(font_battle_dialogue);
	draw_text(320, 260, "By QSV");
	draw_set_font(font_battle_dialogue_overworld);
	draw_text(320, 310, "PRESS Z TO START\nPRESS X TO ERASE SAVE DATA");
	draw_set_halign(ha);
	draw_set_valign(va);
	if keyboard_check_pressed(ord("Z")) {
		menu = 1;
		if file_exists("sdt") {
			LOAD();
		}
		exit;
	}
	if keyboard_check_pressed(ord("X")) {
		file_delete("sdt");
	}
}
if (menu == 1) {
	draw_set_color(c_white);
	draw_set_font(font_battle_dialogue_overworld);
	draw_text(210, 395, "Name:");
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_yellow);
	siner += 0.12;
	ha = draw_get_halign();
	draw_set_halign(fa_center);
	va = draw_get_valign();
	draw_set_valign(fa_middle);
	draw_text(320, 39 + (sin(siner) * 3), text);
	draw_set_halign(ha);
	draw_set_valign(va);
	draw_set_color(c_yellow);
	draw_text(256, 388, codename);
	draw_set_color(c_gray);
	draw_text(256, 400, "______");
	draw_set_color(c_white);
	for (var i = 0; i < 26; i++) {
		uc_letters[i] = string_char_at(al_ucase, i + 1);
		lc_letters[i] = string_char_at(al_lcase, i + 1);
	}
	for (var h = 0; h < 56; h++) {
		if (h < 26)
			totalchar[h] = uc_letters[h];
		if (h >= 30 && h < 56)
			totalchar[h] = lc_letters[h - 30];
	}
	totalchar[26] = "";
	totalchar[27] = "";
	totalchar[28] = "";
	totalchar[29] = "";
	totalchar[56] = "";
	totalchar[57] = "";
	totalchar[58] = "";
	totalchar[59] = "";
	draw_sprite_ext(Soul, 0, 139 + ((sel % 10) * 40), 96 + (floor(sel / 10) * 50), 2, 2, 0, c_white, 0.5);
	if keyboard_check_pressed(vk_up) {
		sel -= 10;
		audio_play_sound(MenuMove, 20, false);
		if (sel < 0)
			sel += 10;
	}
	if keyboard_check_pressed(vk_down) {
		sel += 10;
		audio_play_sound(MenuMove, 20, false);
		if (sel > 58)
			sel -= 10;
	}
	if keyboard_check_pressed(vk_left) {
		sel -= 1;
		audio_play_sound(MenuMove, 20, false);
		if (sel < 0)
			sel += 1;
	}
	if keyboard_check_pressed(vk_right) {
		sel += 1;
		audio_play_sound(MenuMove, 20, false);
		if (sel > 58)
			sel -= 1;
	}
	bkspflag = false;
	if keyboard_check_pressed(ord("Z")) {
		if (sel == 57) {
			bkspflag = true;
			audio_play_sound(Select, 20, false);
		}
		if (sel == 58) {
			if (codename != "") {
				menu = 2;
				sel = 0;
				audio_play_sound(Select, 20, false);
			}
			exit;
		}
		if (totalchar[sel] != "" && string_length(codename) < 6) {
			codename += totalchar[sel];
		}
	}
	if (keyboard_check_pressed(ord("X")) || bkspflag) {
		codename = string_copy(codename, 1, string_length(codename) - 1);
	}
	for (var j = 0; j < 26; j++) {
		draw_text(130 + ((j % 10) * 40), 80 + (50 * floor(j / 10)), uc_letters[j]);
		draw_text(130 + ((j % 10) * 40), 230 + (50 * floor(j / 10)), lc_letters[j]);
	}
	draw_set_color(c_yellow);
	if (sel < 57)
		draw_text(130 + ((sel % 10) * 40), 80 + (50 * floor(sel / 10)), totalchar[sel]);
	draw_set_color(c_white);
	draw_set_font(font_battle_dialogue_overworld);
	if (sel == 57)
		draw_set_color(c_yellow);
	draw_text(403, 338, "BKSP");
	draw_set_color(c_white);
	if (sel == 58)
		draw_set_color(c_yellow);
	if (codename == "")
		draw_set_color(c_gray);
	draw_text(446.5, 338, "END");
	draw_set_color(c_white);
}
if (menu == 2) {
	siner += 0.12;
	ha = draw_get_halign();
	draw_set_halign(fa_center);
	va = draw_get_valign();
	draw_set_valign(fa_middle);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_white);
	draw_text(320, 109 + (sin(siner) * 3), "Is this name correct?");
	draw_set_color(c_yellow);
	draw_text_transformed(320, 230, codename, 2, 2, 0);
	
	draw_sprite_ext(Soul, 0, 200 + (sel * 240), 296, 2, 2, 0, c_white, 0.5);
	draw_set_font(font_battle_dialogue);
	draw_set_color(c_white);
	if (sel == 0)
		draw_set_color(c_yellow);
	draw_text(200, 296, "Yes");
	draw_set_color(c_white);
	if (sel == 1)
		draw_set_color(c_yellow);
	draw_text(439, 296, "No");
	draw_set_halign(ha);
	draw_set_valign(va);
	
	if keyboard_check_pressed(vk_left) {
		sel -= 1;
		if (sel < 0)
			sel += 1;
	}
	if keyboard_check_pressed(vk_right) {
		sel += 1;
		if (sel > 1)
			sel -= 1;
	}
	
	if keyboard_check_pressed(ord("Z")) {
		if (sel == 0) {
			room_goto(Room_HubB)
			sel = 0;
			global.Name = codename;
		}
		if (sel == 1) {
			menu = 1;
			sel = 0;
		}
		audio_play_sound(Select, 20, false)
		exit;
	}
}
draw_set_color(c_ltgray);
draw_set_font(font_menu_minitext);
ha = draw_get_halign();
draw_set_halign(fa_center);
va = draw_get_valign();
draw_set_valign(fa_bottom);
draw_text(320, 476, "THIS GAME WAS MADE IN THE UNDERTALE ENGINE BY QSV\nYOUR CREDITS WOULD GO HERE");
draw_set_halign(ha);
draw_set_valign(va);