var border_l = (320 + current_offsetx) - (current_width / 2);
var border_r = (320 + current_offsetx) + (current_width / 2);
var border_u = (384 + current_offsety) - current_height;
var border_d = (384 + current_offsety);

global.LeftEdge = border_l;
global.RightEdge = border_r;

// Sets the floor for Blue Soul jumping
global.BoardFloor = border_d;
if obj_Soul.image_angle == 90 global.BoardFloor = border_r;
if obj_Soul.image_angle == 180 global.BoardFloor = border_u;
if obj_Soul.image_angle == -90 global.BoardFloor = border_l;

if (current_width == 570 && current_height == 120) {
	// Set up the text writer
	if instance_exists(Dialogue) {
		Dialogue.visible = false;
		Fight.visible = false;
		Act.visible = false;
		
		ActML.visible = false;
		ActMR.visible = false;
		
		ItemL.visible = false;
		ItemR.visible = false;
		Mercy.visible = false;
	}
	if (global.BattleMenu == -1) {
		// Create the instance responsible for drawing text
		// GetStatusText() will fetch the text depending on your encounter
		Dialogue = instance_create_depth(border_l + 30, border_u + 15, 0, obj_TextElement);
		Dialogue.TextToDraw = GetEnemyStatus();
		Dialogue.CanAdvance = false;
		Dialogue.Talker = "Battle";
		
		// Fight Menu
		Fight = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		for (var i = 0; i < array_length(global.Monster); i++) {
			if instance_exists(global.Monster[i])
				Fight.TextToDraw += "* " + global.Monster[i].MyName + "&";
			else
				Fight.TextToDraw += "  &";
		}
		Fight.TextLength = string_length(Fight.TextToDraw);
		Fight.CanAdvance = false;
		Fight.visible = false;
		
		// ACT Menu, it's the same as FIGHT but it leads to the monster ACT commands
		Act = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		for (var i = 0; i < array_length(global.Monster); i++) {
			if instance_exists(global.Monster[i])
				Act.TextToDraw += "* " + global.Monster[i].MyName + "&";
			else
				Act.TextToDraw += "  &";
		}
		Act.TextLength = string_length(Act.TextToDraw);
		Act.CanAdvance = false;
		Act.visible = false;
		
		// Up to 6 commands can fit in the same menu using this method
		ActML = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		ActML.visible = false;
		ActMR = instance_create_depth(border_l + 300, border_u + 15, 0, obj_TextElement);
		ActMR.visible = false;
		
		// Item Menu, this is also in two halves
		ItemL = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		for (var i = 0; i < array_length(global.Item); i += 2) {
			if (global.Item[i] != "")
				ItemL.TextToDraw += "* " + global.Item[i] + "&";
		}
		ItemL.TextLength = string_length(ItemL.TextToDraw);
		ItemL.CanAdvance = false;
		ItemL.visible = false;
		
		ItemR = instance_create_depth(border_l + 300, border_u + 15, 0, obj_TextElement);
		for (var i = 1; i < array_length(global.Item); i += 2) {
			if (global.Item[i] != "")
				ItemR.TextToDraw += "* " + global.Item[i] + "&";
		}
		ItemR.TextLength = string_length(ItemR.TextToDraw);
		ItemR.CanAdvance = false;
		ItemR.visible = false;
		
		// MERCY Menu
		Mercy = instance_create_depth(border_l + 50, border_u + 15, 0, obj_TextElement);
		for (var i = 0; i < array_length(global.Monster); i++) {
			if instance_exists(global.Monster[i]) {
				if global.Monster[i].CanSpare {
					Mercy.TextToDraw += "~Y";
					break;
				}
			}
		}
		Mercy.TextToDraw += "* Spare~D&* Flee";
		if !global.CanFlee
			Mercy.TextToDraw += "* Spare";
		Mercy.TextLength = string_length(Mercy.TextToDraw);
		Mercy.CanAdvance = false;
		Mercy.visible = false;
		
		// For long conversations such as in cutscenes, use an array to store your next few lines
		// In this case, I've set it to have 256 total lines if they are all full, but you can use up to 32,000
		// Of course, nobody is stupid enough to actually have 32,000 lines of dialogue in a single cutscene
		
		// EXAMPLE:
		// Dialogue.TextToDraw = "* Hi guys, I'm present.&* Where's my cookie?";
		// Dialogue.TextQueue[0] = "* Sorry, you don't get one.";
		// Dialogue.TextQueue[1] = "* WHAT DO YOU MEAN?";
		// Dialogue.TextQueue[2] = "* I WAS WORKING FOR 60 HOURS&  AND YOU HAVEN'T GIVEN ME ONE!";
		// Dialogue.TextQueue[3] = "* Sorry, mate. But I'm afraid&  you still don't get one...";
		
		// EXAMPLE FROM UNDERTALE REJUVENATION
		// Dialogue.TextToDraw = "* The Great Papyrus&  110 - ATK, 80 - DEF.";
		// Dialogue.TextQueue[0] = "* Can't take damage...&* Maybe try tiring him out!";
		
		// Sets the menu state to enable menu navigation
		// Also gets us out of this loop so that you don't create infinite writers, which would cause a memory leak and crash the game
		global.BattleMenu = 0;
	}
	if (global.BattleMenu == 0)
		Dialogue.visible = true;
	if (global.BattleMenu == 1)
		Fight.visible = true;
	if (global.BattleMenu == 2)
		Act.visible = true;
		
	if (global.BattleMenu == 2.5) {
		ActML.visible = true;
		ActMR.visible = true;
		ActML.TextToDraw = "";
		for (var j = 0; j < array_length(global.Monster[global.MRN].Act); j += 2) {
			ActML.TextToDraw += "* " + global.Monster[global.MRN].Act[j] + "&";
		}
		ActML.TextLength = string_length(ActML.TextToDraw);
		ActML.CanAdvance = false;
		
		ActMR.TextToDraw = "";
		for (var j = 1; j < array_length(global.Monster[global.MRN].Act); j += 2) {
			ActMR.TextToDraw += "* " + global.Monster[global.MRN].Act[j] + "&";
		}
		ActMR.TextLength = string_length(ActMR.TextToDraw);
		ActMR.CanAdvance = false;
	}
		
	if (global.BattleMenu == 3) {
		if (global.UISelectionMenu < 6) {
			ItemL.TextToDraw = "";
			ItemR.TextToDraw = "";
			for (var i = 0; i < array_length(global.Item); i += 2) {
				if (i > 5) break;
				if (global.Item[i] != "")
					ItemL.TextToDraw += "* " + global.Item[i] + "&";
			}
			for (var i = 1; i < array_length(global.Item); i += 2) {
				if (i > 5) break;
				if (global.Item[i] != "")
					ItemR.TextToDraw += "* " + global.Item[i] + "&";
			}
			ItemL.TextLength = string_length(ItemL.TextToDraw);
			ItemR.TextLength = string_length(ItemR.TextToDraw);
		}
		else {
			ItemL.TextToDraw = "";
			ItemR.TextToDraw = "";
			for (var i = 2; i < array_length(global.Item); i += 2) {
				if (global.Item[i] != "")
					ItemL.TextToDraw += "* " + global.Item[i] + "&";
			}
			for (var i = 3; i < array_length(global.Item); i += 2) {
				if (global.Item[i] != "")
					ItemR.TextToDraw += "* " + global.Item[i] + "&";
			}
			ItemL.TextLength = string_length(ItemL.TextToDraw);
			ItemR.TextLength = string_length(ItemR.TextToDraw);
		}
		ItemL.visible = true;
		ItemR.visible = true;
	}
	if (global.BattleMenu == 4)
		Mercy.visible = true;
}

// Restricts the SOUL to the Bullet Board boundaries
obj_Soul.x = clamp(obj_Soul.x, border_l + 8, border_r - 8);
obj_Soul.y = clamp(obj_Soul.y, border_u + 8, border_d - 8);
draw_set_color(c_white);
draw_rectangle(border_l - 4, border_u - 4, border_r + 4, border_d + 4, false);
draw_set_color(c_black);
draw_rectangle(border_l, border_u, border_r, border_d, false);

// HP bar, LV and Name display
var hp_barwidth = global.PlayerMaxHP;
var hp_barwidth_fill = global.PlayerHP;
var hp_barwidth_karma = global.Karma;
draw_set_font(font_battleui_hp);
draw_set_color(c_white);
draw_text(30, 400, global.Name + "    LV " + string(global.PlayerLV));
if !global.KARMA_ENABLED
	draw_text(320 + hp_barwidth, 400, string(global.PlayerHP) + " / " + string(global.PlayerMaxHP));
else {
	global.InvFrames = 0;
	if global.Karma > global.PlayerHP {
		KarmaTimer += 1;
		if global.Karma < 7 && KarmaTimer > 6 {
			KarmaTimer = 0;
			global.Karma -= 1;
		}
		if global.Karma >= 7 && global.Karma < 16 && KarmaTimer > 14 {
			KarmaTimer = 0;
			global.Karma -= 1;
		}
		if global.Karma >= 16 && global.Karma < 25 && KarmaTimer > 10 {
			KarmaTimer = 0;
			global.Karma -= 1;
		}
		if global.Karma >= 25 && global.Karma < 35 && KarmaTimer > 6 {
			KarmaTimer = 0;
			global.Karma -= 1;
		}
		if global.Karma >= 35 && KarmaTimer > 2 {
			KarmaTimer = 0;
			global.Karma -= 1;
		}
		draw_set_color(c_fuchsia);
	}
	else {
		global.Karma = global.PlayerHP;
	}
	draw_text(370 + hp_barwidth, 400, string(global.Karma) + " / " + string(global.PlayerMaxHP));
}

draw_set_color(c_white);
draw_set_font(font_battleui_widgets);
draw_text(255, 400, "HP");
if global.KARMA_ENABLED {
	draw_text(320 + hp_barwidth, 400, "KR");
}

draw_set_color(c_red);
draw_rectangle(300, 400, 300 + hp_barwidth, 418, false);
draw_set_color(c_fuchsia);
if global.KARMA_ENABLED {
	draw_rectangle(300, 400, 300 + hp_barwidth_karma, 418, false);
}
draw_set_color(c_yellow);
draw_rectangle(300, 400, 300 + hp_barwidth_fill, 418, false);

// Drawing all attacks that are based on a surface
// If they do NOT appear, try setting their "depth" to 1
draw_set_color(c_white);
draw_surface_part_ext(global.BORDER_SURFACE, border_l, border_u, global.BorderWidth, global.BorderHeight, border_l, border_u, 1, 1, c_white, 1)