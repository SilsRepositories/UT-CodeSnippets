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
		var Monsters = 0;
		for (var n = 0; n < 3; n++) {
			if global.Monster[n] != noone {
				Monsters += 1;
			}
		}
		if global.Monsters == 0
			global.Monsters = Monsters;
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, global.Monsters);
		
		// Draws the health bar of the monsters, unless the monster doesn't want the health bar shown: "ShowHealthBar"
		for (var i = 0; i < array_length(global.Monster); i++) {
			if instance_exists(global.Monster[i]) {
				if (global.Monster[i].ShowHealthBar) {
					var percent = (global.Monster[i].MyHP / global.Monster[i].MyMaxHP) * 100;
					draw_set_color(c_red);
					draw_rectangle(470, 287 + (30 * i), 570, 304 + (30 * i), false);
					draw_set_color(c_lime);
					draw_rectangle(470, 287 + (30 * i), 470 + percent, 304 + (30 * i), false);
				}
			}
		}
	}
		
	// Vertical movement, "else" is for grid menus like ITEM and ACT commands
	if (global.BattleMenu == 1 || global.BattleMenu == 2 || global.BattleMenu == 4)
		draw_sprite(Soul, 0, 63, 295 + (30 * clamp(global.UISelectionMenu, 0, 5)));
	else if (global.BattleMenu > 0)
		draw_sprite(Soul, 0, 63 + (250 * (global.UISelectionMenu % 2)), 295 + (30 * floor(clamp(global.UISelectionMenu, 0, 5) / 2)));
		
	// Back out of a menu
	if keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_backspace) {
		global.BattleMenu = 0;
		global.UISelectionMenu = BelowUIReferenceNum;
	}
	
	// Navigation controls
	if global.BattleMenu != 2.5 && global.BattleMenu != 3 {
		if keyboard_check_pressed(vk_up) {
			global.UISelectionMenu -= 1;
			Dir -= 1;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_down) {
			global.UISelectionMenu += 1;
			Dir += 1;
			audio_play_sound(MenuMove, 1, false);
		}
		
		if (global.UISelectionMenu < 0) {
			global.UISelectionMenu = 0;
		}
	}
	else if (global.BattleMenu > 2) {
		if (global.UISelectionMenu < 0) {
			global.UISelectionMenu = 0;
		}
		if keyboard_check_pressed(vk_up) {
			global.UISelectionMenu -= 2;
			Dir -= 2;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_down) {
			global.UISelectionMenu += 2;
			Dir += 2;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_left) {
			global.UISelectionMenu -= 1;
			Dir -= 1;
			audio_play_sound(MenuMove, 1, false);
		}
		if keyboard_check_pressed(vk_right) {
			global.UISelectionMenu += 1;
			Dir += 1;
			audio_play_sound(MenuMove, 1, false);
		}
	}
	if (global.BattleMenu == 1 || global.BattleMenu == 2) {
		if Dir != 0 {
			while global.Monster[global.UISelectionMenu] == noone {
				global.UISelectionMenu += Dir;
				
				if (global.UISelectionMenu < 0)
					global.UISelectionMenu = array_length(global.Monster) - 1;
				
				if (global.UISelectionMenu > array_length(global.Monster) - 1)
					global.UISelectionMenu = 0;
			}
			Dir = 0;
		}
	}
	
	// Monster ACT menu
	if (global.BattleMenu == 2.5)
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, array_length(global.Monster[MonsterReferenceNum].Act) - 1);
		
	// Item menu
	if (global.BattleMenu == 3) {
		var Items = 0;
		for (var n = 0; n < array_length(global.Item); n++) {
			if global.Item[n] != "" {
				Items += 1;
			}
		}
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, Items - 1);
		if (Items == 0) {
			global.BattleMenu = 0;
			global.UISelectionMenu = 2;
		}
	}
		
	if (global.BattleMenu == 4)
		global.UISelectionMenu = clamp(global.UISelectionMenu, 0, global.CanFlee);
	
	// Confirm an input
	if keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) {
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
				if (global.BattleMenu == 1 || global.BattleMenu == 2) {
					for (var i = 0; i < 3; i++) {
						if instance_exists(global.Monster[i]) {
							global.UISelectionMenu = i;
							break;
						}
					}
				}
				
				// You MUST include this to get out of the loop, otherwise your action will not work
				break;
			case 1:
				// Target bar menu
				MonsterReferenceNum = global.UISelectionMenu;
				global.MRN = MonsterReferenceNum;
				CreateTarget(global.PlayerWeapon);
				global.BattleMenu = 1.5;
				global.UISelectionMenu = -1;
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
				var border_l = 320 - (obj_BulletBoard.current_width / 2);
				var border_u = 384 - obj_BulletBoard.current_height;
				// Spare or Flee from a monster
				if (global.UISelectionMenu == 0) {
					var Spares = 0;
					for (var i = 0; i < 3; i++) {
						if instance_exists(global.Monster[i]) {
							if (global.Monster[i].CanSpare) {
								with (global.Monster[i])
									alarm[3] = 1;
								Spares += 1;
							}
						}
					}
					if (Spares > 0) {
						audio_play_sound(Vaporize, 20, false);
						var Monsters = 0;
						for (var i = 0; i < 3; i++) {
							if instance_exists(global.Monster[i]) {
								Monsters += 1;
							}
						}
						Monsters -= Spares;
						if (Monsters == 0 && !BattleWon) {
							var AccumulatedEXP = (global.PlayerEXP - CurrentEXP);
							var AccumulatedGOL = (global.PlayerGOL - CurrentGOL);
							
							global.BattleMenu = -9999;
							global.UISelectionMenu = -1;
							WinText = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
							WinText.TextToDraw = "* YOU WON!&* You got " + string(AccumulatedEXP) + " EXP and&  " + string(AccumulatedGOL) + " GOLD!";
							var CurrentLV = global.PlayerLV;
							LevelUpEXP(global.PlayerEXP);
							if (CurrentLV != global.PlayerLV) {
								audio_play_sound(LV, 20, false);
								WinText.TextToDraw += " LEVEL UP!";
							}
							WinText.CanAdvance = true;
							BattleWon = true;
							audio_stop_sound(global.BattleMusic);
							exit;
						}
					}
				}

				// Flee option
				if (global.UISelectionMenu == 1) {
					var AccumulatedEXP = (global.PlayerEXP - CurrentEXP);
					var AccumulatedGOL = (global.PlayerGOL - CurrentGOL);
					
					global.BattleMenu = -9999;
					global.UISelectionMenu = -1;
					instance_create_depth(border_l + 30, border_u + 23, -1, obj_Flee);
					WinText = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
					WinText.TextToDraw = "* Escaped...";
					var CurrentLV = global.PlayerLV;
					LevelUpEXP(global.PlayerEXP);
					if (CurrentLV != global.PlayerLV) {
						audio_play_sound(LV, 20, false);
						WinText.TextToDraw = "* Ran away with " + string(AccumulatedEXP) + " EXP and&  " + string(AccumulatedGOL) + " GOLD!";
					}
					WinText.TextLength = string_length(WinText.TextToDraw);
					WinText.CanAdvance = true;
					audio_stop_sound(global.BattleMusic);
					exit;
				}
				global.UISelectionMenu = 0;
				break;
		}
	}
}
else {
	if (WinText != noone) {
		if !instance_exists(WinText) {
			// Leave for the overworld
			trans = instance_create_depth(x, y, -1000000, obj_RoomTransitioner);
			trans.Destination = global.CurrentRoom;
			WinText = noone;
			audio_stop_sound(global.BattleMusic);
		}
	}
}
var deadMonsters = 0;
for (var i = 0; i < array_length(global.Monster); i++) {
	if (global.Monster[i] == noone) {
		deadMonsters++;
	}
	if (deadMonsters >= array_length(global.Monster)) {
		if WinText == noone && !BattleWon {
			var AccumulatedEXP = (global.PlayerEXP - CurrentEXP);
			var AccumulatedGOL = (global.PlayerGOL - CurrentGOL);
		
			var border_l = 320 - (obj_BulletBoard.current_width / 2);
			var border_u = 384 - obj_BulletBoard.current_height;
							
			global.BattleMenu = -9999;
			global.UISelectionMenu = -1;
			WinText = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
			WinText.TextToDraw = "* YOU WON!&* You got " + string(AccumulatedEXP) + " EXP and&  " + string(AccumulatedGOL) + " GOLD!";
			var CurrentLV = global.PlayerLV;
			LevelUpEXP(global.PlayerEXP);
			if (CurrentLV != global.PlayerLV) {
				audio_play_sound(LV, 20, false);
				WinText.TextToDraw += " LEVEL UP!";
			}
			WinText.CanAdvance = true;
			BattleWon = true;
			audio_stop_sound(global.BattleMusic);
		}
	}
}