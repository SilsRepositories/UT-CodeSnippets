// CREATE EVENT
// Positions
ButtonPositions_X[0] = 32;
ButtonPositions_X[1] = 185;
ButtonPositions_X[2] = 345;
ButtonPositions_X[3] = 500;

// Sprites
ButtonSprites[0] = UI_Fight;
ButtonSprites[1] = UI_Act;
ButtonSprites[2] = UI_Item;
ButtonSprites[3] = UI_Mercy;

// Position references in the menu for other menus (attacking, items, etc.)
MonsterReferenceNum = 0;
BelowUIReferenceNum = 0;

// DRAW EVENT
// Draw every button sprite with the "Unselected" form
for (var i = 0; i < 4; i++) {
	draw_sprite(ButtonSprites[i], 0, ButtonPositions_X[i], 430);
}

// To make sure that our menu is navigatable, we set the UISelectionMenu variable to -1 when we don't want it
// I.E. during attacks or cutscenes
if (global.UISelectionMenu > -1) {
	
	// Main menu
	if (global.BattleMenu == 0) {
		if keyboard_check_pressed(vk_left) {
			global.UISelectionMenu -= 1;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_right) {
			global.UISelectionMenu += 1;
			audio_play_sound(MenuMove, 1, false);
		}
			
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, 3);
		for (var i = 0; i < 4; i++) {
			draw_sprite(ButtonSprites[i], (global.UISelectionMenu == i && !instance_exists(obj_BulletGenerator)), ButtonPositions_X[i], 430);
			if !instance_exists(obj_BulletGenerator)
				draw_sprite(Soul, 0, ButtonPositions_X[global.UISelectionMenu] + 16, 452);  
		}
	}
	
	// This forces the selection variable to stay within a certain range to prevent crashes and other weird oddities
	// Fight and ACT selection menu
	if (global.BattleMenu == 1 || global.BattleMenu == 2) {
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, array_length(global.Monster) - 1);
		
		// Draws the health bar of the monsters, unless the monster doesn't want the health bar shown: "ShowHealthBar"
		for (var i = 0; i < array_length(global.Monster); i++) {
			if (global.Monster[i].ShowHealthBar) {
				var percent = (global.Monster[i].MyHP / global.Monster[i].MyMaxHP) * 100;
				draw_set_color(c_red);
				draw_rectangle(470, 287 + (30 * i), 570, 304 + (30 * i), false);
				draw_set_color(c_lime);
				draw_rectangle(470, 287 + (30 * i), 470 + percent, 304 + (30 * i), false);
			}
		}
	}
	
	// Monster ACT menu
	if (global.BattleMenu == 2.5)
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, array_length(global.Monster[MonsterReferenceNum].Act) - 1);
		
	// Item menu
	if (global.BattleMenu == 3)
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, array_length(global.Item) - 1);
		
	// Vertical movement, "else" is for grid menus like ITEM and ACT commands
	if (global.BattleMenu == 1 || global.BattleMenu == 2 || global.BattleMenu == 4)
		draw_sprite(Soul, 0, 63, 295 + (30 * global.UISelectionMenu));
	else if (global.BattleMenu > 0)
		draw_sprite(Soul, 0, 63 + (250 * (global.UISelectionMenu % 2)), 295 + (30 * floor(global.UISelectionMenu / 2)));
		
	// Back out of a menu
	if keyboard_check_pressed(ord("X")) {
		global.BattleMenu = 0;
		global.UISelectionMenu = BelowUIReferenceNum;
	}
	
	// Navigation controls
	if global.BattleMenu != 2 && global.BattleMenu != 2.5 && global.BattleMenu != 3 {
		if keyboard_check_pressed(vk_up) {
			global.UISelectionMenu -= 1;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_down) {
			global.UISelectionMenu += 1;
			audio_play_sound(MenuMove, 1, false);
		}
	}
	else {
		if keyboard_check_pressed(vk_up) {
			global.UISelectionMenu -= 2;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_down) {
			global.UISelectionMenu += 2;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_left) {
			global.UISelectionMenu -= 1;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_right) {
			global.UISelectionMenu += 1;
			audio_play_sound(MenuMove, 1, false);
		}
	}
	
	// Confirm an input
	if keyboard_check_pressed(ord("Z")) {
		// A better way of writing "if (so and so)" repeatedly, useful for infinite cases
		audio_play_sound(Select, 1, false);
		switch global.BattleMenu {
			case 0:
				// FIGHT, ACT, ITEM, MERCY
				global.BattleMenu = (global.UISelectionMenu + 1);
				if (global.BattleMenu == 3 && array_length(global.Item) == 0) {
					global.BattleMenu = 0;
					exit;
				}
				
				// Keeps your original option in mind on the four buttons at the bottom
				BelowUIReferenceNum = global.UISelectionMenu;
				
				// Sets your input action back to the first option
				global.UISelectionMenu = 0;
				
				// You MUST include this to get out of the loop, otherwise your action will not work
				break;
			case 1:
				// Target bar menu, we'll look at this in Episode 6 so ignore for now
				MonsterReferenceNum = global.UISelectionMenu;
				global.BattleMenu = 1.5;
				global.UISelectionMenu = 0;
				break;
			case 2:
				// ACT menu
				MonsterReferenceNum = global.UISelectionMenu;
				global.MRN = MonsterReferenceNum;
				global.BattleMenu = 2.5;
				global.UISelectionMenu = 0;
				break;
			case 2.5:
				// ACT commands
				with (global.Monster[global.MRN]) {
					event_user(global.UISelectionMenu);
				}
				global.BattleMenu = -2;
				global.UISelectionMenu = -1;
				break;
			case 3:
				// Item menu
				UseItem(global.UISelectionMenu);
				global.BattleMenu = -2;
				global.UISelectionMenu = -1;
				break;
			case 4:
				// Spare or Flee from a monster, we'll look at this in Episode 6
				global.BattleMenu = -1;
				global.UISelectionMenu = 0;
				break;
		}
	}
}
